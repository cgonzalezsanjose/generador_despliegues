$fecha_desde=(Get-Date).AddDays(-366)
$carpeta_raiz="C:\Proyecto Hacienda"
# $ext_buscar="*.txt","*.sql","*.csv"
$ext_buscar="*.sql"
$pattern_buscar="Modificado Ana"
$carpeta_destino="C:\local_work\aireir_copy"
if(!(Test-Path -pathType Container -Path $carpeta_destino )){ New-Item -ItemType directory -Path $carpeta_destino }
Get-ChildItem -Recurse -File -Path $carpeta_raiz -include @($ext_buscar) | Where-Object {$_.LastWriteTime -ge $fecha_desde} | Select-String -pattern $pattern_buscar| Select-Object -unique -expandproperty path |  ForEach-Object { Copy-Item $_ $carpeta_destino }
