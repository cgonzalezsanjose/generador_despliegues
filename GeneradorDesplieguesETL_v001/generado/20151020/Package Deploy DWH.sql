:SETVAR SQLCMDERRORLEVEL 1
:ON ERROR EXIT

:r "8_Script staging_documentos.sql"
:r "8_Script dimensional_nemotecnicos_y_detalles.sql"
:r "8_Script informe campaña.sql"
:r "12_Script staging_documentos.sql"
:r "12_Script verificacion_dimensional_recaudacion.sql"
:r "999999_Script workflow.sql"
