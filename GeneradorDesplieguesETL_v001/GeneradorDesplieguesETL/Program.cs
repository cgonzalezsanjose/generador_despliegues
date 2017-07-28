using System;
using System.Collections.Generic;
using System.Text;

using LogicaGeneracionDespliegue;
using System.ComponentModel;
using System.Configuration;

namespace GeneradorDesplieguesETL
{
	class Program
	{
		static void Main(string[] args)
		{
			if(args.Length != 1 && args.Length != 2)
			{
				MostrarAviso("Ayuda", "Cantidad de parametros incorrectos.\n - Primer parametro: ruta scripts origen.\n - Segundo parametro (opcional): Carpeta destino");
				return;
			}
			string rutaScripts = args[0];
			string rutaDestino = string.Empty;
			if(args.Length == 2)
			{
				rutaDestino = args[1];
			}
			else
			{
				Console.WriteLine("Introduzca la carpeta en la cual se va a realizar el despliegue. Se creara en ella las subcarpetas necesarias: ");
				rutaDestino = Console.ReadLine();
			}
			rutaDestino = System.IO.Path.Combine(rutaDestino, DateTime.Today.ToString("yyyyMMdd"));
			FusionDespliegue fusion = new FusionDespliegue(ConfigurationManager.AppSettings["NombreFicheroOrden"], rutaScripts, rutaDestino, GeneradorDesplieguesETL.Properties.Settings.Default.RegexValidacion, GeneradorDesplieguesETL.Properties.Settings.Default.RegexReemplazo);
			fusion.OnAvisoCarpetaExistente += new AvisoConfirmacionHandler(fusion_OnAvisoCarpetaExistente);
			fusion.Fusionar();
		}

		static void fusion_OnAvisoCarpetaExistente(CancelEventArgs args)
		{
			Console.Clear();
			MostrarAviso("Aviso", Mensajes.AvisoCarpetaExistente + " (s/n): ");
			string respuesta = Console.ReadLine();
			if(respuesta.Equals("n", StringComparison.CurrentCultureIgnoreCase)) args.Cancel = true;
		}

		private static void MostrarAviso(string mensajeRojo, string mensaje)
		{
			ConsoleColor colorPrevio = Console.ForegroundColor;
			Console.ForegroundColor = ConsoleColor.Red;
			Console.Write(mensajeRojo + ":");
			Console.ForegroundColor = colorPrevio;
			Console.Write(mensaje);
		}
	}
}
