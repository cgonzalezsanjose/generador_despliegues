   pushd C:\P14\extracciones
   for /r %%a in (*.sql) do (
     COPY "%%a" "C:\P14\Despliegues\1-Pendiente PREPRO\444\%%~nxa"
   )
   popd
pause