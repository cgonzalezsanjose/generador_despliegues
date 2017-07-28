#bucle principal por cada pattern a buscar de forma consecutiva
$lista_patterns="Modificado Ana","iban","GROUP BY"
foreach($item in $lista_ficheros) {
  $i + 1
  swith $i
  { 1   {
            $fichero_destino = get-fichero-destino($item)

        }
  default  {
            $fichero_destino = get-fichero-destino-2($item)
           }
  }
}

function get-fichero-destino ($item)
{

    #buscar pattern y volcar a archivo
    $fecha_desde=(Get-Date).AddDays(-366)
    $carpeta_raiz="C:\Proyecto Hacienda"
    # $ext_buscar="*.txt","*.sql","*.csv"
    $ext_buscar="*.sql"
    $pattern_buscar=$item
    $fichero_destino="C:\local_work\aireir_copy\search_into.csv"
    if(!(Test-Path -pathType Container -Path $carpeta_destino )){ New-Item -ItemType directory -Path $carpeta_destino }
    Get-ChildItem -Recurse -File -Path $carpeta_raiz -include @($ext_buscar) | Where-Object {$_.LastWriteTime -ge $fecha_desde} | Select-String -pattern $pattern_buscar| Select-Object -unique path |  export-csv -path $fichero_destino -NoTypeInformation
}


function get-fichero-destino-2 ($item)
{
    #buscar pattern desde archivo y volcar a archivo
    $carpeta_destino="C:\local_work\Homogeneizacion local\backup_local\scripts varios\"
    if(!(Test-Path -pathType Container -Path $carpeta_destino )){ New-Item -ItemType directory -Path $carpeta_destino }
    #$lista_ficheros = Get-Content "C:\Users\smservices132\Desktop\scripts.txt"
    $lista_ficheros = Get-Content $fichero_destino
    foreach($linea in $lista_ficheros) {
       $fichero=Resolve-Path $linea
       copy-item -path  $fichero.Path -Destination $carpeta_destino
       $fichero_destino = get-fichero-destino($item)
}
}