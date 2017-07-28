:SETVAR SQLCMDERRORLEVEL 1
:ON ERROR EXIT

:r "Script preparacion.sql"
:r "Script ssrs_informe_vencimientos.sql"
:r "Script ssrs_derechos_reconocidos_comparativa.sql"
:r "Script workflow.sql"
