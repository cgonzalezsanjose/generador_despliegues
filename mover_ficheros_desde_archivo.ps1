$carpeta_destino="C:\local_work\CSVs\"
$lista_ficheros = Get-Content "C:\local_work\CSVs\archivos_a_sacar_de_github.txt"
foreach($linea in $lista_ficheros) {
   $fichero=Resolve-Path $linea
   move-item -path  $fichero.Path -Destination $carpeta_destino
}