PRINT 'z3_ds_notificaciones.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones(
  id_z3_notificaciones int IDENTITY(1,1),
  id_expediente_z3 int NOT NULL,
  anyo_expediente numeric(4) NOT NULL,
  num_expediente numeric(6) NOT NULL,
  id_contribuyente int NOT NULL,
  nif varchar(11) NOT NULL,
  id_tipo_actuacion_z3 int NOT NULL,
  fec_actuacion date NOT NULL,
  id_tipo_actuacion int NOT NULL,
  num_empleado varchar(8) NOT NULL,
  id_referencia_actuacion int NOT NULL,
  importe_actuacion numeric(18,2),
  es_ultima bit NOT NULL,
  id_modelo_z3 int NOT NULL,
  dcto_salida_por_actuacion varchar(8) NOT NULL,
  tipo_documento varchar(2) NOT NULL,
  documento varchar(13) NOT NULL,
  unidad_recaudacion varchar(4) NOT NULL,
  modelo_tipo_emision varchar(1) NOT NULL,
  modelo_fecha_de_emision date NOT NULL,
  modelo_tipo_notificacion varchar(1) NOT NULL,
  modelo_fecha_de_notificacion date NOT NULL,
  numero_orden_notificacion decimal(2) NOT NULL,
  notificacion_tipo_emision varchar(1) NOT NULL,
  notificacion_fecha_de_emision date NOT NULL,
  notificacion_tipo_notificacion varchar(1) NOT NULL,
  notificacion_fecha_de_notificacion date NOT NULL,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_z3_ds_notificaciones UNIQUE (id_expediente_z3,id_tipo_actuacion_z3,id_modelo_z3,numero_orden_notificacion),
  CONSTRAINT PK_tbn1_z3_ds_notificaciones PRIMARY KEY CLUSTERED (id_z3_notificaciones),
  CONSTRAINT FK_tbn1_z3_ds_notificaciones_tbn1_ot_z3_expedientes_embargo FOREIGN KEY (id_expediente_z3) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_z3_expedientes_embargo(id_expediente_z3),
  CONSTRAINT FK_tbn1_z3_ds_notificaciones_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
  CONSTRAINT FK_tbn1_z3_ds_notificaciones_tbn1_ot_z3_actuaciones_embargo FOREIGN KEY (id_tipo_actuacion_z3) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_z3_actuaciones_embargo(id_tipo_actuacion_z3),
  CONSTRAINT FK_tbn1_z3_ds_notificaciones_tbn1_ot_z3_tipos_actuacion FOREIGN KEY (id_tipo_actuacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_z3_tipos_actuacion(id_tipo_actuacion),
  CONSTRAINT FK_tbn1_z3_ds_notificaciones_tbn1_ot_z3_referencias_actuaciones FOREIGN KEY (id_referencia_actuacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_z3_referencias_actuaciones(id_referencia_actuacion),
  CONSTRAINT FK_tbn1_z3_ds_notificaciones_tbn1_ot_z3_modelos_embargo FOREIGN KEY (id_modelo_z3) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_z3_modelos_embargo(id_modelo_z3)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='id_z3_notificaciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ADD id_z3_notificaciones int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='id_expediente_z3')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ADD id_expediente_z3 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='anyo_expediente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ADD anyo_expediente numeric(4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='num_expediente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ADD num_expediente numeric(6)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='nif')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ADD nif varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='id_tipo_actuacion_z3')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ADD id_tipo_actuacion_z3 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='fec_actuacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ADD fec_actuacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='id_tipo_actuacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ADD id_tipo_actuacion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='num_empleado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ADD num_empleado varchar(8)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='id_referencia_actuacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ADD id_referencia_actuacion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='importe_actuacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ADD importe_actuacion numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='es_ultima')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ADD es_ultima bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='id_modelo_z3')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ADD id_modelo_z3 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='dcto_salida_por_actuacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ADD dcto_salida_por_actuacion varchar(8)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='tipo_documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ADD tipo_documento varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ADD documento varchar(13)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='unidad_recaudacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ADD unidad_recaudacion varchar(4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='modelo_tipo_emision')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ADD modelo_tipo_emision varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='modelo_fecha_de_emision')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ADD modelo_fecha_de_emision date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='modelo_tipo_notificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ADD modelo_tipo_notificacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='modelo_fecha_de_notificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ADD modelo_fecha_de_notificacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='numero_orden_notificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ADD numero_orden_notificacion decimal(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='notificacion_tipo_emision')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ADD notificacion_tipo_emision varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='notificacion_fecha_de_emision')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ADD notificacion_fecha_de_emision date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='notificacion_tipo_notificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ADD notificacion_tipo_notificacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='notificacion_fecha_de_notificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ADD notificacion_fecha_de_notificacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='id_z3_notificaciones' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ALTER COLUMN id_z3_notificaciones int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='id_expediente_z3' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ALTER COLUMN id_expediente_z3 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='anyo_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ALTER COLUMN anyo_expediente numeric(4) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='num_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ALTER COLUMN num_expediente numeric(6) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ALTER COLUMN id_contribuyente int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='nif' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ALTER COLUMN nif varchar(11) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='id_tipo_actuacion_z3' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ALTER COLUMN id_tipo_actuacion_z3 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='fec_actuacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ALTER COLUMN fec_actuacion date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='id_tipo_actuacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ALTER COLUMN id_tipo_actuacion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='num_empleado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ALTER COLUMN num_empleado varchar(8) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='id_referencia_actuacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ALTER COLUMN id_referencia_actuacion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='importe_actuacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ALTER COLUMN importe_actuacion numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='es_ultima' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ALTER COLUMN es_ultima bit NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='id_modelo_z3' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ALTER COLUMN id_modelo_z3 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='dcto_salida_por_actuacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ALTER COLUMN dcto_salida_por_actuacion varchar(8) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='tipo_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ALTER COLUMN tipo_documento varchar(2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ALTER COLUMN documento varchar(13) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='unidad_recaudacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ALTER COLUMN unidad_recaudacion varchar(4) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='modelo_tipo_emision' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ALTER COLUMN modelo_tipo_emision varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='modelo_fecha_de_emision' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ALTER COLUMN modelo_fecha_de_emision date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='modelo_tipo_notificacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ALTER COLUMN modelo_tipo_notificacion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='modelo_fecha_de_notificacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ALTER COLUMN modelo_fecha_de_notificacion date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='numero_orden_notificacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ALTER COLUMN numero_orden_notificacion decimal(2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='notificacion_tipo_emision' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ALTER COLUMN notificacion_tipo_emision varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='notificacion_fecha_de_emision' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ALTER COLUMN notificacion_fecha_de_emision date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='notificacion_tipo_notificacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ALTER COLUMN notificacion_tipo_notificacion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='notificacion_fecha_de_notificacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ALTER COLUMN notificacion_fecha_de_notificacion date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND CONSTRAINT_NAME='PK_tbn1_z3_ds_notificaciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ADD CONSTRAINT PK_tbn1_z3_ds_notificaciones PRIMARY KEY CLUSTERED (id_z3_notificaciones)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND CONSTRAINT_NAME='FK_tbn1_z3_ds_notificaciones_tbn1_ot_z3_expedientes_embargo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ADD CONSTRAINT FK_tbn1_z3_ds_notificaciones_tbn1_ot_z3_expedientes_embargo FOREIGN KEY (id_expediente_z3) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_z3_expedientes_embargo(id_expediente_z3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND CONSTRAINT_NAME='FK_tbn1_z3_ds_notificaciones_tbn1_contribuyentes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ADD CONSTRAINT FK_tbn1_z3_ds_notificaciones_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND CONSTRAINT_NAME='FK_tbn1_z3_ds_notificaciones_tbn1_ot_z3_actuaciones_embargo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ADD CONSTRAINT FK_tbn1_z3_ds_notificaciones_tbn1_ot_z3_actuaciones_embargo FOREIGN KEY (id_tipo_actuacion_z3) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_z3_actuaciones_embargo(id_tipo_actuacion_z3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND CONSTRAINT_NAME='FK_tbn1_z3_ds_notificaciones_tbn1_ot_z3_tipos_actuacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ADD CONSTRAINT FK_tbn1_z3_ds_notificaciones_tbn1_ot_z3_tipos_actuacion FOREIGN KEY (id_tipo_actuacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_z3_tipos_actuacion(id_tipo_actuacion)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND CONSTRAINT_NAME='FK_tbn1_z3_ds_notificaciones_tbn1_ot_z3_referencias_actuaciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ADD CONSTRAINT FK_tbn1_z3_ds_notificaciones_tbn1_ot_z3_referencias_actuaciones FOREIGN KEY (id_referencia_actuacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_z3_referencias_actuaciones(id_referencia_actuacion)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_notificaciones' AND CONSTRAINT_NAME='FK_tbn1_z3_ds_notificaciones_tbn1_ot_z3_modelos_embargo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones ADD CONSTRAINT FK_tbn1_z3_ds_notificaciones_tbn1_ot_z3_modelos_embargo FOREIGN KEY (id_modelo_z3) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_z3_modelos_embargo(id_modelo_z3)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_z3_ds_notificaciones' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_z3_ds_notificaciones;
GO

CREATE PROCEDURE dbo.spn1_cargar_z3_ds_notificaciones(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_z3_ds_notificaciones'
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
  query AS (
    SELECT
      exp_z3.id_expediente_z3 AS id_expediente_z3,
      exp_z3.anyo_expediente AS anyo_expediente,
      exp_z3.num_expediente AS num_expediente,
      exp_z3.id_contribuyente AS id_contribuyente,
      exp_z3.nif AS nif,
      actu_z3.id_tipo_actuacion_z3 AS id_tipo_actuacion_z3,
      actu_z3.fec_actuacion AS fec_actuacion,
      actu_z3.id_tipo_actuacion AS id_tipo_actuacion,
      actu_z3.num_empleado AS num_empleado,
      actu_z3.id_referencia_actuacion AS id_referencia_actuacion,
      actu_z3.importe_actuacion AS importe_actuacion,
      actu_z3.es_ultima AS es_ultima,
      mod_z3.id_modelo_z3 AS id_modelo_z3,
      mod_z3.dcto_salida_por_actuacion AS dcto_salida_por_actuacion,
      mod_z3.tipo_documento AS tipo_documento,
      mod_z3.documento AS documento,
      mod_z3.unidad_recaudacion AS unidad_recaudacion,
      mod_z3.tipo_emision AS modelo_tipo_emision,
      CASE WHEN mod_z3.fecha_de_emision IS NULL THEN '0001-01-01' ELSE mod_z3.fecha_de_emision END AS modelo_fecha_de_emision,
      mod_z3.tipo_notificacion AS modelo_tipo_notificacion,
      CASE WHEN mod_z3.fecha_notificacion IS NULL THEN '0001-01-01' ELSE mod_z3.fecha_notificacion END AS modelo_fecha_de_notificacion,
      noti_z3.notnnoti AS numero_orden_notificacion,
      noti_z3.nottemis AS notificacion_tipo_emision,
      noti_z3.notfemis AS notificacion_fecha_de_emision,
      noti_z3.nottnoti AS notificacion_tipo_notificacion,
      noti_z3.notfnoti AS notificacion_fecha_de_notificacion
    FROM dbn1_stg_dhyf.dbo.tbn1noti_z3 noti_z3
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_ot_z3_expedientes_embargo exp_z3 ON (exp_z3.anyo_expediente=noti_z3.notejerc AND exp_z3.num_expediente=noti_z3.notnro)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_ot_z3_tipos_actuacion tact ON (tact.cod_tipo_actuacion=noti_z3.notactua)
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_ot_z3_actuaciones_embargo actu_z3 ON (actu_z3.id_expediente_z3=exp_z3.id_expediente_z3 AND actu_z3.fec_actuacion=noti_z3.notfecha AND actu_z3.id_tipo_actuacion=coalesce(tact.id_tipo_actuacion,indefinidos.id_tipo_actuacion))
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_ot_z3_modelos_embargo mod_z3 ON (mod_z3.id_expediente_z3=actu_z3.id_expediente_z3 AND mod_z3.id_tipo_actuacion_z3=actu_z3.id_tipo_actuacion_z3 AND mod_z3.dcto_salida_por_actuacion=noti_z3.notmodel AND mod_z3.tipo_documento=noti_z3.nottdcto AND mod_z3.documento=noti_z3.notdcto)
    WHERE
      actu_z3.fec_baja IS NULL
      AND mod_z3.fec_baja IS NULL
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_z3_ds_notificaciones AS tbn1_z3_ds_notificaciones
  USING query ON query.id_expediente_z3=tbn1_z3_ds_notificaciones.id_expediente_z3 AND query.id_tipo_actuacion_z3=tbn1_z3_ds_notificaciones.id_tipo_actuacion_z3 AND query.id_modelo_z3=tbn1_z3_ds_notificaciones.id_modelo_z3 AND query.numero_orden_notificacion=tbn1_z3_ds_notificaciones.numero_orden_notificacion
  WHEN MATCHED AND ((tbn1_z3_ds_notificaciones.anyo_expediente<>query.anyo_expediente OR (tbn1_z3_ds_notificaciones.anyo_expediente IS NULL AND query.anyo_expediente IS NOT NULL) OR  (tbn1_z3_ds_notificaciones.anyo_expediente IS NOT NULL AND query.anyo_expediente IS NULL)
                    OR tbn1_z3_ds_notificaciones.num_expediente<>query.num_expediente OR (tbn1_z3_ds_notificaciones.num_expediente IS NULL AND query.num_expediente IS NOT NULL) OR  (tbn1_z3_ds_notificaciones.num_expediente IS NOT NULL AND query.num_expediente IS NULL)
                    OR tbn1_z3_ds_notificaciones.id_contribuyente<>query.id_contribuyente OR (tbn1_z3_ds_notificaciones.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_z3_ds_notificaciones.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_z3_ds_notificaciones.nif<>query.nif OR (tbn1_z3_ds_notificaciones.nif IS NULL AND query.nif IS NOT NULL) OR  (tbn1_z3_ds_notificaciones.nif IS NOT NULL AND query.nif IS NULL)
                    OR tbn1_z3_ds_notificaciones.fec_actuacion<>query.fec_actuacion OR (tbn1_z3_ds_notificaciones.fec_actuacion IS NULL AND query.fec_actuacion IS NOT NULL) OR  (tbn1_z3_ds_notificaciones.fec_actuacion IS NOT NULL AND query.fec_actuacion IS NULL)
                    OR tbn1_z3_ds_notificaciones.id_tipo_actuacion<>query.id_tipo_actuacion OR (tbn1_z3_ds_notificaciones.id_tipo_actuacion IS NULL AND query.id_tipo_actuacion IS NOT NULL) OR  (tbn1_z3_ds_notificaciones.id_tipo_actuacion IS NOT NULL AND query.id_tipo_actuacion IS NULL)
                    OR tbn1_z3_ds_notificaciones.num_empleado<>query.num_empleado OR (tbn1_z3_ds_notificaciones.num_empleado IS NULL AND query.num_empleado IS NOT NULL) OR  (tbn1_z3_ds_notificaciones.num_empleado IS NOT NULL AND query.num_empleado IS NULL)
                    OR tbn1_z3_ds_notificaciones.id_referencia_actuacion<>query.id_referencia_actuacion OR (tbn1_z3_ds_notificaciones.id_referencia_actuacion IS NULL AND query.id_referencia_actuacion IS NOT NULL) OR  (tbn1_z3_ds_notificaciones.id_referencia_actuacion IS NOT NULL AND query.id_referencia_actuacion IS NULL)
                    OR tbn1_z3_ds_notificaciones.importe_actuacion<>query.importe_actuacion OR (tbn1_z3_ds_notificaciones.importe_actuacion IS NULL AND query.importe_actuacion IS NOT NULL) OR  (tbn1_z3_ds_notificaciones.importe_actuacion IS NOT NULL AND query.importe_actuacion IS NULL)
                    OR tbn1_z3_ds_notificaciones.es_ultima<>query.es_ultima OR (tbn1_z3_ds_notificaciones.es_ultima IS NULL AND query.es_ultima IS NOT NULL) OR  (tbn1_z3_ds_notificaciones.es_ultima IS NOT NULL AND query.es_ultima IS NULL)
                    OR tbn1_z3_ds_notificaciones.dcto_salida_por_actuacion<>query.dcto_salida_por_actuacion OR (tbn1_z3_ds_notificaciones.dcto_salida_por_actuacion IS NULL AND query.dcto_salida_por_actuacion IS NOT NULL) OR  (tbn1_z3_ds_notificaciones.dcto_salida_por_actuacion IS NOT NULL AND query.dcto_salida_por_actuacion IS NULL)
                    OR tbn1_z3_ds_notificaciones.tipo_documento<>query.tipo_documento OR (tbn1_z3_ds_notificaciones.tipo_documento IS NULL AND query.tipo_documento IS NOT NULL) OR  (tbn1_z3_ds_notificaciones.tipo_documento IS NOT NULL AND query.tipo_documento IS NULL)
                    OR tbn1_z3_ds_notificaciones.documento<>query.documento OR (tbn1_z3_ds_notificaciones.documento IS NULL AND query.documento IS NOT NULL) OR  (tbn1_z3_ds_notificaciones.documento IS NOT NULL AND query.documento IS NULL)
                    OR tbn1_z3_ds_notificaciones.unidad_recaudacion<>query.unidad_recaudacion OR (tbn1_z3_ds_notificaciones.unidad_recaudacion IS NULL AND query.unidad_recaudacion IS NOT NULL) OR  (tbn1_z3_ds_notificaciones.unidad_recaudacion IS NOT NULL AND query.unidad_recaudacion IS NULL)
                    OR tbn1_z3_ds_notificaciones.modelo_tipo_emision<>query.modelo_tipo_emision OR (tbn1_z3_ds_notificaciones.modelo_tipo_emision IS NULL AND query.modelo_tipo_emision IS NOT NULL) OR  (tbn1_z3_ds_notificaciones.modelo_tipo_emision IS NOT NULL AND query.modelo_tipo_emision IS NULL)
                    OR tbn1_z3_ds_notificaciones.modelo_fecha_de_emision<>query.modelo_fecha_de_emision OR (tbn1_z3_ds_notificaciones.modelo_fecha_de_emision IS NULL AND query.modelo_fecha_de_emision IS NOT NULL) OR  (tbn1_z3_ds_notificaciones.modelo_fecha_de_emision IS NOT NULL AND query.modelo_fecha_de_emision IS NULL)
                    OR tbn1_z3_ds_notificaciones.modelo_tipo_notificacion<>query.modelo_tipo_notificacion OR (tbn1_z3_ds_notificaciones.modelo_tipo_notificacion IS NULL AND query.modelo_tipo_notificacion IS NOT NULL) OR  (tbn1_z3_ds_notificaciones.modelo_tipo_notificacion IS NOT NULL AND query.modelo_tipo_notificacion IS NULL)
                    OR tbn1_z3_ds_notificaciones.modelo_fecha_de_notificacion<>query.modelo_fecha_de_notificacion OR (tbn1_z3_ds_notificaciones.modelo_fecha_de_notificacion IS NULL AND query.modelo_fecha_de_notificacion IS NOT NULL) OR  (tbn1_z3_ds_notificaciones.modelo_fecha_de_notificacion IS NOT NULL AND query.modelo_fecha_de_notificacion IS NULL)
                    OR tbn1_z3_ds_notificaciones.notificacion_tipo_emision<>query.notificacion_tipo_emision OR (tbn1_z3_ds_notificaciones.notificacion_tipo_emision IS NULL AND query.notificacion_tipo_emision IS NOT NULL) OR  (tbn1_z3_ds_notificaciones.notificacion_tipo_emision IS NOT NULL AND query.notificacion_tipo_emision IS NULL)
                    OR tbn1_z3_ds_notificaciones.notificacion_fecha_de_emision<>query.notificacion_fecha_de_emision OR (tbn1_z3_ds_notificaciones.notificacion_fecha_de_emision IS NULL AND query.notificacion_fecha_de_emision IS NOT NULL) OR  (tbn1_z3_ds_notificaciones.notificacion_fecha_de_emision IS NOT NULL AND query.notificacion_fecha_de_emision IS NULL)
                    OR tbn1_z3_ds_notificaciones.notificacion_tipo_notificacion<>query.notificacion_tipo_notificacion OR (tbn1_z3_ds_notificaciones.notificacion_tipo_notificacion IS NULL AND query.notificacion_tipo_notificacion IS NOT NULL) OR  (tbn1_z3_ds_notificaciones.notificacion_tipo_notificacion IS NOT NULL AND query.notificacion_tipo_notificacion IS NULL)
                    OR tbn1_z3_ds_notificaciones.notificacion_fecha_de_notificacion<>query.notificacion_fecha_de_notificacion OR (tbn1_z3_ds_notificaciones.notificacion_fecha_de_notificacion IS NULL AND query.notificacion_fecha_de_notificacion IS NOT NULL) OR  (tbn1_z3_ds_notificaciones.notificacion_fecha_de_notificacion IS NOT NULL AND query.notificacion_fecha_de_notificacion IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      anyo_expediente=query.anyo_expediente,
      num_expediente=query.num_expediente,
      id_contribuyente=query.id_contribuyente,
      nif=query.nif,
      fec_actuacion=query.fec_actuacion,
      id_tipo_actuacion=query.id_tipo_actuacion,
      num_empleado=query.num_empleado,
      id_referencia_actuacion=query.id_referencia_actuacion,
      importe_actuacion=query.importe_actuacion,
      es_ultima=query.es_ultima,
      dcto_salida_por_actuacion=query.dcto_salida_por_actuacion,
      tipo_documento=query.tipo_documento,
      documento=query.documento,
      unidad_recaudacion=query.unidad_recaudacion,
      modelo_tipo_emision=query.modelo_tipo_emision,
      modelo_fecha_de_emision=query.modelo_fecha_de_emision,
      modelo_tipo_notificacion=query.modelo_tipo_notificacion,
      modelo_fecha_de_notificacion=query.modelo_fecha_de_notificacion,
      notificacion_tipo_emision=query.notificacion_tipo_emision,
      notificacion_fecha_de_emision=query.notificacion_fecha_de_emision,
      notificacion_tipo_notificacion=query.notificacion_tipo_notificacion,
      notificacion_fecha_de_notificacion=query.notificacion_fecha_de_notificacion,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (id_expediente_z3,anyo_expediente,num_expediente,id_contribuyente,nif,id_tipo_actuacion_z3,fec_actuacion,id_tipo_actuacion,num_empleado,id_referencia_actuacion,importe_actuacion,es_ultima,id_modelo_z3,dcto_salida_por_actuacion,tipo_documento,documento,unidad_recaudacion,modelo_tipo_emision,modelo_fecha_de_emision,modelo_tipo_notificacion,modelo_fecha_de_notificacion,numero_orden_notificacion,notificacion_tipo_emision,notificacion_fecha_de_emision,notificacion_tipo_notificacion,notificacion_fecha_de_notificacion,fec_alta,fec_modificacion) VALUES (
      query.id_expediente_z3,
      query.anyo_expediente,
      query.num_expediente,
      query.id_contribuyente,
      query.nif,
      query.id_tipo_actuacion_z3,
      query.fec_actuacion,
      query.id_tipo_actuacion,
      query.num_empleado,
      query.id_referencia_actuacion,
      query.importe_actuacion,
      query.es_ultima,
      query.id_modelo_z3,
      query.dcto_salida_por_actuacion,
      query.tipo_documento,
      query.documento,
      query.unidad_recaudacion,
      query.modelo_tipo_emision,
      query.modelo_fecha_de_emision,
      query.modelo_tipo_notificacion,
      query.modelo_fecha_de_notificacion,
      query.numero_orden_notificacion,
      query.notificacion_tipo_emision,
      query.notificacion_fecha_de_emision,
      query.notificacion_tipo_notificacion,
      query.notificacion_fecha_de_notificacion,
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

