:SETVAR SQLCMDERRORLEVEL 1
:ON ERROR EXIT

:r "1_Script cargar_dimensional_modelo_192.sql"
:r "1_Script workflow.sql"
:r "2_Script preparacion.sql"
:r "2_Script ssrs_informe_vencimientos.sql"
:r "2_Script ssrs_derechos_reconocidos_comparativa.sql"
:r "2_Script workflow.sql"
