$carpeta_destino="C:\Users\smservices132\Desktop\conflictos_github_2017"
if(!(Test-Path -pathType Container -Path $carpeta_destino )){ New-Item -ItemType directory -Path $carpeta_destino }
$lista_ficheros = Get-Content "C:\Users\smservices132\Desktop\conflictos_github_recaudacion_20170615.csv"
foreach($linea in $lista_ficheros) {
   $fichero=Resolve-Path $linea
   copy-item -path  $fichero.Path -Destination $carpeta_destino
}