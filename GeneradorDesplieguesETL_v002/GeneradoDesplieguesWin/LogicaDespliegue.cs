using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.IO.Compression;

using System.ComponentModel;
using System.Linq;
using System.Text.RegularExpressions;
using System.Windows.Forms;

namespace GeneradoDesplieguesWin
{
    public delegate void AvisoConfirmacionHandler(CancelEventArgs args);

    public class LogicaDespliegue
    {
        public string NombreFicheroOrden { get; private set; }
        public string RutaScripts { get; private set; }
        public string RutaDestino { get; private set; }
        public string RegexValidacion { get; private set; }
        public string RegexReemplazo { get; private set; }

        public event AvisoConfirmacionHandler OnAvisoCarpetaExistente;

        public LogicaDespliegue(string nombreFicheroOrden, string rutaScripts, string rutaDestino, string regexValidacion, string regexReemplazo)
        {
            this.NombreFicheroOrden = nombreFicheroOrden;
            this.RutaScripts = rutaScripts;
            this.RutaDestino = rutaDestino;
            this.RegexValidacion = regexValidacion;
            this.RegexReemplazo = regexReemplazo;
        }

        /// <summary>
        /// Metodo que fusiona carpetas de despliegues de ETL's. Genera una subcarpeta llamada Validación con una version modificada de los scripts fusionados.
        /// </summary>
        /// <exception cref="System.IO.DirectoryNotFoundException">El directorio con las carpetas de los despliegues no existe</exception>
        /// <exception cref="System.IO.FileNotFoundException">No se encuentran scripts SQL en las carpetas de despliegues</exception>
        /// <exception cref="System.IO.FileNotFoundException">En el fichero que indica el orden de los scripts se referencia a un archivo inexistente</exception>
        /// <exception cref="System.NotSupportedException">Clase llamada sin subscribirse a los eventos necesarios</exception>
        public void Fusionar()
        {
            if (this.OnAvisoCarpetaExistente == null) throw new NotSupportedException("Se debe llamar a fusionar habiendose registrado al evento OnAvisoCarpetaExistente");
            DirectoryInfo carpetaDestino = new DirectoryInfo(this.RutaDestino);
            DirectoryInfo carpetaScripts = new DirectoryInfo(this.RutaScripts);
            if (!carpetaScripts.Exists) throw new DirectoryNotFoundException(string.Format("la carpeta con despliegues a fusionar no existe '{0}'", carpetaScripts.FullName));
            IEnumerable<DirectoryInfo> subcarpetasScripts = carpetaScripts.GetDirectories().OrderByDescending(p => p.Name).AsEnumerable();
            List<FileInfo> ficherosScripts = new List<FileInfo>();
            foreach (DirectoryInfo subcarpeta in subcarpetasScripts)
            {
                IEnumerable<FileInfo> ficherosSubcarpeta = subcarpeta.GetFiles("*.sql").Where(p => !p.Name.Equals(this.NombreFicheroOrden, StringComparison.CurrentCultureIgnoreCase));
                ficherosScripts.AddRange(ficherosSubcarpeta);
            }
            carpetaScripts.GetFiles("*.sql");
            if (ficherosScripts.Count == 0) throw new FileNotFoundException(string.Format("la carpeta con scripts no contiene ningun script '{0}'", carpetaScripts.FullName));
            if (carpetaDestino.Exists)
            {
                CancelEventArgs args = new CancelEventArgs(false);
                this.OnAvisoCarpetaExistente(args);
                if (args.Cancel) return;
                FileInfo[] ficherosBorrar = carpetaDestino.GetFiles();
                foreach (FileInfo ficheroBorrar in ficherosBorrar)
                {
                    ficheroBorrar.Delete();
                }
                DirectoryInfo[] carpetasBorrar = carpetaDestino.GetDirectories();
                foreach (DirectoryInfo carpetaBorrar in carpetasBorrar)
                {
                    carpetaBorrar.Delete(true);
                }
            }
            else
            {
                Directory.CreateDirectory(this.RutaDestino);
            }
            string rutaCarpetaValidacion = carpetaDestino.FullName + Path.DirectorySeparatorChar + "Validación";
            Directory.CreateDirectory(rutaCarpetaValidacion);
            List<FileInfo> ficherosOrdenados = ficherosScripts.OrdenarPorFechaPruebas(this.NombreFicheroOrden);
            Regex regexReemplazos = new Regex(this.RegexValidacion, RegexOptions.Compiled | RegexOptions.IgnoreCase | RegexOptions.Multiline);
            string ficheroGuia = carpetaDestino.FullName + Path.DirectorySeparatorChar + this.NombreFicheroOrden;
            File.WriteAllText(ficheroGuia, @":SETVAR SQLCMDERRORLEVEL 1
:ON ERROR EXIT

", Encoding.Default);
            foreach (FileInfo ficheroScript in ficherosOrdenados)
            {
                File.AppendAllText(ficheroGuia, string.Format(":r {0}{1}_{2}{0}{3}", "\"", ficheroScript.Directory.Name, ficheroScript.Name, Environment.NewLine), Encoding.Default);
                ficheroScript.CopyTo(carpetaDestino.FullName + Path.DirectorySeparatorChar + ficheroScript.Directory.Name + "_" + ficheroScript.Name);
                string contenidoScript = File.ReadAllText(ficheroScript.FullName, Encoding.Default);
                string contenidoValidacion = Regex.Replace(contenidoScript, this.RegexValidacion, this.RegexReemplazo);
                File.WriteAllText(rutaCarpetaValidacion + Path.DirectorySeparatorChar + ficheroScript.Directory.Name + "_" + ficheroScript.Name, contenidoValidacion, Encoding.Default);
            }
            File.Copy(ficheroGuia, rutaCarpetaValidacion + Path.DirectorySeparatorChar + this.NombreFicheroOrden);
            //TODO Modificar excel de Despliegues
        }

        public void ComprimirArc(string filePath, string nombreFichero)
        {
            DirectoryInfo directorySelected = new DirectoryInfo(filePath);

            foreach (FileInfo fileToCompress in directorySelected.GetFiles())
            {
                using (FileStream originalFileStream = fileToCompress.OpenRead())
                {
                    if ((File.GetAttributes(fileToCompress.FullName) & FileAttributes.Hidden) != FileAttributes.Hidden & fileToCompress.Extension != ".zip")
                    {
                        using (FileStream compressedFileStream = File.Create(fileToCompress.FullName + ".zip"))
                        {
                            using (GZipStream compressionStream = new GZipStream(compressedFileStream, CompressionMode.Compress))
                            {
                                originalFileStream.CopyTo(compressionStream);
                            }
                        }
                        FileInfo info = new FileInfo(directorySelected + "\\" + nombreFichero + ".zip");
                        MessageBox.Show("Comprimidos " + fileToCompress.Name + " desde " + fileToCompress.Length.ToString()  + " con " + info.Length.ToString() + " bytes.", "Archivo comprimido", MessageBoxButtons.YesNo, MessageBoxIcon.Information);
                    }

                }
            }
            
        }

        public void ComprimirFile(string filePath, string nombreFichero)
        {
            string rutaPath = filePath + Path.DirectorySeparatorChar + nombreFichero;
            string zipPath = filePath + Path.DirectorySeparatorChar + nombreFichero + ".zip";

            ZipFile.CreateFromDirectory(rutaPath, zipPath, CompressionLevel.Optimal, true);

        }

    }

    internal static class Extensiones
    {
        private static int obtenerOrdenCarpeta(string nombreCarpeta)
        {
            string rutaRelativa = nombreCarpeta.Substring(nombreCarpeta.LastIndexOf(Path.DirectorySeparatorChar) + 1);
            string retorno = "0";
            int resultado;
            for (int i = 0; i < rutaRelativa.Length; i++)
            {
                bool esNumerico = int.TryParse(rutaRelativa[i].ToString(), out resultado);
                if (esNumerico) retorno += rutaRelativa[i];
                else break;
            }
            return int.Parse(retorno);
        }

        internal static List<FileInfo> OrdenarPorFechaPruebas(this List<FileInfo> ficheros, string nombreFicheroGuia)
        {
            List<FileInfo> retorno = new List<FileInfo>();
            IOrderedEnumerable<FileInfo> ficherosOrdenados = ficheros.OrderBy(p => obtenerOrdenCarpeta(p.DirectoryName));
            string ultimaCarpeta = string.Empty;
            List<string> ordenCarpeta = new List<string>();
            // Lectura de los archivos nombreFicheroGuia y colocacion ordenada en ordenCarpeta
            Regex regexLinea = new Regex(@":r[\s\t]+" + "\"" + "(?<fichero>.*.sql)\"");
            foreach (FileInfo fichero in ficherosOrdenados)
            {
                if (ultimaCarpeta != fichero.DirectoryName)
                {
                    ultimaCarpeta = fichero.DirectoryName;
                    // Leer el orden del fichero 
                    IEnumerable<string> contenidoFicheroGuia = File.ReadAllLines(fichero.Directory.FullName + Path.DirectorySeparatorChar + nombreFicheroGuia).Where(p => p.StartsWith(":r"));
                    foreach (string linea in contenidoFicheroGuia)
                    {
                        Match coincidencia = regexLinea.Match(linea);
                        if (coincidencia.Success)
                        {
                            string ficheroSQL = coincidencia.Groups["fichero"].Value;
                            /*string duplicado = ordenCarpeta.FirstOrDefault(p=> p.EndsWith(Path.DirectorySeparatorChar + ficheroSQL, StringComparison.CurrentCultureIgnoreCase));
							if(duplicado != null) ordenCarpeta.Remove(duplicado);*/
                            ordenCarpeta.Add(fichero.Directory.FullName + Path.DirectorySeparatorChar + ficheroSQL);
                        }
                    }
                }
            }
            foreach (string ficheroGuia in ordenCarpeta)
            {
                FileInfo ficheroEncontrado = ficheros.FirstOrDefault(p => p.FullName.Equals(ficheroGuia, StringComparison.CurrentCultureIgnoreCase));
                if (ficheroEncontrado != null)
                {
                    retorno.Add(ficheroEncontrado);
                }
                else
                {
                    throw new FileNotFoundException(string.Format("El fichero '{0}' referencia a un archivo inexistente: '{1}'.", nombreFicheroGuia, ficheroGuia));
                }
            }
            return retorno;
        }
    }

    class Mensajes
    {
        public static string AvisoCarpetaExistente { get { return "Se ha detectado que la carpeta destino ya existe, se borraran los archivos de la misma si continua ¿desea continuar?"; } }
    }
}