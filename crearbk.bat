@echo OFF

:: YYYYMMDD HH24MISS
set TIMESTAMP=%DATE:~6,4%%DATE:~3,2%%DATE:~0,2% %TIME:~0,2%%TIME:~3,2%%TIME:~6,2%

::M @echo TIMESTAMP=%TIMESTAMP%

:: Crear la carpeta
md "G:\E_SERIKAT\P14\Backups\%TIMESTAMP%"

:: Copiar las carpetas. Le meto una D a pelo para que la pille cuando pregunta si es un fichero o un directorio
ECHO D | xcopy "C:\GitHub\SSIS" /s/e/f "G:\E_SERIKAT\P14\Backups\%TIMESTAMP%\SSIS"

pause