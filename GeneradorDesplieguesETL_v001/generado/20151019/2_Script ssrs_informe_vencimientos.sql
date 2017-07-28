PRINT 'ssrs_informe_vencimientos.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle(
  id_detalle int IDENTITY(1,1),
  id_contribuyente int NOT NULL,
  nif_maestro varchar(12) NOT NULL,
  razon_social varchar(100),
  id_anyo_mes int NOT NULL,
  anyo_mes nvarchar(15) NOT NULL,
  anyo int NOT NULL,
  id_anyo_mes_ref int NOT NULL,
  anyo_mes_ref nvarchar(15) NOT NULL,
  id_familia_impuesto int NOT NULL,
  familia_impuesto nvarchar(35) NOT NULL,
  cod_grupo nvarchar(2) NOT NULL,
  grupo nvarchar(40) NOT NULL,
  cod_subgrupo nvarchar(5) NOT NULL,
  subgrupo nvarchar(40) NOT NULL,
  id_subconcepto int NOT NULL,
  subconcepto nvarchar(40) NOT NULL,
  id_modelo int NOT NULL,
  id_origen int NOT NULL,
  cod_origen nvarchar(2) NOT NULL,
  origen nvarchar(25) NOT NULL,
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
  CONSTRAINT PK_tbn1_ssrs_vencimientos_detalle PRIMARY KEY CLUSTERED (id_detalle)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='id_detalle')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ADD id_detalle int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='nif_maestro')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ADD nif_maestro varchar(12)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='razon_social')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ADD razon_social varchar(100)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='id_anyo_mes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ADD id_anyo_mes int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='anyo_mes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ADD anyo_mes nvarchar(15)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='anyo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ADD anyo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='id_anyo_mes_ref')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ADD id_anyo_mes_ref int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='anyo_mes_ref')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ADD anyo_mes_ref nvarchar(15)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='id_familia_impuesto')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ADD id_familia_impuesto int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='familia_impuesto')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ADD familia_impuesto nvarchar(35)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='cod_grupo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ADD cod_grupo nvarchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='grupo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ADD grupo nvarchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='cod_subgrupo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ADD cod_subgrupo nvarchar(5)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='subgrupo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ADD subgrupo nvarchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='id_subconcepto')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ADD id_subconcepto int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='subconcepto')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ADD subconcepto nvarchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='id_modelo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ADD id_modelo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='id_origen')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ADD id_origen int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='cod_origen')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ADD cod_origen nvarchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ADD origen nvarchar(25)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='modelo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ADD modelo nvarchar(5)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='id_ejercicio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ADD id_ejercicio int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='ejercicio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ADD ejercicio int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='id_ejercicio_reciente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ADD id_ejercicio_reciente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='id_tipo_periodo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ADD id_tipo_periodo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='tipo_periodo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ADD tipo_periodo nvarchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='cod_indicador')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ADD cod_indicador nvarchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='indicador')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ADD indicador nvarchar(10)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='importe')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ADD importe numeric(18,4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='numero')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ADD numero int

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='id_detalle' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ALTER COLUMN id_detalle int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ALTER COLUMN id_contribuyente int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='nif_maestro' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ALTER COLUMN nif_maestro varchar(12) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='razon_social' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ALTER COLUMN razon_social varchar(100) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='id_anyo_mes' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ALTER COLUMN id_anyo_mes int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='anyo_mes' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ALTER COLUMN anyo_mes nvarchar(15) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='anyo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ALTER COLUMN anyo int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='id_anyo_mes_ref' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ALTER COLUMN id_anyo_mes_ref int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='anyo_mes_ref' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ALTER COLUMN anyo_mes_ref nvarchar(15) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='id_familia_impuesto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ALTER COLUMN id_familia_impuesto int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='familia_impuesto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ALTER COLUMN familia_impuesto nvarchar(35) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='cod_grupo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ALTER COLUMN cod_grupo nvarchar(2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='grupo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ALTER COLUMN grupo nvarchar(40) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='cod_subgrupo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ALTER COLUMN cod_subgrupo nvarchar(5) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='subgrupo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ALTER COLUMN subgrupo nvarchar(40) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='id_subconcepto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ALTER COLUMN id_subconcepto int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='subconcepto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ALTER COLUMN subconcepto nvarchar(40) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='id_modelo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ALTER COLUMN id_modelo int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='id_origen' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ALTER COLUMN id_origen int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='cod_origen' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ALTER COLUMN cod_origen nvarchar(2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ALTER COLUMN origen nvarchar(25) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='modelo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ALTER COLUMN modelo nvarchar(5) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='id_ejercicio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ALTER COLUMN id_ejercicio int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='ejercicio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ALTER COLUMN ejercicio int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='id_ejercicio_reciente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ALTER COLUMN id_ejercicio_reciente int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='id_tipo_periodo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ALTER COLUMN id_tipo_periodo int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='tipo_periodo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ALTER COLUMN tipo_periodo nvarchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='cod_indicador' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ALTER COLUMN cod_indicador nvarchar(3) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='indicador' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ALTER COLUMN indicador nvarchar(10) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='importe' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ALTER COLUMN importe numeric(18,4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND COLUMN_NAME='numero' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ALTER COLUMN numero int NOT NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' AND CONSTRAINT_NAME='PK_tbn1_ssrs_vencimientos_detalle')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle ADD CONSTRAINT PK_tbn1_ssrs_vencimientos_detalle PRIMARY KEY CLUSTERED (id_detalle)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_ssrs_vencimientos_detalle_dev' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_ssrs_vencimientos_detalle_dev;
GO

CREATE PROCEDURE dbo.spn1_cargar_ssrs_vencimientos_detalle_dev(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_ssrs_vencimientos_detalle_dev'
  SET NOCOUNT ON;
  DECLARE @log int;
  EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name;
  DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log);
  DECLARE @continuar_en_caso_error bit=0;
  IF @logpadre IS NOT NULL AND EXISTS (SELECT 1 AS expr1
  FROM dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
  WHERE
    'dbn1_stg_dhyf.dbo.'+procedimiento=@procedure_name
    AND excluido=1
  ) BEGIN
    UPDATE dbn1_norm_dhyf.audit.tbn1_logs SET
      mensaje_error='EXCLUÍDO'
    WHERE
      id_log=@log;
    RETURN
  END
     BEGIN TRY

  -- Materialized query: a_devolver
  SELECT
    id_contribuyente,
    cod_modelo AS modelo,
    eomonth(fec_documento) AS fecha_contraido,
    eomonth(fec_documento) AS fecha_referencia,
    id_ejercicio,
    doc.ejercicio AS ejercicio,
    id_ejercicio_reciente,
    cod_periodo,
    '' AS cod_grupo,
    '' AS grupo,
    '' AS cod_subgrupo,
    '' AS subgrupo,
    '' AS id_subconcepto,
    '' AS subconcepto,
    'Autoliquidación' AS origen,
    'AU' AS cod_origen,
    '' AS id_origen,
    'dev' AS cod_indicador,
    'devolver' AS indicador,
    sum(importe_documento) AS importe,
    count(DISTINCT referencia) AS numero
  INTO #a_devolver__1FF5E
  FROM dbn1_dmr_dhyf.dbo.tbn1_dim_todos_documentos doc
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_ejercicios ejercicios ON (ejercicios.ejercicio=doc.ejercicio)
  WHERE
    cod_tipo_documento='J'
    AND tipo_importe NOT IN ('I','C')
  GROUP BY
    id_contribuyente,
    cod_modelo,
    eomonth(fec_documento),
    id_ejercicio,
    doc.ejercicio,
    id_ejercicio_reciente,
    cod_periodo
  
  
  
  CREATE UNIQUE INDEX unique_index_tmp_a_devolver__1FF5E ON #a_devolver__1FF5E (id_contribuyente,modelo,fecha_contraido,fecha_referencia,ejercicio,cod_periodo,cod_grupo,cod_subgrupo,id_subconcepto,id_origen,cod_indicador)
  
  ;WITH
  query AS (
    SELECT
      contribuyentes.id_contribuyente AS id_contribuyente,
      contribuyentes.nif_maestro AS nif_maestro,
      contribuyentes.nombre AS razon_social,
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
      CASE
          WHEN coalesce(familias.cod_familia,'Indefinido') NOT IN ('IRPF','IVA','IS','IE','RAR') THEN 999
          ELSE familias.id_familia_tributaria
      END AS id_familia_impuesto,
      CASE
          WHEN coalesce(familias.cod_familia,'Indefinido') NOT IN ('IRPF','IVA','IS','IE','RAR') THEN 'Otros'
          ELSE familias.desc_familia
      END AS familia_impuesto,
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
      cod_grupo,
      grupo,
      cod_subgrupo,
      subgrupo,
      id_subconcepto,
      subconcepto,
      cod_indicador,
      origen,
      cod_origen,
      id_origen,
      indicador,
      importe,
      numero
    FROM (SELECT
            a_devolver.id_contribuyente id_contribuyente,
            a_devolver.modelo modelo,
            a_devolver.fecha_contraido fecha_contraido,
            a_devolver.fecha_referencia fecha_referencia,
            a_devolver.ejercicio ejercicio,
            a_devolver.cod_periodo cod_periodo,
            a_devolver.cod_grupo cod_grupo,
            a_devolver.cod_subgrupo cod_subgrupo,
            a_devolver.id_subconcepto id_subconcepto,
            a_devolver.id_origen id_origen,
            a_devolver.cod_indicador cod_indicador,
            a_devolver.id_ejercicio id_ejercicio,
            a_devolver.id_ejercicio_reciente id_ejercicio_reciente,
            a_devolver.grupo grupo,
            a_devolver.subgrupo subgrupo,
            a_devolver.subconcepto subconcepto,
            a_devolver.origen origen,
            a_devolver.cod_origen cod_origen,
            a_devolver.indicador indicador,
            a_devolver.importe importe,
            a_devolver.numero numero
          FROM #a_devolver__1FF5E a_devolver) deudas
    INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes contribuyentes ON (contribuyentes.id_contribuyente=deudas.id_contribuyente)
    INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_modelos modelos ON (modelos.cod_modelo=deudas.modelo)
    INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_familias_tributarias familias ON (familias.id_familia_tributaria=modelos.id_familia_tributaria)
    INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_tipos_periodo tipos_periodo ON (tipos_periodo.cod_periodo=deudas.cod_periodo)
    WHERE fecha_contraido BETWEEN dateadd(mm,-48,getdate()) AND eomonth(getdate())
  )
  MERGE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle AS tbn1_ssrs_vencimientos_detalle
  USING query ON query.nif_maestro=tbn1_ssrs_vencimientos_detalle.nif_maestro AND query.id_anyo_mes=tbn1_ssrs_vencimientos_detalle.id_anyo_mes AND query.id_anyo_mes_ref=tbn1_ssrs_vencimientos_detalle.id_anyo_mes_ref AND query.id_familia_impuesto=tbn1_ssrs_vencimientos_detalle.id_familia_impuesto AND query.id_modelo=tbn1_ssrs_vencimientos_detalle.id_modelo AND query.id_ejercicio=tbn1_ssrs_vencimientos_detalle.id_ejercicio AND query.id_tipo_periodo=tbn1_ssrs_vencimientos_detalle.id_tipo_periodo AND query.cod_grupo=tbn1_ssrs_vencimientos_detalle.cod_grupo AND query.cod_subgrupo=tbn1_ssrs_vencimientos_detalle.cod_subgrupo AND query.id_subconcepto=tbn1_ssrs_vencimientos_detalle.id_subconcepto AND query.cod_indicador=tbn1_ssrs_vencimientos_detalle.cod_indicador AND query.id_origen=tbn1_ssrs_vencimientos_detalle.id_origen
  WHEN MATCHED AND (tbn1_ssrs_vencimientos_detalle.cod_indicador='dev'
                    AND (tbn1_ssrs_vencimientos_detalle.id_contribuyente<>query.id_contribuyente OR (tbn1_ssrs_vencimientos_detalle.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_ssrs_vencimientos_detalle.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_ssrs_vencimientos_detalle.razon_social<>query.razon_social OR (tbn1_ssrs_vencimientos_detalle.razon_social IS NULL AND query.razon_social IS NOT NULL) OR  (tbn1_ssrs_vencimientos_detalle.razon_social IS NOT NULL AND query.razon_social IS NULL)
                    OR tbn1_ssrs_vencimientos_detalle.anyo_mes<>query.anyo_mes OR (tbn1_ssrs_vencimientos_detalle.anyo_mes IS NULL AND query.anyo_mes IS NOT NULL) OR  (tbn1_ssrs_vencimientos_detalle.anyo_mes IS NOT NULL AND query.anyo_mes IS NULL)
                    OR tbn1_ssrs_vencimientos_detalle.anyo<>query.anyo OR (tbn1_ssrs_vencimientos_detalle.anyo IS NULL AND query.anyo IS NOT NULL) OR  (tbn1_ssrs_vencimientos_detalle.anyo IS NOT NULL AND query.anyo IS NULL)
                    OR tbn1_ssrs_vencimientos_detalle.anyo_mes_ref<>query.anyo_mes_ref OR (tbn1_ssrs_vencimientos_detalle.anyo_mes_ref IS NULL AND query.anyo_mes_ref IS NOT NULL) OR  (tbn1_ssrs_vencimientos_detalle.anyo_mes_ref IS NOT NULL AND query.anyo_mes_ref IS NULL)
                    OR tbn1_ssrs_vencimientos_detalle.familia_impuesto<>query.familia_impuesto OR (tbn1_ssrs_vencimientos_detalle.familia_impuesto IS NULL AND query.familia_impuesto IS NOT NULL) OR  (tbn1_ssrs_vencimientos_detalle.familia_impuesto IS NOT NULL AND query.familia_impuesto IS NULL)
                    OR tbn1_ssrs_vencimientos_detalle.modelo<>query.modelo OR (tbn1_ssrs_vencimientos_detalle.modelo IS NULL AND query.modelo IS NOT NULL) OR  (tbn1_ssrs_vencimientos_detalle.modelo IS NOT NULL AND query.modelo IS NULL)
                    OR tbn1_ssrs_vencimientos_detalle.ejercicio<>query.ejercicio OR (tbn1_ssrs_vencimientos_detalle.ejercicio IS NULL AND query.ejercicio IS NOT NULL) OR  (tbn1_ssrs_vencimientos_detalle.ejercicio IS NOT NULL AND query.ejercicio IS NULL)
                    OR tbn1_ssrs_vencimientos_detalle.id_ejercicio_reciente<>query.id_ejercicio_reciente OR (tbn1_ssrs_vencimientos_detalle.id_ejercicio_reciente IS NULL AND query.id_ejercicio_reciente IS NOT NULL) OR  (tbn1_ssrs_vencimientos_detalle.id_ejercicio_reciente IS NOT NULL AND query.id_ejercicio_reciente IS NULL)
                    OR tbn1_ssrs_vencimientos_detalle.tipo_periodo<>query.tipo_periodo OR (tbn1_ssrs_vencimientos_detalle.tipo_periodo IS NULL AND query.tipo_periodo IS NOT NULL) OR  (tbn1_ssrs_vencimientos_detalle.tipo_periodo IS NOT NULL AND query.tipo_periodo IS NULL)
                    OR tbn1_ssrs_vencimientos_detalle.grupo<>query.grupo OR (tbn1_ssrs_vencimientos_detalle.grupo IS NULL AND query.grupo IS NOT NULL) OR  (tbn1_ssrs_vencimientos_detalle.grupo IS NOT NULL AND query.grupo IS NULL)
                    OR tbn1_ssrs_vencimientos_detalle.subgrupo<>query.subgrupo OR (tbn1_ssrs_vencimientos_detalle.subgrupo IS NULL AND query.subgrupo IS NOT NULL) OR  (tbn1_ssrs_vencimientos_detalle.subgrupo IS NOT NULL AND query.subgrupo IS NULL)
                    OR tbn1_ssrs_vencimientos_detalle.subconcepto<>query.subconcepto OR (tbn1_ssrs_vencimientos_detalle.subconcepto IS NULL AND query.subconcepto IS NOT NULL) OR  (tbn1_ssrs_vencimientos_detalle.subconcepto IS NOT NULL AND query.subconcepto IS NULL)
                    OR tbn1_ssrs_vencimientos_detalle.origen<>query.origen OR (tbn1_ssrs_vencimientos_detalle.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_ssrs_vencimientos_detalle.origen IS NOT NULL AND query.origen IS NULL)
                    OR tbn1_ssrs_vencimientos_detalle.cod_origen<>query.cod_origen OR (tbn1_ssrs_vencimientos_detalle.cod_origen IS NULL AND query.cod_origen IS NOT NULL) OR  (tbn1_ssrs_vencimientos_detalle.cod_origen IS NOT NULL AND query.cod_origen IS NULL)
                    OR tbn1_ssrs_vencimientos_detalle.indicador<>query.indicador OR (tbn1_ssrs_vencimientos_detalle.indicador IS NULL AND query.indicador IS NOT NULL) OR  (tbn1_ssrs_vencimientos_detalle.indicador IS NOT NULL AND query.indicador IS NULL)
                    OR tbn1_ssrs_vencimientos_detalle.importe<>query.importe OR (tbn1_ssrs_vencimientos_detalle.importe IS NULL AND query.importe IS NOT NULL) OR  (tbn1_ssrs_vencimientos_detalle.importe IS NOT NULL AND query.importe IS NULL)
                    OR tbn1_ssrs_vencimientos_detalle.numero<>query.numero OR (tbn1_ssrs_vencimientos_detalle.numero IS NULL AND query.numero IS NOT NULL) OR  (tbn1_ssrs_vencimientos_detalle.numero IS NOT NULL AND query.numero IS NULL))) THEN
    UPDATE SET
      id_contribuyente=query.id_contribuyente,
      razon_social=query.razon_social,
      anyo_mes=query.anyo_mes,
      anyo=query.anyo,
      anyo_mes_ref=query.anyo_mes_ref,
      familia_impuesto=query.familia_impuesto,
      modelo=query.modelo,
      ejercicio=query.ejercicio,
      id_ejercicio_reciente=query.id_ejercicio_reciente,
      tipo_periodo=query.tipo_periodo,
      grupo=query.grupo,
      subgrupo=query.subgrupo,
      subconcepto=query.subconcepto,
      origen=query.origen,
      cod_origen=query.cod_origen,
      indicador=query.indicador,
      importe=query.importe,
      numero=query.numero
  WHEN NOT MATCHED THEN
    INSERT (id_contribuyente,nif_maestro,razon_social,id_anyo_mes,anyo_mes,anyo,id_anyo_mes_ref,anyo_mes_ref,id_familia_impuesto,familia_impuesto,id_modelo,modelo,id_ejercicio,ejercicio,id_ejercicio_reciente,id_tipo_periodo,tipo_periodo,cod_grupo,grupo,cod_subgrupo,subgrupo,id_subconcepto,subconcepto,cod_indicador,origen,cod_origen,id_origen,indicador,importe,numero) VALUES (
      query.id_contribuyente,
      query.nif_maestro,
      query.razon_social,
      query.id_anyo_mes,
      query.anyo_mes,
      query.anyo,
      query.id_anyo_mes_ref,
      query.anyo_mes_ref,
      query.id_familia_impuesto,
      query.familia_impuesto,
      query.id_modelo,
      query.modelo,
      query.id_ejercicio,
      query.ejercicio,
      query.id_ejercicio_reciente,
      query.id_tipo_periodo,
      query.tipo_periodo,
      query.cod_grupo,
      query.grupo,
      query.cod_subgrupo,
      query.subgrupo,
      query.id_subconcepto,
      query.subconcepto,
      query.cod_indicador,
      query.origen,
      query.cod_origen,
      query.id_origen,
      query.indicador,
      query.importe,
      query.numero)
  WHEN NOT MATCHED BY SOURCE AND (tbn1_ssrs_vencimientos_detalle.cod_indicador='dev') THEN
    DELETE;

  EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
   END TRY
  BEGIN CATCH
    EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null;
    UPDATE dbn1_norm_dhyf.audit.tbn1_logs SET
      mensaje_error=error_message(),
      procedimiento_error=error_procedure()
    WHERE
      id_log=@log;
    IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
  END CATCH


END

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_ssrs_vencimientos_detalle' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_ssrs_vencimientos_detalle;
GO

CREATE PROCEDURE dbo.spn1_cargar_ssrs_vencimientos_detalle(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_ssrs_vencimientos_detalle'
  SET NOCOUNT ON;
  DECLARE @log int;
  EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name;
  DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log);
  DECLARE @continuar_en_caso_error bit=0;
  IF @logpadre IS NOT NULL AND EXISTS (SELECT 1 AS expr1
  FROM dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
  WHERE
    'dbn1_stg_dhyf.dbo.'+procedimiento=@procedure_name
    AND excluido=1
  ) BEGIN
    UPDATE dbn1_norm_dhyf.audit.tbn1_logs SET
      mensaje_error='EXCLUÍDO'
    WHERE
      id_log=@log;
    RETURN
  END
     BEGIN TRY

  -- Materialized query: a_ingresar
  SELECT
    deudas.id_contribuyente AS id_contribuyente,
    deudas.modelo AS modelo,
    eomonth(fecha_contraido) AS fecha_contraido,
    eomonth(eomonth(fecha_contraido)) AS fecha_referencia,
    id_ejercicio,
    ejercicio_tributario AS ejercicio,
    id_ejercicio_reciente,
    periodo AS cod_periodo,
    grupos.cod_grupo AS cod_grupo,
    grupos.des_grupo AS grupo,
    grupos.cod_subgrupo AS cod_subgrupo,
    grupos.des_subgrupo AS subgrupo,
    grupos.id_grupo_subgrupo_subconcepto AS id_subconcepto,
    grupos.des_subconcepto AS subconcepto,
    deudas.des_origen AS origen,
    deudas.cod_origen AS cod_origen,
    deudas.id_origen_liquidacion AS id_origen,
    'ing' AS cod_indicador,
    'ingresar' AS indicador,
    sum(mov.importe) AS importe,
    count(DISTINCT deudas.id_deuda) AS numero
  INTO #a_ingresar__0A043
  FROM dbn1_dmr_dhyf.dbo.tbn1_dim_ot_deudas deudas
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_ssrs_ot_contraido_por_deuda mov ON (mov.id_deuda=deudas.id_deuda)
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_ot_clases_movimientos clase ON (clase.id_clase_movimiento=mov.id_clase_movimiento)
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_ot_grupos_subgrupos_subconceptos grupos ON (grupos.id_grupo_subgrupo_subconcepto=mov.id_grupo_subgrupo_subconcepto)
  WHERE
    deudas.cod_origen='AU'
    AND clase.tipo_movimiento<>'Ingresado'
  GROUP BY
    deudas.id_contribuyente,
    deudas.modelo,
    eomonth(fecha_contraido),
    eomonth(eomonth(fecha_contraido)),
    id_ejercicio,
    ejercicio_tributario,
    id_ejercicio_reciente,
    periodo,
    grupos.cod_grupo,
    grupos.des_grupo,
    grupos.cod_subgrupo,
    grupos.des_subgrupo,
    grupos.id_grupo_subgrupo_subconcepto,
    grupos.des_subconcepto,
    deudas.des_origen,
    deudas.cod_origen,
    deudas.id_origen_liquidacion
  
  
  
  CREATE UNIQUE INDEX unique_index_tmp_a_ingresar__0A043 ON #a_ingresar__0A043 (id_contribuyente,modelo,fecha_contraido,fecha_referencia,ejercicio,cod_periodo,cod_grupo,cod_subgrupo,id_subconcepto,id_origen,cod_indicador)
  
  -- Materialized query: ingresado
  SELECT
    deudas.id_contribuyente AS id_contribuyente,
    deudas.modelo AS modelo,
    eomonth(deudas.fecha_contraido) AS fecha_contraido,
    eomonth(mov.fecha) AS fecha_referencia,
    id_ejercicio,
    ejercicio_tributario AS ejercicio,
    id_ejercicio_reciente,
    periodo AS cod_periodo,
    grupos.cod_grupo AS cod_grupo,
    grupos.des_grupo AS grupo,
    grupos.cod_subgrupo AS cod_subgrupo,
    grupos.des_subgrupo AS subgrupo,
    grupos.id_grupo_subgrupo_subconcepto AS id_subconcepto,
    grupos.des_subconcepto AS subconcepto,
    deudas.des_origen AS origen,
    deudas.cod_origen AS cod_origen,
    deudas.id_origen_liquidacion AS id_origen,
    'ind' AS cod_indicador,
    'ingresado' AS indicador,
    sum(mov.importe) AS importe,
    count(DISTINCT deudas.id_deuda) AS numero
  INTO #ingresado__69756
  FROM dbn1_dmr_dhyf.dbo.tbn1_dim_ot_deudas deudas
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_ssrs_ot_contraido_por_deuda mov ON (mov.id_deuda=deudas.id_deuda)
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_ot_clases_movimientos clase ON (clase.id_clase_movimiento=mov.id_clase_movimiento)
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_ot_grupos_subgrupos_subconceptos grupos ON (grupos.id_grupo_subgrupo_subconcepto=mov.id_grupo_subgrupo_subconcepto)
  WHERE clase.tipo_movimiento='Ingresado'
  GROUP BY
    deudas.id_contribuyente,
    deudas.modelo,
    eomonth(deudas.fecha_contraido),
    eomonth(mov.fecha),
    id_ejercicio,
    ejercicio_tributario,
    id_ejercicio_reciente,
    periodo,
    grupos.cod_grupo,
    grupos.des_grupo,
    grupos.cod_subgrupo,
    grupos.des_subgrupo,
    grupos.id_grupo_subgrupo_subconcepto,
    grupos.des_subconcepto,
    deudas.des_origen,
    deudas.cod_origen,
    deudas.id_origen_liquidacion
  
  
  
  CREATE UNIQUE INDEX unique_index_tmp_ingresado__69756 ON #ingresado__69756 (id_contribuyente,modelo,fecha_contraido,fecha_referencia,ejercicio,cod_periodo,cod_grupo,cod_subgrupo,id_subconcepto,id_origen,cod_indicador)
  
  -- Materialized query: pendiente
  SELECT
    deudas.id_contribuyente AS id_contribuyente,
    deudas.modelo AS modelo,
    eomonth(deudas.fecha_contraido) AS fecha_contraido,
    eomonth(mov.fecha) AS fecha_referencia,
    id_ejercicio,
    ejercicio_tributario AS ejercicio,
    id_ejercicio_reciente,
    periodo AS cod_periodo,
    grupos.cod_grupo AS cod_grupo,
    grupos.des_grupo AS grupo,
    grupos.cod_subgrupo AS cod_subgrupo,
    grupos.des_subgrupo AS subgrupo,
    grupos.id_grupo_subgrupo_subconcepto AS id_subconcepto,
    grupos.des_subconcepto AS subconcepto,
    deudas.des_origen AS origen,
    deudas.cod_origen AS cod_origen,
    deudas.id_origen_liquidacion AS id_origen,
    'pte' AS cod_indicador,
    'pendiente' AS indicador,
    sum(mov.importe) AS importe,
    count(DISTINCT deudas.id_deuda) AS numero
  INTO #pendiente__268DE
  FROM dbn1_dmr_dhyf.dbo.tbn1_dim_ot_deudas deudas
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_ssrs_ot_contraido_por_deuda mov ON (mov.id_deuda=deudas.id_deuda)
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_ot_clases_movimientos clase ON (clase.id_clase_movimiento=mov.id_clase_movimiento)
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_ot_grupos_subgrupos_subconceptos grupos ON (grupos.id_grupo_subgrupo_subconcepto=mov.id_grupo_subgrupo_subconcepto)
  GROUP BY
    deudas.id_contribuyente,
    deudas.modelo,
    eomonth(deudas.fecha_contraido),
    eomonth(mov.fecha),
    id_ejercicio,
    ejercicio_tributario,
    id_ejercicio_reciente,
    periodo,
    grupos.cod_grupo,
    grupos.des_grupo,
    grupos.cod_subgrupo,
    grupos.des_subgrupo,
    grupos.id_grupo_subgrupo_subconcepto,
    grupos.des_subconcepto,
    deudas.des_origen,
    deudas.cod_origen,
    deudas.id_origen_liquidacion
  HAVING sum(mov.importe)<>0
  
  
  
  CREATE UNIQUE INDEX unique_index_tmp_pendiente__268DE ON #pendiente__268DE (id_contribuyente,modelo,fecha_contraido,fecha_referencia,ejercicio,cod_periodo,cod_grupo,cod_subgrupo,id_subconcepto,id_origen,cod_indicador)
  
  -- Materialized query: anulado
  SELECT
    deudas.id_contribuyente AS id_contribuyente,
    deudas.modelo AS modelo,
    eomonth(deudas.fecha_contraido) AS fecha_contraido,
    eomonth(mov.fecha) AS fecha_referencia,
    id_ejercicio,
    ejercicio_tributario AS ejercicio,
    id_ejercicio_reciente,
    periodo AS cod_periodo,
    grupos.cod_grupo AS cod_grupo,
    grupos.des_grupo AS grupo,
    grupos.cod_subgrupo AS cod_subgrupo,
    grupos.des_subgrupo AS subgrupo,
    grupos.id_grupo_subgrupo_subconcepto AS id_subconcepto,
    grupos.des_subconcepto AS subconcepto,
    deudas.des_origen AS origen,
    deudas.cod_origen AS cod_origen,
    deudas.id_origen_liquidacion AS id_origen,
    'anu' AS cod_indicador,
    'anulado' AS indicador,
    sum(mov.importe) AS importe,
    count(DISTINCT deudas.id_deuda) AS numero
  INTO #anulado__AAC91
  FROM dbn1_dmr_dhyf.dbo.tbn1_dim_ot_deudas deudas
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_ssrs_ot_contraido_por_deuda mov ON (mov.id_deuda=deudas.id_deuda)
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_ot_clases_movimientos clase ON (clase.id_clase_movimiento=mov.id_clase_movimiento)
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_ot_grupos_subgrupos_subconceptos grupos ON (grupos.id_grupo_subgrupo_subconcepto=mov.id_grupo_subgrupo_subconcepto)
  WHERE clase.tipo_movimiento='Anulado'
  GROUP BY
    deudas.id_contribuyente,
    deudas.modelo,
    eomonth(deudas.fecha_contraido),
    eomonth(mov.fecha),
    id_ejercicio,
    ejercicio_tributario,
    id_ejercicio_reciente,
    periodo,
    grupos.cod_grupo,
    grupos.des_grupo,
    grupos.cod_subgrupo,
    grupos.des_subgrupo,
    grupos.id_grupo_subgrupo_subconcepto,
    grupos.des_subconcepto,
    deudas.des_origen,
    deudas.cod_origen,
    deudas.id_origen_liquidacion
  
  
  
  CREATE UNIQUE INDEX unique_index_tmp_anulado__AAC91 ON #anulado__AAC91 (id_contribuyente,modelo,fecha_contraido,fecha_referencia,ejercicio,cod_periodo,cod_grupo,cod_subgrupo,id_subconcepto,id_origen,cod_indicador)
  
  -- Materialized query: contraido
  SELECT
    deudas.id_contribuyente AS id_contribuyente,
    deudas.modelo AS modelo,
    eomonth(deudas.fecha_contraido) AS fecha_contraido,
    eomonth(mov.fecha) AS fecha_referencia,
    id_ejercicio,
    ejercicio_tributario AS ejercicio,
    id_ejercicio_reciente,
    periodo AS cod_periodo,
    grupos.cod_grupo AS cod_grupo,
    grupos.des_grupo AS grupo,
    grupos.cod_subgrupo AS cod_subgrupo,
    grupos.des_subgrupo AS subgrupo,
    grupos.id_grupo_subgrupo_subconcepto AS id_subconcepto,
    grupos.des_subconcepto AS subconcepto,
    deudas.des_origen AS origen,
    deudas.cod_origen AS cod_origen,
    deudas.id_origen_liquidacion AS id_origen,
    'con' AS cod_indicador,
    'contraído' AS indicador,
    sum(mov.importe) AS importe,
    count(DISTINCT deudas.id_deuda) AS numero
  INTO #contraido__778AD
  FROM dbn1_dmr_dhyf.dbo.tbn1_dim_ot_deudas deudas
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_ssrs_ot_contraido_por_deuda mov ON (mov.id_deuda=deudas.id_deuda)
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_ot_clases_movimientos clase ON (clase.id_clase_movimiento=mov.id_clase_movimiento)
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_ot_grupos_subgrupos_subconceptos grupos ON (grupos.id_grupo_subgrupo_subconcepto=mov.id_grupo_subgrupo_subconcepto)
  WHERE clase.tipo_movimiento='Contraído'
  GROUP BY
    deudas.id_contribuyente,
    deudas.modelo,
    eomonth(deudas.fecha_contraido),
    eomonth(mov.fecha),
    id_ejercicio,
    ejercicio_tributario,
    id_ejercicio_reciente,
    periodo,
    grupos.cod_grupo,
    grupos.des_grupo,
    grupos.cod_subgrupo,
    grupos.des_subgrupo,
    grupos.id_grupo_subgrupo_subconcepto,
    grupos.des_subconcepto,
    deudas.des_origen,
    deudas.cod_origen,
    deudas.id_origen_liquidacion
  
  
  
  CREATE UNIQUE INDEX unique_index_tmp_contraido__778AD ON #contraido__778AD (id_contribuyente,modelo,fecha_contraido,fecha_referencia,ejercicio,cod_periodo,cod_grupo,cod_subgrupo,id_subconcepto,id_origen,cod_indicador)
  
  ;WITH
  query AS (
    SELECT
      contribuyentes.id_contribuyente AS id_contribuyente,
      contribuyentes.nif_maestro AS nif_maestro,
      contribuyentes.nombre AS razon_social,
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
      CASE
          WHEN coalesce(familias.cod_familia,'Indefinido') NOT IN ('IRPF','IVA','IS','IE','RAR') THEN 999
          ELSE familias.id_familia_tributaria
      END AS id_familia_impuesto,
      CASE
          WHEN coalesce(familias.cod_familia,'Indefinido') NOT IN ('IRPF','IVA','IS','IE','RAR') THEN 'Otros'
          ELSE familias.desc_familia
      END AS familia_impuesto,
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
      cod_grupo,
      grupo,
      cod_subgrupo,
      subgrupo,
      id_subconcepto,
      subconcepto,
      cod_indicador,
      origen,
      cod_origen,
      id_origen,
      indicador,
      importe,
      numero
    FROM (SELECT
            coalesce(a_ingresar.id_contribuyente,ingresado.id_contribuyente,pendiente.id_contribuyente,anulado.id_contribuyente,contraido.id_contribuyente) id_contribuyente,
            coalesce(a_ingresar.modelo,ingresado.modelo,pendiente.modelo,anulado.modelo,contraido.modelo) modelo,
            coalesce(a_ingresar.fecha_contraido,ingresado.fecha_contraido,pendiente.fecha_contraido,anulado.fecha_contraido,contraido.fecha_contraido) fecha_contraido,
            coalesce(a_ingresar.fecha_referencia,ingresado.fecha_referencia,pendiente.fecha_referencia,anulado.fecha_referencia,contraido.fecha_referencia) fecha_referencia,
            coalesce(a_ingresar.ejercicio,ingresado.ejercicio,pendiente.ejercicio,anulado.ejercicio,contraido.ejercicio) ejercicio,
            coalesce(a_ingresar.cod_periodo,ingresado.cod_periodo,pendiente.cod_periodo,anulado.cod_periodo,contraido.cod_periodo) cod_periodo,
            coalesce(a_ingresar.cod_grupo,ingresado.cod_grupo,pendiente.cod_grupo,anulado.cod_grupo,contraido.cod_grupo) cod_grupo,
            coalesce(a_ingresar.cod_subgrupo,ingresado.cod_subgrupo,pendiente.cod_subgrupo,anulado.cod_subgrupo,contraido.cod_subgrupo) cod_subgrupo,
            coalesce(a_ingresar.id_subconcepto,ingresado.id_subconcepto,pendiente.id_subconcepto,anulado.id_subconcepto,contraido.id_subconcepto) id_subconcepto,
            coalesce(a_ingresar.id_origen,ingresado.id_origen,pendiente.id_origen,anulado.id_origen,contraido.id_origen) id_origen,
            coalesce(a_ingresar.cod_indicador,ingresado.cod_indicador,pendiente.cod_indicador,anulado.cod_indicador,contraido.cod_indicador) cod_indicador,
            coalesce(a_ingresar.id_ejercicio,ingresado.id_ejercicio,pendiente.id_ejercicio,anulado.id_ejercicio,contraido.id_ejercicio) id_ejercicio,
            coalesce(a_ingresar.id_ejercicio_reciente,ingresado.id_ejercicio_reciente,pendiente.id_ejercicio_reciente,anulado.id_ejercicio_reciente,contraido.id_ejercicio_reciente) id_ejercicio_reciente,
            coalesce(a_ingresar.grupo,ingresado.grupo,pendiente.grupo,anulado.grupo,contraido.grupo) grupo,
            coalesce(a_ingresar.subgrupo,ingresado.subgrupo,pendiente.subgrupo,anulado.subgrupo,contraido.subgrupo) subgrupo,
            coalesce(a_ingresar.subconcepto,ingresado.subconcepto,pendiente.subconcepto,anulado.subconcepto,contraido.subconcepto) subconcepto,
            coalesce(a_ingresar.origen,ingresado.origen,pendiente.origen,anulado.origen,contraido.origen) origen,
            coalesce(a_ingresar.cod_origen,ingresado.cod_origen,pendiente.cod_origen,anulado.cod_origen,contraido.cod_origen) cod_origen,
            coalesce(a_ingresar.indicador,ingresado.indicador,pendiente.indicador,anulado.indicador,contraido.indicador) indicador,
            coalesce(a_ingresar.importe,ingresado.importe,pendiente.importe,anulado.importe,contraido.importe) importe,
            coalesce(a_ingresar.numero,ingresado.numero,pendiente.numero,anulado.numero,contraido.numero) numero
          FROM #a_ingresar__0A043 a_ingresar
          FULL JOIN #ingresado__69756 ingresado ON (a_ingresar.id_contribuyente=ingresado.id_contribuyente AND a_ingresar.modelo=ingresado.modelo AND a_ingresar.fecha_contraido=ingresado.fecha_contraido AND a_ingresar.fecha_referencia=ingresado.fecha_referencia AND a_ingresar.ejercicio=ingresado.ejercicio AND a_ingresar.cod_periodo=ingresado.cod_periodo AND a_ingresar.cod_grupo=ingresado.cod_grupo AND a_ingresar.cod_subgrupo=ingresado.cod_subgrupo AND a_ingresar.id_subconcepto=ingresado.id_subconcepto AND a_ingresar.id_origen=ingresado.id_origen AND a_ingresar.cod_indicador=ingresado.cod_indicador)
          FULL JOIN #pendiente__268DE pendiente ON (coalesce(a_ingresar.id_contribuyente,INGRESADO.id_contribuyente)=pendiente.id_contribuyente AND coalesce(a_ingresar.modelo,INGRESADO.modelo)=pendiente.modelo AND coalesce(a_ingresar.fecha_contraido,INGRESADO.fecha_contraido)=pendiente.fecha_contraido AND coalesce(a_ingresar.fecha_referencia,INGRESADO.fecha_referencia)=pendiente.fecha_referencia AND coalesce(a_ingresar.ejercicio,INGRESADO.ejercicio)=pendiente.ejercicio AND coalesce(a_ingresar.cod_periodo,INGRESADO.cod_periodo)=pendiente.cod_periodo AND coalesce(a_ingresar.cod_grupo,INGRESADO.cod_grupo)=pendiente.cod_grupo AND coalesce(a_ingresar.cod_subgrupo,INGRESADO.cod_subgrupo)=pendiente.cod_subgrupo AND coalesce(a_ingresar.id_subconcepto,INGRESADO.id_subconcepto)=pendiente.id_subconcepto AND coalesce(a_ingresar.id_origen,INGRESADO.id_origen)=pendiente.id_origen AND coalesce(a_ingresar.cod_indicador,INGRESADO.cod_indicador)=pendiente.cod_indicador)
          FULL JOIN #anulado__AAC91 anulado ON (coalesce(a_ingresar.id_contribuyente,INGRESADO.id_contribuyente,PENDIENTE.id_contribuyente)=anulado.id_contribuyente AND coalesce(a_ingresar.modelo,INGRESADO.modelo,PENDIENTE.modelo)=anulado.modelo AND coalesce(a_ingresar.fecha_contraido,INGRESADO.fecha_contraido,PENDIENTE.fecha_contraido)=anulado.fecha_contraido AND coalesce(a_ingresar.fecha_referencia,INGRESADO.fecha_referencia,PENDIENTE.fecha_referencia)=anulado.fecha_referencia AND coalesce(a_ingresar.ejercicio,INGRESADO.ejercicio,PENDIENTE.ejercicio)=anulado.ejercicio AND coalesce(a_ingresar.cod_periodo,INGRESADO.cod_periodo,PENDIENTE.cod_periodo)=anulado.cod_periodo AND coalesce(a_ingresar.cod_grupo,INGRESADO.cod_grupo,PENDIENTE.cod_grupo)=anulado.cod_grupo AND coalesce(a_ingresar.cod_subgrupo,INGRESADO.cod_subgrupo,PENDIENTE.cod_subgrupo)=anulado.cod_subgrupo AND coalesce(a_ingresar.id_subconcepto,INGRESADO.id_subconcepto,PENDIENTE.id_subconcepto)=anulado.id_subconcepto AND coalesce(a_ingresar.id_origen,INGRESADO.id_origen,PENDIENTE.id_origen)=anulado.id_origen AND coalesce(a_ingresar.cod_indicador,INGRESADO.cod_indicador,PENDIENTE.cod_indicador)=anulado.cod_indicador)
          FULL JOIN #contraido__778AD contraido ON (coalesce(a_ingresar.id_contribuyente,INGRESADO.id_contribuyente,PENDIENTE.id_contribuyente,ANULADO.id_contribuyente)=contraido.id_contribuyente AND coalesce(a_ingresar.modelo,INGRESADO.modelo,PENDIENTE.modelo,ANULADO.modelo)=contraido.modelo AND coalesce(a_ingresar.fecha_contraido,INGRESADO.fecha_contraido,PENDIENTE.fecha_contraido,ANULADO.fecha_contraido)=contraido.fecha_contraido AND coalesce(a_ingresar.fecha_referencia,INGRESADO.fecha_referencia,PENDIENTE.fecha_referencia,ANULADO.fecha_referencia)=contraido.fecha_referencia AND coalesce(a_ingresar.ejercicio,INGRESADO.ejercicio,PENDIENTE.ejercicio,ANULADO.ejercicio)=contraido.ejercicio AND coalesce(a_ingresar.cod_periodo,INGRESADO.cod_periodo,PENDIENTE.cod_periodo,ANULADO.cod_periodo)=contraido.cod_periodo AND coalesce(a_ingresar.cod_grupo,INGRESADO.cod_grupo,PENDIENTE.cod_grupo,ANULADO.cod_grupo)=contraido.cod_grupo AND coalesce(a_ingresar.cod_subgrupo,INGRESADO.cod_subgrupo,PENDIENTE.cod_subgrupo,ANULADO.cod_subgrupo)=contraido.cod_subgrupo AND coalesce(a_ingresar.id_subconcepto,INGRESADO.id_subconcepto,PENDIENTE.id_subconcepto,ANULADO.id_subconcepto)=contraido.id_subconcepto AND coalesce(a_ingresar.id_origen,INGRESADO.id_origen,PENDIENTE.id_origen,ANULADO.id_origen)=contraido.id_origen AND coalesce(a_ingresar.cod_indicador,INGRESADO.cod_indicador,PENDIENTE.cod_indicador,ANULADO.cod_indicador)=contraido.cod_indicador)) deudas
    INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes contribuyentes ON (contribuyentes.id_contribuyente=deudas.id_contribuyente)
    INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_modelos modelos ON (modelos.cod_modelo=deudas.modelo)
    INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_familias_tributarias familias ON (familias.id_familia_tributaria=modelos.id_familia_tributaria)
    INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_tipos_periodo tipos_periodo ON (tipos_periodo.cod_periodo=deudas.cod_periodo)
    WHERE fecha_contraido BETWEEN dateadd(mm,-48,getdate()) AND eomonth(getdate())
  )
  MERGE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_detalle AS tbn1_ssrs_vencimientos_detalle
  USING query ON query.nif_maestro=tbn1_ssrs_vencimientos_detalle.nif_maestro AND query.id_anyo_mes=tbn1_ssrs_vencimientos_detalle.id_anyo_mes AND query.id_anyo_mes_ref=tbn1_ssrs_vencimientos_detalle.id_anyo_mes_ref AND query.id_familia_impuesto=tbn1_ssrs_vencimientos_detalle.id_familia_impuesto AND query.id_modelo=tbn1_ssrs_vencimientos_detalle.id_modelo AND query.id_ejercicio=tbn1_ssrs_vencimientos_detalle.id_ejercicio AND query.id_tipo_periodo=tbn1_ssrs_vencimientos_detalle.id_tipo_periodo AND query.cod_grupo=tbn1_ssrs_vencimientos_detalle.cod_grupo AND query.cod_subgrupo=tbn1_ssrs_vencimientos_detalle.cod_subgrupo AND query.id_subconcepto=tbn1_ssrs_vencimientos_detalle.id_subconcepto AND query.cod_indicador=tbn1_ssrs_vencimientos_detalle.cod_indicador AND query.id_origen=tbn1_ssrs_vencimientos_detalle.id_origen
  WHEN MATCHED AND (tbn1_ssrs_vencimientos_detalle.cod_indicador<>'dev'
                    AND (tbn1_ssrs_vencimientos_detalle.id_contribuyente<>query.id_contribuyente OR (tbn1_ssrs_vencimientos_detalle.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_ssrs_vencimientos_detalle.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_ssrs_vencimientos_detalle.razon_social<>query.razon_social OR (tbn1_ssrs_vencimientos_detalle.razon_social IS NULL AND query.razon_social IS NOT NULL) OR  (tbn1_ssrs_vencimientos_detalle.razon_social IS NOT NULL AND query.razon_social IS NULL)
                    OR tbn1_ssrs_vencimientos_detalle.anyo_mes<>query.anyo_mes OR (tbn1_ssrs_vencimientos_detalle.anyo_mes IS NULL AND query.anyo_mes IS NOT NULL) OR  (tbn1_ssrs_vencimientos_detalle.anyo_mes IS NOT NULL AND query.anyo_mes IS NULL)
                    OR tbn1_ssrs_vencimientos_detalle.anyo<>query.anyo OR (tbn1_ssrs_vencimientos_detalle.anyo IS NULL AND query.anyo IS NOT NULL) OR  (tbn1_ssrs_vencimientos_detalle.anyo IS NOT NULL AND query.anyo IS NULL)
                    OR tbn1_ssrs_vencimientos_detalle.anyo_mes_ref<>query.anyo_mes_ref OR (tbn1_ssrs_vencimientos_detalle.anyo_mes_ref IS NULL AND query.anyo_mes_ref IS NOT NULL) OR  (tbn1_ssrs_vencimientos_detalle.anyo_mes_ref IS NOT NULL AND query.anyo_mes_ref IS NULL)
                    OR tbn1_ssrs_vencimientos_detalle.familia_impuesto<>query.familia_impuesto OR (tbn1_ssrs_vencimientos_detalle.familia_impuesto IS NULL AND query.familia_impuesto IS NOT NULL) OR  (tbn1_ssrs_vencimientos_detalle.familia_impuesto IS NOT NULL AND query.familia_impuesto IS NULL)
                    OR tbn1_ssrs_vencimientos_detalle.modelo<>query.modelo OR (tbn1_ssrs_vencimientos_detalle.modelo IS NULL AND query.modelo IS NOT NULL) OR  (tbn1_ssrs_vencimientos_detalle.modelo IS NOT NULL AND query.modelo IS NULL)
                    OR tbn1_ssrs_vencimientos_detalle.ejercicio<>query.ejercicio OR (tbn1_ssrs_vencimientos_detalle.ejercicio IS NULL AND query.ejercicio IS NOT NULL) OR  (tbn1_ssrs_vencimientos_detalle.ejercicio IS NOT NULL AND query.ejercicio IS NULL)
                    OR tbn1_ssrs_vencimientos_detalle.id_ejercicio_reciente<>query.id_ejercicio_reciente OR (tbn1_ssrs_vencimientos_detalle.id_ejercicio_reciente IS NULL AND query.id_ejercicio_reciente IS NOT NULL) OR  (tbn1_ssrs_vencimientos_detalle.id_ejercicio_reciente IS NOT NULL AND query.id_ejercicio_reciente IS NULL)
                    OR tbn1_ssrs_vencimientos_detalle.tipo_periodo<>query.tipo_periodo OR (tbn1_ssrs_vencimientos_detalle.tipo_periodo IS NULL AND query.tipo_periodo IS NOT NULL) OR  (tbn1_ssrs_vencimientos_detalle.tipo_periodo IS NOT NULL AND query.tipo_periodo IS NULL)
                    OR tbn1_ssrs_vencimientos_detalle.grupo<>query.grupo OR (tbn1_ssrs_vencimientos_detalle.grupo IS NULL AND query.grupo IS NOT NULL) OR  (tbn1_ssrs_vencimientos_detalle.grupo IS NOT NULL AND query.grupo IS NULL)
                    OR tbn1_ssrs_vencimientos_detalle.subgrupo<>query.subgrupo OR (tbn1_ssrs_vencimientos_detalle.subgrupo IS NULL AND query.subgrupo IS NOT NULL) OR  (tbn1_ssrs_vencimientos_detalle.subgrupo IS NOT NULL AND query.subgrupo IS NULL)
                    OR tbn1_ssrs_vencimientos_detalle.subconcepto<>query.subconcepto OR (tbn1_ssrs_vencimientos_detalle.subconcepto IS NULL AND query.subconcepto IS NOT NULL) OR  (tbn1_ssrs_vencimientos_detalle.subconcepto IS NOT NULL AND query.subconcepto IS NULL)
                    OR tbn1_ssrs_vencimientos_detalle.origen<>query.origen OR (tbn1_ssrs_vencimientos_detalle.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_ssrs_vencimientos_detalle.origen IS NOT NULL AND query.origen IS NULL)
                    OR tbn1_ssrs_vencimientos_detalle.cod_origen<>query.cod_origen OR (tbn1_ssrs_vencimientos_detalle.cod_origen IS NULL AND query.cod_origen IS NOT NULL) OR  (tbn1_ssrs_vencimientos_detalle.cod_origen IS NOT NULL AND query.cod_origen IS NULL)
                    OR tbn1_ssrs_vencimientos_detalle.indicador<>query.indicador OR (tbn1_ssrs_vencimientos_detalle.indicador IS NULL AND query.indicador IS NOT NULL) OR  (tbn1_ssrs_vencimientos_detalle.indicador IS NOT NULL AND query.indicador IS NULL)
                    OR tbn1_ssrs_vencimientos_detalle.importe<>query.importe OR (tbn1_ssrs_vencimientos_detalle.importe IS NULL AND query.importe IS NOT NULL) OR  (tbn1_ssrs_vencimientos_detalle.importe IS NOT NULL AND query.importe IS NULL)
                    OR tbn1_ssrs_vencimientos_detalle.numero<>query.numero OR (tbn1_ssrs_vencimientos_detalle.numero IS NULL AND query.numero IS NOT NULL) OR  (tbn1_ssrs_vencimientos_detalle.numero IS NOT NULL AND query.numero IS NULL))) THEN
    UPDATE SET
      id_contribuyente=query.id_contribuyente,
      razon_social=query.razon_social,
      anyo_mes=query.anyo_mes,
      anyo=query.anyo,
      anyo_mes_ref=query.anyo_mes_ref,
      familia_impuesto=query.familia_impuesto,
      modelo=query.modelo,
      ejercicio=query.ejercicio,
      id_ejercicio_reciente=query.id_ejercicio_reciente,
      tipo_periodo=query.tipo_periodo,
      grupo=query.grupo,
      subgrupo=query.subgrupo,
      subconcepto=query.subconcepto,
      origen=query.origen,
      cod_origen=query.cod_origen,
      indicador=query.indicador,
      importe=query.importe,
      numero=query.numero
  WHEN NOT MATCHED THEN
    INSERT (id_contribuyente,nif_maestro,razon_social,id_anyo_mes,anyo_mes,anyo,id_anyo_mes_ref,anyo_mes_ref,id_familia_impuesto,familia_impuesto,id_modelo,modelo,id_ejercicio,ejercicio,id_ejercicio_reciente,id_tipo_periodo,tipo_periodo,cod_grupo,grupo,cod_subgrupo,subgrupo,id_subconcepto,subconcepto,cod_indicador,origen,cod_origen,id_origen,indicador,importe,numero) VALUES (
      query.id_contribuyente,
      query.nif_maestro,
      query.razon_social,
      query.id_anyo_mes,
      query.anyo_mes,
      query.anyo,
      query.id_anyo_mes_ref,
      query.anyo_mes_ref,
      query.id_familia_impuesto,
      query.familia_impuesto,
      query.id_modelo,
      query.modelo,
      query.id_ejercicio,
      query.ejercicio,
      query.id_ejercicio_reciente,
      query.id_tipo_periodo,
      query.tipo_periodo,
      query.cod_grupo,
      query.grupo,
      query.cod_subgrupo,
      query.subgrupo,
      query.id_subconcepto,
      query.subconcepto,
      query.cod_indicador,
      query.origen,
      query.cod_origen,
      query.id_origen,
      query.indicador,
      query.importe,
      query.numero)
  WHEN NOT MATCHED BY SOURCE AND (tbn1_ssrs_vencimientos_detalle.cod_indicador<>'dev') THEN
    DELETE;

  EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
   END TRY
  BEGIN CATCH
    EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null;
    UPDATE dbn1_norm_dhyf.audit.tbn1_logs SET
      mensaje_error=error_message(),
      procedimiento_error=error_procedure()
    WHERE
      id_log=@log;
    IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
  END CATCH


END

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen(
  id_detalle int IDENTITY(1,1),
  id_anyo_mes int NOT NULL,
  anyo_mes nvarchar(15) NOT NULL,
  anyo int NOT NULL,
  id_anyo_mes_ref int NOT NULL,
  anyo_mes_ref nvarchar(15) NOT NULL,
  id_familia_impuesto int NOT NULL,
  familia_impuesto nvarchar(35) NOT NULL,
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
  CONSTRAINT PK_tbn1_ssrs_vencimientos_resumen PRIMARY KEY CLUSTERED (id_detalle)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' AND COLUMN_NAME='id_detalle')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen ADD id_detalle int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' AND COLUMN_NAME='id_anyo_mes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen ADD id_anyo_mes int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' AND COLUMN_NAME='anyo_mes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen ADD anyo_mes nvarchar(15)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' AND COLUMN_NAME='anyo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen ADD anyo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' AND COLUMN_NAME='id_anyo_mes_ref')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen ADD id_anyo_mes_ref int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' AND COLUMN_NAME='anyo_mes_ref')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen ADD anyo_mes_ref nvarchar(15)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' AND COLUMN_NAME='id_familia_impuesto')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen ADD id_familia_impuesto int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' AND COLUMN_NAME='familia_impuesto')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen ADD familia_impuesto nvarchar(35)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' AND COLUMN_NAME='id_modelo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen ADD id_modelo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' AND COLUMN_NAME='modelo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen ADD modelo nvarchar(5)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' AND COLUMN_NAME='id_ejercicio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen ADD id_ejercicio int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' AND COLUMN_NAME='ejercicio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen ADD ejercicio int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' AND COLUMN_NAME='id_ejercicio_reciente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen ADD id_ejercicio_reciente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' AND COLUMN_NAME='id_tipo_periodo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen ADD id_tipo_periodo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' AND COLUMN_NAME='tipo_periodo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen ADD tipo_periodo nvarchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' AND COLUMN_NAME='cod_indicador')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen ADD cod_indicador nvarchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' AND COLUMN_NAME='indicador')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen ADD indicador nvarchar(10)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' AND COLUMN_NAME='importe')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen ADD importe numeric(18,4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' AND COLUMN_NAME='numero')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen ADD numero int

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' AND COLUMN_NAME='id_detalle' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen ALTER COLUMN id_detalle int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' AND COLUMN_NAME='id_anyo_mes' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen ALTER COLUMN id_anyo_mes int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' AND COLUMN_NAME='anyo_mes' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen ALTER COLUMN anyo_mes nvarchar(15) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' AND COLUMN_NAME='anyo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen ALTER COLUMN anyo int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' AND COLUMN_NAME='id_anyo_mes_ref' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen ALTER COLUMN id_anyo_mes_ref int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' AND COLUMN_NAME='anyo_mes_ref' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen ALTER COLUMN anyo_mes_ref nvarchar(15) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' AND COLUMN_NAME='id_familia_impuesto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen ALTER COLUMN id_familia_impuesto int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' AND COLUMN_NAME='familia_impuesto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen ALTER COLUMN familia_impuesto nvarchar(35) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' AND COLUMN_NAME='id_modelo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen ALTER COLUMN id_modelo int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' AND COLUMN_NAME='modelo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen ALTER COLUMN modelo nvarchar(5) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' AND COLUMN_NAME='id_ejercicio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen ALTER COLUMN id_ejercicio int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' AND COLUMN_NAME='ejercicio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen ALTER COLUMN ejercicio int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' AND COLUMN_NAME='id_ejercicio_reciente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen ALTER COLUMN id_ejercicio_reciente int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' AND COLUMN_NAME='id_tipo_periodo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen ALTER COLUMN id_tipo_periodo int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' AND COLUMN_NAME='tipo_periodo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen ALTER COLUMN tipo_periodo nvarchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' AND COLUMN_NAME='cod_indicador' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen ALTER COLUMN cod_indicador nvarchar(3) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' AND COLUMN_NAME='indicador' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen ALTER COLUMN indicador nvarchar(10) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' AND COLUMN_NAME='importe' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen ALTER COLUMN importe numeric(18,4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' AND COLUMN_NAME='numero' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen ALTER COLUMN numero int NOT NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' AND CONSTRAINT_NAME='PK_tbn1_ssrs_vencimientos_resumen')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen ADD CONSTRAINT PK_tbn1_ssrs_vencimientos_resumen PRIMARY KEY CLUSTERED (id_detalle)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_ssrs_vencimientos_resumen' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_ssrs_vencimientos_resumen;
GO

CREATE PROCEDURE dbo.spn1_cargar_ssrs_vencimientos_resumen(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_ssrs_vencimientos_resumen'
  SET NOCOUNT ON;
  DECLARE @log int;
  EXECUTE @log = dbn1_stg_dhyf.dbo.spn1_apuntar_log @logpadre,@procedure_name;
  DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf.dbo.fnn1_fecha_ultima_carga(@log);
  DECLARE @continuar_en_caso_error bit=0;
  IF @logpadre IS NOT NULL AND EXISTS (SELECT 1 AS expr1
  FROM dbn1_norm_dhyf.audit.tbn1_procedimientos_excluidos
  WHERE
    'dbn1_stg_dhyf.dbo.'+procedimiento=@procedure_name
    AND excluido=1
  ) BEGIN
    UPDATE dbn1_norm_dhyf.audit.tbn1_logs SET
      mensaje_error='EXCLUÍDO'
    WHERE
      id_log=@log;
    RETURN
  END
     BEGIN TRY

  -- Materialized query: a_ingresar
  SELECT
    deudas.modelo AS modelo,
    eomonth(fecha_contraido) AS fecha_contraido,
    eomonth(eomonth(fecha_contraido)) AS fecha_referencia,
    id_ejercicio,
    ejercicio_tributario AS ejercicio,
    id_ejercicio_reciente,
    periodo AS cod_periodo,
    'ing' AS cod_indicador,
    'ingresar' AS indicador,
    sum(importe_total_contraido-importe_total_anulado-importe_total_resto) AS importe,
    count(DISTINCT deudas.id_deuda) AS numero
  INTO #a_ingresar__0E868
  FROM dbn1_dmr_dhyf.dbo.tbn1_dim_ot_deudas deudas
  WHERE deudas.cod_origen='AU'
  GROUP BY
    deudas.modelo,
    eomonth(fecha_contraido),
    eomonth(eomonth(fecha_contraido)),
    id_ejercicio,
    ejercicio_tributario,
    id_ejercicio_reciente,
    periodo
  
  
  
  CREATE UNIQUE INDEX unique_index_tmp_a_ingresar__0E868 ON #a_ingresar__0E868 (modelo,fecha_contraido,fecha_referencia,ejercicio,cod_periodo,cod_indicador)
  
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
    sum(mov.importe) AS importe,
    count(DISTINCT deudas.id_deuda) AS numero
  INTO #ingresado__332EF
  FROM dbn1_dmr_dhyf.dbo.tbn1_dim_ot_deudas deudas
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_ssrs_ot_contraido_por_deuda mov ON (mov.id_deuda=deudas.id_deuda)
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_ot_clases_movimientos clase ON (clase.id_clase_movimiento=mov.id_clase_movimiento)
  WHERE
    deudas.cod_origen='AU'
    AND clase.tipo_movimiento='Ingresado'
  GROUP BY
    deudas.modelo,
    eomonth(deudas.fecha_contraido),
    eomonth(mov.fecha),
    id_ejercicio,
    ejercicio_tributario,
    id_ejercicio_reciente,
    periodo
  
  
  
  CREATE UNIQUE INDEX unique_index_tmp_ingresado__332EF ON #ingresado__332EF (modelo,fecha_contraido,fecha_referencia,ejercicio,cod_periodo,cod_indicador)
  
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
    sum(mov.importe) AS importe,
    count(DISTINCT deudas.id_deuda) AS numero
  INTO #pendiente__C772E
  FROM dbn1_dmr_dhyf.dbo.tbn1_dim_ot_deudas deudas
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_ssrs_ot_contraido_por_deuda mov ON (mov.id_deuda=deudas.id_deuda)
  WHERE deudas.cod_origen='AU'
  GROUP BY
    deudas.modelo,
    eomonth(deudas.fecha_contraido),
    eomonth(mov.fecha),
    id_ejercicio,
    ejercicio_tributario,
    id_ejercicio_reciente,
    periodo
  
  
  
  CREATE UNIQUE INDEX unique_index_tmp_pendiente__C772E ON #pendiente__C772E (modelo,fecha_contraido,fecha_referencia,ejercicio,cod_periodo,cod_indicador)
  
  -- Materialized query: a_devolver
  SELECT
    cod_modelo AS modelo,
    eomonth(fec_documento) AS fecha_contraido,
    eomonth(fec_documento) AS fecha_referencia,
    id_ejercicio,
    doc.ejercicio AS ejercicio,
    id_ejercicio_reciente,
    cod_periodo,
    'dev' AS cod_indicador,
    'devolver' AS indicador,
    sum(importe_documento) AS importe,
    count(DISTINCT referencia) AS numero
  INTO #a_devolver__D67FA
  FROM dbn1_dmr_dhyf.dbo.tbn1_dim_todos_documentos doc
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_ejercicios ejercicios ON (ejercicios.ejercicio=doc.ejercicio)
  WHERE
    cod_tipo_documento='J'
    AND tipo_importe NOT IN ('I','C')
  GROUP BY
    cod_modelo,
    eomonth(fec_documento),
    id_ejercicio,
    doc.ejercicio,
    id_ejercicio_reciente,
    cod_periodo
  
  
  
  CREATE UNIQUE INDEX unique_index_tmp_a_devolver__D67FA ON #a_devolver__D67FA (modelo,fecha_contraido,fecha_referencia,ejercicio,cod_periodo,cod_indicador)
  
  -- Materialized query: iva_a_compensar
  SELECT
    cod_modelo AS modelo,
    eomonth(fecha_inicio) AS fecha_contraido,
    eomonth(fecha_inicio) AS fecha_referencia,
    id_ejercicio,
    ejercicio,
    id_ejercicio_reciente,
    cod_periodo,
    'com' AS cod_indicador,
    'compensar' AS indicador,
    sum(importe_acum) AS importe,
    count(numero) AS numero
  INTO #iva_a_compensar__FC3A3
  FROM (SELECT
          cod_modelo,
          fechas.fecha_inicio AS fecha_inicio,
          id_ejercicio,
          ejercicio,
          id_ejercicio_reciente,
          id_tipo_periodo,
          importe_acum,
          numero
        FROM (SELECT eomonth(max(fecha)) AS fecha_inicio
              FROM dbn1_dmr_dhyf.dbo.tbn1_dim_fechas
              WHERE fecha BETWEEN dateadd(mm,-48,getdate()) AND getdate()
              GROUP BY
                anyo,
                mes) fechas
        CROSS APPLY dbn1_dmr_dhyf.dbo.fnn1_ssrs_iva_resumen_vencimientos(fechas.fecha_inicio)
        WHERE
          cod_tipo_resultado='C'
          AND importe_acum<>0) acumulado_iva
  INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_tipos_periodo tipos_periodo ON (tipos_periodo.id_tipo_periodo=acumulado_iva.id_tipo_periodo)
  GROUP BY
    cod_modelo,
    eomonth(fecha_inicio),
    id_ejercicio,
    ejercicio,
    id_ejercicio_reciente,
    cod_periodo
  
  
  
  CREATE UNIQUE INDEX unique_index_tmp_iva_a_compensar__FC3A3 ON #iva_a_compensar__FC3A3 (modelo,fecha_contraido,fecha_referencia,ejercicio,cod_periodo,cod_indicador)
  
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
      CASE
          WHEN coalesce(familias.cod_familia,'Indefinido') NOT IN ('IRPF','IVA','IS','IE','RAR') THEN 999
          ELSE familias.id_familia_tributaria
      END AS id_familia_impuesto,
      CASE
          WHEN coalesce(familias.cod_familia,'Indefinido') NOT IN ('IRPF','IVA','IS','IE','RAR') THEN 'Otros'
          ELSE familias.desc_familia
      END AS familia_impuesto,
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
            coalesce(a_ingresar.modelo,ingresado.modelo,pendiente.modelo,a_devolver.modelo,iva_a_compensar.modelo) modelo,
            coalesce(a_ingresar.fecha_contraido,ingresado.fecha_contraido,pendiente.fecha_contraido,a_devolver.fecha_contraido,iva_a_compensar.fecha_contraido) fecha_contraido,
            coalesce(a_ingresar.fecha_referencia,ingresado.fecha_referencia,pendiente.fecha_referencia,a_devolver.fecha_referencia,iva_a_compensar.fecha_referencia) fecha_referencia,
            coalesce(a_ingresar.ejercicio,ingresado.ejercicio,pendiente.ejercicio,a_devolver.ejercicio,iva_a_compensar.ejercicio) ejercicio,
            coalesce(a_ingresar.cod_periodo,ingresado.cod_periodo,pendiente.cod_periodo,a_devolver.cod_periodo,iva_a_compensar.cod_periodo) cod_periodo,
            coalesce(a_ingresar.cod_indicador,ingresado.cod_indicador,pendiente.cod_indicador,a_devolver.cod_indicador,iva_a_compensar.cod_indicador) cod_indicador,
            coalesce(a_ingresar.id_ejercicio,ingresado.id_ejercicio,pendiente.id_ejercicio,a_devolver.id_ejercicio,iva_a_compensar.id_ejercicio) id_ejercicio,
            coalesce(a_ingresar.id_ejercicio_reciente,ingresado.id_ejercicio_reciente,pendiente.id_ejercicio_reciente,a_devolver.id_ejercicio_reciente,iva_a_compensar.id_ejercicio_reciente) id_ejercicio_reciente,
            coalesce(a_ingresar.indicador,ingresado.indicador,pendiente.indicador,a_devolver.indicador,iva_a_compensar.indicador) indicador,
            coalesce(a_ingresar.importe,ingresado.importe,pendiente.importe,a_devolver.importe,iva_a_compensar.importe) importe,
            coalesce(a_ingresar.numero,ingresado.numero,pendiente.numero,a_devolver.numero,iva_a_compensar.numero) numero
          FROM #a_ingresar__0E868 a_ingresar
          FULL JOIN #ingresado__332EF ingresado ON (a_ingresar.modelo=ingresado.modelo AND a_ingresar.fecha_contraido=ingresado.fecha_contraido AND a_ingresar.fecha_referencia=ingresado.fecha_referencia AND a_ingresar.ejercicio=ingresado.ejercicio AND a_ingresar.cod_periodo=ingresado.cod_periodo AND a_ingresar.cod_indicador=ingresado.cod_indicador)
          FULL JOIN #pendiente__C772E pendiente ON (coalesce(a_ingresar.modelo,INGRESADO.modelo)=pendiente.modelo AND coalesce(a_ingresar.fecha_contraido,INGRESADO.fecha_contraido)=pendiente.fecha_contraido AND coalesce(a_ingresar.fecha_referencia,INGRESADO.fecha_referencia)=pendiente.fecha_referencia AND coalesce(a_ingresar.ejercicio,INGRESADO.ejercicio)=pendiente.ejercicio AND coalesce(a_ingresar.cod_periodo,INGRESADO.cod_periodo)=pendiente.cod_periodo AND coalesce(a_ingresar.cod_indicador,INGRESADO.cod_indicador)=pendiente.cod_indicador)
          FULL JOIN #a_devolver__D67FA a_devolver ON (coalesce(a_ingresar.modelo,INGRESADO.modelo,PENDIENTE.modelo)=a_devolver.modelo AND coalesce(a_ingresar.fecha_contraido,INGRESADO.fecha_contraido,PENDIENTE.fecha_contraido)=a_devolver.fecha_contraido AND coalesce(a_ingresar.fecha_referencia,INGRESADO.fecha_referencia,PENDIENTE.fecha_referencia)=a_devolver.fecha_referencia AND coalesce(a_ingresar.ejercicio,INGRESADO.ejercicio,PENDIENTE.ejercicio)=a_devolver.ejercicio AND coalesce(a_ingresar.cod_periodo,INGRESADO.cod_periodo,PENDIENTE.cod_periodo)=a_devolver.cod_periodo AND coalesce(a_ingresar.cod_indicador,INGRESADO.cod_indicador,PENDIENTE.cod_indicador)=a_devolver.cod_indicador)
          FULL JOIN #iva_a_compensar__FC3A3 iva_a_compensar ON (coalesce(a_ingresar.modelo,INGRESADO.modelo,PENDIENTE.modelo,A_DEVOLVER.modelo)=iva_a_compensar.modelo AND coalesce(a_ingresar.fecha_contraido,INGRESADO.fecha_contraido,PENDIENTE.fecha_contraido,A_DEVOLVER.fecha_contraido)=iva_a_compensar.fecha_contraido AND coalesce(a_ingresar.fecha_referencia,INGRESADO.fecha_referencia,PENDIENTE.fecha_referencia,A_DEVOLVER.fecha_referencia)=iva_a_compensar.fecha_referencia AND coalesce(a_ingresar.ejercicio,INGRESADO.ejercicio,PENDIENTE.ejercicio,A_DEVOLVER.ejercicio)=iva_a_compensar.ejercicio AND coalesce(a_ingresar.cod_periodo,INGRESADO.cod_periodo,PENDIENTE.cod_periodo,A_DEVOLVER.cod_periodo)=iva_a_compensar.cod_periodo AND coalesce(a_ingresar.cod_indicador,INGRESADO.cod_indicador,PENDIENTE.cod_indicador,A_DEVOLVER.cod_indicador)=iva_a_compensar.cod_indicador)) deudas
    INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_modelos modelos ON (modelos.cod_modelo=deudas.modelo)
    INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_familias_tributarias familias ON (familias.id_familia_tributaria=modelos.id_familia_tributaria)
    INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_tipos_periodo tipos_periodo ON (tipos_periodo.cod_periodo=deudas.cod_periodo)
    WHERE fecha_contraido BETWEEN dateadd(mm,-48,getdate()) AND eomonth(getdate())
  )
  MERGE dbn1_dmr_dhyf.dbo.tbn1_ssrs_vencimientos_resumen AS tbn1_ssrs_vencimientos_resumen
  USING query ON query.id_anyo_mes=tbn1_ssrs_vencimientos_resumen.id_anyo_mes AND query.id_anyo_mes_ref=tbn1_ssrs_vencimientos_resumen.id_anyo_mes_ref AND query.id_familia_impuesto=tbn1_ssrs_vencimientos_resumen.id_familia_impuesto AND query.id_modelo=tbn1_ssrs_vencimientos_resumen.id_modelo AND query.id_ejercicio=tbn1_ssrs_vencimientos_resumen.id_ejercicio AND query.id_tipo_periodo=tbn1_ssrs_vencimientos_resumen.id_tipo_periodo AND query.cod_indicador=tbn1_ssrs_vencimientos_resumen.cod_indicador
  WHEN MATCHED AND ((tbn1_ssrs_vencimientos_resumen.anyo_mes<>query.anyo_mes OR (tbn1_ssrs_vencimientos_resumen.anyo_mes IS NULL AND query.anyo_mes IS NOT NULL) OR  (tbn1_ssrs_vencimientos_resumen.anyo_mes IS NOT NULL AND query.anyo_mes IS NULL)
                    OR tbn1_ssrs_vencimientos_resumen.anyo<>query.anyo OR (tbn1_ssrs_vencimientos_resumen.anyo IS NULL AND query.anyo IS NOT NULL) OR  (tbn1_ssrs_vencimientos_resumen.anyo IS NOT NULL AND query.anyo IS NULL)
                    OR tbn1_ssrs_vencimientos_resumen.anyo_mes_ref<>query.anyo_mes_ref OR (tbn1_ssrs_vencimientos_resumen.anyo_mes_ref IS NULL AND query.anyo_mes_ref IS NOT NULL) OR  (tbn1_ssrs_vencimientos_resumen.anyo_mes_ref IS NOT NULL AND query.anyo_mes_ref IS NULL)
                    OR tbn1_ssrs_vencimientos_resumen.familia_impuesto<>query.familia_impuesto OR (tbn1_ssrs_vencimientos_resumen.familia_impuesto IS NULL AND query.familia_impuesto IS NOT NULL) OR  (tbn1_ssrs_vencimientos_resumen.familia_impuesto IS NOT NULL AND query.familia_impuesto IS NULL)
                    OR tbn1_ssrs_vencimientos_resumen.modelo<>query.modelo OR (tbn1_ssrs_vencimientos_resumen.modelo IS NULL AND query.modelo IS NOT NULL) OR  (tbn1_ssrs_vencimientos_resumen.modelo IS NOT NULL AND query.modelo IS NULL)
                    OR tbn1_ssrs_vencimientos_resumen.ejercicio<>query.ejercicio OR (tbn1_ssrs_vencimientos_resumen.ejercicio IS NULL AND query.ejercicio IS NOT NULL) OR  (tbn1_ssrs_vencimientos_resumen.ejercicio IS NOT NULL AND query.ejercicio IS NULL)
                    OR tbn1_ssrs_vencimientos_resumen.id_ejercicio_reciente<>query.id_ejercicio_reciente OR (tbn1_ssrs_vencimientos_resumen.id_ejercicio_reciente IS NULL AND query.id_ejercicio_reciente IS NOT NULL) OR  (tbn1_ssrs_vencimientos_resumen.id_ejercicio_reciente IS NOT NULL AND query.id_ejercicio_reciente IS NULL)
                    OR tbn1_ssrs_vencimientos_resumen.tipo_periodo<>query.tipo_periodo OR (tbn1_ssrs_vencimientos_resumen.tipo_periodo IS NULL AND query.tipo_periodo IS NOT NULL) OR  (tbn1_ssrs_vencimientos_resumen.tipo_periodo IS NOT NULL AND query.tipo_periodo IS NULL)
                    OR tbn1_ssrs_vencimientos_resumen.indicador<>query.indicador OR (tbn1_ssrs_vencimientos_resumen.indicador IS NULL AND query.indicador IS NOT NULL) OR  (tbn1_ssrs_vencimientos_resumen.indicador IS NOT NULL AND query.indicador IS NULL)
                    OR tbn1_ssrs_vencimientos_resumen.importe<>query.importe OR (tbn1_ssrs_vencimientos_resumen.importe IS NULL AND query.importe IS NOT NULL) OR  (tbn1_ssrs_vencimientos_resumen.importe IS NOT NULL AND query.importe IS NULL)
                    OR tbn1_ssrs_vencimientos_resumen.numero<>query.numero OR (tbn1_ssrs_vencimientos_resumen.numero IS NULL AND query.numero IS NOT NULL) OR  (tbn1_ssrs_vencimientos_resumen.numero IS NOT NULL AND query.numero IS NULL))) THEN
    UPDATE SET
      anyo_mes=query.anyo_mes,
      anyo=query.anyo,
      anyo_mes_ref=query.anyo_mes_ref,
      familia_impuesto=query.familia_impuesto,
      modelo=query.modelo,
      ejercicio=query.ejercicio,
      id_ejercicio_reciente=query.id_ejercicio_reciente,
      tipo_periodo=query.tipo_periodo,
      indicador=query.indicador,
      importe=query.importe,
      numero=query.numero
  WHEN NOT MATCHED THEN
    INSERT (id_anyo_mes,anyo_mes,anyo,id_anyo_mes_ref,anyo_mes_ref,id_familia_impuesto,familia_impuesto,id_modelo,modelo,id_ejercicio,ejercicio,id_ejercicio_reciente,id_tipo_periodo,tipo_periodo,cod_indicador,indicador,importe,numero) VALUES (
      query.id_anyo_mes,
      query.anyo_mes,
      query.anyo,
      query.id_anyo_mes_ref,
      query.anyo_mes_ref,
      query.id_familia_impuesto,
      query.familia_impuesto,
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

  EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
   END TRY
  BEGIN CATCH
    EXECUTE dbn1_stg_dhyf.dbo.spn1_finalizar_log @log,null;
    UPDATE dbn1_norm_dhyf.audit.tbn1_logs SET
      mensaje_error=error_message(),
      procedimiento_error=error_procedure()
    WHERE
      id_log=@log;
    IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
  END CATCH


END

GO

USE dbn1_dmr_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='fnn1_ssrs_iva_resumen_vencimientos' AND ROUTINE_TYPE='FUNCTION')
DROP FUNCTION dbo.fnn1_ssrs_iva_resumen_vencimientos;
GO

CREATE FUNCTION dbo.fnn1_ssrs_iva_resumen_vencimientos(@fecha_ini datetime) RETURNS TABLE AS
RETURN (
  SELECT
    doc.id_contribuyente AS id_contribuyente,
    doc.id_expediente AS id_expediente,
    doc.nif_maestro AS nif_maestro,
    doc.razon_social AS nombre_rs,
    doc.fec_documento AS fec_documento,
    year(doc.fec_documento) AS anyo,
    doc.cod_modelo_ejercicio AS cod_modelo_ejercicio,
    doc.id_ejercicio AS id_ejercicio,
    doc.id_ejercicio_reciente AS id_ejercicio_reciente,
    doc.ejercicio_reciente AS ejercicio_reciente,
    doc.ejercicio AS ejercicio,
    doc.id_periodo AS id_periodo,
    doc.id_tipo_periodo AS id_tipo_periodo,
    doc.tipo_periodo AS tipo_periodo,
    doc.cod_tipo_periodo AS cod_tipo_periodo,
    doc.id_modelo AS id_modelo,
    doc.cod_modelo AS cod_modelo,
    doc.id_tipo_resultado AS id_tipo_resultado,
    doc.cod_tipo_resultado AS cod_tipo_resultado,
    doc.tipo_resultado AS tipo_resultado,
    sum(doc.resultado) AS importe,
    CASE
        WHEN doc.cod_tipo_resultado='C' THEN CASE
            WHEN 1=sum(1) OVER (PARTITION BY doc.id_contribuyente,CASE WHEN doc.fec_documento<=@fecha_ini THEN 'S' ELSE 'N' END ORDER BY doc.ejercicio DESC,doc.fec_documento DESC,doc.cod_modelo DESC,doc.cod_tipo_periodo DESC,sum(doc.resultado) DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) THEN sum(doc.resultado)
        END
        ELSE sum(doc.resultado)
    END AS importe_acum,
    1 AS numero,
    CASE WHEN doc.fec_documento<=@fecha_ini THEN 'S' ELSE 'N' END AS actual
  FROM dbo.tbn1_ssrs_iva_documentos_recientes doc
  INNER JOIN dbo.tbn1_ssrs_iva_modelos_regimenes regimen ON (regimen.id_modelo=doc.id_modelo)
  WHERE
    doc.cod_modelo NOT IN ('322')
    AND NOT (doc.cod_modelo IN ('390') AND doc.es_inscrito_en_rdm='S')
    AND doc.cod_tipo_documento='J'
    AND doc.fec_documento BETWEEN CAST('20000101' AS datetime) AND @fecha_ini
  GROUP BY
    doc.id_contribuyente,
    doc.id_expediente,
    doc.nif_maestro,
    doc.razon_social,
    doc.fec_documento,
    year(doc.fec_documento),
    doc.cod_modelo_ejercicio,
    doc.id_ejercicio,
    doc.id_ejercicio_reciente,
    doc.ejercicio_reciente,
    doc.ejercicio,
    doc.id_periodo,
    doc.id_tipo_periodo,
    doc.tipo_periodo,
    doc.cod_tipo_periodo,
    doc.id_modelo,
    doc.cod_modelo,
    doc.id_tipo_resultado,
    doc.cod_tipo_resultado,
    doc.tipo_resultado,
    CASE WHEN doc.fec_documento<=@fecha_ini THEN 'S' ELSE 'N' END
)

GO

