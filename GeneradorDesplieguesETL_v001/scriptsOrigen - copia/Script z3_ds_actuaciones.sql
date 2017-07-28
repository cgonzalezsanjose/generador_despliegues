PRINT 'z3_ds_actuaciones.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones(
  id_z3_actuaciones int IDENTITY(1,1),
  id_expediente_z3 int NOT NULL,
  anyo_expediente numeric(4) NOT NULL,
  num_expediente numeric(6) NOT NULL,
  id_contribuyente int NOT NULL,
  nif varchar(11) NOT NULL,
  id_tipo_actuacion_z3 int NOT NULL,
  fec_actuacion date NOT NULL,
  id_tipo_actuacion int NOT NULL,
  num_empleado varchar(8) NOT NULL,
  oficina_recaudacion varchar(4) NOT NULL,
  control_salida varchar(2) NOT NULL,
  motivo_levantamiento varchar(1) NOT NULL,
  id_tipo_actuacion_anterior int NOT NULL,
  fec_actuacion_anterior date NOT NULL,
  id_referencia_actuacion int NOT NULL,
  situacion varchar(2) NOT NULL,
  id_organismo_anotacion_preventiva int NOT NULL,
  id_tipo_unidad_familiar int NOT NULL,
  es_actuacion_reconstruida bit NOT NULL,
  auto_judicial varchar(12) NOT NULL,
  expediente_relacionado varchar(10) NOT NULL,
  id_tipo_actuacion_relacionada int NOT NULL,
  fec_actuacion_relacionada date NOT NULL,
  act_definitiva_pasada_Z3 bit NOT NULL,
  id_tipo_actuacion_subasta int NOT NULL,
  fec_actuacion_subasta date NOT NULL,
  clase_embargo varchar(2) NOT NULL,
  sentencia_judicial varchar(30) NOT NULL,
  importe numeric(18,2),
  importe_actuacion numeric(18,2),
  fec_visto_bueno date NOT NULL,
  es_ultima bit NOT NULL,
  fecha_embargo date NOT NULL,
  fecha_anotacion date NOT NULL,
  fecha_prorroga date NOT NULL,
  fecha_rectificacion_negativa date NOT NULL,
  fecha_cancelacion date NOT NULL,
  fecha_prevista_prorroga date NOT NULL,
  saldo_actual_gastos decimal(18,2),
  tipo_documento varchar(2) NOT NULL,
  documento varchar(13) NOT NULL,
  a_favor_de varchar(1) NOT NULL,
  importe_embargable decimal(18,2),
  id_deuda int NOT NULL,
  importe_contraido decimal(18,2),
  importe_principal decimal(18,2),
  importe_demora decimal(18,2),
  importe_recargo decimal(18,2),
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_z3_ds_actuaciones UNIQUE (id_expediente_z3,id_tipo_actuacion_z3,tipo_documento,documento,id_deuda),
  CONSTRAINT PK_tbn1_z3_ds_actuaciones PRIMARY KEY CLUSTERED (id_z3_actuaciones),
  CONSTRAINT FK_tbn1_z3_ds_actuaciones_tbn1_ot_z3_expedientes_embargo FOREIGN KEY (id_expediente_z3) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_z3_expedientes_embargo(id_expediente_z3),
  CONSTRAINT FK_tbn1_z3_ds_actuaciones_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
  CONSTRAINT FK_tbn1_z3_ds_actuaciones_tbn1_ot_z3_actuaciones_embargo FOREIGN KEY (id_tipo_actuacion_z3) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_z3_actuaciones_embargo(id_tipo_actuacion_z3),
  CONSTRAINT FK_tbn1_z3_ds_actuaciones_tbn1_ot_z3_tipos_actuacion FOREIGN KEY (id_tipo_actuacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_z3_tipos_actuacion(id_tipo_actuacion),
  CONSTRAINT FK_tbn1_z3_ds_actuaciones_tbn1_ot_z3_tipos_actuacion1 FOREIGN KEY (id_tipo_actuacion_anterior) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_z3_tipos_actuacion(id_tipo_actuacion),
  CONSTRAINT FK_tbn1_z3_ds_actuaciones_tbn1_ot_z3_referencias_actuaciones FOREIGN KEY (id_referencia_actuacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_z3_referencias_actuaciones(id_referencia_actuacion),
  CONSTRAINT FK_tbn1_z3_ds_actuaciones_tbn1_ot_z3_organismos_anotacion_preventiva FOREIGN KEY (id_organismo_anotacion_preventiva) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_z3_organismos_anotacion_preventiva(id_organismo_anotacion_preventiva),
  CONSTRAINT FK_tbn1_z3_ds_actuaciones_tbn1_ot_z3_tipos_unidad_familiar FOREIGN KEY (id_tipo_unidad_familiar) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_z3_tipos_unidad_familiar(id_tipo_unidad_familiar),
  CONSTRAINT FK_tbn1_z3_ds_actuaciones_tbn1_ot_z3_tipos_actuacion2 FOREIGN KEY (id_tipo_actuacion_relacionada) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_z3_tipos_actuacion(id_tipo_actuacion),
  CONSTRAINT FK_tbn1_z3_ds_actuaciones_tbn1_ot_z3_tipos_actuacion3 FOREIGN KEY (id_tipo_actuacion_subasta) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_z3_tipos_actuacion(id_tipo_actuacion)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='id_z3_actuaciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD id_z3_actuaciones int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='id_expediente_z3')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD id_expediente_z3 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='anyo_expediente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD anyo_expediente numeric(4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='num_expediente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD num_expediente numeric(6)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='nif')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD nif varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='id_tipo_actuacion_z3')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD id_tipo_actuacion_z3 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='fec_actuacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD fec_actuacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='id_tipo_actuacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD id_tipo_actuacion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='num_empleado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD num_empleado varchar(8)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='oficina_recaudacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD oficina_recaudacion varchar(4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='control_salida')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD control_salida varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='motivo_levantamiento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD motivo_levantamiento varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='id_tipo_actuacion_anterior')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD id_tipo_actuacion_anterior int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='fec_actuacion_anterior')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD fec_actuacion_anterior date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='id_referencia_actuacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD id_referencia_actuacion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='situacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD situacion varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='id_organismo_anotacion_preventiva')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD id_organismo_anotacion_preventiva int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='id_tipo_unidad_familiar')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD id_tipo_unidad_familiar int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='es_actuacion_reconstruida')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD es_actuacion_reconstruida bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='auto_judicial')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD auto_judicial varchar(12)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='expediente_relacionado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD expediente_relacionado varchar(10)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='id_tipo_actuacion_relacionada')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD id_tipo_actuacion_relacionada int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='fec_actuacion_relacionada')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD fec_actuacion_relacionada date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='act_definitiva_pasada_Z3')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD act_definitiva_pasada_Z3 bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='id_tipo_actuacion_subasta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD id_tipo_actuacion_subasta int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='fec_actuacion_subasta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD fec_actuacion_subasta date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='clase_embargo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD clase_embargo varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='sentencia_judicial')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD sentencia_judicial varchar(30)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='importe')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD importe numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='importe_actuacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD importe_actuacion numeric(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='fec_visto_bueno')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD fec_visto_bueno date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='es_ultima')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD es_ultima bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='fecha_embargo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD fecha_embargo date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='fecha_anotacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD fecha_anotacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='fecha_prorroga')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD fecha_prorroga date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='fecha_rectificacion_negativa')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD fecha_rectificacion_negativa date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='fecha_cancelacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD fecha_cancelacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='fecha_prevista_prorroga')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD fecha_prevista_prorroga date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='saldo_actual_gastos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD saldo_actual_gastos decimal(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='tipo_documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD tipo_documento varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='documento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD documento varchar(13)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='a_favor_de')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD a_favor_de varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='importe_embargable')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD importe_embargable decimal(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='id_deuda')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD id_deuda int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='importe_contraido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD importe_contraido decimal(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='importe_principal')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD importe_principal decimal(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='importe_demora')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD importe_demora decimal(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='importe_recargo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD importe_recargo decimal(18,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='id_z3_actuaciones' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN id_z3_actuaciones int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='id_expediente_z3' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN id_expediente_z3 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='anyo_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN anyo_expediente numeric(4) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='num_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN num_expediente numeric(6) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN id_contribuyente int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='nif' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN nif varchar(11) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='id_tipo_actuacion_z3' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN id_tipo_actuacion_z3 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='fec_actuacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN fec_actuacion date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='id_tipo_actuacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN id_tipo_actuacion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='num_empleado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN num_empleado varchar(8) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='oficina_recaudacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN oficina_recaudacion varchar(4) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='control_salida' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN control_salida varchar(2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='motivo_levantamiento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN motivo_levantamiento varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='id_tipo_actuacion_anterior' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN id_tipo_actuacion_anterior int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='fec_actuacion_anterior' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN fec_actuacion_anterior date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='id_referencia_actuacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN id_referencia_actuacion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='situacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN situacion varchar(2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='id_organismo_anotacion_preventiva' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN id_organismo_anotacion_preventiva int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='id_tipo_unidad_familiar' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN id_tipo_unidad_familiar int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='es_actuacion_reconstruida' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN es_actuacion_reconstruida bit NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='auto_judicial' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN auto_judicial varchar(12) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='expediente_relacionado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN expediente_relacionado varchar(10) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='id_tipo_actuacion_relacionada' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN id_tipo_actuacion_relacionada int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='fec_actuacion_relacionada' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN fec_actuacion_relacionada date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='act_definitiva_pasada_Z3' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN act_definitiva_pasada_Z3 bit NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='id_tipo_actuacion_subasta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN id_tipo_actuacion_subasta int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='fec_actuacion_subasta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN fec_actuacion_subasta date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='clase_embargo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN clase_embargo varchar(2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='sentencia_judicial' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN sentencia_judicial varchar(30) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='importe' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN importe numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='importe_actuacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN importe_actuacion numeric(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='fec_visto_bueno' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN fec_visto_bueno date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='es_ultima' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN es_ultima bit NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='fecha_embargo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN fecha_embargo date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='fecha_anotacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN fecha_anotacion date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='fecha_prorroga' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN fecha_prorroga date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='fecha_rectificacion_negativa' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN fecha_rectificacion_negativa date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='fecha_cancelacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN fecha_cancelacion date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='fecha_prevista_prorroga' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN fecha_prevista_prorroga date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='saldo_actual_gastos' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN saldo_actual_gastos decimal(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='tipo_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN tipo_documento varchar(2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN documento varchar(13) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='a_favor_de' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN a_favor_de varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='importe_embargable' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN importe_embargable decimal(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='id_deuda' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN id_deuda int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='importe_contraido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN importe_contraido decimal(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='importe_principal' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN importe_principal decimal(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='importe_demora' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN importe_demora decimal(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='importe_recargo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN importe_recargo decimal(18,2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND CONSTRAINT_NAME='PK_tbn1_z3_ds_actuaciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD CONSTRAINT PK_tbn1_z3_ds_actuaciones PRIMARY KEY CLUSTERED (id_z3_actuaciones)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND CONSTRAINT_NAME='FK_tbn1_z3_ds_actuaciones_tbn1_ot_z3_expedientes_embargo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD CONSTRAINT FK_tbn1_z3_ds_actuaciones_tbn1_ot_z3_expedientes_embargo FOREIGN KEY (id_expediente_z3) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_z3_expedientes_embargo(id_expediente_z3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND CONSTRAINT_NAME='FK_tbn1_z3_ds_actuaciones_tbn1_contribuyentes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD CONSTRAINT FK_tbn1_z3_ds_actuaciones_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND CONSTRAINT_NAME='FK_tbn1_z3_ds_actuaciones_tbn1_ot_z3_actuaciones_embargo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD CONSTRAINT FK_tbn1_z3_ds_actuaciones_tbn1_ot_z3_actuaciones_embargo FOREIGN KEY (id_tipo_actuacion_z3) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_z3_actuaciones_embargo(id_tipo_actuacion_z3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND CONSTRAINT_NAME='FK_tbn1_z3_ds_actuaciones_tbn1_ot_z3_tipos_actuacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD CONSTRAINT FK_tbn1_z3_ds_actuaciones_tbn1_ot_z3_tipos_actuacion FOREIGN KEY (id_tipo_actuacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_z3_tipos_actuacion(id_tipo_actuacion)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND CONSTRAINT_NAME='FK_tbn1_z3_ds_actuaciones_tbn1_ot_z3_tipos_actuacion1')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD CONSTRAINT FK_tbn1_z3_ds_actuaciones_tbn1_ot_z3_tipos_actuacion1 FOREIGN KEY (id_tipo_actuacion_anterior) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_z3_tipos_actuacion(id_tipo_actuacion)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND CONSTRAINT_NAME='FK_tbn1_z3_ds_actuaciones_tbn1_ot_z3_referencias_actuaciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD CONSTRAINT FK_tbn1_z3_ds_actuaciones_tbn1_ot_z3_referencias_actuaciones FOREIGN KEY (id_referencia_actuacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_z3_referencias_actuaciones(id_referencia_actuacion)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND CONSTRAINT_NAME='FK_tbn1_z3_ds_actuaciones_tbn1_ot_z3_organismos_anotacion_preventiva')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD CONSTRAINT FK_tbn1_z3_ds_actuaciones_tbn1_ot_z3_organismos_anotacion_preventiva FOREIGN KEY (id_organismo_anotacion_preventiva) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_z3_organismos_anotacion_preventiva(id_organismo_anotacion_preventiva)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND CONSTRAINT_NAME='FK_tbn1_z3_ds_actuaciones_tbn1_ot_z3_tipos_unidad_familiar')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD CONSTRAINT FK_tbn1_z3_ds_actuaciones_tbn1_ot_z3_tipos_unidad_familiar FOREIGN KEY (id_tipo_unidad_familiar) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_z3_tipos_unidad_familiar(id_tipo_unidad_familiar)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND CONSTRAINT_NAME='FK_tbn1_z3_ds_actuaciones_tbn1_ot_z3_tipos_actuacion2')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD CONSTRAINT FK_tbn1_z3_ds_actuaciones_tbn1_ot_z3_tipos_actuacion2 FOREIGN KEY (id_tipo_actuacion_relacionada) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_z3_tipos_actuacion(id_tipo_actuacion)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND CONSTRAINT_NAME='FK_tbn1_z3_ds_actuaciones_tbn1_ot_z3_tipos_actuacion3')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD CONSTRAINT FK_tbn1_z3_ds_actuaciones_tbn1_ot_z3_tipos_actuacion3 FOREIGN KEY (id_tipo_actuacion_subasta) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ot_z3_tipos_actuacion(id_tipo_actuacion)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND CONSTRAINT_NAME='uk_z3_ds_actuaciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ADD CONSTRAINT uk_z3_ds_actuaciones UNIQUE (id_expediente_z3,id_tipo_actuacion_z3,tipo_documento,documento,id_deuda)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_z3_ds_actuaciones' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_z3_ds_actuaciones;
GO

CREATE PROCEDURE dbo.spn1_cargar_z3_ds_actuaciones(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_z3_ds_actuaciones'
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

  -- Materialized query: actuaciones
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
    actu_z3.oficina_recaudacion AS oficina_recaudacion,
    actu_z3.control_salida AS control_salida,
    actu_z3.motivo_levantamiento AS motivo_levantamiento,
    actu_z3.id_tipo_actuacion_anterior AS id_tipo_actuacion_anterior,
    actu_z3.fec_actuacion_anterior AS fec_actuacion_anterior,
    actu_z3.id_referencia_actuacion AS id_referencia_actuacion,
    actu_z3.situacion AS situacion,
    actu_z3.id_organismo_anotacion_preventiva AS id_organismo_anotacion_preventiva,
    actu_z3.id_tipo_unidad_familiar AS id_tipo_unidad_familiar,
    actu_z3.es_actuacion_reconstruida AS es_actuacion_reconstruida,
    actu_z3.auto_judicial AS auto_judicial,
    actu_z3.expediente_relacionado AS expediente_relacionado,
    actu_z3.id_tipo_actuacion_relacionada AS id_tipo_actuacion_relacionada,
    actu_z3.fec_actu_relacionada AS fec_actu_relacionada,
    actu_z3.act_definitiva_pasada_Z3 AS act_definitiva_pasada_Z3,
    actu_z3.id_tipo_actuacion_subasta AS id_tipo_actuacion_subasta,
    actu_z3.fec_actuacion_subasta AS fec_actuacion_subasta,
    actu_z3.clase_embargo AS clase_embargo,
    actu_z3.sentencia_judicial AS sentencia_judicial,
    actu_z3.importe AS importe,
    actu_z3.importe_actuacion AS importe_actuacion,
    actu_z3.fec_visto_bueno AS fec_visto_bueno,
    actu_z3.es_ultima AS es_ultima
  INTO #actuaciones__B8E5E
  FROM dbn1_norm_dhyf.dbo.tbn1_ot_z3_actuaciones_embargo actu_z3
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_ot_z3_expedientes_embargo exp_z3 ON (exp_z3.id_expediente_z3=actu_z3.id_expediente_z3)
  WHERE actu_z3.fec_baja IS NULL
  
  
  
  CREATE UNIQUE INDEX unique_index_tmp_actuaciones__B8E5E ON #actuaciones__B8E5E (id_expediente_z3,id_tipo_actuacion_z3)
  
  -- Materialized query: gastos
  SELECT
    exp_z3.id_expediente_z3 AS id_expediente_z3,
    actu_z3.id_tipo_actuacion_z3 AS id_tipo_actuacion_z3,
    gtos.gtofemb AS fecha_embargo,
    gtos.gtofanot AS fecha_anotacion,
    gtos.gtofpro AS fecha_prorroga,
    gtos.gtofren AS fecha_rectificacion_negativa,
    gtos.gtofcan AS fecha_cancelacion,
	gtos.gtoprecad AS fecha_prevista_prorroga,
    gtos.gtosaldoa/100 AS saldo_actual_gastos
  INTO #gastos__ECE5D
  FROM dbn1_stg_dhyf.dbo.tbn1gtos_z3 gtos
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_ot_z3_expedientes_embargo exp_z3 ON (exp_z3.anyo_expediente=gtos.gtoejerc AND exp_z3.num_expediente=gtos.gtonro)
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_ot_z3_tipos_actuacion tact ON (tact.cod_tipo_actuacion=gtos.gtoactua)
  CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_ot_z3_actuaciones_embargo actu_z3 ON (actu_z3.id_expediente_z3=exp_z3.id_expediente_z3 AND actu_z3.fec_actuacion=gtos.gtofecha AND actu_z3.id_tipo_actuacion=coalesce(tact.id_tipo_actuacion,indefinidos.id_tipo_actuacion))
  WHERE actu_z3.fec_baja IS NULL
  
  
  
  CREATE UNIQUE INDEX unique_index_tmp_gastos__ECE5D ON #gastos__ECE5D (id_expediente_z3,id_tipo_actuacion_z3)
  
  -- Materialized query: valores
  SELECT
    exp_z3.id_expediente_z3 AS id_expediente_z3,
    actu_z3.id_tipo_actuacion_z3 AS id_tipo_actuacion_z3,
    valores.valtdcto AS tipo_documento,
    valores.valdcto AS documento,
    valores.valfavor AS a_favor_de,
    valores.valimpor/100 AS importe_embargable
  INTO #valores__55C57
  FROM dbn1_stg_dhyf.dbo.tbn1valo_z3 valores
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_ot_z3_expedientes_embargo exp_z3 ON (exp_z3.anyo_expediente=valores.valejerc AND exp_z3.num_expediente=valores.valnro)
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_ot_z3_tipos_actuacion tact ON (tact.cod_tipo_actuacion=valores.valactua)
  CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_ot_z3_actuaciones_embargo actu_z3 ON (actu_z3.id_expediente_z3=exp_z3.id_expediente_z3 AND actu_z3.fec_actuacion=valores.valfecha AND actu_z3.id_tipo_actuacion=coalesce(tact.id_tipo_actuacion,indefinidos.id_tipo_actuacion))
  WHERE actu_z3.fec_baja IS NULL
  
  
  
  CREATE UNIQUE INDEX unique_index_tmp_valores__55C57 ON #valores__55C57 (id_expediente_z3,id_tipo_actuacion_z3,tipo_documento,documento)
  
  -- Materialized query: dtos_actu
  SELECT
    exp_z3.id_expediente_z3 AS id_expediente_z3,
    actu_z3.id_tipo_actuacion_z3 AS id_tipo_actuacion_z3,
	deudas.id_deuda AS id_deuda,
	deudas.importe_contraido AS importe_contraido,
	dtos_actu.dtosimppr/100 AS importe_principal,
	dtos_actu.dtosimpid/100 AS importe_demora,
	dtos_actu.dtosimpre/100 AS importe_recargo
  INTO #dtos_actu__55C58
  FROM dbn1_stg_dhyf.dbo.tbn1dtos_z3 dtos_actu
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_ot_deudas deudas ON (deudas.num_liquidacion=dtos_actu.dtosndto)
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_ot_z3_expedientes_embargo exp_z3 ON (exp_z3.anyo_expediente=cast(substring(dtos_actu.dtosexpe,1,4) as decimal(4,0)) AND exp_z3.num_expediente=cast(substring(dtos_actu.dtosexpe,5,len(dtos_actu.dtosexpe)) as decimal(6,0)))
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_ot_z3_tipos_actuacion tact ON (tact.cod_tipo_actuacion=dtos_actu.dtosactu)
  CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
  INNER JOIN dbn1_norm_dhyf.dbo.tbn1_ot_z3_actuaciones_embargo actu_z3 ON (actu_z3.id_expediente_z3=exp_z3.id_expediente_z3 AND actu_z3.fec_actuacion=dtos_actu.dtosfact AND actu_z3.id_tipo_actuacion=coalesce(tact.id_tipo_actuacion,indefinidos.id_tipo_actuacion))
  WHERE
	actu_z3.fec_baja IS NULL
	AND deudas.fec_baja IS NULL
  
  
  
  CREATE UNIQUE INDEX unique_index_tmp_dtos_actu__55C58 ON #dtos_actu__55C58 (id_expediente_z3,id_tipo_actuacion_z3,id_deuda)
  
  ;WITH
  query AS (
    SELECT
      id_expediente_z3,
      anyo_expediente,
      num_expediente,
      id_contribuyente,
      nif,
      id_tipo_actuacion_z3,
      fec_actuacion,
      id_tipo_actuacion,
      num_empleado,
      oficina_recaudacion,
      control_salida,
      motivo_levantamiento,
      id_tipo_actuacion_anterior,
      coalesce(fec_actuacion_anterior,'0001-01-01') AS fec_actuacion_anterior,
      id_referencia_actuacion,
      situacion,
      id_organismo_anotacion_preventiva,
      id_tipo_unidad_familiar,
      es_actuacion_reconstruida,
      auto_judicial,
      expediente_relacionado,
      id_tipo_actuacion_relacionada,
      coalesce(fec_actu_relacionada,'0001-01-01') AS fec_actuacion_relacionada,
      act_definitiva_pasada_Z3,
      id_tipo_actuacion_subasta,
      coalesce(fec_actuacion_subasta,'0001-01-01') AS fec_actuacion_subasta,
      clase_embargo,
      sentencia_judicial,
      CASE
          WHEN row_number() OVER (PARTITION BY id_expediente_z3,id_tipo_actuacion_z3 ORDER BY tipo_documento,documento,id_deuda)=1 THEN importe
          ELSE 0
      END AS importe,
      CASE
          WHEN row_number() OVER (PARTITION BY id_expediente_z3,id_tipo_actuacion_z3 ORDER BY tipo_documento,documento,id_deuda)=1 THEN importe_actuacion
          ELSE 0
      END AS importe_actuacion,
      coalesce(fec_visto_bueno,'0001-01-01') AS fec_visto_bueno,
      es_ultima,
      coalesce(fecha_embargo,'0001-01-01') AS fecha_embargo,
      coalesce(fecha_anotacion,'0001-01-01') AS fecha_anotacion,
      coalesce(fecha_prorroga,'0001-01-01') AS fecha_prorroga,
      coalesce(fecha_rectificacion_negativa,'0001-01-01') AS fecha_rectificacion_negativa,
      coalesce(fecha_cancelacion,'0001-01-01') AS fecha_cancelacion,
	  coalesce(fecha_prevista_prorroga,'0001-01-01') AS fecha_prevista_prorroga,
      CASE
          WHEN row_number() OVER (PARTITION BY id_expediente_z3,id_tipo_actuacion_z3 ORDER BY tipo_documento,documento,id_deuda)=1 THEN saldo_actual_gastos
          ELSE 0
      END AS saldo_actual_gastos,
	  coalesce(tipo_documento,'') AS tipo_documento,
	  coalesce(documento,'') AS documento,
	  coalesce(a_favor_de,'') AS a_favor_de,
	  CASE
          WHEN row_number() OVER (PARTITION BY id_expediente_z3,id_tipo_actuacion_z3,tipo_documento,documento ORDER BY id_deuda)=1 THEN importe_embargable
          ELSE 0
      END AS importe_embargable,
	  coalesce(id_deuda,-1) AS id_deuda,
	  importe_contraido,
	  importe_principal,
	  importe_demora,
	  importe_recargo
	FROM
      (SELECT
         coalesce(actuaciones.id_expediente_z3,gastos.id_expediente_z3,valores.id_expediente_z3,dtos_actu.id_expediente_z3) id_expediente_z3,
         coalesce(actuaciones.id_tipo_actuacion_z3,gastos.id_tipo_actuacion_z3,valores.id_tipo_actuacion_z3,dtos_actu.id_tipo_actuacion_z3) id_tipo_actuacion_z3,
         actuaciones.anyo_expediente anyo_expediente,
         actuaciones.num_expediente num_expediente,
         actuaciones.id_contribuyente id_contribuyente,
         actuaciones.nif nif,
         actuaciones.fec_actuacion fec_actuacion,
         actuaciones.id_tipo_actuacion id_tipo_actuacion,
         actuaciones.num_empleado num_empleado,
         actuaciones.oficina_recaudacion oficina_recaudacion,
         actuaciones.control_salida control_salida,
         actuaciones.motivo_levantamiento motivo_levantamiento,
         actuaciones.id_tipo_actuacion_anterior id_tipo_actuacion_anterior,
         actuaciones.fec_actuacion_anterior fec_actuacion_anterior,
         actuaciones.id_referencia_actuacion id_referencia_actuacion,
         actuaciones.situacion situacion,
         actuaciones.id_organismo_anotacion_preventiva id_organismo_anotacion_preventiva,
         actuaciones.id_tipo_unidad_familiar id_tipo_unidad_familiar,
         actuaciones.es_actuacion_reconstruida es_actuacion_reconstruida,
         actuaciones.auto_judicial auto_judicial,
         actuaciones.expediente_relacionado expediente_relacionado,
         actuaciones.id_tipo_actuacion_relacionada id_tipo_actuacion_relacionada,
         actuaciones.fec_actu_relacionada fec_actu_relacionada,
         actuaciones.act_definitiva_pasada_Z3 act_definitiva_pasada_Z3,
         actuaciones.id_tipo_actuacion_subasta id_tipo_actuacion_subasta,
         actuaciones.fec_actuacion_subasta fec_actuacion_subasta,
         actuaciones.clase_embargo clase_embargo,
         actuaciones.sentencia_judicial sentencia_judicial,
         actuaciones.importe importe,
         actuaciones.importe_actuacion importe_actuacion,
         actuaciones.fec_visto_bueno fec_visto_bueno,
         actuaciones.es_ultima es_ultima,
         gastos.fecha_embargo fecha_embargo,
         gastos.fecha_anotacion fecha_anotacion,
         gastos.fecha_prorroga fecha_prorroga,
         gastos.fecha_rectificacion_negativa fecha_rectificacion_negativa,
         gastos.fecha_cancelacion fecha_cancelacion,
		 gastos.fecha_prevista_prorroga fecha_prevista_prorroga,
         gastos.saldo_actual_gastos saldo_actual_gastos,
         valores.tipo_documento tipo_documento,
         valores.documento documento,
         valores.a_favor_de a_favor_de,
         valores.importe_embargable importe_embargable,
		 dtos_actu.id_deuda id_deuda,
		 dtos_actu.importe_contraido importe_contraido,
		 dtos_actu.importe_principal importe_principal,
		 dtos_actu.importe_demora importe_demora,
		 dtos_actu.importe_recargo importe_recargo
       FROM #actuaciones__B8E5E actuaciones
       FULL JOIN #gastos__ECE5D gastos ON (actuaciones.id_expediente_z3=gastos.id_expediente_z3 AND actuaciones.id_tipo_actuacion_z3=gastos.id_tipo_actuacion_z3)
       FULL JOIN #valores__55C57 valores ON (coalesce(actuaciones.id_expediente_z3,GASTOS.id_expediente_z3)=valores.id_expediente_z3 AND coalesce(actuaciones.id_tipo_actuacion_z3,GASTOS.id_tipo_actuacion_z3)=valores.id_tipo_actuacion_z3)
	   FULL JOIN #dtos_actu__55C58 dtos_actu ON (coalesce(actuaciones.id_expediente_z3,GASTOS.id_expediente_z3,VALORES.id_expediente_z3)=dtos_actu.id_expediente_z3 AND coalesce(actuaciones.id_tipo_actuacion_z3,GASTOS.id_tipo_actuacion_z3,VALORES.id_tipo_actuacion_z3)=dtos_actu.id_tipo_actuacion_z3)) ds_actuaciones
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones AS tbn1_z3_ds_actuaciones
  USING query ON query.id_expediente_z3=tbn1_z3_ds_actuaciones.id_expediente_z3 AND query.id_tipo_actuacion_z3=tbn1_z3_ds_actuaciones.id_tipo_actuacion_z3 AND query.tipo_documento=tbn1_z3_ds_actuaciones.tipo_documento AND query.documento=tbn1_z3_ds_actuaciones.documento AND query.id_deuda=tbn1_z3_ds_actuaciones.id_deuda
  WHEN MATCHED AND ((tbn1_z3_ds_actuaciones.anyo_expediente<>query.anyo_expediente OR (tbn1_z3_ds_actuaciones.anyo_expediente IS NULL AND query.anyo_expediente IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.anyo_expediente IS NOT NULL AND query.anyo_expediente IS NULL)
                    OR tbn1_z3_ds_actuaciones.num_expediente<>query.num_expediente OR (tbn1_z3_ds_actuaciones.num_expediente IS NULL AND query.num_expediente IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.num_expediente IS NOT NULL AND query.num_expediente IS NULL)
                    OR tbn1_z3_ds_actuaciones.id_contribuyente<>query.id_contribuyente OR (tbn1_z3_ds_actuaciones.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_z3_ds_actuaciones.nif<>query.nif OR (tbn1_z3_ds_actuaciones.nif IS NULL AND query.nif IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.nif IS NOT NULL AND query.nif IS NULL)
                    OR tbn1_z3_ds_actuaciones.fec_actuacion<>query.fec_actuacion OR (tbn1_z3_ds_actuaciones.fec_actuacion IS NULL AND query.fec_actuacion IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.fec_actuacion IS NOT NULL AND query.fec_actuacion IS NULL)
                    OR tbn1_z3_ds_actuaciones.id_tipo_actuacion<>query.id_tipo_actuacion OR (tbn1_z3_ds_actuaciones.id_tipo_actuacion IS NULL AND query.id_tipo_actuacion IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.id_tipo_actuacion IS NOT NULL AND query.id_tipo_actuacion IS NULL)
                    OR tbn1_z3_ds_actuaciones.num_empleado<>query.num_empleado OR (tbn1_z3_ds_actuaciones.num_empleado IS NULL AND query.num_empleado IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.num_empleado IS NOT NULL AND query.num_empleado IS NULL)
                    OR tbn1_z3_ds_actuaciones.oficina_recaudacion<>query.oficina_recaudacion OR (tbn1_z3_ds_actuaciones.oficina_recaudacion IS NULL AND query.oficina_recaudacion IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.oficina_recaudacion IS NOT NULL AND query.oficina_recaudacion IS NULL)
                    OR tbn1_z3_ds_actuaciones.control_salida<>query.control_salida OR (tbn1_z3_ds_actuaciones.control_salida IS NULL AND query.control_salida IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.control_salida IS NOT NULL AND query.control_salida IS NULL)
                    OR tbn1_z3_ds_actuaciones.motivo_levantamiento<>query.motivo_levantamiento OR (tbn1_z3_ds_actuaciones.motivo_levantamiento IS NULL AND query.motivo_levantamiento IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.motivo_levantamiento IS NOT NULL AND query.motivo_levantamiento IS NULL)
                    OR tbn1_z3_ds_actuaciones.id_tipo_actuacion_anterior<>query.id_tipo_actuacion_anterior OR (tbn1_z3_ds_actuaciones.id_tipo_actuacion_anterior IS NULL AND query.id_tipo_actuacion_anterior IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.id_tipo_actuacion_anterior IS NOT NULL AND query.id_tipo_actuacion_anterior IS NULL)
                    OR tbn1_z3_ds_actuaciones.fec_actuacion_anterior<>query.fec_actuacion_anterior OR (tbn1_z3_ds_actuaciones.fec_actuacion_anterior IS NULL AND query.fec_actuacion_anterior IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.fec_actuacion_anterior IS NOT NULL AND query.fec_actuacion_anterior IS NULL)
                    OR tbn1_z3_ds_actuaciones.id_referencia_actuacion<>query.id_referencia_actuacion OR (tbn1_z3_ds_actuaciones.id_referencia_actuacion IS NULL AND query.id_referencia_actuacion IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.id_referencia_actuacion IS NOT NULL AND query.id_referencia_actuacion IS NULL)
                    OR tbn1_z3_ds_actuaciones.situacion<>query.situacion OR (tbn1_z3_ds_actuaciones.situacion IS NULL AND query.situacion IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.situacion IS NOT NULL AND query.situacion IS NULL)
                    OR tbn1_z3_ds_actuaciones.id_organismo_anotacion_preventiva<>query.id_organismo_anotacion_preventiva OR (tbn1_z3_ds_actuaciones.id_organismo_anotacion_preventiva IS NULL AND query.id_organismo_anotacion_preventiva IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.id_organismo_anotacion_preventiva IS NOT NULL AND query.id_organismo_anotacion_preventiva IS NULL)
                    OR tbn1_z3_ds_actuaciones.id_tipo_unidad_familiar<>query.id_tipo_unidad_familiar OR (tbn1_z3_ds_actuaciones.id_tipo_unidad_familiar IS NULL AND query.id_tipo_unidad_familiar IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.id_tipo_unidad_familiar IS NOT NULL AND query.id_tipo_unidad_familiar IS NULL)
                    OR tbn1_z3_ds_actuaciones.es_actuacion_reconstruida<>query.es_actuacion_reconstruida OR (tbn1_z3_ds_actuaciones.es_actuacion_reconstruida IS NULL AND query.es_actuacion_reconstruida IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.es_actuacion_reconstruida IS NOT NULL AND query.es_actuacion_reconstruida IS NULL)
                    OR tbn1_z3_ds_actuaciones.auto_judicial<>query.auto_judicial OR (tbn1_z3_ds_actuaciones.auto_judicial IS NULL AND query.auto_judicial IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.auto_judicial IS NOT NULL AND query.auto_judicial IS NULL)
                    OR tbn1_z3_ds_actuaciones.expediente_relacionado<>query.expediente_relacionado OR (tbn1_z3_ds_actuaciones.expediente_relacionado IS NULL AND query.expediente_relacionado IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.expediente_relacionado IS NOT NULL AND query.expediente_relacionado IS NULL)
                    OR tbn1_z3_ds_actuaciones.id_tipo_actuacion_relacionada<>query.id_tipo_actuacion_relacionada OR (tbn1_z3_ds_actuaciones.id_tipo_actuacion_relacionada IS NULL AND query.id_tipo_actuacion_relacionada IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.id_tipo_actuacion_relacionada IS NOT NULL AND query.id_tipo_actuacion_relacionada IS NULL)
                    OR tbn1_z3_ds_actuaciones.fec_actuacion_relacionada<>query.fec_actuacion_relacionada OR (tbn1_z3_ds_actuaciones.fec_actuacion_relacionada IS NULL AND query.fec_actuacion_relacionada IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.fec_actuacion_relacionada IS NOT NULL AND query.fec_actuacion_relacionada IS NULL)
                    OR tbn1_z3_ds_actuaciones.act_definitiva_pasada_Z3<>query.act_definitiva_pasada_Z3 OR (tbn1_z3_ds_actuaciones.act_definitiva_pasada_Z3 IS NULL AND query.act_definitiva_pasada_Z3 IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.act_definitiva_pasada_Z3 IS NOT NULL AND query.act_definitiva_pasada_Z3 IS NULL)
                    OR tbn1_z3_ds_actuaciones.id_tipo_actuacion_subasta<>query.id_tipo_actuacion_subasta OR (tbn1_z3_ds_actuaciones.id_tipo_actuacion_subasta IS NULL AND query.id_tipo_actuacion_subasta IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.id_tipo_actuacion_subasta IS NOT NULL AND query.id_tipo_actuacion_subasta IS NULL)
                    OR tbn1_z3_ds_actuaciones.fec_actuacion_subasta<>query.fec_actuacion_subasta OR (tbn1_z3_ds_actuaciones.fec_actuacion_subasta IS NULL AND query.fec_actuacion_subasta IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.fec_actuacion_subasta IS NOT NULL AND query.fec_actuacion_subasta IS NULL)
                    OR tbn1_z3_ds_actuaciones.clase_embargo<>query.clase_embargo OR (tbn1_z3_ds_actuaciones.clase_embargo IS NULL AND query.clase_embargo IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.clase_embargo IS NOT NULL AND query.clase_embargo IS NULL)
                    OR tbn1_z3_ds_actuaciones.sentencia_judicial<>query.sentencia_judicial OR (tbn1_z3_ds_actuaciones.sentencia_judicial IS NULL AND query.sentencia_judicial IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.sentencia_judicial IS NOT NULL AND query.sentencia_judicial IS NULL)
                    OR tbn1_z3_ds_actuaciones.importe<>query.importe OR (tbn1_z3_ds_actuaciones.importe IS NULL AND query.importe IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.importe IS NOT NULL AND query.importe IS NULL)
                    OR tbn1_z3_ds_actuaciones.importe_actuacion<>query.importe_actuacion OR (tbn1_z3_ds_actuaciones.importe_actuacion IS NULL AND query.importe_actuacion IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.importe_actuacion IS NOT NULL AND query.importe_actuacion IS NULL)
                    OR tbn1_z3_ds_actuaciones.fec_visto_bueno<>query.fec_visto_bueno OR (tbn1_z3_ds_actuaciones.fec_visto_bueno IS NULL AND query.fec_visto_bueno IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.fec_visto_bueno IS NOT NULL AND query.fec_visto_bueno IS NULL)
                    OR tbn1_z3_ds_actuaciones.es_ultima<>query.es_ultima OR (tbn1_z3_ds_actuaciones.es_ultima IS NULL AND query.es_ultima IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.es_ultima IS NOT NULL AND query.es_ultima IS NULL)
                    OR tbn1_z3_ds_actuaciones.fecha_embargo<>query.fecha_embargo OR (tbn1_z3_ds_actuaciones.fecha_embargo IS NULL AND query.fecha_embargo IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.fecha_embargo IS NOT NULL AND query.fecha_embargo IS NULL)
                    OR tbn1_z3_ds_actuaciones.fecha_anotacion<>query.fecha_anotacion OR (tbn1_z3_ds_actuaciones.fecha_anotacion IS NULL AND query.fecha_anotacion IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.fecha_anotacion IS NOT NULL AND query.fecha_anotacion IS NULL)
                    OR tbn1_z3_ds_actuaciones.fecha_prorroga<>query.fecha_prorroga OR (tbn1_z3_ds_actuaciones.fecha_prorroga IS NULL AND query.fecha_prorroga IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.fecha_prorroga IS NOT NULL AND query.fecha_prorroga IS NULL)
                    OR tbn1_z3_ds_actuaciones.fecha_rectificacion_negativa<>query.fecha_rectificacion_negativa OR (tbn1_z3_ds_actuaciones.fecha_rectificacion_negativa IS NULL AND query.fecha_rectificacion_negativa IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.fecha_rectificacion_negativa IS NOT NULL AND query.fecha_rectificacion_negativa IS NULL)
                    OR tbn1_z3_ds_actuaciones.fecha_cancelacion<>query.fecha_cancelacion OR (tbn1_z3_ds_actuaciones.fecha_cancelacion IS NULL AND query.fecha_cancelacion IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.fecha_cancelacion IS NOT NULL AND query.fecha_cancelacion IS NULL)
					OR tbn1_z3_ds_actuaciones.fecha_prevista_prorroga<>query.fecha_prevista_prorroga OR (tbn1_z3_ds_actuaciones.fecha_prevista_prorroga IS NULL AND query.fecha_prevista_prorroga IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.fecha_prevista_prorroga IS NOT NULL AND query.fecha_prevista_prorroga IS NULL)
                    OR tbn1_z3_ds_actuaciones.saldo_actual_gastos<>query.saldo_actual_gastos OR (tbn1_z3_ds_actuaciones.saldo_actual_gastos IS NULL AND query.saldo_actual_gastos IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.saldo_actual_gastos IS NOT NULL AND query.saldo_actual_gastos IS NULL)
                    OR tbn1_z3_ds_actuaciones.a_favor_de<>query.a_favor_de OR (tbn1_z3_ds_actuaciones.a_favor_de IS NULL AND query.a_favor_de IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.a_favor_de IS NOT NULL AND query.a_favor_de IS NULL)
                    OR tbn1_z3_ds_actuaciones.importe_embargable<>query.importe_embargable OR (tbn1_z3_ds_actuaciones.importe_embargable IS NULL AND query.importe_embargable IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.importe_embargable IS NOT NULL AND query.importe_embargable IS NULL)
					OR tbn1_z3_ds_actuaciones.importe_contraido<>query.importe_contraido OR (tbn1_z3_ds_actuaciones.importe_contraido IS NULL AND query.importe_contraido IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.importe_contraido IS NOT NULL AND query.importe_contraido IS NULL)
					OR tbn1_z3_ds_actuaciones.importe_principal<>query.importe_principal OR (tbn1_z3_ds_actuaciones.importe_principal IS NULL AND query.importe_principal IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.importe_principal IS NOT NULL AND query.importe_principal IS NULL)
					OR tbn1_z3_ds_actuaciones.importe_demora<>query.importe_demora OR (tbn1_z3_ds_actuaciones.importe_demora IS NULL AND query.importe_demora IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.importe_demora IS NOT NULL AND query.importe_demora IS NULL)
					OR tbn1_z3_ds_actuaciones.importe_recargo<>query.importe_recargo OR (tbn1_z3_ds_actuaciones.importe_recargo IS NULL AND query.importe_recargo IS NOT NULL) OR  (tbn1_z3_ds_actuaciones.importe_recargo IS NOT NULL AND query.importe_recargo IS NULL)
					OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      anyo_expediente=query.anyo_expediente,
      num_expediente=query.num_expediente,
      id_contribuyente=query.id_contribuyente,
      nif=query.nif,
      fec_actuacion=query.fec_actuacion,
      id_tipo_actuacion=query.id_tipo_actuacion,
      num_empleado=query.num_empleado,
      oficina_recaudacion=query.oficina_recaudacion,
      control_salida=query.control_salida,
      motivo_levantamiento=query.motivo_levantamiento,
      id_tipo_actuacion_anterior=query.id_tipo_actuacion_anterior,
      fec_actuacion_anterior=query.fec_actuacion_anterior,
      id_referencia_actuacion=query.id_referencia_actuacion,
      situacion=query.situacion,
      id_organismo_anotacion_preventiva=query.id_organismo_anotacion_preventiva,
      id_tipo_unidad_familiar=query.id_tipo_unidad_familiar,
      es_actuacion_reconstruida=query.es_actuacion_reconstruida,
      auto_judicial=query.auto_judicial,
      expediente_relacionado=query.expediente_relacionado,
      id_tipo_actuacion_relacionada=query.id_tipo_actuacion_relacionada,
      fec_actuacion_relacionada=query.fec_actuacion_relacionada,
      act_definitiva_pasada_Z3=query.act_definitiva_pasada_Z3,
      id_tipo_actuacion_subasta=query.id_tipo_actuacion_subasta,
      fec_actuacion_subasta=query.fec_actuacion_subasta,
      clase_embargo=query.clase_embargo,
      sentencia_judicial=query.sentencia_judicial,
      importe=query.importe,
      importe_actuacion=query.importe_actuacion,
      fec_visto_bueno=query.fec_visto_bueno,
      es_ultima=query.es_ultima,
      fecha_embargo=query.fecha_embargo,
      fecha_anotacion=query.fecha_anotacion,
      fecha_prorroga=query.fecha_prorroga,
      fecha_rectificacion_negativa=query.fecha_rectificacion_negativa,
      fecha_cancelacion=query.fecha_cancelacion,
	  fecha_prevista_prorroga=query.fecha_prevista_prorroga,
      saldo_actual_gastos=query.saldo_actual_gastos,
      a_favor_de=query.a_favor_de,
      importe_embargable=query.importe_embargable,
	  importe_contraido=query.importe_contraido,
	  importe_principal=query.importe_principal,
	  importe_demora=query.importe_demora,
	  importe_recargo=query.importe_recargo,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (id_expediente_z3,anyo_expediente,num_expediente,id_contribuyente,nif,id_tipo_actuacion_z3,fec_actuacion,id_tipo_actuacion,num_empleado,oficina_recaudacion,control_salida,motivo_levantamiento,id_tipo_actuacion_anterior,fec_actuacion_anterior,id_referencia_actuacion,situacion,id_organismo_anotacion_preventiva,id_tipo_unidad_familiar,es_actuacion_reconstruida,auto_judicial,expediente_relacionado,id_tipo_actuacion_relacionada,fec_actuacion_relacionada,act_definitiva_pasada_Z3,id_tipo_actuacion_subasta,fec_actuacion_subasta,clase_embargo,sentencia_judicial,importe,importe_actuacion,fec_visto_bueno,es_ultima,fecha_embargo,fecha_anotacion,fecha_prorroga,fecha_rectificacion_negativa,fecha_cancelacion,fecha_prevista_prorroga,saldo_actual_gastos,tipo_documento,documento,a_favor_de,importe_embargable,id_deuda,importe_contraido,importe_principal,importe_demora,importe_recargo,fec_alta,fec_modificacion) VALUES (
      query.id_expediente_z3,
      query.anyo_expediente,
      query.num_expediente,
      query.id_contribuyente,
      query.nif,
      query.id_tipo_actuacion_z3,
      query.fec_actuacion,
      query.id_tipo_actuacion,
      query.num_empleado,
      query.oficina_recaudacion,
      query.control_salida,
      query.motivo_levantamiento,
      query.id_tipo_actuacion_anterior,
      query.fec_actuacion_anterior,
      query.id_referencia_actuacion,
      query.situacion,
      query.id_organismo_anotacion_preventiva,
      query.id_tipo_unidad_familiar,
      query.es_actuacion_reconstruida,
      query.auto_judicial,
      query.expediente_relacionado,
      query.id_tipo_actuacion_relacionada,
      query.fec_actuacion_relacionada,
      query.act_definitiva_pasada_Z3,
      query.id_tipo_actuacion_subasta,
      query.fec_actuacion_subasta,
      query.clase_embargo,
      query.sentencia_judicial,
      query.importe,
      query.importe_actuacion,
      query.fec_visto_bueno,
      query.es_ultima,
      query.fecha_embargo,
      query.fecha_anotacion,
      query.fecha_prorroga,
      query.fecha_rectificacion_negativa,
      query.fecha_cancelacion,
	  query.fecha_prevista_prorroga,
      query.saldo_actual_gastos,
      query.tipo_documento,
      query.documento,
      query.a_favor_de,
      query.importe_embargable,
	  query.id_deuda,
	  query.importe_contraido,
	  query.importe_principal,
	  query.importe_demora,
	  query.importe_recargo,
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

