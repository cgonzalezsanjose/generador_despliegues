PRINT 'z3_ds_expedientes_deudas.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas(
  id_z3_expedientes_deudas int IDENTITY(1,1),
  id_expediente_z3 int NOT NULL,
  anyo_expediente numeric(4) NOT NULL,
  num_expediente numeric(6) NOT NULL,
  id_contribuyente int NOT NULL,
  nif varchar(11) NOT NULL,
  num_empleado varchar(8) NOT NULL,
  id_agente int NOT NULL,
  oficina_recaudacion varchar(4) NOT NULL,
  fec_actuacion date NOT NULL,
  id_tipo_actuacion int NOT NULL,
  concepto_deuda varchar(7) NOT NULL,
  num_expediente_en_NF varchar(13) NOT NULL,
  es_fallido bit NOT NULL,
  tipo_expediente varchar(1) NOT NULL,
  tiene_nifs_derivados bit NOT NULL,
  id_tipo_expediente_embargos int NOT NULL,
  fec_carga_expediente date NOT NULL,
  anyo_carga_expediente int NOT NULL,
  mes_carga_expediente int NOT NULL,
  id_documento_z3 int,
  id_deuda int NOT NULL,
  id_estado_documento int NOT NULL,
  fecha_asiento date NOT NULL,
  anyo_asiento int NOT NULL,
  mes_asiento int NOT NULL,
  codigo_operacion varchar(4) NOT NULL,
  anyo_contraido varchar(2) NOT NULL,
  tipo_ingreso varchar(1) NOT NULL,
  clave_ingreso varchar(7) NOT NULL,
  secuencia int NOT NULL,
  id_codigo_operacion int NOT NULL,
  id_tipo_ingreso int NOT NULL,
  id_clave_ingreso int NOT NULL,
  id_modelo int NOT NULL,
  cod_modelo varchar(3) NOT NULL,
  fecha_contraido date NOT NULL,
  importe_liquidacion_principal numeric(18,2),
  importe_pendiente_principal numeric(18,2),
  importe_pendiente_demora numeric(18,2),
  importe_pendiente_recargo numeric(18,2),
  importe_suspendido_principal numeric(18,2),
  importe_suspendido_demora numeric(18,2),
  importe_suspendido_recargo numeric(18,2),
  importe_aplazado_principal numeric(18,2),
  importe_aplazado_demora numeric(18,2),
  importe_aplazado_recargo numeric(18,2),
  importe_documento numeric(18,2),
  importe_principal numeric(18,2),
  importe numeric(18,2),
  importe_real numeric(18,2),
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_z3_ds_expedientes_deudas UNIQUE (id_expediente_z3,id_deuda,fecha_asiento,codigo_operacion,anyo_contraido,tipo_ingreso,clave_ingreso,secuencia),
  CONSTRAINT PK_tbn1_z3_ds_expedientes_deudas PRIMARY KEY CLUSTERED (id_z3_expedientes_deudas),
  CONSTRAINT FK_tbn1_z3_ds_expedientes_deudas_tbn1_ot_z3_expedientes_embargo FOREIGN KEY (id_expediente_z3) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_z3_expedientes_embargo(id_expediente_z3),
  CONSTRAINT FK_tbn1_z3_ds_expedientes_deudas_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
  CONSTRAINT FK_tbn1_z3_ds_expedientes_deudas_tbn1_ot_z3_agentes FOREIGN KEY (id_agente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_z3_agentes(id_agente),
  CONSTRAINT FK_tbn1_z3_ds_expedientes_deudas_tbn1_ot_z3_tipos_actuacion FOREIGN KEY (id_tipo_actuacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_z3_tipos_actuacion(id_tipo_actuacion),
  CONSTRAINT FK_tbn1_z3_ds_expedientes_deudas_tbn1_ot_z3_tipo_expediente FOREIGN KEY (id_tipo_expediente_embargos) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_z3_tipo_expediente(id_tipo_expediente_embargos),
  CONSTRAINT FK_tbn1_z3_ds_expedientes_deudas_tbn1_documentos FOREIGN KEY (id_documento_z3) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento),
  CONSTRAINT FK_tbn1_z3_ds_expedientes_deudas_tbn1_ot_deudas FOREIGN KEY (id_deuda) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_deudas(id_deuda),
  CONSTRAINT FK_tbn1_z3_ds_expedientes_deudas_tbn1_ot_estados FOREIGN KEY (id_estado_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_estados(id_estado),
  CONSTRAINT FK_tbn1_z3_ds_expedientes_deudas_tbn1_ot_codigos_operacion FOREIGN KEY (id_codigo_operacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_codigos_operacion(id_codigo_operacion),
  CONSTRAINT FK_tbn1_z3_ds_expedientes_deudas_tbn1_ot_tipos_ingreso FOREIGN KEY (id_tipo_ingreso) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_tipos_ingreso(id_tipo_ingreso),
  CONSTRAINT FK_tbn1_z3_ds_expedientes_deudas_tbn1_ot_claves_ingreso FOREIGN KEY (id_clave_ingreso) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_claves_ingreso(id_clave_ingreso),
  CONSTRAINT FK_tbn1_z3_ds_expedientes_deudas_tbn1_modelos FOREIGN KEY (id_modelo) REFERENCES dbn1_norm_dhyf.dbo.tbn1_modelos(id_modelo)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='id_z3_expedientes_deudas')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD id_z3_expedientes_deudas int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='id_expediente_z3')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD id_expediente_z3 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='anyo_expediente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD anyo_expediente numeric(4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='num_expediente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD num_expediente numeric(6)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='nif')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD nif varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='num_empleado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD num_empleado varchar(8)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='id_agente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD id_agente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='oficina_recaudacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD oficina_recaudacion varchar(4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='fec_actuacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD fec_actuacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='id_tipo_actuacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD id_tipo_actuacion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='concepto_deuda')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD concepto_deuda varchar(7)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='num_expediente_en_NF')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD num_expediente_en_NF varchar(13)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='es_fallido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD es_fallido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='tipo_expediente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD tipo_expediente varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='tiene_nifs_derivados')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD tiene_nifs_derivados bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='id_tipo_expediente_embargos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD id_tipo_expediente_embargos int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='fec_carga_expediente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD fec_carga_expediente date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='anyo_carga_expediente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD anyo_carga_expediente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='mes_carga_expediente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD mes_carga_expediente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='id_documento_z3')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD id_documento_z3 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='id_deuda')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD id_deuda int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='id_estado_documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD id_estado_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='fecha_asiento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD fecha_asiento date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='anyo_asiento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD anyo_asiento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='mes_asiento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD mes_asiento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='codigo_operacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD codigo_operacion varchar(4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='anyo_contraido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD anyo_contraido varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='tipo_ingreso')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD tipo_ingreso varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='clave_ingreso')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD clave_ingreso varchar(7)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD secuencia int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='id_codigo_operacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD id_codigo_operacion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='id_tipo_ingreso')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD id_tipo_ingreso int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='id_clave_ingreso')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD id_clave_ingreso int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='id_modelo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD id_modelo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='cod_modelo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD cod_modelo varchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='fecha_contraido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD fecha_contraido date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='importe_liquidacion_principal')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD importe_liquidacion_principal numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='importe_pendiente_principal')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD importe_pendiente_principal numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='importe_pendiente_demora')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD importe_pendiente_demora numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='importe_pendiente_recargo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD importe_pendiente_recargo numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='importe_suspendido_principal')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD importe_suspendido_principal numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='importe_suspendido_demora')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD importe_suspendido_demora numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='importe_suspendido_recargo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD importe_suspendido_recargo numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='importe_aplazado_principal')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD importe_aplazado_principal numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='importe_aplazado_demora')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD importe_aplazado_demora numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='importe_aplazado_recargo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD importe_aplazado_recargo numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='importe_documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD importe_documento numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='importe_principal')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD importe_principal numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='importe')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD importe numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='importe_real')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD importe_real numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='id_z3_expedientes_deudas' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN id_z3_expedientes_deudas int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='id_expediente_z3' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN id_expediente_z3 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='anyo_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN anyo_expediente numeric(4) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='num_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN num_expediente numeric(6) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN id_contribuyente int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='nif' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN nif varchar(11) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='num_empleado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN num_empleado varchar(8) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='id_agente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN id_agente int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='oficina_recaudacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN oficina_recaudacion varchar(4) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='fec_actuacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN fec_actuacion date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='id_tipo_actuacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN id_tipo_actuacion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='concepto_deuda' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN concepto_deuda varchar(7) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='num_expediente_en_NF' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN num_expediente_en_NF varchar(13) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='es_fallido' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN es_fallido bit NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='tipo_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN tipo_expediente varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='tiene_nifs_derivados' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN tiene_nifs_derivados bit NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='id_tipo_expediente_embargos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN id_tipo_expediente_embargos int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='fec_carga_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN fec_carga_expediente date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='anyo_carga_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN anyo_carga_expediente int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='mes_carga_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN mes_carga_expediente int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='id_documento_z3' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN id_documento_z3 int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='id_deuda' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN id_deuda int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='id_estado_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN id_estado_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='fecha_asiento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN fecha_asiento date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='anyo_asiento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN anyo_asiento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='mes_asiento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN mes_asiento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='codigo_operacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN codigo_operacion varchar(4) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='anyo_contraido' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN anyo_contraido varchar(2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='tipo_ingreso' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN tipo_ingreso varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='clave_ingreso' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN clave_ingreso varchar(7) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='secuencia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN secuencia int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='id_codigo_operacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN id_codigo_operacion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='id_tipo_ingreso' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN id_tipo_ingreso int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='id_clave_ingreso' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN id_clave_ingreso int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='id_modelo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN id_modelo int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='cod_modelo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN cod_modelo varchar(3) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='fecha_contraido' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN fecha_contraido date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='importe_liquidacion_principal' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN importe_liquidacion_principal numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='importe_pendiente_principal' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN importe_pendiente_principal numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='importe_pendiente_demora' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN importe_pendiente_demora numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='importe_pendiente_recargo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN importe_pendiente_recargo numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='importe_suspendido_principal' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN importe_suspendido_principal numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='importe_suspendido_demora' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN importe_suspendido_demora numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='importe_suspendido_recargo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN importe_suspendido_recargo numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='importe_aplazado_principal' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN importe_aplazado_principal numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='importe_aplazado_demora' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN importe_aplazado_demora numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='importe_aplazado_recargo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN importe_aplazado_recargo numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='importe_documento' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN importe_documento numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='importe_principal' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN importe_principal numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='importe' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN importe numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='importe_real' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN importe_real numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND CONSTRAINT_NAME='PK_tbn1_z3_ds_expedientes_deudas')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD CONSTRAINT PK_tbn1_z3_ds_expedientes_deudas PRIMARY KEY CLUSTERED (id_z3_expedientes_deudas)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND CONSTRAINT_NAME='FK_tbn1_z3_ds_expedientes_deudas_tbn1_ot_z3_expedientes_embargo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD CONSTRAINT FK_tbn1_z3_ds_expedientes_deudas_tbn1_ot_z3_expedientes_embargo FOREIGN KEY (id_expediente_z3) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_z3_expedientes_embargo(id_expediente_z3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND CONSTRAINT_NAME='FK_tbn1_z3_ds_expedientes_deudas_tbn1_contribuyentes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD CONSTRAINT FK_tbn1_z3_ds_expedientes_deudas_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND CONSTRAINT_NAME='FK_tbn1_z3_ds_expedientes_deudas_tbn1_ot_z3_agentes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD CONSTRAINT FK_tbn1_z3_ds_expedientes_deudas_tbn1_ot_z3_agentes FOREIGN KEY (id_agente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_z3_agentes(id_agente)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND CONSTRAINT_NAME='FK_tbn1_z3_ds_expedientes_deudas_tbn1_ot_z3_tipos_actuacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD CONSTRAINT FK_tbn1_z3_ds_expedientes_deudas_tbn1_ot_z3_tipos_actuacion FOREIGN KEY (id_tipo_actuacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_z3_tipos_actuacion(id_tipo_actuacion)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND CONSTRAINT_NAME='FK_tbn1_z3_ds_expedientes_deudas_tbn1_ot_z3_tipo_expediente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD CONSTRAINT FK_tbn1_z3_ds_expedientes_deudas_tbn1_ot_z3_tipo_expediente FOREIGN KEY (id_tipo_expediente_embargos) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_z3_tipo_expediente(id_tipo_expediente_embargos)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND CONSTRAINT_NAME='FK_tbn1_z3_ds_expedientes_deudas_tbn1_documentos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD CONSTRAINT FK_tbn1_z3_ds_expedientes_deudas_tbn1_documentos FOREIGN KEY (id_documento_z3) REFERENCES dbn1_norm_dhyf.dbo.tbn1_documentos(id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND CONSTRAINT_NAME='FK_tbn1_z3_ds_expedientes_deudas_tbn1_ot_deudas')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD CONSTRAINT FK_tbn1_z3_ds_expedientes_deudas_tbn1_ot_deudas FOREIGN KEY (id_deuda) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_deudas(id_deuda)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND CONSTRAINT_NAME='FK_tbn1_z3_ds_expedientes_deudas_tbn1_ot_estados')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD CONSTRAINT FK_tbn1_z3_ds_expedientes_deudas_tbn1_ot_estados FOREIGN KEY (id_estado_documento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_estados(id_estado)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND CONSTRAINT_NAME='FK_tbn1_z3_ds_expedientes_deudas_tbn1_ot_codigos_operacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD CONSTRAINT FK_tbn1_z3_ds_expedientes_deudas_tbn1_ot_codigos_operacion FOREIGN KEY (id_codigo_operacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_codigos_operacion(id_codigo_operacion)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND CONSTRAINT_NAME='FK_tbn1_z3_ds_expedientes_deudas_tbn1_ot_tipos_ingreso')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD CONSTRAINT FK_tbn1_z3_ds_expedientes_deudas_tbn1_ot_tipos_ingreso FOREIGN KEY (id_tipo_ingreso) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_tipos_ingreso(id_tipo_ingreso)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND CONSTRAINT_NAME='FK_tbn1_z3_ds_expedientes_deudas_tbn1_ot_claves_ingreso')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD CONSTRAINT FK_tbn1_z3_ds_expedientes_deudas_tbn1_ot_claves_ingreso FOREIGN KEY (id_clave_ingreso) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_claves_ingreso(id_clave_ingreso)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_expedientes_deudas' AND CONSTRAINT_NAME='FK_tbn1_z3_ds_expedientes_deudas_tbn1_modelos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ADD CONSTRAINT FK_tbn1_z3_ds_expedientes_deudas_tbn1_modelos FOREIGN KEY (id_modelo) REFERENCES dbn1_norm_dhyf.dbo.tbn1_modelos(id_modelo)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_z3_ds_expedientes_deudas' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_z3_ds_expedientes_deudas;
GO

CREATE PROCEDURE dbo.spn1_cargar_z3_ds_expedientes_deudas(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_z3_ds_expedientes_deudas'
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

  ;WITH
  allRows AS (
    SELECT
      exp_z3.id_expediente_z3 AS id_expediente_z3,
      exp_z3.anyo_expediente AS anyo_expediente,
      exp_z3.num_expediente AS num_expediente,
      exp_z3.id_contribuyente AS id_contribuyente,
      exp_z3.nif AS nif,
      exp_z3.num_empleado AS num_empleado,
      exp_z3.id_agente AS id_agente,
      exp_z3.oficina_recaudacion AS oficina_recaudacion,
	  CASE WHEN exp_z3.fec_actuacion IS NULL THEN '0001-01-01' ELSE exp_z3.fec_actuacion END AS fec_actuacion,
      exp_z3.id_tipo_actuacion AS id_tipo_actuacion,
      exp_z3.concepto_deuda AS concepto_deuda,
      exp_z3.num_expediente_en_NF AS num_expediente_en_NF,
      CASE WHEN coalesce(exp_z3.num_expediente_en_NF,'')='' THEN 0 ELSE 1 END AS es_fallido,
      exp_z3.tipo_expediente AS tipo_expediente,
      exp_z3.tiene_nifs_derivados AS tiene_nifs_derivados,
      exp_z3.id_tipo_expediente_embargos AS id_tipo_expediente_embargos,
      exp_z3.fec_carga_expediente AS fec_carga_expediente,
      year(exp_z3.fec_carga_expediente) AS anyo_carga_expediente,
      month(exp_z3.fec_carga_expediente) AS mes_carga_expediente,
      deudas.id_documento AS id_documento_z3,
      deudas.id_deuda AS id_deuda,
      coalesce(est.id_estado,indefinidos.id_estado) AS id_estado_documento,
      mov.fecha_asiento AS fecha_asiento,
      year(mov.fecha_asiento) AS anyo_asiento,
      month(mov.fecha_asiento) AS mes_asiento,
      mov.codigo_operacion AS codigo_operacion,
      mov.anyo_contraido AS anyo_contraido,
      mov.tipo_ingreso AS tipo_ingreso,
      mov.clave_ingreso AS clave_ingreso,
      mov.secuencia AS secuencia,
      mov.id_codigo_operacion AS id_codigo_operacion,
      cc.id_tipo_ingreso AS id_tipo_ingreso,
      cc.id_clave_ingreso AS id_clave_ingreso,
      deudas.id_modelo AS id_modelo,
      deudas.modelo AS cod_modelo,
	  CASE WHEN deudas.fecha_contraido IS NULL THEN '0001-01-01' ELSE deudas.fecha_contraido END AS fecha_contraido,
      CASE
          WHEN row_number() OVER (PARTITION BY exp_z3.id_expediente_z3 ORDER BY deudas.id_deuda,mov.fecha_asiento,mov.codigo_operacion,mov.anyo_contraido,mov.tipo_ingreso,mov.clave_ingreso,mov.secuencia)=1 THEN exp_z3.importe_liquid_principal
          ELSE 0
      END AS importe_liquidacion_principal,
	  CASE
          WHEN row_number() OVER (PARTITION BY exp_z3.id_expediente_z3 ORDER BY deudas.id_deuda,mov.fecha_asiento,mov.codigo_operacion,mov.anyo_contraido,mov.tipo_ingreso,mov.clave_ingreso,mov.secuencia)=1 THEN exp_z3.importe_pendiente_principal
          ELSE 0
      END AS importe_pendiente_principal,
	  CASE
          WHEN row_number() OVER (PARTITION BY exp_z3.id_expediente_z3 ORDER BY deudas.id_deuda,mov.fecha_asiento,mov.codigo_operacion,mov.anyo_contraido,mov.tipo_ingreso,mov.clave_ingreso,mov.secuencia)=1 THEN exp_z3.importe_pendiente_demora
          ELSE 0
      END AS importe_pendiente_demora,
	  CASE
          WHEN row_number() OVER (PARTITION BY exp_z3.id_expediente_z3 ORDER BY deudas.id_deuda,mov.fecha_asiento,mov.codigo_operacion,mov.anyo_contraido,mov.tipo_ingreso,mov.clave_ingreso,mov.secuencia)=1 THEN exp_z3.importe_pendiente_recargo
          ELSE 0
      END AS importe_pendiente_recargo,
	  CASE
          WHEN row_number() OVER (PARTITION BY exp_z3.id_expediente_z3 ORDER BY deudas.id_deuda,mov.fecha_asiento,mov.codigo_operacion,mov.anyo_contraido,mov.tipo_ingreso,mov.clave_ingreso,mov.secuencia)=1 THEN exp_z3.importe_suspendido_principal
          ELSE 0
      END AS importe_suspendido_principal,
	  CASE
          WHEN row_number() OVER (PARTITION BY exp_z3.id_expediente_z3 ORDER BY deudas.id_deuda,mov.fecha_asiento,mov.codigo_operacion,mov.anyo_contraido,mov.tipo_ingreso,mov.clave_ingreso,mov.secuencia)=1 THEN exp_z3.importe_suspendido_demora
          ELSE 0
      END AS importe_suspendido_demora,
	  CASE
          WHEN row_number() OVER (PARTITION BY exp_z3.id_expediente_z3 ORDER BY deudas.id_deuda,mov.fecha_asiento,mov.codigo_operacion,mov.anyo_contraido,mov.tipo_ingreso,mov.clave_ingreso,mov.secuencia)=1 THEN exp_z3.importe_suspendido_recargo
          ELSE 0
      END AS importe_suspendido_recargo,
	  CASE
          WHEN row_number() OVER (PARTITION BY exp_z3.id_expediente_z3 ORDER BY deudas.id_deuda,mov.fecha_asiento,mov.codigo_operacion,mov.anyo_contraido,mov.tipo_ingreso,mov.clave_ingreso,mov.secuencia)=1 THEN exp_z3.importe_aplazado_principal
          ELSE 0
      END AS importe_aplazado_principal,
	  CASE
          WHEN row_number() OVER (PARTITION BY exp_z3.id_expediente_z3 ORDER BY deudas.id_deuda,mov.fecha_asiento,mov.codigo_operacion,mov.anyo_contraido,mov.tipo_ingreso,mov.clave_ingreso,mov.secuencia)=1 THEN exp_z3.importe_aplazado_demora
          ELSE 0
      END AS importe_aplazado_demora,
	  CASE
          WHEN row_number() OVER (PARTITION BY exp_z3.id_expediente_z3 ORDER BY deudas.id_deuda,mov.fecha_asiento,mov.codigo_operacion,mov.anyo_contraido,mov.tipo_ingreso,mov.clave_ingreso,mov.secuencia)=1 THEN exp_z3.importe_aplazado_recargo
          ELSE 0
      END AS importe_aplazado_recargo,
	  CASE
          WHEN row_number() OVER (PARTITION BY exp_z3.id_expediente_z3,deudas.id_deuda ORDER BY mov.fecha_asiento,mov.codigo_operacion,mov.anyo_contraido,mov.tipo_ingreso,mov.clave_ingreso,mov.secuencia,doc_z3.docfehi DESC)=1 THEN doc_z3.docimpo/100
          ELSE 0
      END AS importe_documento,
      CASE
          WHEN row_number() OVER (PARTITION BY exp_z3.id_expediente_z3,deudas.id_deuda ORDER BY mov.fecha_asiento,mov.codigo_operacion,mov.anyo_contraido,mov.tipo_ingreso,mov.clave_ingreso,mov.secuencia,doc_z3.docfehi DESC)=1 THEN doc_z3.docimppr/100
          ELSE 0
      END AS importe_principal,
      mov.importe AS importe,
      mov.importe_real AS importe_real
    FROM dbn1_norm_dhyf.dbo.tbn1_ot_z3_expedientes_embargo exp_z3
    INNER JOIN dbn1_stg_dhyf.dbo.tbn1docu_z3 doc_z3 ON (doc_z3.docejerc=exp_z3.anyo_expediente AND doc_z3.docnro=exp_z3.num_expediente)
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_ot_deudas deudas ON (deudas.num_liquidacion=doc_z3.docdcto)
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_ot_operaciones_contables mov ON (mov.id_deuda=deudas.id_deuda)
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_ot_claves_contables cc ON (cc.id_clave_contable=mov.id_clave_contable)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_ot_estados est ON (est.cod_estado=doc_z3.docesta)
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
    WHERE
      deudas.fec_baja IS NULL
      AND mov.fec_baja IS NULL
      AND cc.fec_baja IS NULL
  ),
  allRowsNumbered AS (
    SELECT
      id_expediente_z3,
      anyo_expediente,
      num_expediente,
      id_contribuyente,
      nif,
      num_empleado,
      id_agente,
      oficina_recaudacion,
      fec_actuacion,
      id_tipo_actuacion,
      concepto_deuda,
      num_expediente_en_NF,
      es_fallido,
      tipo_expediente,
      tiene_nifs_derivados,
      id_tipo_expediente_embargos,
      fec_carga_expediente,
      anyo_carga_expediente,
      mes_carga_expediente,
      id_documento_z3,
      id_deuda,
      id_estado_documento,
      fecha_asiento,
      anyo_asiento,
      mes_asiento,
      codigo_operacion,
      anyo_contraido,
      tipo_ingreso,
      clave_ingreso,
      secuencia,
      id_codigo_operacion,
      id_tipo_ingreso,
      id_clave_ingreso,
      id_modelo,
      cod_modelo,
      fecha_contraido,
      importe_liquidacion_principal,
	  importe_pendiente_principal,
	  importe_pendiente_demora,
	  importe_pendiente_recargo,
	  importe_suspendido_principal,
	  importe_suspendido_demora,
	  importe_suspendido_recargo,
	  importe_aplazado_principal,
	  importe_aplazado_demora,
	  importe_aplazado_recargo,
	  importe_documento,
      importe_principal,
      importe,
      importe_real,
      ROW_NUMBER() OVER (PARTITION BY id_expediente_z3,id_deuda,fecha_asiento,codigo_operacion,anyo_contraido,tipo_ingreso,clave_ingreso,secuencia ORDER BY importe_documento DESC) rownumber
    FROM allRows
  ),
  query AS (
    SELECT
      id_expediente_z3,
      anyo_expediente,
      num_expediente,
      id_contribuyente,
      nif,
      num_empleado,
      id_agente,
      oficina_recaudacion,
      fec_actuacion,
      id_tipo_actuacion,
      concepto_deuda,
      num_expediente_en_NF,
      es_fallido,
      tipo_expediente,
      tiene_nifs_derivados,
      id_tipo_expediente_embargos,
      fec_carga_expediente,
      anyo_carga_expediente,
      mes_carga_expediente,
      id_documento_z3,
      id_deuda,
      id_estado_documento,
      fecha_asiento,
      anyo_asiento,
      mes_asiento,
      codigo_operacion,
      anyo_contraido,
      tipo_ingreso,
      clave_ingreso,
      secuencia,
      id_codigo_operacion,
      id_tipo_ingreso,
      id_clave_ingreso,
      id_modelo,
      cod_modelo,
      fecha_contraido,
      importe_liquidacion_principal,
	  importe_pendiente_principal,
	  importe_pendiente_demora,
	  importe_pendiente_recargo,
	  importe_suspendido_principal,
	  importe_suspendido_demora,
	  importe_suspendido_recargo,
	  importe_aplazado_principal,
	  importe_aplazado_demora,
	  importe_aplazado_recargo,
      importe_documento,
      importe_principal,
      importe,
      importe_real
    FROM allRowsNumbered
    WHERE rownumber<=1
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas AS tbn1_z3_ds_expedientes_deudas
  USING query ON query.id_expediente_z3=tbn1_z3_ds_expedientes_deudas.id_expediente_z3 AND query.id_deuda=tbn1_z3_ds_expedientes_deudas.id_deuda AND query.fecha_asiento=tbn1_z3_ds_expedientes_deudas.fecha_asiento AND query.codigo_operacion=tbn1_z3_ds_expedientes_deudas.codigo_operacion AND query.anyo_contraido=tbn1_z3_ds_expedientes_deudas.anyo_contraido AND query.tipo_ingreso=tbn1_z3_ds_expedientes_deudas.tipo_ingreso AND query.clave_ingreso=tbn1_z3_ds_expedientes_deudas.clave_ingreso AND query.secuencia=tbn1_z3_ds_expedientes_deudas.secuencia
  WHEN MATCHED AND ((tbn1_z3_ds_expedientes_deudas.anyo_expediente<>query.anyo_expediente OR (tbn1_z3_ds_expedientes_deudas.anyo_expediente IS NULL AND query.anyo_expediente IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.anyo_expediente IS NOT NULL AND query.anyo_expediente IS NULL)
                    OR tbn1_z3_ds_expedientes_deudas.num_expediente<>query.num_expediente OR (tbn1_z3_ds_expedientes_deudas.num_expediente IS NULL AND query.num_expediente IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.num_expediente IS NOT NULL AND query.num_expediente IS NULL)
                    OR tbn1_z3_ds_expedientes_deudas.id_contribuyente<>query.id_contribuyente OR (tbn1_z3_ds_expedientes_deudas.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_z3_ds_expedientes_deudas.nif<>query.nif OR (tbn1_z3_ds_expedientes_deudas.nif IS NULL AND query.nif IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.nif IS NOT NULL AND query.nif IS NULL)
                    OR tbn1_z3_ds_expedientes_deudas.num_empleado<>query.num_empleado OR (tbn1_z3_ds_expedientes_deudas.num_empleado IS NULL AND query.num_empleado IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.num_empleado IS NOT NULL AND query.num_empleado IS NULL)
                    OR tbn1_z3_ds_expedientes_deudas.id_agente<>query.id_agente OR (tbn1_z3_ds_expedientes_deudas.id_agente IS NULL AND query.id_agente IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.id_agente IS NOT NULL AND query.id_agente IS NULL)
                    OR tbn1_z3_ds_expedientes_deudas.oficina_recaudacion<>query.oficina_recaudacion OR (tbn1_z3_ds_expedientes_deudas.oficina_recaudacion IS NULL AND query.oficina_recaudacion IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.oficina_recaudacion IS NOT NULL AND query.oficina_recaudacion IS NULL)
                    OR tbn1_z3_ds_expedientes_deudas.fec_actuacion<>query.fec_actuacion OR (tbn1_z3_ds_expedientes_deudas.fec_actuacion IS NULL AND query.fec_actuacion IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.fec_actuacion IS NOT NULL AND query.fec_actuacion IS NULL)
                    OR tbn1_z3_ds_expedientes_deudas.id_tipo_actuacion<>query.id_tipo_actuacion OR (tbn1_z3_ds_expedientes_deudas.id_tipo_actuacion IS NULL AND query.id_tipo_actuacion IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.id_tipo_actuacion IS NOT NULL AND query.id_tipo_actuacion IS NULL)
                    OR tbn1_z3_ds_expedientes_deudas.concepto_deuda<>query.concepto_deuda OR (tbn1_z3_ds_expedientes_deudas.concepto_deuda IS NULL AND query.concepto_deuda IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.concepto_deuda IS NOT NULL AND query.concepto_deuda IS NULL)
                    OR tbn1_z3_ds_expedientes_deudas.num_expediente_en_NF<>query.num_expediente_en_NF OR (tbn1_z3_ds_expedientes_deudas.num_expediente_en_NF IS NULL AND query.num_expediente_en_NF IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.num_expediente_en_NF IS NOT NULL AND query.num_expediente_en_NF IS NULL)
                    OR tbn1_z3_ds_expedientes_deudas.es_fallido<>query.es_fallido OR (tbn1_z3_ds_expedientes_deudas.es_fallido IS NULL AND query.es_fallido IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.es_fallido IS NOT NULL AND query.es_fallido IS NULL)
                    OR tbn1_z3_ds_expedientes_deudas.tipo_expediente<>query.tipo_expediente OR (tbn1_z3_ds_expedientes_deudas.tipo_expediente IS NULL AND query.tipo_expediente IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.tipo_expediente IS NOT NULL AND query.tipo_expediente IS NULL)
                    OR tbn1_z3_ds_expedientes_deudas.tiene_nifs_derivados<>query.tiene_nifs_derivados OR (tbn1_z3_ds_expedientes_deudas.tiene_nifs_derivados IS NULL AND query.tiene_nifs_derivados IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.tiene_nifs_derivados IS NOT NULL AND query.tiene_nifs_derivados IS NULL)
                    OR tbn1_z3_ds_expedientes_deudas.id_tipo_expediente_embargos<>query.id_tipo_expediente_embargos OR (tbn1_z3_ds_expedientes_deudas.id_tipo_expediente_embargos IS NULL AND query.id_tipo_expediente_embargos IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.id_tipo_expediente_embargos IS NOT NULL AND query.id_tipo_expediente_embargos IS NULL)
                    OR tbn1_z3_ds_expedientes_deudas.fec_carga_expediente<>query.fec_carga_expediente OR (tbn1_z3_ds_expedientes_deudas.fec_carga_expediente IS NULL AND query.fec_carga_expediente IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.fec_carga_expediente IS NOT NULL AND query.fec_carga_expediente IS NULL)
                    OR tbn1_z3_ds_expedientes_deudas.anyo_carga_expediente<>query.anyo_carga_expediente OR (tbn1_z3_ds_expedientes_deudas.anyo_carga_expediente IS NULL AND query.anyo_carga_expediente IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.anyo_carga_expediente IS NOT NULL AND query.anyo_carga_expediente IS NULL)
                    OR tbn1_z3_ds_expedientes_deudas.mes_carga_expediente<>query.mes_carga_expediente OR (tbn1_z3_ds_expedientes_deudas.mes_carga_expediente IS NULL AND query.mes_carga_expediente IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.mes_carga_expediente IS NOT NULL AND query.mes_carga_expediente IS NULL)
                    OR tbn1_z3_ds_expedientes_deudas.id_documento_z3<>query.id_documento_z3 OR (tbn1_z3_ds_expedientes_deudas.id_documento_z3 IS NULL AND query.id_documento_z3 IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.id_documento_z3 IS NOT NULL AND query.id_documento_z3 IS NULL)
                    OR tbn1_z3_ds_expedientes_deudas.id_estado_documento<>query.id_estado_documento OR (tbn1_z3_ds_expedientes_deudas.id_estado_documento IS NULL AND query.id_estado_documento IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.id_estado_documento IS NOT NULL AND query.id_estado_documento IS NULL)
                    OR tbn1_z3_ds_expedientes_deudas.anyo_asiento<>query.anyo_asiento OR (tbn1_z3_ds_expedientes_deudas.anyo_asiento IS NULL AND query.anyo_asiento IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.anyo_asiento IS NOT NULL AND query.anyo_asiento IS NULL)
                    OR tbn1_z3_ds_expedientes_deudas.mes_asiento<>query.mes_asiento OR (tbn1_z3_ds_expedientes_deudas.mes_asiento IS NULL AND query.mes_asiento IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.mes_asiento IS NOT NULL AND query.mes_asiento IS NULL)
                    OR tbn1_z3_ds_expedientes_deudas.id_codigo_operacion<>query.id_codigo_operacion OR (tbn1_z3_ds_expedientes_deudas.id_codigo_operacion IS NULL AND query.id_codigo_operacion IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.id_codigo_operacion IS NOT NULL AND query.id_codigo_operacion IS NULL)
                    OR tbn1_z3_ds_expedientes_deudas.id_tipo_ingreso<>query.id_tipo_ingreso OR (tbn1_z3_ds_expedientes_deudas.id_tipo_ingreso IS NULL AND query.id_tipo_ingreso IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.id_tipo_ingreso IS NOT NULL AND query.id_tipo_ingreso IS NULL)
                    OR tbn1_z3_ds_expedientes_deudas.id_clave_ingreso<>query.id_clave_ingreso OR (tbn1_z3_ds_expedientes_deudas.id_clave_ingreso IS NULL AND query.id_clave_ingreso IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.id_clave_ingreso IS NOT NULL AND query.id_clave_ingreso IS NULL)
                    OR tbn1_z3_ds_expedientes_deudas.id_modelo<>query.id_modelo OR (tbn1_z3_ds_expedientes_deudas.id_modelo IS NULL AND query.id_modelo IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.id_modelo IS NOT NULL AND query.id_modelo IS NULL)
                    OR tbn1_z3_ds_expedientes_deudas.cod_modelo<>query.cod_modelo OR (tbn1_z3_ds_expedientes_deudas.cod_modelo IS NULL AND query.cod_modelo IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.cod_modelo IS NOT NULL AND query.cod_modelo IS NULL)
                    OR tbn1_z3_ds_expedientes_deudas.fecha_contraido<>query.fecha_contraido OR (tbn1_z3_ds_expedientes_deudas.fecha_contraido IS NULL AND query.fecha_contraido IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.fecha_contraido IS NOT NULL AND query.fecha_contraido IS NULL)
                    OR tbn1_z3_ds_expedientes_deudas.importe_liquidacion_principal<>query.importe_liquidacion_principal OR (tbn1_z3_ds_expedientes_deudas.importe_liquidacion_principal IS NULL AND query.importe_liquidacion_principal IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.importe_liquidacion_principal IS NOT NULL AND query.importe_liquidacion_principal IS NULL)
					OR tbn1_z3_ds_expedientes_deudas.importe_pendiente_principal<>query.importe_pendiente_principal OR (tbn1_z3_ds_expedientes_deudas.importe_pendiente_principal IS NULL AND query.importe_pendiente_principal IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.importe_pendiente_principal IS NOT NULL AND query.importe_pendiente_principal IS NULL)
					OR tbn1_z3_ds_expedientes_deudas.importe_pendiente_demora<>query.importe_pendiente_demora OR (tbn1_z3_ds_expedientes_deudas.importe_pendiente_demora IS NULL AND query.importe_pendiente_demora IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.importe_pendiente_demora IS NOT NULL AND query.importe_pendiente_demora IS NULL)
					OR tbn1_z3_ds_expedientes_deudas.importe_pendiente_recargo<>query.importe_pendiente_recargo OR (tbn1_z3_ds_expedientes_deudas.importe_pendiente_recargo IS NULL AND query.importe_pendiente_recargo IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.importe_pendiente_recargo IS NOT NULL AND query.importe_pendiente_recargo IS NULL)
					OR tbn1_z3_ds_expedientes_deudas.importe_suspendido_principal<>query.importe_suspendido_principal OR (tbn1_z3_ds_expedientes_deudas.importe_suspendido_principal IS NULL AND query.importe_suspendido_principal IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.importe_suspendido_principal IS NOT NULL AND query.importe_suspendido_principal IS NULL)
					OR tbn1_z3_ds_expedientes_deudas.importe_suspendido_demora<>query.importe_suspendido_demora OR (tbn1_z3_ds_expedientes_deudas.importe_suspendido_demora IS NULL AND query.importe_suspendido_demora IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.importe_suspendido_demora IS NOT NULL AND query.importe_suspendido_demora IS NULL)
					OR tbn1_z3_ds_expedientes_deudas.importe_suspendido_recargo<>query.importe_suspendido_recargo OR (tbn1_z3_ds_expedientes_deudas.importe_suspendido_recargo IS NULL AND query.importe_suspendido_recargo IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.importe_suspendido_recargo IS NOT NULL AND query.importe_suspendido_recargo IS NULL)
					OR tbn1_z3_ds_expedientes_deudas.importe_aplazado_principal<>query.importe_aplazado_principal OR (tbn1_z3_ds_expedientes_deudas.importe_aplazado_principal IS NULL AND query.importe_aplazado_principal IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.importe_aplazado_principal IS NOT NULL AND query.importe_aplazado_principal IS NULL)
					OR tbn1_z3_ds_expedientes_deudas.importe_aplazado_demora<>query.importe_aplazado_demora OR (tbn1_z3_ds_expedientes_deudas.importe_aplazado_demora IS NULL AND query.importe_aplazado_demora IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.importe_aplazado_demora IS NOT NULL AND query.importe_aplazado_demora IS NULL)
					OR tbn1_z3_ds_expedientes_deudas.importe_aplazado_recargo<>query.importe_aplazado_recargo OR (tbn1_z3_ds_expedientes_deudas.importe_aplazado_recargo IS NULL AND query.importe_aplazado_recargo IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.importe_aplazado_recargo IS NOT NULL AND query.importe_aplazado_recargo IS NULL)
					OR tbn1_z3_ds_expedientes_deudas.importe_documento<>query.importe_documento OR (tbn1_z3_ds_expedientes_deudas.importe_documento IS NULL AND query.importe_documento IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.importe_documento IS NOT NULL AND query.importe_documento IS NULL)
                    OR tbn1_z3_ds_expedientes_deudas.importe_principal<>query.importe_principal OR (tbn1_z3_ds_expedientes_deudas.importe_principal IS NULL AND query.importe_principal IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.importe_principal IS NOT NULL AND query.importe_principal IS NULL)
                    OR tbn1_z3_ds_expedientes_deudas.importe<>query.importe OR (tbn1_z3_ds_expedientes_deudas.importe IS NULL AND query.importe IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.importe IS NOT NULL AND query.importe IS NULL)
                    OR tbn1_z3_ds_expedientes_deudas.importe_real<>query.importe_real OR (tbn1_z3_ds_expedientes_deudas.importe_real IS NULL AND query.importe_real IS NOT NULL) OR  (tbn1_z3_ds_expedientes_deudas.importe_real IS NOT NULL AND query.importe_real IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      anyo_expediente=query.anyo_expediente,
      num_expediente=query.num_expediente,
      id_contribuyente=query.id_contribuyente,
      nif=query.nif,
      num_empleado=query.num_empleado,
      id_agente=query.id_agente,
      oficina_recaudacion=query.oficina_recaudacion,
      fec_actuacion=query.fec_actuacion,
      id_tipo_actuacion=query.id_tipo_actuacion,
      concepto_deuda=query.concepto_deuda,
      num_expediente_en_NF=query.num_expediente_en_NF,
      es_fallido=query.es_fallido,
      tipo_expediente=query.tipo_expediente,
      tiene_nifs_derivados=query.tiene_nifs_derivados,
      id_tipo_expediente_embargos=query.id_tipo_expediente_embargos,
      fec_carga_expediente=query.fec_carga_expediente,
      anyo_carga_expediente=query.anyo_carga_expediente,
      mes_carga_expediente=query.mes_carga_expediente,
      id_documento_z3=query.id_documento_z3,
      id_estado_documento=query.id_estado_documento,
      anyo_asiento=query.anyo_asiento,
      mes_asiento=query.mes_asiento,
      id_codigo_operacion=query.id_codigo_operacion,
      id_tipo_ingreso=query.id_tipo_ingreso,
      id_clave_ingreso=query.id_clave_ingreso,
      id_modelo=query.id_modelo,
      cod_modelo=query.cod_modelo,
      fecha_contraido=query.fecha_contraido,
      importe_liquidacion_principal=query.importe_liquidacion_principal,
	  importe_pendiente_principal=query.importe_pendiente_principal,
	  importe_pendiente_demora=query.importe_pendiente_demora,
	  importe_pendiente_recargo=query.importe_pendiente_recargo,
	  importe_suspendido_principal=query.importe_suspendido_principal,
	  importe_suspendido_demora=query.importe_suspendido_demora,
	  importe_suspendido_recargo=query.importe_suspendido_recargo,
	  importe_aplazado_principal=query.importe_aplazado_principal,
	  importe_aplazado_demora=query.importe_aplazado_demora,
	  importe_aplazado_recargo=query.importe_aplazado_recargo,
	  importe_documento=query.importe_documento,
      importe_principal=query.importe_principal,
      importe=query.importe,
      importe_real=query.importe_real,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (id_expediente_z3,anyo_expediente,num_expediente,id_contribuyente,nif,num_empleado,id_agente,oficina_recaudacion,fec_actuacion,id_tipo_actuacion,concepto_deuda,num_expediente_en_NF,es_fallido,tipo_expediente,tiene_nifs_derivados,id_tipo_expediente_embargos,fec_carga_expediente,anyo_carga_expediente,mes_carga_expediente,id_documento_z3,id_deuda,id_estado_documento,fecha_asiento,anyo_asiento,mes_asiento,codigo_operacion,anyo_contraido,tipo_ingreso,clave_ingreso,secuencia,id_codigo_operacion,id_tipo_ingreso,id_clave_ingreso,id_modelo,cod_modelo,fecha_contraido,importe_liquidacion_principal,importe_pendiente_principal,importe_pendiente_demora,importe_pendiente_recargo,importe_suspendido_principal,importe_suspendido_demora,importe_suspendido_recargo,importe_aplazado_principal,importe_aplazado_demora,importe_aplazado_recargo,importe_documento,importe_principal,importe,importe_real,fec_alta,fec_modificacion) VALUES (
      query.id_expediente_z3,
      query.anyo_expediente,
      query.num_expediente,
      query.id_contribuyente,
      query.nif,
      query.num_empleado,
      query.id_agente,
      query.oficina_recaudacion,
      query.fec_actuacion,
      query.id_tipo_actuacion,
      query.concepto_deuda,
      query.num_expediente_en_NF,
      query.es_fallido,
      query.tipo_expediente,
      query.tiene_nifs_derivados,
      query.id_tipo_expediente_embargos,
      query.fec_carga_expediente,
      query.anyo_carga_expediente,
      query.mes_carga_expediente,
      query.id_documento_z3,
      query.id_deuda,
      query.id_estado_documento,
      query.fecha_asiento,
      query.anyo_asiento,
      query.mes_asiento,
      query.codigo_operacion,
      query.anyo_contraido,
      query.tipo_ingreso,
      query.clave_ingreso,
      query.secuencia,
      query.id_codigo_operacion,
      query.id_tipo_ingreso,
      query.id_clave_ingreso,
      query.id_modelo,
      query.cod_modelo,
      query.fecha_contraido,
      query.importe_liquidacion_principal,
	  query.importe_pendiente_principal,
	  query.importe_pendiente_demora,
	  query.importe_pendiente_recargo,
	  query.importe_suspendido_principal,
	  query.importe_suspendido_demora,
	  query.importe_suspendido_recargo,
	  query.importe_aplazado_principal,
	  query.importe_aplazado_demora,
	  query.importe_aplazado_recargo,
      query.importe_documento,
      query.importe_principal,
      query.importe,
      query.importe_real,
      getdate(),
      getdate())
  WHEN NOT MATCHED BY SOURCE AND (fec_baja IS NULL) THEN
    UPDATE SET
      fec_baja=getdate(),
      fec_modificacion=getdate();

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

