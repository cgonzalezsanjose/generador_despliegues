PRINT 'dimensional_z3_exp_deuda_fact.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact(
	id int IDENTITY(1,1),
	id_dim_expedientes int NOT NULL,
	id_dim_fechas int NOT NULL,
	id_dim_contribuyentes int NOT NULL,
	id_dim_detalles_expediente int NOT NULL,
	id_dim_fechas_expediente int NOT NULL,
	id_dim_deudas int NOT NULL,
	id_dim_detalles_deuda int NOT NULL,
	id_dim_detalles_movimiento int NOT NULL,
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
	CONSTRAINT FK_tbn1_z3_exp_deuda_fact_tbn1_z3_exp_deuda_dim_expedientes FOREIGN KEY (id_dim_expedientes) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_expedientes(id_dim_expedientes),
	CONSTRAINT FK_tbn1_z3_exp_deuda_fact_tbn1_z3_exp_deuda_dim_fechas FOREIGN KEY (id_dim_fechas) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_fechas(id_dim_fechas),
	CONSTRAINT FK_tbn1_z3_exp_deuda_fact_tbn1_z3_exp_deuda_dim_contribuyentes FOREIGN KEY (id_dim_contribuyentes) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_contribuyentes(id_dim_contribuyentes),
	CONSTRAINT FK_tbn1_z3_exp_deuda_fact_tbn1_z3_exp_deuda_dim_detalles_expediente FOREIGN KEY (id_dim_detalles_expediente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_expediente(id_dim_detalles_expediente),
	CONSTRAINT FK_tbn1_z3_exp_deuda_fact_tbn1_z3_exp_deuda_dim_fechas_expediente FOREIGN KEY (id_dim_fechas_expediente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_fechas_expediente(id_dim_fechas_expediente),
	CONSTRAINT FK_tbn1_z3_exp_deuda_fact_tbn1_z3_exp_deuda_dim_deudas FOREIGN KEY (id_dim_deudas) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_deudas(id_dim_deudas),
	CONSTRAINT FK_tbn1_z3_exp_deuda_fact_tbn1_z3_exp_deuda_dim_detalles_deuda FOREIGN KEY (id_dim_detalles_deuda) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_deuda(id_dim_detalles_deuda),
	CONSTRAINT FK_tbn1_z3_exp_deuda_fact_tbn1_z3_exp_deuda_dim_detalles_movimiento FOREIGN KEY (id_dim_detalles_movimiento) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_movimiento(id_dim_detalles_movimiento),
	CONSTRAINT PK_tbn1_z3_exp_deuda_fact PRIMARY KEY CLUSTERED (id)
)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='id')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ADD id int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='id_dim_expedientes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ADD id_dim_expedientes int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='id_dim_fechas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ADD id_dim_fechas int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='id_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ADD id_dim_contribuyentes int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='id_dim_detalles_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ADD id_dim_detalles_expediente int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='id_dim_fechas_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ADD id_dim_fechas_expediente int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='id_dim_deudas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ADD id_dim_deudas int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='id_dim_detalles_deuda')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ADD id_dim_detalles_deuda int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='id_dim_detalles_movimiento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ADD id_dim_detalles_movimiento int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='importe_liquidacion_principal')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ADD importe_liquidacion_principal numeric(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='importe_pendiente_principal')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ADD importe_pendiente_principal numeric(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='importe_pendiente_demora')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ADD importe_pendiente_demora numeric(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='importe_pendiente_recargo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ADD importe_pendiente_recargo numeric(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='importe_suspendido_principal')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ADD importe_suspendido_principal numeric(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='importe_suspendido_demora')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ADD importe_suspendido_demora numeric(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='importe_suspendido_recargo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ADD importe_suspendido_recargo numeric(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='importe_aplazado_principal')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ADD importe_aplazado_principal numeric(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='importe_aplazado_demora')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ADD importe_aplazado_demora numeric(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='importe_aplazado_recargo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ADD importe_aplazado_recargo numeric(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='importe_documento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ADD importe_documento numeric(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='importe_principal')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ADD importe_principal numeric(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='importe')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ADD importe numeric(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='importe_real')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ADD importe_real numeric(18,2)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='id' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ALTER COLUMN id int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='id_dim_expedientes' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ALTER COLUMN id_dim_expedientes int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='id_dim_fechas' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ALTER COLUMN id_dim_fechas int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='id_dim_contribuyentes' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ALTER COLUMN id_dim_contribuyentes int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='id_dim_detalles_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ALTER COLUMN id_dim_detalles_expediente int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='id_dim_fechas_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ALTER COLUMN id_dim_fechas_expediente int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='id_dim_deudas' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ALTER COLUMN id_dim_deudas int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='id_dim_detalles_deuda' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ALTER COLUMN id_dim_detalles_deuda int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='id_dim_detalles_movimiento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ALTER COLUMN id_dim_detalles_movimiento int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='importe_liquidacion_principal' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ALTER COLUMN importe_liquidacion_principal numeric(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='importe_pendiente_principal' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ALTER COLUMN importe_pendiente_principal numeric(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='importe_pendiente_demora' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ALTER COLUMN importe_pendiente_demora numeric(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='importe_pendiente_recargo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ALTER COLUMN importe_pendiente_recargo numeric(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='importe_suspendido_principal' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ALTER COLUMN importe_suspendido_principal numeric(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='importe_suspendido_demora' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ALTER COLUMN importe_suspendido_demora numeric(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='importe_suspendido_recargo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ALTER COLUMN importe_suspendido_recargo numeric(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='importe_aplazado_principal' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ALTER COLUMN importe_aplazado_principal numeric(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='importe_aplazado_demora' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ALTER COLUMN importe_aplazado_demora numeric(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='importe_aplazado_recargo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ALTER COLUMN importe_aplazado_recargo numeric(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='importe_documento' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ALTER COLUMN importe_documento numeric(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='importe_principal' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ALTER COLUMN importe_principal numeric(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='importe' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ALTER COLUMN importe numeric(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND COLUMN_NAME='importe_real' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ALTER COLUMN importe_real numeric(18,2) NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND CONSTRAINT_NAME='PK_tbn1_z3_exp_deuda_fact')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ADD CONSTRAINT PK_tbn1_z3_exp_deuda_fact PRIMARY KEY CLUSTERED (id)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND CONSTRAINT_NAME='FK_tbn1_z3_exp_deuda_fact_tbn1_z3_exp_deuda_dim_expedientes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ADD CONSTRAINT FK_tbn1_z3_exp_deuda_fact_tbn1_z3_exp_deuda_dim_expedientes FOREIGN KEY (id_dim_expedientes) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_expedientes(id_dim_expedientes)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND CONSTRAINT_NAME='FK_tbn1_z3_exp_deuda_fact_tbn1_z3_exp_deuda_dim_fechas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ADD CONSTRAINT FK_tbn1_z3_exp_deuda_fact_tbn1_z3_exp_deuda_dim_fechas FOREIGN KEY (id_dim_fechas) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_fechas(id_dim_fechas)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND CONSTRAINT_NAME='FK_tbn1_z3_exp_deuda_fact_tbn1_z3_exp_deuda_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ADD CONSTRAINT FK_tbn1_z3_exp_deuda_fact_tbn1_z3_exp_deuda_dim_contribuyentes FOREIGN KEY (id_dim_contribuyentes) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_contribuyentes(id_dim_contribuyentes)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND CONSTRAINT_NAME='FK_tbn1_z3_exp_deuda_fact_tbn1_z3_exp_deuda_dim_detalles_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ADD CONSTRAINT FK_tbn1_z3_exp_deuda_fact_tbn1_z3_exp_deuda_dim_detalles_expediente FOREIGN KEY (id_dim_detalles_expediente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_expediente(id_dim_detalles_expediente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND CONSTRAINT_NAME='FK_tbn1_z3_exp_deuda_fact_tbn1_z3_exp_deuda_dim_fechas_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ADD CONSTRAINT FK_tbn1_z3_exp_deuda_fact_tbn1_z3_exp_deuda_dim_fechas_expediente FOREIGN KEY (id_dim_fechas_expediente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_fechas_expediente(id_dim_fechas_expediente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND CONSTRAINT_NAME='FK_tbn1_z3_exp_deuda_fact_tbn1_z3_exp_deuda_dim_deudas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ADD CONSTRAINT FK_tbn1_z3_exp_deuda_fact_tbn1_z3_exp_deuda_dim_deudas FOREIGN KEY (id_dim_deudas) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_deudas(id_dim_deudas)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND CONSTRAINT_NAME='FK_tbn1_z3_exp_deuda_fact_tbn1_z3_exp_deuda_dim_detalles_deuda')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ADD CONSTRAINT FK_tbn1_z3_exp_deuda_fact_tbn1_z3_exp_deuda_dim_detalles_deuda FOREIGN KEY (id_dim_detalles_deuda) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_deuda(id_dim_detalles_deuda)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_fact' AND CONSTRAINT_NAME='FK_tbn1_z3_exp_deuda_fact_tbn1_z3_exp_deuda_dim_detalles_movimiento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact ADD CONSTRAINT FK_tbn1_z3_exp_deuda_fact_tbn1_z3_exp_deuda_dim_detalles_movimiento FOREIGN KEY (id_dim_detalles_movimiento) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_movimiento(id_dim_detalles_movimiento)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_z3_exp_deuda_fact' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_z3_exp_deuda_fact;
GO

CREATE PROCEDURE dbo.spn1_cargar_z3_exp_deuda_fact(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_z3_exp_deuda_fact'
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
			expedientes.id_dim_expedientes AS id_dim_expedientes,
			fechas.id_dim_fechas AS id_dim_fechas,
			contribuyentes.id_dim_contribuyentes AS id_dim_contribuyentes,
			detalles_expediente.id_dim_detalles_expediente AS id_dim_detalles_expediente,
			fechas_expediente.id_dim_fechas_expediente AS id_dim_fechas_expediente,
			deudas.id_dim_deudas AS id_dim_deudas,
			detalles_deuda.id_dim_detalles_deuda AS id_dim_detalles_deuda,
			detalles_movimiento.id_dim_detalles_movimiento AS id_dim_detalles_movimiento,
			sum(ds_t.importe_liquidacion_principal) AS importe_liquidacion_principal,
			sum(ds_t.importe_pendiente_principal) AS importe_pendiente_principal,
			sum(ds_t.importe_pendiente_demora) AS importe_pendiente_demora,
			sum(ds_t.importe_pendiente_recargo) AS importe_pendiente_recargo,
			sum(ds_t.importe_suspendido_principal) AS importe_suspendido_principal,
			sum(ds_t.importe_suspendido_demora) AS importe_suspendido_demora,
			sum(ds_t.importe_suspendido_recargo) AS importe_suspendido_recargo,
			sum(ds_t.importe_aplazado_principal) AS importe_aplazado_principal,
			sum(ds_t.importe_aplazado_demora) AS importe_aplazado_demora,
			sum(ds_t.importe_aplazado_recargo) AS importe_aplazado_recargo,
			sum(ds_t.importe_documento) AS importe_documento,
			sum(ds_t.importe_principal) AS importe_principal,
			sum(ds_t.importe) AS importe,
			sum(ds_t.importe_real) AS importe_real
		FROM dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ds_t
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_expedientes AS expedientes ON (expedientes.id_expediente_z3=ds_t.id_expediente_z3 AND expedientes.num_expediente=ds_t.num_expediente AND expedientes.num_expediente_en_NF=ds_t.num_expediente_en_NF)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_fechas AS fechas ON (fechas.anyo_expediente=ds_t.anyo_expediente AND fechas.fecha_asiento=ds_t.fecha_asiento AND fechas.anyo_asiento=ds_t.anyo_asiento AND fechas.mes_asiento=ds_t.mes_asiento AND fechas.fecha_contraido=ds_t.fecha_contraido)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_contribuyentes AS contribuyentes ON (contribuyentes.id_contribuyente=ds_t.id_contribuyente AND contribuyentes.nif=ds_t.nif)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_expediente AS detalles_expediente ON (detalles_expediente.num_empleado=ds_t.num_empleado AND detalles_expediente.id_agente=ds_t.id_agente AND detalles_expediente.oficina_recaudacion=ds_t.oficina_recaudacion AND detalles_expediente.id_tipo_actuacion=ds_t.id_tipo_actuacion AND detalles_expediente.concepto_deuda=ds_t.concepto_deuda AND detalles_expediente.es_fallido=ds_t.es_fallido AND detalles_expediente.tipo_expediente=ds_t.tipo_expediente AND detalles_expediente.tiene_nifs_derivados=ds_t.tiene_nifs_derivados AND detalles_expediente.id_tipo_expediente_embargos=ds_t.id_tipo_expediente_embargos)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_fechas_expediente AS fechas_expediente ON (fechas_expediente.fec_actuacion=ds_t.fec_actuacion AND fechas_expediente.fec_carga_expediente=ds_t.fec_carga_expediente AND fechas_expediente.anyo_carga_expediente=ds_t.anyo_carga_expediente AND fechas_expediente.mes_carga_expediente=ds_t.mes_carga_expediente)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_deudas AS deudas ON (deudas.id_deuda=ds_t.id_deuda)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_deuda AS detalles_deuda ON (detalles_deuda.id_estado_documento=ds_t.id_estado_documento AND detalles_deuda.id_modelo=ds_t.id_modelo AND detalles_deuda.cod_modelo=ds_t.cod_modelo)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_movimiento AS detalles_movimiento ON (detalles_movimiento.anyo_contraido=ds_t.anyo_contraido AND detalles_movimiento.secuencia=ds_t.secuencia AND detalles_movimiento.id_codigo_operacion=ds_t.id_codigo_operacion AND detalles_movimiento.id_tipo_ingreso=ds_t.id_tipo_ingreso AND detalles_movimiento.id_clave_ingreso=ds_t.id_clave_ingreso)
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			expedientes.id_dim_expedientes,
			fechas.id_dim_fechas,
			contribuyentes.id_dim_contribuyentes,
			detalles_expediente.id_dim_detalles_expediente,
			fechas_expediente.id_dim_fechas_expediente,
			deudas.id_dim_deudas,
			detalles_deuda.id_dim_detalles_deuda,
			detalles_movimiento.id_dim_detalles_movimiento
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_fact AS tbn1_z3_exp_deuda_fact
	USING query ON query.id_dim_expedientes=tbn1_z3_exp_deuda_fact.id_dim_expedientes AND query.id_dim_fechas=tbn1_z3_exp_deuda_fact.id_dim_fechas AND query.id_dim_contribuyentes=tbn1_z3_exp_deuda_fact.id_dim_contribuyentes AND query.id_dim_detalles_expediente=tbn1_z3_exp_deuda_fact.id_dim_detalles_expediente AND query.id_dim_fechas_expediente=tbn1_z3_exp_deuda_fact.id_dim_fechas_expediente AND query.id_dim_deudas=tbn1_z3_exp_deuda_fact.id_dim_deudas AND query.id_dim_detalles_deuda=tbn1_z3_exp_deuda_fact.id_dim_detalles_deuda AND query.id_dim_detalles_movimiento=tbn1_z3_exp_deuda_fact.id_dim_detalles_movimiento
	WHEN MATCHED AND ((tbn1_z3_exp_deuda_fact.importe_liquidacion_principal<>query.importe_liquidacion_principal OR (tbn1_z3_exp_deuda_fact.importe_liquidacion_principal IS NULL AND query.importe_liquidacion_principal IS NOT NULL) OR (tbn1_z3_exp_deuda_fact.importe_liquidacion_principal IS NOT NULL AND query.importe_liquidacion_principal IS NULL)
			OR tbn1_z3_exp_deuda_fact.importe_pendiente_principal<>query.importe_pendiente_principal OR (tbn1_z3_exp_deuda_fact.importe_pendiente_principal IS NULL AND query.importe_pendiente_principal IS NOT NULL) OR (tbn1_z3_exp_deuda_fact.importe_pendiente_principal IS NOT NULL AND query.importe_pendiente_principal IS NULL)
			OR tbn1_z3_exp_deuda_fact.importe_pendiente_demora<>query.importe_pendiente_demora OR (tbn1_z3_exp_deuda_fact.importe_pendiente_demora IS NULL AND query.importe_pendiente_demora IS NOT NULL) OR (tbn1_z3_exp_deuda_fact.importe_pendiente_demora IS NOT NULL AND query.importe_pendiente_demora IS NULL)
			OR tbn1_z3_exp_deuda_fact.importe_pendiente_recargo<>query.importe_pendiente_recargo OR (tbn1_z3_exp_deuda_fact.importe_pendiente_recargo IS NULL AND query.importe_pendiente_recargo IS NOT NULL) OR (tbn1_z3_exp_deuda_fact.importe_pendiente_recargo IS NOT NULL AND query.importe_pendiente_recargo IS NULL)
			OR tbn1_z3_exp_deuda_fact.importe_suspendido_principal<>query.importe_suspendido_principal OR (tbn1_z3_exp_deuda_fact.importe_suspendido_principal IS NULL AND query.importe_suspendido_principal IS NOT NULL) OR (tbn1_z3_exp_deuda_fact.importe_suspendido_principal IS NOT NULL AND query.importe_suspendido_principal IS NULL)
			OR tbn1_z3_exp_deuda_fact.importe_suspendido_demora<>query.importe_suspendido_demora OR (tbn1_z3_exp_deuda_fact.importe_suspendido_demora IS NULL AND query.importe_suspendido_demora IS NOT NULL) OR (tbn1_z3_exp_deuda_fact.importe_suspendido_demora IS NOT NULL AND query.importe_suspendido_demora IS NULL)
			OR tbn1_z3_exp_deuda_fact.importe_suspendido_recargo<>query.importe_suspendido_recargo OR (tbn1_z3_exp_deuda_fact.importe_suspendido_recargo IS NULL AND query.importe_suspendido_recargo IS NOT NULL) OR (tbn1_z3_exp_deuda_fact.importe_suspendido_recargo IS NOT NULL AND query.importe_suspendido_recargo IS NULL)
			OR tbn1_z3_exp_deuda_fact.importe_aplazado_principal<>query.importe_aplazado_principal OR (tbn1_z3_exp_deuda_fact.importe_aplazado_principal IS NULL AND query.importe_aplazado_principal IS NOT NULL) OR (tbn1_z3_exp_deuda_fact.importe_aplazado_principal IS NOT NULL AND query.importe_aplazado_principal IS NULL)
			OR tbn1_z3_exp_deuda_fact.importe_aplazado_demora<>query.importe_aplazado_demora OR (tbn1_z3_exp_deuda_fact.importe_aplazado_demora IS NULL AND query.importe_aplazado_demora IS NOT NULL) OR (tbn1_z3_exp_deuda_fact.importe_aplazado_demora IS NOT NULL AND query.importe_aplazado_demora IS NULL)
			OR tbn1_z3_exp_deuda_fact.importe_aplazado_recargo<>query.importe_aplazado_recargo OR (tbn1_z3_exp_deuda_fact.importe_aplazado_recargo IS NULL AND query.importe_aplazado_recargo IS NOT NULL) OR (tbn1_z3_exp_deuda_fact.importe_aplazado_recargo IS NOT NULL AND query.importe_aplazado_recargo IS NULL)
			OR tbn1_z3_exp_deuda_fact.importe_documento<>query.importe_documento OR (tbn1_z3_exp_deuda_fact.importe_documento IS NULL AND query.importe_documento IS NOT NULL) OR (tbn1_z3_exp_deuda_fact.importe_documento IS NOT NULL AND query.importe_documento IS NULL)
			OR tbn1_z3_exp_deuda_fact.importe_principal<>query.importe_principal OR (tbn1_z3_exp_deuda_fact.importe_principal IS NULL AND query.importe_principal IS NOT NULL) OR (tbn1_z3_exp_deuda_fact.importe_principal IS NOT NULL AND query.importe_principal IS NULL)
			OR tbn1_z3_exp_deuda_fact.importe<>query.importe OR (tbn1_z3_exp_deuda_fact.importe IS NULL AND query.importe IS NOT NULL) OR (tbn1_z3_exp_deuda_fact.importe IS NOT NULL AND query.importe IS NULL)
			OR tbn1_z3_exp_deuda_fact.importe_real<>query.importe_real OR (tbn1_z3_exp_deuda_fact.importe_real IS NULL AND query.importe_real IS NOT NULL) OR (tbn1_z3_exp_deuda_fact.importe_real IS NOT NULL AND query.importe_real IS NULL))) THEN
		UPDATE SET
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
			importe_real=query.importe_real
	WHEN NOT MATCHED THEN
		INSERT (id_dim_expedientes,id_dim_fechas,id_dim_contribuyentes,id_dim_detalles_expediente,id_dim_fechas_expediente,id_dim_deudas,id_dim_detalles_deuda,id_dim_detalles_movimiento,importe_liquidacion_principal,importe_pendiente_principal,importe_pendiente_demora,importe_pendiente_recargo,importe_suspendido_principal,importe_suspendido_demora,importe_suspendido_recargo,importe_aplazado_principal,importe_aplazado_demora,importe_aplazado_recargo,importe_documento,importe_principal,importe,importe_real) VALUES (
			query.id_dim_expedientes,
			query.id_dim_fechas,
			query.id_dim_contribuyentes,
			query.id_dim_detalles_expediente,
			query.id_dim_fechas_expediente,
			query.id_dim_deudas,
			query.id_dim_detalles_deuda,
			query.id_dim_detalles_movimiento,
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
			query.importe_real
			)
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

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_z3_dm_expedientes_deudas' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_z3_dm_expedientes_deudas;
GO

CREATE PROCEDURE dbo.spn1_cargar_z3_dm_expedientes_deudas(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_z3_dm_expedientes_deudas'
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

  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_z3_exp_deuda_dim_expedientes @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_z3_exp_deuda_dim_fechas @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_z3_exp_deuda_dim_contribuyentes @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_z3_exp_deuda_dim_detalles_expediente @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_z3_exp_deuda_dim_fechas_expediente @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_z3_exp_deuda_dim_deudas @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_z3_exp_deuda_dim_detalles_deuda @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_z3_exp_deuda_dim_detalles_movimiento @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_z3_exp_deuda_fact @log;

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

