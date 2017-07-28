PRINT 'ssrs_derechos_reconocidos_comparativa.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas')
CREATE TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas(
  id_detalle int IDENTITY(1,1),
  id_anyo_mes int NOT NULL,
  anyo_mes nvarchar(15) NOT NULL,
  anyo int NOT NULL,
  id_anyo_mes_ref int NOT NULL,
  anyo_mes_ref nvarchar(15) NOT NULL,
  cod_grupo nvarchar(2) NOT NULL,
  grupo nvarchar(40) NOT NULL,
  cod_subgrupo nvarchar(5) NOT NULL,
  subgrupo nvarchar(40) NOT NULL,
  id_subconcepto int NOT NULL,
  subconcepto nvarchar(40) NOT NULL,
  id_modelo int NOT NULL,
  modelo nvarchar(5) NOT NULL,
  id_ejercicio int NOT NULL,
  ejercicio int NOT NULL,
  id_ejercicio_reciente int NOT NULL,
  id_tipo_periodo int NOT NULL,
  tipo_periodo nvarchar(50) NOT NULL,
  cod_indicador nvarchar(3) NOT NULL,
  indicador nvarchar(10) NOT NULL,
  importe numeric(18,4),
  numero int NOT NULL,
  CONSTRAINT PK_tbn1_ssrs_derechos_reconocidos_comparativas PRIMARY KEY CLUSTERED (id_detalle)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='id_detalle')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ADD id_detalle int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='id_anyo_mes')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ADD id_anyo_mes int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='anyo_mes')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ADD anyo_mes nvarchar(15)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='anyo')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ADD anyo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='id_anyo_mes_ref')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ADD id_anyo_mes_ref int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='anyo_mes_ref')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ADD anyo_mes_ref nvarchar(15)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='cod_grupo')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ADD cod_grupo nvarchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='grupo')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ADD grupo nvarchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='cod_subgrupo')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ADD cod_subgrupo nvarchar(5)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='subgrupo')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ADD subgrupo nvarchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='id_subconcepto')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ADD id_subconcepto int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='subconcepto')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ADD subconcepto nvarchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='id_modelo')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ADD id_modelo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='modelo')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ADD modelo nvarchar(5)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='id_ejercicio')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ADD id_ejercicio int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='ejercicio')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ADD ejercicio int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='id_ejercicio_reciente')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ADD id_ejercicio_reciente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='id_tipo_periodo')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ADD id_tipo_periodo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='tipo_periodo')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ADD tipo_periodo nvarchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='cod_indicador')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ADD cod_indicador nvarchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='indicador')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ADD indicador nvarchar(10)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='importe')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ADD importe numeric(18,4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='numero')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ADD numero int

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='id_detalle' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ALTER COLUMN id_detalle int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='id_anyo_mes' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ALTER COLUMN id_anyo_mes int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='anyo_mes' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ALTER COLUMN anyo_mes nvarchar(15) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='anyo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ALTER COLUMN anyo int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='id_anyo_mes_ref' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ALTER COLUMN id_anyo_mes_ref int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='anyo_mes_ref' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ALTER COLUMN anyo_mes_ref nvarchar(15) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='cod_grupo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ALTER COLUMN cod_grupo nvarchar(2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='grupo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ALTER COLUMN grupo nvarchar(40) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='cod_subgrupo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ALTER COLUMN cod_subgrupo nvarchar(5) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='subgrupo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ALTER COLUMN subgrupo nvarchar(40) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='id_subconcepto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ALTER COLUMN id_subconcepto int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='subconcepto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ALTER COLUMN subconcepto nvarchar(40) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='id_modelo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ALTER COLUMN id_modelo int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='modelo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ALTER COLUMN modelo nvarchar(5) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='id_ejercicio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ALTER COLUMN id_ejercicio int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='ejercicio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ALTER COLUMN ejercicio int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='id_ejercicio_reciente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ALTER COLUMN id_ejercicio_reciente int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='id_tipo_periodo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ALTER COLUMN id_tipo_periodo int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='tipo_periodo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ALTER COLUMN tipo_periodo nvarchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='cod_indicador' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ALTER COLUMN cod_indicador nvarchar(3) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='indicador' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ALTER COLUMN indicador nvarchar(10) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='importe' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ALTER COLUMN importe numeric(18,4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND COLUMN_NAME='numero' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ALTER COLUMN numero int NOT NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' AND CONSTRAINT_NAME='PK_tbn1_ssrs_derechos_reconocidos_comparativas')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas ADD CONSTRAINT PK_tbn1_ssrs_derechos_reconocidos_comparativas PRIMARY KEY CLUSTERED (id_detalle)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf_v.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_ssrs_derechos_reconocidos_comparativas' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_ssrs_derechos_reconocidos_comparativas;
GO

CREATE PROCEDURE dbo.spn1_cargar_ssrs_derechos_reconocidos_comparativas(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf_v.dbo.spn1_cargar_ssrs_derechos_reconocidos_comparativas'
  SET NOCOUNT ON;
  DECLARE @log int;
  EXECUTE @log = dbn1_stg_dhyf_v.dbo.spn1_apuntar_log @logpadre,@procedure_name;
  DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf_v.dbo.fnn1_fecha_ultima_carga(@log);
  DECLARE @continuar_en_caso_error bit=0;
  IF @logpadre IS NOT NULL AND EXISTS (SELECT 1 AS expr1
  FROM dbn1_norm_dhyf_v.audit.tbn1_procedimientos_excluidos
  WHERE
    'dbn1_stg_dhyf_v.dbo.'+procedimiento=@procedure_name
    AND excluido=1
  ) BEGIN
    UPDATE dbn1_norm_dhyf_v.audit.tbn1_logs SET
      mensaje_error='EXCLUÍDO'
    WHERE
      id_log=@log;
    RETURN
  END
     BEGIN TRY

  -- Materialized query: contraido
  SELECT
    deudas.modelo AS modelo,
    eomonth(deudas.fecha_contraido) AS fecha_contraido,
    eomonth(mov.fecha) AS fecha_referencia,
    id_ejercicio,
    ejercicio_tributario AS ejercicio,
    id_ejercicio_reciente,
    periodo AS cod_periodo,
    'con' AS cod_indicador,
    'contraido' AS indicador,
    sub.cod_grupo AS cod_grupo,
    sub.des_grupo AS grupo,
    sub.cod_subgrupo AS cod_subgrupo,
    sub.des_subgrupo AS subgrupo,
    sub.id_grupo_subgrupo_subconcepto AS id_subconcepto,
    sub.des_subconcepto AS subconcepto,
    sum(mov.importe) AS importe,
    count(DISTINCT deudas.id_deuda) AS numero
  INTO #contraido__A8BEE
  FROM dbn1_dmr_dhyf_v.dbo.tbn1_dim_ot_deudas deudas
  INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_ot_contraido_por_deuda mov ON (mov_v.id_deuda=deudas.id_deuda)
  INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_dim_ot_clases_movimientos clase ON (clase_v.id_clase_movimiento=mov.id_clase_movimiento)
  INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_dim_ot_grupos_subgrupos_subconceptos sub ON (sub_v.id_grupo_subgrupo_subconcepto=mov.id_grupo_subgrupo_subconcepto)
  WHERE clase.tipo_movimiento='Contraído'
  GROUP BY
    deudas.modelo,
    eomonth(deudas.fecha_contraido),
    eomonth(mov.fecha),
    id_ejercicio,
    ejercicio_tributario,
    id_ejercicio_reciente,
    periodo,
    sub.cod_grupo,
    sub.des_grupo,
    sub.cod_subgrupo,
    sub.des_subgrupo,
    sub.id_grupo_subgrupo_subconcepto,
    sub.des_subconcepto
  
  
  
  CREATE UNIQUE INDEX unique_index_tmp_contraido__A8BEE ON #contraido__A8BEE (modelo,fecha_contraido,fecha_referencia,ejercicio,cod_periodo,cod_indicador,cod_grupo,cod_subgrupo,id_subconcepto)
  
  -- Materialized query: anulado
  SELECT
    deudas.modelo AS modelo,
    eomonth(deudas.fecha_contraido) AS fecha_contraido,
    eomonth(mov.fecha) AS fecha_referencia,
    id_ejercicio,
    ejercicio_tributario AS ejercicio,
    id_ejercicio_reciente,
    periodo AS cod_periodo,
    'anu' AS cod_indicador,
    'anulado' AS indicador,
    sub.cod_grupo AS cod_grupo,
    sub.des_grupo AS grupo,
    sub.cod_subgrupo AS cod_subgrupo,
    sub.des_subgrupo AS subgrupo,
    sub.id_grupo_subgrupo_subconcepto AS id_subconcepto,
    sub.des_subconcepto AS subconcepto,
    sum(mov.importe) AS importe,
    count(DISTINCT deudas.id_deuda) AS numero
  INTO #anulado__08186
  FROM dbn1_dmr_dhyf_v.dbo.tbn1_dim_ot_deudas deudas
  INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_ot_contraido_por_deuda mov ON (mov_v.id_deuda=deudas.id_deuda)
  INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_dim_ot_clases_movimientos clase ON (clase_v.id_clase_movimiento=mov.id_clase_movimiento)
  INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_dim_ot_grupos_subgrupos_subconceptos sub ON (sub_v.id_grupo_subgrupo_subconcepto=mov.id_grupo_subgrupo_subconcepto)
  WHERE clase.tipo_movimiento='Anulado'
  GROUP BY
    deudas.modelo,
    eomonth(deudas.fecha_contraido),
    eomonth(mov.fecha),
    id_ejercicio,
    ejercicio_tributario,
    id_ejercicio_reciente,
    periodo,
    sub.cod_grupo,
    sub.des_grupo,
    sub.cod_subgrupo,
    sub.des_subgrupo,
    sub.id_grupo_subgrupo_subconcepto,
    sub.des_subconcepto
  
  
  
  CREATE UNIQUE INDEX unique_index_tmp_anulado__08186 ON #anulado__08186 (modelo,fecha_contraido,fecha_referencia,ejercicio,cod_periodo,cod_indicador,cod_grupo,cod_subgrupo,id_subconcepto)
  
  -- Materialized query: ingresado
  SELECT
    deudas.modelo AS modelo,
    eomonth(deudas.fecha_contraido) AS fecha_contraido,
    eomonth(mov.fecha) AS fecha_referencia,
    id_ejercicio,
    ejercicio_tributario AS ejercicio,
    id_ejercicio_reciente,
    periodo AS cod_periodo,
    'ind' AS cod_indicador,
    'ingresado' AS indicador,
    sub.cod_grupo AS cod_grupo,
    sub.des_grupo AS grupo,
    sub.cod_subgrupo AS cod_subgrupo,
    sub.des_subgrupo AS subgrupo,
    sub.id_grupo_subgrupo_subconcepto AS id_subconcepto,
    sub.des_subconcepto AS subconcepto,
    sum(mov.importe) AS importe,
    count(DISTINCT deudas.id_deuda) AS numero
  INTO #ingresado__209B7
  FROM dbn1_dmr_dhyf_v.dbo.tbn1_dim_ot_deudas deudas
  INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_ot_contraido_por_deuda mov ON (mov_v.id_deuda=deudas.id_deuda)
  INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_dim_ot_clases_movimientos clase ON (clase_v.id_clase_movimiento=mov.id_clase_movimiento)
  INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_dim_ot_grupos_subgrupos_subconceptos sub ON (sub_v.id_grupo_subgrupo_subconcepto=mov.id_grupo_subgrupo_subconcepto)
  WHERE clase.tipo_movimiento='Ingresado'
  GROUP BY
    deudas.modelo,
    eomonth(deudas.fecha_contraido),
    eomonth(mov.fecha),
    id_ejercicio,
    ejercicio_tributario,
    id_ejercicio_reciente,
    periodo,
    sub.cod_grupo,
    sub.des_grupo,
    sub.cod_subgrupo,
    sub.des_subgrupo,
    sub.id_grupo_subgrupo_subconcepto,
    sub.des_subconcepto
  
  
  
  CREATE UNIQUE INDEX unique_index_tmp_ingresado__209B7 ON #ingresado__209B7 (modelo,fecha_contraido,fecha_referencia,ejercicio,cod_periodo,cod_indicador,cod_grupo,cod_subgrupo,id_subconcepto)
  
  -- Materialized query: pendiente
  SELECT
    deudas.modelo AS modelo,
    eomonth(deudas.fecha_contraido) AS fecha_contraido,
    eomonth(mov.fecha) AS fecha_referencia,
    id_ejercicio,
    ejercicio_tributario AS ejercicio,
    id_ejercicio_reciente,
    periodo AS cod_periodo,
    'pte' AS cod_indicador,
    'pendiente' AS indicador,
    sub.cod_grupo AS cod_grupo,
    sub.des_grupo AS grupo,
    sub.cod_subgrupo AS cod_subgrupo,
    sub.des_subgrupo AS subgrupo,
    sub.id_grupo_subgrupo_subconcepto AS id_subconcepto,
    sub.des_subconcepto AS subconcepto,
    sum(mov.importe) AS importe,
    0 AS numero
  INTO #pendiente__8D325
  FROM dbn1_dmr_dhyf_v.dbo.tbn1_dim_ot_deudas deudas
  INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_ot_contraido_por_deuda mov ON (mov_v.id_deuda=deudas.id_deuda)
  INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_dim_ot_grupos_subgrupos_subconceptos sub ON (sub_v.id_grupo_subgrupo_subconcepto=mov.id_grupo_subgrupo_subconcepto)
  GROUP BY
    deudas.modelo,
    eomonth(deudas.fecha_contraido),
    eomonth(mov.fecha),
    id_ejercicio,
    ejercicio_tributario,
    id_ejercicio_reciente,
    periodo,
    sub.cod_grupo,
    sub.des_grupo,
    sub.cod_subgrupo,
    sub.des_subgrupo,
    sub.id_grupo_subgrupo_subconcepto,
    sub.des_subconcepto
  
  
  
  CREATE UNIQUE INDEX unique_index_tmp_pendiente__8D325 ON #pendiente__8D325 (modelo,fecha_contraido,fecha_referencia,ejercicio,cod_periodo,cod_indicador,cod_grupo,cod_subgrupo,id_subconcepto)
  
  ;WITH
  query AS (
    SELECT
      year(fecha_contraido)*100+month(fecha_contraido) AS id_anyo_mes,
      concat(year(fecha_contraido),' ',CASE month(fecha_contraido)
          WHEN 1 THEN 'Enero'
          WHEN 2 THEN 'Febrero'
          WHEN 3 THEN 'Marzo'
          WHEN 4 THEN 'Abril'
          WHEN 5 THEN 'Mayo'
          WHEN 6 THEN 'Junio'
          WHEN 7 THEN 'Julio'
          WHEN 8 THEN 'Agosto'
          WHEN 9 THEN 'Septiembre'
          WHEN 10 THEN 'Octubre'
          WHEN 11 THEN 'Noviembre'
          WHEN 12 THEN 'Diciembre'
      END) AS anyo_mes,
      year(fecha_contraido) AS anyo,
      year(fecha_referencia)*100+month(fecha_referencia) AS id_anyo_mes_ref,
      concat(year(fecha_referencia),' ',CASE month(fecha_referencia)
          WHEN 1 THEN 'Enero'
          WHEN 2 THEN 'Febrero'
          WHEN 3 THEN 'Marzo'
          WHEN 4 THEN 'Abril'
          WHEN 5 THEN 'Mayo'
          WHEN 6 THEN 'Junio'
          WHEN 7 THEN 'Julio'
          WHEN 8 THEN 'Agosto'
          WHEN 9 THEN 'Septiembre'
          WHEN 10 THEN 'Octubre'
          WHEN 11 THEN 'Noviembre'
          WHEN 12 THEN 'Diciembre'
      END) AS anyo_mes_ref,
      cod_grupo,
      grupo,
      cod_subgrupo,
      subgrupo,
      id_subconcepto,
      subconcepto,
      modelos.id_modelo AS id_modelo,
      CASE
          WHEN modelos.cod_modelo='303' THEN CASE WHEN upper(tipos_periodo.tipo_periodo) LIKE upper('%trimestre%') THEN '303 T' ELSE '303 M' END
          ELSE modelos.cod_modelo
      END AS modelo,
      id_ejercicio,
      ejercicio,
      id_ejercicio_reciente,
      tipos_periodo.id_tipo_periodo AS id_tipo_periodo,
      tipos_periodo.tipo_periodo AS tipo_periodo,
      cod_indicador,
      indicador,
      importe,
      numero
    FROM (SELECT
            coalesce(contraido_v.modelo,anulado.modelo,ingresado.modelo,pendiente.modelo) modelo,
            coalesce(contraido_v.fecha_contraido,anulado.fecha_contraido,ingresado.fecha_contraido,pendiente.fecha_contraido) fecha_contraido,
            coalesce(contraido_v.fecha_referencia,anulado.fecha_referencia,ingresado.fecha_referencia,pendiente.fecha_referencia) fecha_referencia,
            coalesce(contraido_v.ejercicio,anulado.ejercicio,ingresado.ejercicio,pendiente.ejercicio) ejercicio,
            coalesce(contraido_v.cod_periodo,anulado.cod_periodo,ingresado.cod_periodo,pendiente.cod_periodo) cod_periodo,
            coalesce(contraido_v.cod_indicador,anulado.cod_indicador,ingresado.cod_indicador,pendiente.cod_indicador) cod_indicador,
            coalesce(contraido_v.cod_grupo,anulado.cod_grupo,ingresado.cod_grupo,pendiente.cod_grupo) cod_grupo,
            coalesce(contraido_v.cod_subgrupo,anulado.cod_subgrupo,ingresado.cod_subgrupo,pendiente.cod_subgrupo) cod_subgrupo,
            coalesce(contraido_v.id_subconcepto,anulado.id_subconcepto,ingresado.id_subconcepto,pendiente.id_subconcepto) id_subconcepto,
            coalesce(contraido_v.id_ejercicio,anulado.id_ejercicio,ingresado.id_ejercicio,pendiente.id_ejercicio) id_ejercicio,
            coalesce(contraido_v.id_ejercicio_reciente,anulado.id_ejercicio_reciente,ingresado.id_ejercicio_reciente,pendiente.id_ejercicio_reciente) id_ejercicio_reciente,
            coalesce(contraido_v.indicador,anulado.indicador,ingresado.indicador,pendiente.indicador) indicador,
            coalesce(contraido_v.grupo,anulado.grupo,ingresado.grupo,pendiente.grupo) grupo,
            coalesce(contraido_v.subgrupo,anulado.subgrupo,ingresado.subgrupo,pendiente.subgrupo) subgrupo,
            coalesce(contraido_v.subconcepto,anulado.subconcepto,ingresado.subconcepto,pendiente.subconcepto) subconcepto,
            coalesce(contraido_v.importe,anulado.importe,ingresado.importe,pendiente.importe) importe,
            coalesce(contraido_v.numero,anulado.numero,ingresado.numero,pendiente.numero) numero
          FROM #contraido__A8BEE contraido
          FULL JOIN #anulado__08186 anulado ON (contraido_v.modelo=anulado.modelo AND contraido_v.fecha_contraido=anulado.fecha_contraido AND contraido_v.fecha_referencia=anulado.fecha_referencia AND contraido_v.ejercicio=anulado.ejercicio AND contraido_v.cod_periodo=anulado.cod_periodo AND contraido_v.cod_indicador=anulado.cod_indicador AND contraido_v.cod_grupo=anulado.cod_grupo AND contraido_v.cod_subgrupo=anulado.cod_subgrupo AND contraido_v.id_subconcepto=anulado.id_subconcepto)
          FULL JOIN #ingresado__209B7 ingresado ON (coalesce(contraido_v.modelo,ANULADO.modelo)=ingresado.modelo AND coalesce(contraido_v.fecha_contraido,ANULADO.fecha_contraido)=ingresado.fecha_contraido AND coalesce(contraido_v.fecha_referencia,ANULADO.fecha_referencia)=ingresado.fecha_referencia AND coalesce(contraido_v.ejercicio,ANULADO.ejercicio)=ingresado.ejercicio AND coalesce(contraido_v.cod_periodo,ANULADO.cod_periodo)=ingresado.cod_periodo AND coalesce(contraido_v.cod_indicador,ANULADO.cod_indicador)=ingresado.cod_indicador AND coalesce(contraido_v.cod_grupo,ANULADO.cod_grupo)=ingresado.cod_grupo AND coalesce(contraido_v.cod_subgrupo,ANULADO.cod_subgrupo)=ingresado.cod_subgrupo AND coalesce(contraido_v.id_subconcepto,ANULADO.id_subconcepto)=ingresado.id_subconcepto)
          FULL JOIN #pendiente__8D325 pendiente ON (coalesce(contraido_v.modelo,ANULADO.modelo,INGRESADO.modelo)=pendiente.modelo AND coalesce(contraido_v.fecha_contraido,ANULADO.fecha_contraido,INGRESADO.fecha_contraido)=pendiente.fecha_contraido AND coalesce(contraido_v.fecha_referencia,ANULADO.fecha_referencia,INGRESADO.fecha_referencia)=pendiente.fecha_referencia AND coalesce(contraido_v.ejercicio,ANULADO.ejercicio,INGRESADO.ejercicio)=pendiente.ejercicio AND coalesce(contraido_v.cod_periodo,ANULADO.cod_periodo,INGRESADO.cod_periodo)=pendiente.cod_periodo AND coalesce(contraido_v.cod_indicador,ANULADO.cod_indicador,INGRESADO.cod_indicador)=pendiente.cod_indicador AND coalesce(contraido_v.cod_grupo,ANULADO.cod_grupo,INGRESADO.cod_grupo)=pendiente.cod_grupo AND coalesce(contraido_v.cod_subgrupo,ANULADO.cod_subgrupo,INGRESADO.cod_subgrupo)=pendiente.cod_subgrupo AND coalesce(contraido_v.id_subconcepto,ANULADO.id_subconcepto,INGRESADO.id_subconcepto)=pendiente.id_subconcepto)) deudas
    INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_dim_modelos modelos ON (modelos_v.cod_modelo=deudas.modelo)
    INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_dim_tipos_periodo tipos_periodo ON (tipos_periodo_v.cod_periodo=deudas.cod_periodo)
    WHERE fecha_contraido BETWEEN dateadd(mm,-48,getdate()) AND eomonth(getdate())
  )
  MERGE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas AS tbn1_ssrs_derechos_reconocidos_comparativas
  USING query ON query_v.id_anyo_mes=tbn1_ssrs_derechos_reconocidos_comparativas.id_anyo_mes AND query_v.id_anyo_mes_ref=tbn1_ssrs_derechos_reconocidos_comparativas.id_anyo_mes_ref AND query_v.cod_grupo=tbn1_ssrs_derechos_reconocidos_comparativas.cod_grupo AND query_v.cod_subgrupo=tbn1_ssrs_derechos_reconocidos_comparativas.cod_subgrupo AND query_v.id_subconcepto=tbn1_ssrs_derechos_reconocidos_comparativas.id_subconcepto AND query_v.id_modelo=tbn1_ssrs_derechos_reconocidos_comparativas.id_modelo AND query_v.id_ejercicio=tbn1_ssrs_derechos_reconocidos_comparativas.id_ejercicio AND query_v.id_tipo_periodo=tbn1_ssrs_derechos_reconocidos_comparativas.id_tipo_periodo AND query_v.cod_indicador=tbn1_ssrs_derechos_reconocidos_comparativas.cod_indicador
  WHEN MATCHED AND ((tbn1_ssrs_derechos_reconocidos_comparativas_v.anyo_mes<>query.anyo_mes OR (tbn1_ssrs_derechos_reconocidos_comparativas.anyo_mes IS NULL AND query.anyo_mes IS NOT NULL) OR  (tbn1_ssrs_derechos_reconocidos_comparativas.anyo_mes IS NOT NULL AND query.anyo_mes IS NULL)
                    OR tbn1_ssrs_derechos_reconocidos_comparativas_v.anyo<>query.anyo OR (tbn1_ssrs_derechos_reconocidos_comparativas.anyo IS NULL AND query.anyo IS NOT NULL) OR  (tbn1_ssrs_derechos_reconocidos_comparativas.anyo IS NOT NULL AND query.anyo IS NULL)
                    OR tbn1_ssrs_derechos_reconocidos_comparativas_v.anyo_mes_ref<>query.anyo_mes_ref OR (tbn1_ssrs_derechos_reconocidos_comparativas.anyo_mes_ref IS NULL AND query.anyo_mes_ref IS NOT NULL) OR  (tbn1_ssrs_derechos_reconocidos_comparativas.anyo_mes_ref IS NOT NULL AND query.anyo_mes_ref IS NULL)
                    OR tbn1_ssrs_derechos_reconocidos_comparativas_v.grupo<>query.grupo OR (tbn1_ssrs_derechos_reconocidos_comparativas.grupo IS NULL AND query.grupo IS NOT NULL) OR  (tbn1_ssrs_derechos_reconocidos_comparativas.grupo IS NOT NULL AND query.grupo IS NULL)
                    OR tbn1_ssrs_derechos_reconocidos_comparativas_v.subgrupo<>query.subgrupo OR (tbn1_ssrs_derechos_reconocidos_comparativas.subgrupo IS NULL AND query.subgrupo IS NOT NULL) OR  (tbn1_ssrs_derechos_reconocidos_comparativas.subgrupo IS NOT NULL AND query.subgrupo IS NULL)
                    OR tbn1_ssrs_derechos_reconocidos_comparativas_v.subconcepto<>query.subconcepto OR (tbn1_ssrs_derechos_reconocidos_comparativas.subconcepto IS NULL AND query.subconcepto IS NOT NULL) OR  (tbn1_ssrs_derechos_reconocidos_comparativas.subconcepto IS NOT NULL AND query.subconcepto IS NULL)
                    OR tbn1_ssrs_derechos_reconocidos_comparativas_v.modelo<>query.modelo OR (tbn1_ssrs_derechos_reconocidos_comparativas.modelo IS NULL AND query.modelo IS NOT NULL) OR  (tbn1_ssrs_derechos_reconocidos_comparativas.modelo IS NOT NULL AND query.modelo IS NULL)
                    OR tbn1_ssrs_derechos_reconocidos_comparativas_v.ejercicio<>query.ejercicio OR (tbn1_ssrs_derechos_reconocidos_comparativas.ejercicio IS NULL AND query.ejercicio IS NOT NULL) OR  (tbn1_ssrs_derechos_reconocidos_comparativas.ejercicio IS NOT NULL AND query.ejercicio IS NULL)
                    OR tbn1_ssrs_derechos_reconocidos_comparativas_v.id_ejercicio_reciente<>query.id_ejercicio_reciente OR (tbn1_ssrs_derechos_reconocidos_comparativas.id_ejercicio_reciente IS NULL AND query.id_ejercicio_reciente IS NOT NULL) OR  (tbn1_ssrs_derechos_reconocidos_comparativas.id_ejercicio_reciente IS NOT NULL AND query.id_ejercicio_reciente IS NULL)
                    OR tbn1_ssrs_derechos_reconocidos_comparativas_v.tipo_periodo<>query.tipo_periodo OR (tbn1_ssrs_derechos_reconocidos_comparativas.tipo_periodo IS NULL AND query.tipo_periodo IS NOT NULL) OR  (tbn1_ssrs_derechos_reconocidos_comparativas.tipo_periodo IS NOT NULL AND query.tipo_periodo IS NULL)
                    OR tbn1_ssrs_derechos_reconocidos_comparativas_v.indicador<>query.indicador OR (tbn1_ssrs_derechos_reconocidos_comparativas.indicador IS NULL AND query.indicador IS NOT NULL) OR  (tbn1_ssrs_derechos_reconocidos_comparativas.indicador IS NOT NULL AND query.indicador IS NULL)
                    OR tbn1_ssrs_derechos_reconocidos_comparativas_v.importe<>query.importe OR (tbn1_ssrs_derechos_reconocidos_comparativas.importe IS NULL AND query.importe IS NOT NULL) OR  (tbn1_ssrs_derechos_reconocidos_comparativas.importe IS NOT NULL AND query.importe IS NULL)
                    OR tbn1_ssrs_derechos_reconocidos_comparativas_v.numero<>query.numero OR (tbn1_ssrs_derechos_reconocidos_comparativas.numero IS NULL AND query.numero IS NOT NULL) OR  (tbn1_ssrs_derechos_reconocidos_comparativas.numero IS NOT NULL AND query.numero IS NULL))) THEN
    UPDATE SET
      anyo_mes=query.anyo_mes,
      anyo=query.anyo,
      anyo_mes_ref=query.anyo_mes_ref,
      grupo=query.grupo,
      subgrupo=query.subgrupo,
      subconcepto=query.subconcepto,
      modelo=query.modelo,
      ejercicio=query.ejercicio,
      id_ejercicio_reciente=query.id_ejercicio_reciente,
      tipo_periodo=query.tipo_periodo,
      indicador=query.indicador,
      importe=query.importe,
      numero=query.numero
  WHEN NOT MATCHED THEN
    INSERT (id_anyo_mes,anyo_mes,anyo,id_anyo_mes_ref,anyo_mes_ref,cod_grupo,grupo,cod_subgrupo,subgrupo,id_subconcepto,subconcepto,id_modelo,modelo,id_ejercicio,ejercicio,id_ejercicio_reciente,id_tipo_periodo,tipo_periodo,cod_indicador,indicador,importe,numero) VALUES (
      query.id_anyo_mes,
      query.anyo_mes,
      query.anyo,
      query.id_anyo_mes_ref,
      query.anyo_mes_ref,
      query.cod_grupo,
      query.grupo,
      query.cod_subgrupo,
      query.subgrupo,
      query.id_subconcepto,
      query.subconcepto,
      query.id_modelo,
      query.modelo,
      query.id_ejercicio,
      query.ejercicio,
      query.id_ejercicio_reciente,
      query.id_tipo_periodo,
      query.tipo_periodo,
      query.cod_indicador,
      query.indicador,
      query.importe,
      query.numero)
  WHEN NOT MATCHED BY SOURCE THEN
    DELETE;

  EXECUTE dbn1_stg_dhyf_v.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
   END TRY
  BEGIN CATCH
    EXECUTE dbn1_stg_dhyf_v.dbo.spn1_finalizar_log @log,null;
    UPDATE dbn1_norm_dhyf_v.audit.tbn1_logs SET
      mensaje_error=error_message(),
      procedimiento_error=error_procedure()
    WHERE
      id_log=@log;
    IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
  END CATCH


END

GO

