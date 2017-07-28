PRINT 'staging_documentos.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos')
CREATE TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos(
  referencia varchar(22) NOT NULL,
  cod_expediente varchar(40),
  ejercicio decimal(4,0) NULL,
  nif varchar(9) NULL,
  discriminante varchar(2) NULL,
  cod_modelo varchar(4) NULL,
  periodo varchar(1),
  sufijo_expediente varchar(10),
  origen varchar(15),
  referencia_corta varchar(9) NULL,
  sufijo varchar(2) NULL,
  cod_tipo_documento varchar(1) NULL,
  ano_salida decimal(4,0) NULL,
  importe1 numeric(18,2) NULL,
  cod_aplicacion varchar(2) NULL,
  fec_documento date NULL,
  tipo_importe varchar(1),
  timestamp datetime2,
  marca_baja varchar(1) NULL,
  esta_archivado bit,
  fec_baja_documento date NULL,
  cab_fec_alta date NULL,
  cab_fec_presentacion date NULL,
  cab_fec_desde date NULL,
  cab_fec_hasta date NULL,
  cab_cod_municipio decimal(3,0) NULL,
  cab_tipo_presentacion varchar(1) NULL,
  cab_nif_dominante varchar(11) NULL,
  cab_cod_administracion varchar(1) NULL,
  cab_liq_fec_presentacion date NULL,
  cab_liq_fec_desde date NULL,
  cab_liq_fec_hasta date NULL,
  cab_liq_cod_municipio decimal(3,0) NULL,
  cod_fase_liquidacion varchar(5) NULL,
  fase_supuesto varchar(28) NOT NULL,
  tipo_gravamen numeric(18,4),
  tipo_gravamen_IR numeric(18,4),
  tipo_gravamen_base_imp_general_coop numeric(18,4),
  grupo_fiscal varchar(16) NULL,
  normativa varchar(9) NULL,
  tipo_normativa varchar(15) NULL,
  declaracion_complementaria varchar(30) NULL,
  tamano varchar(15) NULL,
  orden_tamano int NULL,
  tipo_tributacion varchar(22) NULL,
  contabilidad varchar(34) NULL,
  regimen_fiscal varchar(54) NULL,
  cod_iae1 decimal(15,0) NULL,
  cod_iae2 decimal(15,0) NULL,
  cod_iae3 decimal(15,0) NULL,
  cod_iae4 decimal(15,0) NULL,
  cab_inspec_procede_propuesta_liquidacion bit,
  CONSTRAINT PK_tbn1_tmp_documentos PRIMARY KEY CLUSTERED (referencia)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='referencia')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD referencia varchar(22)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cod_expediente')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD cod_expediente varchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='ejercicio')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD ejercicio decimal(4,0)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='nif')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD nif varchar(9)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='discriminante')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD discriminante varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cod_modelo')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD cod_modelo varchar(4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='periodo')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD periodo varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='sufijo_expediente')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD sufijo_expediente varchar(10)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD origen varchar(15)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='referencia_corta')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD referencia_corta varchar(9)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='sufijo')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD sufijo varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cod_tipo_documento')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD cod_tipo_documento varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='ano_salida')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD ano_salida decimal(4,0)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='importe1')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD importe1 numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cod_aplicacion')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD cod_aplicacion varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='fec_documento')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD fec_documento date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='tipo_importe')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD tipo_importe varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='timestamp')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD timestamp datetime2

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='marca_baja')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD marca_baja varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='esta_archivado')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD esta_archivado bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='fec_baja_documento')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD fec_baja_documento date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cab_fec_alta')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD cab_fec_alta date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cab_fec_presentacion')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD cab_fec_presentacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cab_fec_desde')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD cab_fec_desde date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cab_fec_hasta')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD cab_fec_hasta date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cab_cod_municipio')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD cab_cod_municipio decimal(3,0)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cab_tipo_presentacion')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD cab_tipo_presentacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cab_nif_dominante')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD cab_nif_dominante varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cab_cod_administracion')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD cab_cod_administracion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cab_liq_fec_presentacion')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD cab_liq_fec_presentacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cab_liq_fec_desde')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD cab_liq_fec_desde date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cab_liq_fec_hasta')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD cab_liq_fec_hasta date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cab_liq_cod_municipio')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD cab_liq_cod_municipio decimal(3,0)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cod_fase_liquidacion')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD cod_fase_liquidacion varchar(5)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='fase_supuesto')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD fase_supuesto varchar(28)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='tipo_gravamen')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD tipo_gravamen numeric(18,4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='tipo_gravamen_IR')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD tipo_gravamen_IR numeric(18,4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='tipo_gravamen_base_imp_general_coop')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD tipo_gravamen_base_imp_general_coop numeric(18,4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='grupo_fiscal')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD grupo_fiscal varchar(16)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='normativa')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD normativa varchar(9)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='tipo_normativa')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD tipo_normativa varchar(15)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='declaracion_complementaria')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD declaracion_complementaria varchar(30)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='tamano')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD tamano varchar(15)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='orden_tamano')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD orden_tamano int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='tipo_tributacion')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD tipo_tributacion varchar(22)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='contabilidad')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD contabilidad varchar(34)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='regimen_fiscal')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD regimen_fiscal varchar(54)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cod_iae1')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD cod_iae1 decimal(15,0)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cod_iae2')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD cod_iae2 decimal(15,0)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cod_iae3')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD cod_iae3 decimal(15,0)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cod_iae4')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD cod_iae4 decimal(15,0)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cab_inspec_procede_propuesta_liquidacion')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD cab_inspec_procede_propuesta_liquidacion bit

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cab_inspec_procede_propuesta_liquidacion' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD CONSTRAINT DF_DBO_TBN1_TMP_DOCUMENTOS_CAB_INSPEC_PROCEDE_PROPUESTA_LIQUIDACION DEFAULT 0 FOR cab_inspec_procede_propuesta_liquidacion

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='referencia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN referencia varchar(22) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cod_expediente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN cod_expediente varchar(40) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='ejercicio' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN ejercicio decimal(4,0) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='nif' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN nif varchar(9) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='discriminante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN discriminante varchar(2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cod_modelo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN cod_modelo varchar(4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='periodo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN periodo varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='sufijo_expediente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN sufijo_expediente varchar(10) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='origen' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN origen varchar(15) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='referencia_corta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN referencia_corta varchar(9) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='sufijo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN sufijo varchar(2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cod_tipo_documento' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN cod_tipo_documento varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='ano_salida' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN ano_salida decimal(4,0) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='importe1' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN importe1 numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cod_aplicacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN cod_aplicacion varchar(2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='fec_documento' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN fec_documento date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='tipo_importe' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN tipo_importe varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='timestamp' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN timestamp datetime2 NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='marca_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN marca_baja varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='esta_archivado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN esta_archivado bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='fec_baja_documento' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN fec_baja_documento date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cab_fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN cab_fec_alta date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cab_fec_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN cab_fec_presentacion date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cab_fec_desde' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN cab_fec_desde date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cab_fec_hasta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN cab_fec_hasta date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cab_cod_municipio' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN cab_cod_municipio decimal(3,0) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cab_tipo_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN cab_tipo_presentacion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cab_nif_dominante' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN cab_nif_dominante varchar(11) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cab_cod_administracion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN cab_cod_administracion varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cab_liq_fec_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN cab_liq_fec_presentacion date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cab_liq_fec_desde' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN cab_liq_fec_desde date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cab_liq_fec_hasta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN cab_liq_fec_hasta date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cab_liq_cod_municipio' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN cab_liq_cod_municipio decimal(3,0) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cod_fase_liquidacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN cod_fase_liquidacion varchar(5) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='fase_supuesto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN fase_supuesto varchar(28) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='tipo_gravamen' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN tipo_gravamen numeric(18,4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='tipo_gravamen_IR' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN tipo_gravamen_IR numeric(18,4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='tipo_gravamen_base_imp_general_coop' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN tipo_gravamen_base_imp_general_coop numeric(18,4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='grupo_fiscal' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN grupo_fiscal varchar(16) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='normativa' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN normativa varchar(9) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='tipo_normativa' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN tipo_normativa varchar(15) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='declaracion_complementaria' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN declaracion_complementaria varchar(30) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='tamano' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN tamano varchar(15) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='orden_tamano' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN orden_tamano int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='tipo_tributacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN tipo_tributacion varchar(22) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='contabilidad' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN contabilidad varchar(34) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='regimen_fiscal' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN regimen_fiscal varchar(54) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cod_iae1' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN cod_iae1 decimal(15,0) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cod_iae2' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN cod_iae2 decimal(15,0) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cod_iae3' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN cod_iae3 decimal(15,0) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cod_iae4' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN cod_iae4 decimal(15,0) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND COLUMN_NAME='cab_inspec_procede_propuesta_liquidacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ALTER COLUMN cab_inspec_procede_propuesta_liquidacion bit NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_tmp_documentos' AND CONSTRAINT_NAME='PK_tbn1_tmp_documentos')
ALTER TABLE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos ADD CONSTRAINT PK_tbn1_tmp_documentos PRIMARY KEY CLUSTERED (referencia)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_staging_documentos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_staging_documentos;
GO

CREATE PROCEDURE dbo.spn1_cargar_staging_documentos(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_staging_documentos'
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

  -- Materialized query: Aquí sacamos la referencia corta de la Autoliquidación en primer lugar, Propuesta de Inspección lugar en tercer lugar, Acta de Inspección en 4 lugar, y cualquier otra Fase es 2º lugar	 
 ;WITH
  allRows AS (
SELECT
      dcto_ejercicio as ejercicio ,dcto_periodo as periodo,CASE WHEN dcto_modelo='20X' THEN '200' ELSE dcto_modelo END AS modelo,substring(dcto_nif,1,9) as nif_9,dcto_discriminante as discriminante,
      concat(CAST(dcto_ejercicio AS varchar(4)),'-',dcto_periodo,'-',CASE WHEN dcto_modelo='20X' THEN '200' ELSE dcto_modelo END,'-',substring(dcto_nif,1,9),'-',dcto_discriminante) AS cod_expediente_corto,
      dcto_dcto_refer AS referencia_corta,
      CASE WHEN dcto_fecha_docu='01/01/0001' THEN '01/01/2001' ELSE dcto_fecha_docu END AS fec_documento,	  
      CASE
          WHEN familia_modelo.cod_familia='IVA' THEN CASE
              WHEN liqinspeccion.lqac_refer_sico IS NOT NULL THEN 'YALIQ'
              WHEN d.dcto_cod_apli='YA' THEN 'YAPRO'
              WHEN d.dcto_tipo_documen='J' THEN 'AUTO'
              WHEN d.dcto_tipo_documen='¦' AND d.dcto_modelo='322' THEN 'AUTO'
              WHEN d.dcto_tipo_documen='9' THEN 'PROP'
              WHEN d.dcto_tipo_documen='S' THEN 'LIQ'
              WHEN d.dcto_tipo_documen IN ('[') AND d.dcto_modelo='322' THEN 'LIQ'
              WHEN d.dcto_tipo_documen='R' THEN 'REV'
              WHEN d.dcto_tipo_documen IN ('.') AND d.dcto_modelo='322' THEN 'REV'
              WHEN d.dcto_tipo_documen='F' THEN 'RECT'
              WHEN d.dcto_tipo_documen IN ('$') AND d.dcto_modelo='322' THEN 'RECT'
              WHEN d.dcto_tipo_documen='0' THEN 'DENEG'
              WHEN d.dcto_tipo_documen='1' THEN 'ARCH'
              ELSE null
          END
          WHEN familia_modelo.cod_familia='IS' THEN CASE
              WHEN liqinspeccion.lqac_refer_sico IS NOT NULL THEN 'YALIQ'
              WHEN d.dcto_cod_apli='YA' THEN 'YAPRO'
              WHEN d.dcto_tipo_documen='J' AND (substring(d.dcto_dcto_refer,1,1) IN ('W','0','1','2','3','4','5','6','7','8','9') OR d.dcto_nif LIKE '_W55%') THEN 'AUTO'
              WHEN d.dcto_tipo_documen='9' AND (d.dcto_dcto_refer LIKE 'FS%' OR d.dcto_dcto_refer LIKE 'W%' OR d.dcto_dcto_refer LIKE 'S%') THEN 'PROP'
              WHEN d.dcto_tipo_documen='S' AND lotes.d4codlote='S3' THEN 'DEV'
              WHEN d.dcto_tipo_documen IN ('R','S') THEN 'LIQ'
              ELSE null
          END
          ELSE null
      END AS cod_fase_liquidacion,
	  CASE (
	       CASE
          WHEN familia_modelo.cod_familia='IVA' THEN CASE
              WHEN liqinspeccion.lqac_refer_sico IS NOT NULL THEN 'YALIQ'
              WHEN d.dcto_cod_apli='YA' THEN 'YAPRO'
              WHEN d.dcto_tipo_documen='J' THEN 'AUTO'
              WHEN d.dcto_tipo_documen='¦' AND d.dcto_modelo='322' THEN 'AUTO'
              WHEN d.dcto_tipo_documen='9' THEN 'PROP'
              WHEN d.dcto_tipo_documen='S' THEN 'LIQ'
              WHEN d.dcto_tipo_documen IN ('[') AND d.dcto_modelo='322' THEN 'LIQ'
              WHEN d.dcto_tipo_documen='R' THEN 'REV'
              WHEN d.dcto_tipo_documen IN ('.') AND d.dcto_modelo='322' THEN 'REV'
              WHEN d.dcto_tipo_documen='F' THEN 'RECT'
              WHEN d.dcto_tipo_documen IN ('$') AND d.dcto_modelo='322' THEN 'RECT'
              WHEN d.dcto_tipo_documen='0' THEN 'DENEG'
              WHEN d.dcto_tipo_documen='1' THEN 'ARCH'
              ELSE null
          END
          WHEN familia_modelo.cod_familia='IS' THEN CASE
              WHEN liqinspeccion.lqac_refer_sico IS NOT NULL THEN 'YALIQ'
              WHEN d.dcto_cod_apli='YA' THEN 'YAPRO'
              WHEN d.dcto_tipo_documen='J' AND (substring(d.dcto_dcto_refer,1,1) IN ('W','0','1','2','3','4','5','6','7','8','9') OR d.dcto_nif LIKE '_W55%') THEN 'AUTO'
              WHEN d.dcto_tipo_documen='9' AND (d.dcto_dcto_refer LIKE 'FS%' OR d.dcto_dcto_refer LIKE 'W%' OR d.dcto_dcto_refer LIKE 'S%') THEN 'PROP'
              WHEN d.dcto_tipo_documen='S' AND lotes.d4codlote='S3' THEN 'DEV'
              WHEN d.dcto_tipo_documen IN ('R','S') THEN 'LIQ'
              ELSE null
          END
          ELSE null
      END
	  )
	  WHEN 'AUTO' then 1 WHEN 'YAPRO' then 3 WHEN 'YALIQ' then 4 else 2 end as indicador
    FROM dbn1_stg_dhyf.dbo.tbn1_tmp_dcto d
    LEFT JOIN dbn1_stg_dhyf.dbo.tbn1auca_sc_1 auca ON (auca.aucarefer=d.refer)
    LEFT JOIN dbn1_stg_dhyf.dbo.tbn1lpca_sc_1 lpca ON (lpca.lpcarefer=d.refer)
    LEFT JOIN dbn1_stg_dhyf.dbo.tbn1lqac_ya liqinspeccion ON (liqinspeccion.lqac_refer_sico=d.refer)
    LEFT JOIN dbn1_stg_dhyf.dbo.tbn1_tmp_cabeceras cab ON (cab.referencia=d.refer)
    LEFT JOIN dbn1_stg_dhyf.dbo.tbn1dlpr_d4 lotes ON (lotes.d4referl=d.refer)
    INNER JOIN (SELECT 'IS' cod_familia,'200' cod_modelo
                UNION ALL SELECT 'IS','20X'
                UNION ALL SELECT 'IS','218'
                UNION ALL SELECT 'IS','220'
                UNION ALL SELECT 'IS','222'
                UNION ALL SELECT 'IVA','39'
                UNION ALL SELECT 'IVA','303'
                UNION ALL SELECT 'IVA','308'
                UNION ALL SELECT 'IVA','309'
                UNION ALL SELECT 'IVA','310'
                UNION ALL SELECT 'IVA','322'
                UNION ALL SELECT 'IVA','340'
                UNION ALL SELECT 'IVA','341'
                UNION ALL SELECT 'IVA','349'
                UNION ALL SELECT 'IVA','353'
                UNION ALL SELECT 'IVA','390'
                UNION ALL SELECT 'IVA','391'
                UNION ALL SELECT 'IVA','320'
                UNION ALL SELECT 'IVA','330'
                UNION ALL SELECT 'IVA','331'
                UNION ALL SELECT 'IVA','300'
                UNION ALL SELECT 'RAR','180'
                UNION ALL SELECT 'RAR','187'
                UNION ALL SELECT 'RAR','188'
                UNION ALL SELECT 'RAR','190'
                UNION ALL SELECT 'RAR','193'
                UNION ALL SELECT 'RAR','194'
                UNION ALL SELECT 'RAR','196'
                UNION ALL SELECT 'RAR','296'
                UNION ALL SELECT 'RAR','110'
                UNION ALL SELECT 'RAR','111'
                UNION ALL SELECT 'RAR','115'
                UNION ALL SELECT 'RAR','117'
                UNION ALL SELECT 'RAR','123'
                UNION ALL SELECT 'RAR','124'
                UNION ALL SELECT 'RAR','126'
                UNION ALL SELECT 'RAR','128'
                UNION ALL SELECT 'RAR','216'
                UNION ALL SELECT 'DI','170'
                UNION ALL SELECT 'DI','171'
                UNION ALL SELECT 'DI','181'
                UNION ALL SELECT 'DI','182'
                UNION ALL SELECT 'DI','184'
                UNION ALL SELECT 'DI','189'
                UNION ALL SELECT 'DI','192'
                UNION ALL SELECT 'DI','198'
                UNION ALL SELECT 'DI','199'
                UNION ALL SELECT 'DI','291'
                UNION ALL SELECT 'DI','345'
                UNION ALL SELECT 'DI','346'
                UNION ALL SELECT 'DI','347'
                UNION ALL SELECT 'DI','720'				
                UNION ALL SELECT 'DI','781'
                UNION ALL SELECT 'AE','848'
                UNION ALL SELECT 'IE','506'
                UNION ALL SELECT 'IE','507'
                UNION ALL SELECT 'IE','508'
                UNION ALL SELECT 'IE','510'
                UNION ALL SELECT 'IE','513'
                UNION ALL SELECT 'IE','524'
                UNION ALL SELECT 'IE','553'
                UNION ALL SELECT 'IE','554'
                UNION ALL SELECT 'IE','555'
                UNION ALL SELECT 'IE','557'
                UNION ALL SELECT 'IE','558'
                UNION ALL SELECT 'IE','560'
                UNION ALL SELECT 'IE','561'
                UNION ALL SELECT 'IE','562'
                UNION ALL SELECT 'IE','563'
                UNION ALL SELECT 'IE','564'
                UNION ALL SELECT 'IE','566'
                UNION ALL SELECT 'IE','570'
                UNION ALL SELECT 'IE','572'
                UNION ALL SELECT 'IE','580'
                UNION ALL SELECT 'IE','581'
                UNION ALL SELECT 'IRPF','4'
                UNION ALL SELECT 'IRPF','100'
                UNION ALL SELECT 'IRPF','130'
                UNION ALL SELECT 'IRPF','714'
                UNION ALL SELECT 'J','042'
                UNION ALL SELECT 'J','043'
                UNION ALL SELECT 'J','048'
                UNION ALL SELECT 'NR','215'
                UNION ALL SELECT 'NR','299'
                UNION ALL SELECT 'NR','RF2'
                UNION ALL SELECT 'O','036'
                UNION ALL SELECT 'O','037'
                UNION ALL SELECT 'O','038'
                UNION ALL SELECT 'O','159'
                UNION ALL SELECT 'O','611'
                UNION ALL SELECT 'O','616'
                UNION ALL SELECT 'PS','430'
                UNION ALL SELECT 'PS','480'
                UNION ALL SELECT 'TP','610'
                UNION ALL SELECT 'TP','615'
                UNION ALL SELECT 'V','568'
                UNION ALL SELECT 'VMH','569') familia_modelo ON familia_modelo.cod_modelo=d.dcto_modelo
    WHERE coalesce(d.dcto_tipo_documen,'')<>'O'
--	and left(concat(CAST(dcto_ejercicio AS varchar(4)),'-',dcto_periodo,'-',CASE WHEN dcto_modelo='20X' THEN '200' ELSE dcto_modelo END,'-',substring(dcto_nif,1,9),'-',dcto_discriminante,'-',dcto_dcto_refer),23) in ('2012-0-200- 02522817-00','2012-0-200- 00805708-00')
  ),
  allRowsNumbered AS (
    SELECT
      cod_expediente_corto,
      ejercicio ,periodo,modelo, nif_9,discriminante,
      referencia_corta,
      fec_documento,	  
      cod_fase_liquidacion,
      indicador,
      ROW_NUMBER() OVER (PARTITION BY cod_expediente_corto ORDER BY indicador,fec_documento desc) rownumber
    FROM allRows
  ),
  query AS (
    SELECT
      cod_expediente_corto,
      ejercicio ,periodo,modelo, nif_9,discriminante,
      referencia_corta,
	  fec_documento,
      cod_fase_liquidacion,
      indicador
    FROM allRowsNumbered
    WHERE rownumber<=1
  )
  select cod_expediente_corto,
      ejercicio ,periodo,modelo, nif_9,discriminante,
      referencia_corta,
      cod_fase_liquidacion,
      indicador   
  INTO #AU1__87898
  from query

  CREATE UNIQUE INDEX unique_index_tmp_AU1__87898 ON #AU1__87898 (ejercicio,periodo,modelo,nif_9,discriminante)	 

  ;WITH
  query AS (
    SELECT
      refer AS referencia,
 --     concat(CAST(dcto_ejercicio AS varchar(4)),'-',dcto_periodo,'-',CASE WHEN dcto_modelo='20X' THEN '200' ELSE dcto_modelo END,'-',substring(dcto_nif,1,9),'-',dcto_discriminante,'-',dcto_dcto_refer) AS cod_expediente,
--      concat(CAST(dcto_ejercicio AS varchar(4)),'-',dcto_periodo,'-',CASE WHEN dcto_modelo='20X' THEN '200' ELSE dcto_modelo END,'-',substring(dcto_nif,1,9),'-',dcto_discriminante,'-',exp1.referencia_corta) AS cod_expediente,  
      case  
	       when cod_fase_liquidacion = 'AUTO' and familia_modelo.cod_familia = 'IVA' then 
                 concat(CAST(dcto_ejercicio AS varchar(4)),'-',dcto_periodo,'-',CASE WHEN dcto_modelo='20X' THEN '200' ELSE dcto_modelo END,'-',substring(dcto_nif,1,9),'-',dcto_discriminante,'-',dcto_dcto_refer)		   
	       else  concat(CAST(dcto_ejercicio AS varchar(4)),'-',dcto_periodo,'-',CASE WHEN dcto_modelo='20X' THEN '200' ELSE dcto_modelo END,'-',substring(dcto_nif,1,9),'-',dcto_discriminante,'-',exp1.referencia_corta)
	  end AS cod_expediente, 
      origen,
      dcto_nif AS nif,
      dcto_discriminante AS discriminante,
      dcto_ejercicio AS ejercicio,
      CASE WHEN dcto_modelo='20X' THEN '200' ELSE dcto_modelo END AS cod_modelo,
      dcto_periodo AS periodo,
      dcto_cod_apli AS cod_aplicacion,
 --     dcto_dcto_refer AS referencia_corta,
 --     exp1.referencia_corta AS referencia_corta,
      case  
	       when cod_fase_liquidacion = 'AUTO' and familia_modelo.cod_familia = 'IVA' then dcto_dcto_refer
           else exp1.referencia_corta
      end AS referencia_corta,	   
      dcto_sufijo_liq AS sufijo,
      dcto_tipo_documen AS cod_tipo_documento,
      dcto_ano_salida AS ano_salida,
      CASE WHEN dcto_signo_importe='I' THEN abs(dcto_importe1)/100 ELSE abs(dcto_importe1)/-100 END AS importe1,
      CASE WHEN dcto_fecha_docu='01/01/0001' THEN '01/01/2001' ELSE dcto_fecha_docu END AS fec_documento,
      dcto_signo_importe AS tipo_importe,
      dcto_timestamp AS timestamp,
      CASE WHEN dcto_baja_marca='' THEN null ELSE dcto_baja_marca END AS marca_baja,
      CASE
          WHEN familia_modelo.cod_familia='IVA' THEN CASE
              WHEN max(d.dcto_tipo_documen) OVER (PARTITION BY concat(CAST(dcto_ejercicio AS varchar(4)),'-',dcto_periodo,'-',CASE WHEN dcto_modelo='20X' THEN '200' ELSE dcto_modelo END,'-',substring(dcto_nif,1,9),'-',dcto_discriminante,'-',dcto_dcto_refer) ORDER BY CASE WHEN dcto_fecha_docu='01/01/0001' THEN '01/01/2001' ELSE dcto_fecha_docu END ROWS BETWEEN 1 FOLLOWING AND 1 FOLLOWING)='1' THEN 1
              ELSE 0
          END
          ELSE 0
      END AS esta_archivado,
      dcto_f_baja AS fec_baja_documento,
      aucafalta AS cab_fec_alta,
      aucafpres AS cab_fec_presentacion,
      aucafdesde AS cab_fec_desde,
      aucafhasta AS cab_fec_hasta,
      aucacodmuni AS cab_cod_municipio,
      auca_tipo_presen AS cab_tipo_presentacion,
      auca_nif_dominante AS cab_nif_dominante,
      auca_admon AS cab_cod_administracion,
      lpcafpres AS cab_liq_fec_presentacion,
      lpcafdesde AS cab_liq_fec_desde,
      lpcafhasta AS cab_liq_fec_hasta,
      lpcacodmuni AS cab_liq_cod_municipio,
      coalesce(procede_propuesta_liquidacion,CASE WHEN lqac_propuesta='S' THEN 1 ELSE 0 END) AS cab_inspec_procede_propuesta_liquidacion,
      CASE
          WHEN familia_modelo.cod_familia='IVA' THEN CASE
              WHEN liqinspeccion.lqac_refer_sico IS NOT NULL THEN 'YALIQ'
              WHEN d.dcto_cod_apli='YA' THEN 'YAPRO'
              WHEN d.dcto_tipo_documen='J' THEN 'AUTO'
              WHEN d.dcto_tipo_documen='¦' AND d.dcto_modelo='322' THEN 'AUTO'
              WHEN d.dcto_tipo_documen='9' THEN 'PROP'
              WHEN d.dcto_tipo_documen='S' THEN 'LIQ'
              WHEN d.dcto_tipo_documen IN ('[') AND d.dcto_modelo='322' THEN 'LIQ'
              WHEN d.dcto_tipo_documen='R' THEN 'REV'
              WHEN d.dcto_tipo_documen IN ('.') AND d.dcto_modelo='322' THEN 'REV'
              WHEN d.dcto_tipo_documen='F' THEN 'RECT'
              WHEN d.dcto_tipo_documen IN ('$') AND d.dcto_modelo='322' THEN 'RECT'
              WHEN d.dcto_tipo_documen='0' THEN 'DENEG'
              WHEN d.dcto_tipo_documen='1' THEN 'ARCH'
              ELSE null
          END
          WHEN familia_modelo.cod_familia='IS' THEN CASE
              WHEN liqinspeccion.lqac_refer_sico IS NOT NULL THEN 'YALIQ'
              WHEN d.dcto_cod_apli='YA' THEN 'YAPRO'
              WHEN d.dcto_tipo_documen='J' AND (substring(d.dcto_dcto_refer,1,1) IN ('W','0','1','2','3','4','5','6','7','8','9') OR d.dcto_nif LIKE '_W55%') THEN 'AUTO'
              WHEN d.dcto_tipo_documen='9' AND (d.dcto_dcto_refer LIKE 'FS%' OR d.dcto_dcto_refer LIKE 'W%' OR d.dcto_dcto_refer LIKE 'S%') THEN 'PROP'
              WHEN d.dcto_tipo_documen='S' AND lotes.d4codlote='S3' THEN 'DEV'
              WHEN d.dcto_tipo_documen IN ('R','S') THEN 'LIQ'
              ELSE null
          END
          ELSE null
      END AS cod_fase_liquidacion,
      CASE
          WHEN familia_modelo.cod_familia='IVA' THEN CASE
              WHEN liqinspeccion.lqac_refer_sico IS NOT NULL THEN 'Acta inspección'
              WHEN d.dcto_cod_apli='YA' THEN 'Propuesta inspección'
              WHEN d.dcto_tipo_documen='J' THEN 'Autoliquidación'
              WHEN d.dcto_tipo_documen='¦' AND d.dcto_modelo='322' THEN 'Autoliquidación'
              WHEN d.dcto_tipo_documen='9' THEN 'Propuesta de liquidación'
              WHEN d.dcto_tipo_documen='S' THEN 'Liquidación provisional'
              WHEN d.dcto_tipo_documen='[' AND d.dcto_modelo='322' THEN 'Liquidación provisional'
              WHEN d.dcto_tipo_documen='R' THEN 'Revisión sin liquidación'
              WHEN d.dcto_tipo_documen='.' AND d.dcto_modelo='322' THEN 'Revisión sin liquidación'
              WHEN d.dcto_tipo_documen='F' THEN 'Rectificación de oficio'
              WHEN d.dcto_tipo_documen='$' AND d.dcto_modelo='322' THEN 'Rectificación de oficio'
              WHEN d.dcto_tipo_documen='0' THEN 'Denegación'
              WHEN d.dcto_tipo_documen='1' THEN 'Archivo'
              ELSE 'Indefinido'
          END
          WHEN familia_modelo.cod_familia='IS' THEN CASE
              WHEN liqinspeccion.lqac_refer_sico IS NOT NULL THEN 'Acta inspección'
              WHEN d.dcto_cod_apli='YA' THEN 'Propuesta inspección'
              WHEN d.dcto_tipo_documen='J' AND substring(d.dcto_dcto_refer,1,1)='W' THEN 'Autoliquidación general'
              WHEN d.dcto_tipo_documen='J' AND substring(d.dcto_dcto_refer,1,1) IN ('0','1','2','3','4','5','6','7','8','9') THEN 'Autoliquidación en papel'
              WHEN d.dcto_tipo_documen='J' AND d.dcto_nif LIKE 'W55%' THEN 'Autoliquidación confidencial'
              WHEN d.dcto_tipo_documen='9' AND d.dcto_dcto_refer LIKE 'W%' THEN 'Propuesta'
              WHEN d.dcto_tipo_documen='9' AND d.dcto_dcto_refer LIKE 'FS%' THEN 'Propuesta de oficio'
              WHEN d.dcto_tipo_documen='9' AND d.dcto_dcto_refer LIKE 'S%' THEN 'Propuesta sanción'
              WHEN d.dcto_tipo_documen IN ('R') THEN 'Revisión sin liquidación'
              WHEN d.dcto_tipo_documen IN ('S') AND lotes.d4codlote='S3' THEN 'Devolución de oficio'
              WHEN d.dcto_tipo_documen IN ('S') THEN 'Liquidación provisional'
              ELSE 'Indefinido'
          END
          ELSE 'Indefinido'
      END AS fase_supuesto,
      cab.tipo_gravamen/100 AS tipo_gravamen,
      cab.tipo_gravamen_IR/100 AS tipo_gravamen_IR,
      cab.tipo_gravamen_base_imp_general_coop/100 AS tipo_gravamen_base_imp_general_coop,
      coalesce(cab.grupo,'Sin marca') AS grupo_fiscal,
      CASE
          WHEN aucabyteestfor='F' THEN coalesce(cab.normativa,'Sin marca')
          WHEN aucabyteestfor='E' THEN 'Estatal'
          WHEN liqinspeccion.lqac_refer_sico IS NOT NULL THEN 'Bizkaia'
          WHEN d.dcto_cod_apli='YA' THEN 'Bizkaia'
      END AS normativa,
      cab.declaracion_complementaria AS declaracion_complementaria,
      CASE
          WHEN aucabyteestfor='F' THEN 'Foral'
          WHEN aucabyteestfor='E' THEN 'Estatal'
          WHEN liqinspeccion.lqac_refer_sico IS NOT NULL THEN 'Foral'
          WHEN d.dcto_cod_apli='YA' THEN 'Foral'
      END AS tipo_normativa,
      coalesce(cab.tamano,'Sin marca') AS tamano,
      coalesce(cab.orden_tamano,4) AS orden_tamano,
      coalesce(cab.tipo_tributacion,'Sin marca') AS tipo_tributacion,
      coalesce(cab.contabilidad,'Sin marca') AS contabilidad,
      coalesce(cab.regimen_fiscal,'Sin marca') AS regimen_fiscal,
      cab.cod_iae1 AS cod_iae1,
      cab.cod_iae2 AS cod_iae2,
      cab.cod_iae3 AS cod_iae3,
      cab.cod_iae4 AS cod_iae4
    FROM dbn1_stg_dhyf.dbo.tbn1_tmp_dcto d
    LEFT JOIN dbn1_stg_dhyf.dbo.tbn1auca_sc_1 auca ON (auca.aucarefer=d.refer)
    LEFT JOIN dbn1_stg_dhyf.dbo.tbn1lpca_sc_1 lpca ON (lpca.lpcarefer=d.refer)
    LEFT JOIN dbn1_stg_dhyf.dbo.tbn1lqac_ya liqinspeccion ON (liqinspeccion.lqac_refer_sico=d.refer)
    LEFT JOIN dbn1_stg_dhyf.dbo.tbn1_tmp_cabeceras cab ON (cab.referencia=d.refer)
    LEFT JOIN dbn1_stg_dhyf.dbo.tbn1dlpr_d4 lotes ON (lotes.d4referl=d.refer)
    INNER JOIN (SELECT 'IS' cod_familia,'200' cod_modelo
                UNION ALL SELECT 'IS','20X'
                UNION ALL SELECT 'IS','218'
                UNION ALL SELECT 'IS','220'
                UNION ALL SELECT 'IS','222'
                UNION ALL SELECT 'IVA','39'
                UNION ALL SELECT 'IVA','303'
                UNION ALL SELECT 'IVA','308'
                UNION ALL SELECT 'IVA','309'
                UNION ALL SELECT 'IVA','310'
                UNION ALL SELECT 'IVA','322'
                UNION ALL SELECT 'IVA','340'
                UNION ALL SELECT 'IVA','341'
                UNION ALL SELECT 'IVA','349'
                UNION ALL SELECT 'IVA','353'
                UNION ALL SELECT 'IVA','390'
                UNION ALL SELECT 'IVA','391'
                UNION ALL SELECT 'IVA','320'
                UNION ALL SELECT 'IVA','330'
                UNION ALL SELECT 'IVA','331'
                UNION ALL SELECT 'IVA','300'
                UNION ALL SELECT 'RAR','180'
                UNION ALL SELECT 'RAR','187'
                UNION ALL SELECT 'RAR','188'
                UNION ALL SELECT 'RAR','190'
                UNION ALL SELECT 'RAR','193'
                UNION ALL SELECT 'RAR','194'
                UNION ALL SELECT 'RAR','196'
                UNION ALL SELECT 'RAR','296'
                UNION ALL SELECT 'RAR','110'
                UNION ALL SELECT 'RAR','111'
                UNION ALL SELECT 'RAR','115'
                UNION ALL SELECT 'RAR','117'
                UNION ALL SELECT 'RAR','123'
                UNION ALL SELECT 'RAR','124'
                UNION ALL SELECT 'RAR','126'
                UNION ALL SELECT 'RAR','128'
                UNION ALL SELECT 'RAR','216'
                UNION ALL SELECT 'DI','170'
                UNION ALL SELECT 'DI','171'
                UNION ALL SELECT 'DI','181'
                UNION ALL SELECT 'DI','182'
                UNION ALL SELECT 'DI','184'
                UNION ALL SELECT 'DI','189'
                UNION ALL SELECT 'DI','192'
                UNION ALL SELECT 'DI','198'
                UNION ALL SELECT 'DI','199'
                UNION ALL SELECT 'DI','291'
                UNION ALL SELECT 'DI','345'
                UNION ALL SELECT 'DI','346'
                UNION ALL SELECT 'DI','347'
                UNION ALL SELECT 'DI','720'				
                UNION ALL SELECT 'DI','781'
                UNION ALL SELECT 'AE','848'
                UNION ALL SELECT 'IE','506'
                UNION ALL SELECT 'IE','507'
                UNION ALL SELECT 'IE','508'
                UNION ALL SELECT 'IE','510'
                UNION ALL SELECT 'IE','513'
                UNION ALL SELECT 'IE','524'
                UNION ALL SELECT 'IE','553'
                UNION ALL SELECT 'IE','554'
                UNION ALL SELECT 'IE','555'
                UNION ALL SELECT 'IE','557'
                UNION ALL SELECT 'IE','558'
                UNION ALL SELECT 'IE','560'
                UNION ALL SELECT 'IE','561'
                UNION ALL SELECT 'IE','562'
                UNION ALL SELECT 'IE','563'
                UNION ALL SELECT 'IE','564'
                UNION ALL SELECT 'IE','566'
                UNION ALL SELECT 'IE','570'
                UNION ALL SELECT 'IE','572'
                UNION ALL SELECT 'IE','580'
                UNION ALL SELECT 'IE','581'
                UNION ALL SELECT 'IRPF','4'
                UNION ALL SELECT 'IRPF','100'
                UNION ALL SELECT 'IRPF','130'
                UNION ALL SELECT 'IRPF','714'
                UNION ALL SELECT 'J','042'
                UNION ALL SELECT 'J','043'
                UNION ALL SELECT 'J','048'
                UNION ALL SELECT 'NR','215'
                UNION ALL SELECT 'NR','299'
                UNION ALL SELECT 'NR','RF2'
                UNION ALL SELECT 'O','036'
                UNION ALL SELECT 'O','037'
                UNION ALL SELECT 'O','038'
                UNION ALL SELECT 'O','159'
                UNION ALL SELECT 'O','611'
                UNION ALL SELECT 'O','616'
                UNION ALL SELECT 'PS','430'
                UNION ALL SELECT 'PS','480'
                UNION ALL SELECT 'TP','610'
                UNION ALL SELECT 'TP','615'
                UNION ALL SELECT 'V','568'
                UNION ALL SELECT 'VMH','569') familia_modelo ON familia_modelo.cod_modelo=d.dcto_modelo
    INNER JOIN #AU1__87898 exp1 on exp1.ejercicio =  dcto_ejercicio   and exp1.periodo = dcto_periodo   and exp1.modelo = CASE WHEN dcto_modelo='20X' THEN '200' ELSE dcto_modelo end and exp1.nif_9 = substring(dcto_nif,1,9)   and  exp1.discriminante = dcto_discriminante				
    WHERE coalesce(d.dcto_tipo_documen,'')<>'O'
  )
  MERGE dbn1_stg_dhyf.dbo.tbn1_tmp_documentos AS tbn1_tmp_documentos
  USING query ON query.referencia=tbn1_tmp_documentos.referencia
  WHEN MATCHED AND ((tbn1_tmp_documentos.cod_expediente<>query.cod_expediente OR (tbn1_tmp_documentos.cod_expediente IS NULL AND query.cod_expediente IS NOT NULL) OR  (tbn1_tmp_documentos.cod_expediente IS NOT NULL AND query.cod_expediente IS NULL)
                    OR tbn1_tmp_documentos.origen<>query.origen OR (tbn1_tmp_documentos.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_tmp_documentos.origen IS NOT NULL AND query.origen IS NULL)
                    OR tbn1_tmp_documentos.nif<>query.nif OR (tbn1_tmp_documentos.nif IS NULL AND query.nif IS NOT NULL) OR  (tbn1_tmp_documentos.nif IS NOT NULL AND query.nif IS NULL)
                    OR tbn1_tmp_documentos.discriminante<>query.discriminante OR (tbn1_tmp_documentos.discriminante IS NULL AND query.discriminante IS NOT NULL) OR  (tbn1_tmp_documentos.discriminante IS NOT NULL AND query.discriminante IS NULL)
                    OR tbn1_tmp_documentos.ejercicio<>query.ejercicio OR (tbn1_tmp_documentos.ejercicio IS NULL AND query.ejercicio IS NOT NULL) OR  (tbn1_tmp_documentos.ejercicio IS NOT NULL AND query.ejercicio IS NULL)
                    OR tbn1_tmp_documentos.cod_modelo<>query.cod_modelo OR (tbn1_tmp_documentos.cod_modelo IS NULL AND query.cod_modelo IS NOT NULL) OR  (tbn1_tmp_documentos.cod_modelo IS NOT NULL AND query.cod_modelo IS NULL)
                    OR tbn1_tmp_documentos.periodo<>query.periodo OR (tbn1_tmp_documentos.periodo IS NULL AND query.periodo IS NOT NULL) OR  (tbn1_tmp_documentos.periodo IS NOT NULL AND query.periodo IS NULL)
                    OR tbn1_tmp_documentos.cod_aplicacion<>query.cod_aplicacion OR (tbn1_tmp_documentos.cod_aplicacion IS NULL AND query.cod_aplicacion IS NOT NULL) OR  (tbn1_tmp_documentos.cod_aplicacion IS NOT NULL AND query.cod_aplicacion IS NULL)
                    OR tbn1_tmp_documentos.referencia_corta<>query.referencia_corta OR (tbn1_tmp_documentos.referencia_corta IS NULL AND query.referencia_corta IS NOT NULL) OR  (tbn1_tmp_documentos.referencia_corta IS NOT NULL AND query.referencia_corta IS NULL)
                    OR tbn1_tmp_documentos.sufijo<>query.sufijo OR (tbn1_tmp_documentos.sufijo IS NULL AND query.sufijo IS NOT NULL) OR  (tbn1_tmp_documentos.sufijo IS NOT NULL AND query.sufijo IS NULL)
                    OR tbn1_tmp_documentos.cod_tipo_documento<>query.cod_tipo_documento OR (tbn1_tmp_documentos.cod_tipo_documento IS NULL AND query.cod_tipo_documento IS NOT NULL) OR  (tbn1_tmp_documentos.cod_tipo_documento IS NOT NULL AND query.cod_tipo_documento IS NULL)
                    OR tbn1_tmp_documentos.ano_salida<>query.ano_salida OR (tbn1_tmp_documentos.ano_salida IS NULL AND query.ano_salida IS NOT NULL) OR  (tbn1_tmp_documentos.ano_salida IS NOT NULL AND query.ano_salida IS NULL)
                    OR tbn1_tmp_documentos.importe1<>query.importe1 OR (tbn1_tmp_documentos.importe1 IS NULL AND query.importe1 IS NOT NULL) OR  (tbn1_tmp_documentos.importe1 IS NOT NULL AND query.importe1 IS NULL)
                    OR tbn1_tmp_documentos.fec_documento<>query.fec_documento OR (tbn1_tmp_documentos.fec_documento IS NULL AND query.fec_documento IS NOT NULL) OR  (tbn1_tmp_documentos.fec_documento IS NOT NULL AND query.fec_documento IS NULL)
                    OR tbn1_tmp_documentos.tipo_importe<>query.tipo_importe OR (tbn1_tmp_documentos.tipo_importe IS NULL AND query.tipo_importe IS NOT NULL) OR  (tbn1_tmp_documentos.tipo_importe IS NOT NULL AND query.tipo_importe IS NULL)
                    OR tbn1_tmp_documentos.timestamp<>query.timestamp OR (tbn1_tmp_documentos.timestamp IS NULL AND query.timestamp IS NOT NULL) OR  (tbn1_tmp_documentos.timestamp IS NOT NULL AND query.timestamp IS NULL)
                    OR tbn1_tmp_documentos.marca_baja<>query.marca_baja OR (tbn1_tmp_documentos.marca_baja IS NULL AND query.marca_baja IS NOT NULL) OR  (tbn1_tmp_documentos.marca_baja IS NOT NULL AND query.marca_baja IS NULL)
                    OR tbn1_tmp_documentos.esta_archivado<>query.esta_archivado OR (tbn1_tmp_documentos.esta_archivado IS NULL AND query.esta_archivado IS NOT NULL) OR  (tbn1_tmp_documentos.esta_archivado IS NOT NULL AND query.esta_archivado IS NULL)
                    OR tbn1_tmp_documentos.fec_baja_documento<>query.fec_baja_documento OR (tbn1_tmp_documentos.fec_baja_documento IS NULL AND query.fec_baja_documento IS NOT NULL) OR  (tbn1_tmp_documentos.fec_baja_documento IS NOT NULL AND query.fec_baja_documento IS NULL)
                    OR tbn1_tmp_documentos.cab_fec_alta<>query.cab_fec_alta OR (tbn1_tmp_documentos.cab_fec_alta IS NULL AND query.cab_fec_alta IS NOT NULL) OR  (tbn1_tmp_documentos.cab_fec_alta IS NOT NULL AND query.cab_fec_alta IS NULL)
                    OR tbn1_tmp_documentos.cab_fec_presentacion<>query.cab_fec_presentacion OR (tbn1_tmp_documentos.cab_fec_presentacion IS NULL AND query.cab_fec_presentacion IS NOT NULL) OR  (tbn1_tmp_documentos.cab_fec_presentacion IS NOT NULL AND query.cab_fec_presentacion IS NULL)
                    OR tbn1_tmp_documentos.cab_fec_desde<>query.cab_fec_desde OR (tbn1_tmp_documentos.cab_fec_desde IS NULL AND query.cab_fec_desde IS NOT NULL) OR  (tbn1_tmp_documentos.cab_fec_desde IS NOT NULL AND query.cab_fec_desde IS NULL)
                    OR tbn1_tmp_documentos.cab_fec_hasta<>query.cab_fec_hasta OR (tbn1_tmp_documentos.cab_fec_hasta IS NULL AND query.cab_fec_hasta IS NOT NULL) OR  (tbn1_tmp_documentos.cab_fec_hasta IS NOT NULL AND query.cab_fec_hasta IS NULL)
                    OR tbn1_tmp_documentos.cab_cod_municipio<>query.cab_cod_municipio OR (tbn1_tmp_documentos.cab_cod_municipio IS NULL AND query.cab_cod_municipio IS NOT NULL) OR  (tbn1_tmp_documentos.cab_cod_municipio IS NOT NULL AND query.cab_cod_municipio IS NULL)
                    OR tbn1_tmp_documentos.cab_tipo_presentacion<>query.cab_tipo_presentacion OR (tbn1_tmp_documentos.cab_tipo_presentacion IS NULL AND query.cab_tipo_presentacion IS NOT NULL) OR  (tbn1_tmp_documentos.cab_tipo_presentacion IS NOT NULL AND query.cab_tipo_presentacion IS NULL)
                    OR tbn1_tmp_documentos.cab_nif_dominante<>query.cab_nif_dominante OR (tbn1_tmp_documentos.cab_nif_dominante IS NULL AND query.cab_nif_dominante IS NOT NULL) OR  (tbn1_tmp_documentos.cab_nif_dominante IS NOT NULL AND query.cab_nif_dominante IS NULL)
                    OR tbn1_tmp_documentos.cab_cod_administracion<>query.cab_cod_administracion OR (tbn1_tmp_documentos.cab_cod_administracion IS NULL AND query.cab_cod_administracion IS NOT NULL) OR  (tbn1_tmp_documentos.cab_cod_administracion IS NOT NULL AND query.cab_cod_administracion IS NULL)
                    OR tbn1_tmp_documentos.cab_liq_fec_presentacion<>query.cab_liq_fec_presentacion OR (tbn1_tmp_documentos.cab_liq_fec_presentacion IS NULL AND query.cab_liq_fec_presentacion IS NOT NULL) OR  (tbn1_tmp_documentos.cab_liq_fec_presentacion IS NOT NULL AND query.cab_liq_fec_presentacion IS NULL)
                    OR tbn1_tmp_documentos.cab_liq_fec_desde<>query.cab_liq_fec_desde OR (tbn1_tmp_documentos.cab_liq_fec_desde IS NULL AND query.cab_liq_fec_desde IS NOT NULL) OR  (tbn1_tmp_documentos.cab_liq_fec_desde IS NOT NULL AND query.cab_liq_fec_desde IS NULL)
                    OR tbn1_tmp_documentos.cab_liq_fec_hasta<>query.cab_liq_fec_hasta OR (tbn1_tmp_documentos.cab_liq_fec_hasta IS NULL AND query.cab_liq_fec_hasta IS NOT NULL) OR  (tbn1_tmp_documentos.cab_liq_fec_hasta IS NOT NULL AND query.cab_liq_fec_hasta IS NULL)
                    OR tbn1_tmp_documentos.cab_liq_cod_municipio<>query.cab_liq_cod_municipio OR (tbn1_tmp_documentos.cab_liq_cod_municipio IS NULL AND query.cab_liq_cod_municipio IS NOT NULL) OR  (tbn1_tmp_documentos.cab_liq_cod_municipio IS NOT NULL AND query.cab_liq_cod_municipio IS NULL)
                    OR tbn1_tmp_documentos.cab_inspec_procede_propuesta_liquidacion<>query.cab_inspec_procede_propuesta_liquidacion OR (tbn1_tmp_documentos.cab_inspec_procede_propuesta_liquidacion IS NULL AND query.cab_inspec_procede_propuesta_liquidacion IS NOT NULL) OR  (tbn1_tmp_documentos.cab_inspec_procede_propuesta_liquidacion IS NOT NULL AND query.cab_inspec_procede_propuesta_liquidacion IS NULL)
                    OR tbn1_tmp_documentos.cod_fase_liquidacion<>query.cod_fase_liquidacion OR (tbn1_tmp_documentos.cod_fase_liquidacion IS NULL AND query.cod_fase_liquidacion IS NOT NULL) OR  (tbn1_tmp_documentos.cod_fase_liquidacion IS NOT NULL AND query.cod_fase_liquidacion IS NULL)
                    OR tbn1_tmp_documentos.fase_supuesto<>query.fase_supuesto OR (tbn1_tmp_documentos.fase_supuesto IS NULL AND query.fase_supuesto IS NOT NULL) OR  (tbn1_tmp_documentos.fase_supuesto IS NOT NULL AND query.fase_supuesto IS NULL)
                    OR tbn1_tmp_documentos.tipo_gravamen<>query.tipo_gravamen OR (tbn1_tmp_documentos.tipo_gravamen IS NULL AND query.tipo_gravamen IS NOT NULL) OR  (tbn1_tmp_documentos.tipo_gravamen IS NOT NULL AND query.tipo_gravamen IS NULL)
                    OR tbn1_tmp_documentos.tipo_gravamen_IR<>query.tipo_gravamen_IR OR (tbn1_tmp_documentos.tipo_gravamen_IR IS NULL AND query.tipo_gravamen_IR IS NOT NULL) OR  (tbn1_tmp_documentos.tipo_gravamen_IR IS NOT NULL AND query.tipo_gravamen_IR IS NULL)
                    OR tbn1_tmp_documentos.tipo_gravamen_base_imp_general_coop<>query.tipo_gravamen_base_imp_general_coop OR (tbn1_tmp_documentos.tipo_gravamen_base_imp_general_coop IS NULL AND query.tipo_gravamen_base_imp_general_coop IS NOT NULL) OR  (tbn1_tmp_documentos.tipo_gravamen_base_imp_general_coop IS NOT NULL AND query.tipo_gravamen_base_imp_general_coop IS NULL)
                    OR tbn1_tmp_documentos.grupo_fiscal<>query.grupo_fiscal OR (tbn1_tmp_documentos.grupo_fiscal IS NULL AND query.grupo_fiscal IS NOT NULL) OR  (tbn1_tmp_documentos.grupo_fiscal IS NOT NULL AND query.grupo_fiscal IS NULL)
                    OR tbn1_tmp_documentos.normativa<>query.normativa OR (tbn1_tmp_documentos.normativa IS NULL AND query.normativa IS NOT NULL) OR  (tbn1_tmp_documentos.normativa IS NOT NULL AND query.normativa IS NULL)
                    OR tbn1_tmp_documentos.declaracion_complementaria<>query.declaracion_complementaria OR (tbn1_tmp_documentos.declaracion_complementaria IS NULL AND query.declaracion_complementaria IS NOT NULL) OR  (tbn1_tmp_documentos.declaracion_complementaria IS NOT NULL AND query.declaracion_complementaria IS NULL)
                    OR tbn1_tmp_documentos.tipo_normativa<>query.tipo_normativa OR (tbn1_tmp_documentos.tipo_normativa IS NULL AND query.tipo_normativa IS NOT NULL) OR  (tbn1_tmp_documentos.tipo_normativa IS NOT NULL AND query.tipo_normativa IS NULL)
                    OR tbn1_tmp_documentos.tamano<>query.tamano OR (tbn1_tmp_documentos.tamano IS NULL AND query.tamano IS NOT NULL) OR  (tbn1_tmp_documentos.tamano IS NOT NULL AND query.tamano IS NULL)
                    OR tbn1_tmp_documentos.orden_tamano<>query.orden_tamano OR (tbn1_tmp_documentos.orden_tamano IS NULL AND query.orden_tamano IS NOT NULL) OR  (tbn1_tmp_documentos.orden_tamano IS NOT NULL AND query.orden_tamano IS NULL)
                    OR tbn1_tmp_documentos.tipo_tributacion<>query.tipo_tributacion OR (tbn1_tmp_documentos.tipo_tributacion IS NULL AND query.tipo_tributacion IS NOT NULL) OR  (tbn1_tmp_documentos.tipo_tributacion IS NOT NULL AND query.tipo_tributacion IS NULL)
                    OR tbn1_tmp_documentos.contabilidad<>query.contabilidad OR (tbn1_tmp_documentos.contabilidad IS NULL AND query.contabilidad IS NOT NULL) OR  (tbn1_tmp_documentos.contabilidad IS NOT NULL AND query.contabilidad IS NULL)
                    OR tbn1_tmp_documentos.regimen_fiscal<>query.regimen_fiscal OR (tbn1_tmp_documentos.regimen_fiscal IS NULL AND query.regimen_fiscal IS NOT NULL) OR  (tbn1_tmp_documentos.regimen_fiscal IS NOT NULL AND query.regimen_fiscal IS NULL)
                    OR tbn1_tmp_documentos.cod_iae1<>query.cod_iae1 OR (tbn1_tmp_documentos.cod_iae1 IS NULL AND query.cod_iae1 IS NOT NULL) OR  (tbn1_tmp_documentos.cod_iae1 IS NOT NULL AND query.cod_iae1 IS NULL)
                    OR tbn1_tmp_documentos.cod_iae2<>query.cod_iae2 OR (tbn1_tmp_documentos.cod_iae2 IS NULL AND query.cod_iae2 IS NOT NULL) OR  (tbn1_tmp_documentos.cod_iae2 IS NOT NULL AND query.cod_iae2 IS NULL)
                    OR tbn1_tmp_documentos.cod_iae3<>query.cod_iae3 OR (tbn1_tmp_documentos.cod_iae3 IS NULL AND query.cod_iae3 IS NOT NULL) OR  (tbn1_tmp_documentos.cod_iae3 IS NOT NULL AND query.cod_iae3 IS NULL)
                    OR tbn1_tmp_documentos.cod_iae4<>query.cod_iae4 OR (tbn1_tmp_documentos.cod_iae4 IS NULL AND query.cod_iae4 IS NOT NULL) OR  (tbn1_tmp_documentos.cod_iae4 IS NOT NULL AND query.cod_iae4 IS NULL))) THEN
    UPDATE SET
      cod_expediente=query.cod_expediente,
      origen=query.origen,
      nif=query.nif,
      discriminante=query.discriminante,
      ejercicio=query.ejercicio,
      cod_modelo=query.cod_modelo,
      periodo=query.periodo,
      cod_aplicacion=query.cod_aplicacion,
      referencia_corta=query.referencia_corta,
      sufijo=query.sufijo,
      cod_tipo_documento=query.cod_tipo_documento,
      ano_salida=query.ano_salida,
      importe1=query.importe1,
      fec_documento=query.fec_documento,
      tipo_importe=query.tipo_importe,
      timestamp=query.timestamp,
      marca_baja=query.marca_baja,
      esta_archivado=query.esta_archivado,
      fec_baja_documento=query.fec_baja_documento,
      cab_fec_alta=query.cab_fec_alta,
      cab_fec_presentacion=query.cab_fec_presentacion,
      cab_fec_desde=query.cab_fec_desde,
      cab_fec_hasta=query.cab_fec_hasta,
      cab_cod_municipio=query.cab_cod_municipio,
      cab_tipo_presentacion=query.cab_tipo_presentacion,
      cab_nif_dominante=query.cab_nif_dominante,
      cab_cod_administracion=query.cab_cod_administracion,
      cab_liq_fec_presentacion=query.cab_liq_fec_presentacion,
      cab_liq_fec_desde=query.cab_liq_fec_desde,
      cab_liq_fec_hasta=query.cab_liq_fec_hasta,
      cab_liq_cod_municipio=query.cab_liq_cod_municipio,
      cab_inspec_procede_propuesta_liquidacion=query.cab_inspec_procede_propuesta_liquidacion,
      cod_fase_liquidacion=query.cod_fase_liquidacion,
      fase_supuesto=query.fase_supuesto,
      tipo_gravamen=query.tipo_gravamen,
      tipo_gravamen_IR=query.tipo_gravamen_IR,
      tipo_gravamen_base_imp_general_coop=query.tipo_gravamen_base_imp_general_coop,
      grupo_fiscal=query.grupo_fiscal,
      normativa=query.normativa,
      declaracion_complementaria=query.declaracion_complementaria,
      tipo_normativa=query.tipo_normativa,
      tamano=query.tamano,
      orden_tamano=query.orden_tamano,
      tipo_tributacion=query.tipo_tributacion,
      contabilidad=query.contabilidad,
      regimen_fiscal=query.regimen_fiscal,
      cod_iae1=query.cod_iae1,
      cod_iae2=query.cod_iae2,
      cod_iae3=query.cod_iae3,
      cod_iae4=query.cod_iae4
  WHEN NOT MATCHED THEN
    INSERT (referencia,cod_expediente,origen,nif,discriminante,ejercicio,cod_modelo,periodo,cod_aplicacion,referencia_corta,sufijo,cod_tipo_documento,ano_salida,importe1,fec_documento,tipo_importe,timestamp,marca_baja,esta_archivado,fec_baja_documento,cab_fec_alta,cab_fec_presentacion,cab_fec_desde,cab_fec_hasta,cab_cod_municipio,cab_tipo_presentacion,cab_nif_dominante,cab_cod_administracion,cab_liq_fec_presentacion,cab_liq_fec_desde,cab_liq_fec_hasta,cab_liq_cod_municipio,cab_inspec_procede_propuesta_liquidacion,cod_fase_liquidacion,fase_supuesto,tipo_gravamen,tipo_gravamen_IR,tipo_gravamen_base_imp_general_coop,grupo_fiscal,normativa,declaracion_complementaria,tipo_normativa,tamano,orden_tamano,tipo_tributacion,contabilidad,regimen_fiscal,cod_iae1,cod_iae2,cod_iae3,cod_iae4) VALUES (
      query.referencia,
      query.cod_expediente,
      query.origen,
      query.nif,
      query.discriminante,
      query.ejercicio,
      query.cod_modelo,
      query.periodo,
      query.cod_aplicacion,
      query.referencia_corta,
      query.sufijo,
      query.cod_tipo_documento,
      query.ano_salida,
      query.importe1,
      query.fec_documento,
      query.tipo_importe,
      query.timestamp,
      query.marca_baja,
      query.esta_archivado,
      query.fec_baja_documento,
      query.cab_fec_alta,
      query.cab_fec_presentacion,
      query.cab_fec_desde,
      query.cab_fec_hasta,
      query.cab_cod_municipio,
      query.cab_tipo_presentacion,
      query.cab_nif_dominante,
      query.cab_cod_administracion,
      query.cab_liq_fec_presentacion,
      query.cab_liq_fec_desde,
      query.cab_liq_fec_hasta,
      query.cab_liq_cod_municipio,
      query.cab_inspec_procede_propuesta_liquidacion,
      query.cod_fase_liquidacion,
      query.fase_supuesto,
      query.tipo_gravamen,
      query.tipo_gravamen_IR,
      query.tipo_gravamen_base_imp_general_coop,
      query.grupo_fiscal,
      query.normativa,
      query.declaracion_complementaria,
      query.tipo_normativa,
      query.tamano,
      query.orden_tamano,
      query.tipo_tributacion,
      query.contabilidad,
      query.regimen_fiscal,
      query.cod_iae1,
      query.cod_iae2,
      query.cod_iae3,
      query.cod_iae4)
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

