PRINT 'dimensional_z3_actu_fact.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact(
	id int IDENTITY(1,1),
	id_dim_expedientes int NOT NULL,
	id_dim_fechas int NOT NULL,
	id_dim_contribuyentes int NOT NULL,
	id_dim_actuaciones int NOT NULL,
	id_dim_detalles_actuacion int NOT NULL,
	id_dim_fechas_gastos int NOT NULL,
	id_dim_valores int NOT NULL,
	id_dim_deudas int NOT NULL,
	importe numeric(18,2),
	importe_actuacion numeric(18,2),
	saldo_actual_gastos decimal(18,2),
	importe_embargable decimal(18,2),
	importe_principal decimal(18,2),
	importe_demora decimal(18,2),
	importe_recargo decimal(18,2),
	importe_contraido decimal(18,2),
	CONSTRAINT FK_tbn1_z3_actu_fact_tbn1_z3_actu_dim_expedientes FOREIGN KEY (id_dim_expedientes) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_expedientes(id_dim_expedientes),
	CONSTRAINT FK_tbn1_z3_actu_fact_tbn1_z3_actu_dim_fechas FOREIGN KEY (id_dim_fechas) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas(id_dim_fechas),
	CONSTRAINT FK_tbn1_z3_actu_fact_tbn1_z3_actu_dim_contribuyentes FOREIGN KEY (id_dim_contribuyentes) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_contribuyentes(id_dim_contribuyentes),
	CONSTRAINT FK_tbn1_z3_actu_fact_tbn1_z3_actu_dim_actuaciones FOREIGN KEY (id_dim_actuaciones) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_actuaciones(id_dim_actuaciones),
	CONSTRAINT FK_tbn1_z3_actu_fact_tbn1_z3_actu_dim_detalles_actuacion FOREIGN KEY (id_dim_detalles_actuacion) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_detalles_actuacion(id_dim_detalles_actuacion),
	CONSTRAINT FK_tbn1_z3_actu_fact_tbn1_z3_actu_dim_fechas_gastos FOREIGN KEY (id_dim_fechas_gastos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas_gastos(id_dim_fechas_gastos),
	CONSTRAINT FK_tbn1_z3_actu_fact_tbn1_z3_actu_dim_valores FOREIGN KEY (id_dim_valores) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_valores(id_dim_valores),
	CONSTRAINT FK_tbn1_z3_actu_fact_tbn1_z3_actu_dim_deudas FOREIGN KEY (id_dim_deudas) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_deudas(id_dim_deudas),
	CONSTRAINT PK_tbn1_z3_actu_fact PRIMARY KEY CLUSTERED (id)
)
GO


IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND COLUMN_NAME='id')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ADD id int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND COLUMN_NAME='id_dim_expedientes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ADD id_dim_expedientes int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND COLUMN_NAME='id_dim_fechas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ADD id_dim_fechas int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND COLUMN_NAME='id_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ADD id_dim_contribuyentes int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND COLUMN_NAME='id_dim_actuaciones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ADD id_dim_actuaciones int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND COLUMN_NAME='id_dim_detalles_actuacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ADD id_dim_detalles_actuacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND COLUMN_NAME='id_dim_fechas_gastos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ADD id_dim_fechas_gastos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND COLUMN_NAME='id_dim_valores')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ADD id_dim_valores int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND COLUMN_NAME='id_dim_deudas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ADD id_dim_deudas int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND COLUMN_NAME='importe')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ADD importe numeric(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND COLUMN_NAME='importe_actuacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ADD importe_actuacion numeric(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND COLUMN_NAME='saldo_actual_gastos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ADD saldo_actual_gastos decimal(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND COLUMN_NAME='importe_embargable')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ADD importe_embargable decimal(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND COLUMN_NAME='importe_principal')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ADD importe_principal decimal(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND COLUMN_NAME='importe_demora')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ADD importe_demora decimal(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND COLUMN_NAME='importe_recargo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ADD importe_recargo decimal(18,2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND COLUMN_NAME='importe_contraido')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ADD importe_contraido decimal(18,2)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND COLUMN_NAME='id' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ALTER COLUMN id int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND COLUMN_NAME='id_dim_expedientes' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ALTER COLUMN id_dim_expedientes int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND COLUMN_NAME='id_dim_fechas' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ALTER COLUMN id_dim_fechas int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND COLUMN_NAME='id_dim_contribuyentes' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ALTER COLUMN id_dim_contribuyentes int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND COLUMN_NAME='id_dim_actuaciones' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ALTER COLUMN id_dim_actuaciones int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND COLUMN_NAME='id_dim_detalles_actuacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ALTER COLUMN id_dim_detalles_actuacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND COLUMN_NAME='id_dim_fechas_gastos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ALTER COLUMN id_dim_fechas_gastos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND COLUMN_NAME='id_dim_valores' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ALTER COLUMN id_dim_valores int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND COLUMN_NAME='id_dim_deudas' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ALTER COLUMN id_dim_deudas int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND COLUMN_NAME='importe' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ALTER COLUMN importe numeric(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND COLUMN_NAME='importe_actuacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ALTER COLUMN importe_actuacion numeric(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND COLUMN_NAME='saldo_actual_gastos' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ALTER COLUMN saldo_actual_gastos decimal(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND COLUMN_NAME='importe_embargable' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ALTER COLUMN importe_embargable decimal(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND COLUMN_NAME='importe_principal' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ALTER COLUMN importe_principal decimal(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND COLUMN_NAME='importe_demora' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ALTER COLUMN importe_demora decimal(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND COLUMN_NAME='importe_recargo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ALTER COLUMN importe_recargo decimal(18,2) NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND COLUMN_NAME='importe_contraido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ALTER COLUMN importe_contraido decimal(18,2) NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND CONSTRAINT_NAME='PK_tbn1_z3_actu_fact')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ADD CONSTRAINT PK_tbn1_z3_actu_fact PRIMARY KEY CLUSTERED (id)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND CONSTRAINT_NAME='FK_tbn1_z3_actu_fact_tbn1_z3_actu_dim_expedientes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ADD CONSTRAINT FK_tbn1_z3_actu_fact_tbn1_z3_actu_dim_expedientes FOREIGN KEY (id_dim_expedientes) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_expedientes(id_dim_expedientes)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND CONSTRAINT_NAME='FK_tbn1_z3_actu_fact_tbn1_z3_actu_dim_fechas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ADD CONSTRAINT FK_tbn1_z3_actu_fact_tbn1_z3_actu_dim_fechas FOREIGN KEY (id_dim_fechas) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas(id_dim_fechas)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND CONSTRAINT_NAME='FK_tbn1_z3_actu_fact_tbn1_z3_actu_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ADD CONSTRAINT FK_tbn1_z3_actu_fact_tbn1_z3_actu_dim_contribuyentes FOREIGN KEY (id_dim_contribuyentes) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_contribuyentes(id_dim_contribuyentes)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND CONSTRAINT_NAME='FK_tbn1_z3_actu_fact_tbn1_z3_actu_dim_actuaciones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ADD CONSTRAINT FK_tbn1_z3_actu_fact_tbn1_z3_actu_dim_actuaciones FOREIGN KEY (id_dim_actuaciones) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_actuaciones(id_dim_actuaciones)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND CONSTRAINT_NAME='FK_tbn1_z3_actu_fact_tbn1_z3_actu_dim_detalles_actuacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ADD CONSTRAINT FK_tbn1_z3_actu_fact_tbn1_z3_actu_dim_detalles_actuacion FOREIGN KEY (id_dim_detalles_actuacion) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_detalles_actuacion(id_dim_detalles_actuacion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND CONSTRAINT_NAME='FK_tbn1_z3_actu_fact_tbn1_z3_actu_dim_fechas_gastos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ADD CONSTRAINT FK_tbn1_z3_actu_fact_tbn1_z3_actu_dim_fechas_gastos FOREIGN KEY (id_dim_fechas_gastos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas_gastos(id_dim_fechas_gastos)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND CONSTRAINT_NAME='FK_tbn1_z3_actu_fact_tbn1_z3_actu_dim_valores')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ADD CONSTRAINT FK_tbn1_z3_actu_fact_tbn1_z3_actu_dim_valores FOREIGN KEY (id_dim_valores) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_valores(id_dim_valores)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_fact' AND CONSTRAINT_NAME='FK_tbn1_z3_actu_fact_tbn1_z3_actu_dim_deudas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact ADD CONSTRAINT FK_tbn1_z3_actu_fact_tbn1_z3_actu_dim_deudas FOREIGN KEY (id_dim_deudas) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_deudas(id_dim_deudas)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_z3_actu_fact' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_z3_actu_fact;
GO

CREATE PROCEDURE dbo.spn1_cargar_z3_actu_fact(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_z3_actu_fact'
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
			actuaciones.id_dim_actuaciones AS id_dim_actuaciones,
			detalles_actuacion.id_dim_detalles_actuacion AS id_dim_detalles_actuacion,
			fechas_gastos.id_dim_fechas_gastos AS id_dim_fechas_gastos,
			valores.id_dim_valores AS id_dim_valores,
			deudas.id_dim_deudas AS id_dim_deudas,
			sum(ds_t.importe) AS importe,
			sum(ds_t.importe_actuacion) AS importe_actuacion,
			sum(ds_t.saldo_actual_gastos) AS saldo_actual_gastos,
			sum(ds_t.importe_embargable) AS importe_embargable,
			sum(ds_t.importe_principal) AS importe_principal,
			sum(ds_t.importe_demora) AS importe_demora,
			sum(ds_t.importe_recargo) AS importe_recargo,
			sum(ds_t.importe_contraido) AS importe_contraido
		FROM dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ds_t
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_expedientes AS expedientes ON (expedientes.id_expediente_z3=ds_t.id_expediente_z3 AND expedientes.num_expediente=ds_t.num_expediente)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas AS fechas ON (fechas.anyo_expediente=ds_t.anyo_expediente AND fechas.fec_actuacion=ds_t.fec_actuacion AND fechas.fec_actuacion_anterior=ds_t.fec_actuacion_anterior AND fechas.fec_actuacion_relacionada=ds_t.fec_actuacion_relacionada AND fechas.fec_actuacion_subasta=ds_t.fec_actuacion_subasta AND fechas.fec_visto_bueno=ds_t.fec_visto_bueno)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_contribuyentes AS contribuyentes ON (contribuyentes.id_contribuyente=ds_t.id_contribuyente AND contribuyentes.nif=ds_t.nif)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_actuaciones AS actuaciones ON (actuaciones.id_tipo_actuacion_z3=ds_t.id_tipo_actuacion_z3 AND actuaciones.id_tipo_actuacion=ds_t.id_tipo_actuacion AND actuaciones.num_empleado=ds_t.num_empleado AND actuaciones.oficina_recaudacion=ds_t.oficina_recaudacion AND actuaciones.id_tipo_actuacion_anterior=ds_t.id_tipo_actuacion_anterior AND actuaciones.id_referencia_actuacion=ds_t.id_referencia_actuacion AND actuaciones.id_tipo_actuacion_relacionada=ds_t.id_tipo_actuacion_relacionada AND actuaciones.id_tipo_actuacion_subasta=ds_t.id_tipo_actuacion_subasta AND actuaciones.es_ultima=ds_t.es_ultima)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_detalles_actuacion AS detalles_actuacion ON (detalles_actuacion.control_salida=ds_t.control_salida AND detalles_actuacion.motivo_levantamiento=ds_t.motivo_levantamiento AND detalles_actuacion.situacion=ds_t.situacion AND detalles_actuacion.id_organismo_anotacion_preventiva=ds_t.id_organismo_anotacion_preventiva AND detalles_actuacion.id_tipo_unidad_familiar=ds_t.id_tipo_unidad_familiar AND detalles_actuacion.es_actuacion_reconstruida=ds_t.es_actuacion_reconstruida AND detalles_actuacion.auto_judicial=ds_t.auto_judicial AND detalles_actuacion.expediente_relacionado=ds_t.expediente_relacionado AND detalles_actuacion.act_definitiva_pasada_Z3=ds_t.act_definitiva_pasada_Z3 AND detalles_actuacion.clase_embargo=ds_t.clase_embargo AND detalles_actuacion.sentencia_judicial=ds_t.sentencia_judicial)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas_gastos AS fechas_gastos ON (fechas_gastos.fecha_embargo=ds_t.fecha_embargo AND fechas_gastos.fecha_anotacion=ds_t.fecha_anotacion AND fechas_gastos.fecha_prorroga=ds_t.fecha_prorroga AND fechas_gastos.fecha_rectificacion_negativa=ds_t.fecha_rectificacion_negativa AND fechas_gastos.fecha_cancelacion=ds_t.fecha_cancelacion AND fechas_gastos.fecha_prevista_prorroga=ds_t.fecha_prevista_prorroga)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_valores AS valores ON (valores.tipo_documento=ds_t.tipo_documento AND valores.documento=ds_t.documento AND valores.a_favor_de=ds_t.a_favor_de)
		INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_deudas AS deudas ON (deudas.id_deuda=ds_t.id_deuda)
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			expedientes.id_dim_expedientes,
			fechas.id_dim_fechas,
			contribuyentes.id_dim_contribuyentes,
			actuaciones.id_dim_actuaciones,
			detalles_actuacion.id_dim_detalles_actuacion,
			fechas_gastos.id_dim_fechas_gastos,
			valores.id_dim_valores,
			deudas.id_dim_deudas
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact AS tbn1_z3_actu_fact
	USING query ON query.id_dim_expedientes=tbn1_z3_actu_fact.id_dim_expedientes AND query.id_dim_fechas=tbn1_z3_actu_fact.id_dim_fechas AND query.id_dim_contribuyentes=tbn1_z3_actu_fact.id_dim_contribuyentes AND query.id_dim_actuaciones=tbn1_z3_actu_fact.id_dim_actuaciones AND query.id_dim_detalles_actuacion=tbn1_z3_actu_fact.id_dim_detalles_actuacion AND query.id_dim_fechas_gastos=tbn1_z3_actu_fact.id_dim_fechas_gastos AND query.id_dim_valores=tbn1_z3_actu_fact.id_dim_valores AND query.id_dim_deudas=tbn1_z3_actu_fact.id_dim_deudas
	WHEN MATCHED AND ((tbn1_z3_actu_fact.importe<>query.importe OR (tbn1_z3_actu_fact.importe IS NULL AND query.importe IS NOT NULL) OR (tbn1_z3_actu_fact.importe IS NOT NULL AND query.importe IS NULL)
			OR tbn1_z3_actu_fact.importe_actuacion<>query.importe_actuacion OR (tbn1_z3_actu_fact.importe_actuacion IS NULL AND query.importe_actuacion IS NOT NULL) OR (tbn1_z3_actu_fact.importe_actuacion IS NOT NULL AND query.importe_actuacion IS NULL)
			OR tbn1_z3_actu_fact.saldo_actual_gastos<>query.saldo_actual_gastos OR (tbn1_z3_actu_fact.saldo_actual_gastos IS NULL AND query.saldo_actual_gastos IS NOT NULL) OR (tbn1_z3_actu_fact.saldo_actual_gastos IS NOT NULL AND query.saldo_actual_gastos IS NULL)
			OR tbn1_z3_actu_fact.importe_embargable<>query.importe_embargable OR (tbn1_z3_actu_fact.importe_embargable IS NULL AND query.importe_embargable IS NOT NULL) OR (tbn1_z3_actu_fact.importe_embargable IS NOT NULL AND query.importe_embargable IS NULL)
			OR tbn1_z3_actu_fact.importe_principal<>query.importe_principal OR (tbn1_z3_actu_fact.importe_principal IS NULL AND query.importe_principal IS NOT NULL) OR (tbn1_z3_actu_fact.importe_principal IS NOT NULL AND query.importe_principal IS NULL)
			OR tbn1_z3_actu_fact.importe_demora<>query.importe_demora OR (tbn1_z3_actu_fact.importe_demora IS NULL AND query.importe_demora IS NOT NULL) OR (tbn1_z3_actu_fact.importe_demora IS NOT NULL AND query.importe_demora IS NULL)
			OR tbn1_z3_actu_fact.importe_recargo<>query.importe_recargo OR (tbn1_z3_actu_fact.importe_recargo IS NULL AND query.importe_recargo IS NOT NULL) OR (tbn1_z3_actu_fact.importe_recargo IS NOT NULL AND query.importe_recargo IS NULL)
			OR tbn1_z3_actu_fact.importe_contraido<>query.importe_contraido OR (tbn1_z3_actu_fact.importe_contraido IS NULL AND query.importe_contraido IS NOT NULL) OR (tbn1_z3_actu_fact.importe_contraido IS NOT NULL AND query.importe_contraido IS NULL))) THEN
		UPDATE SET
			importe=query.importe,
			importe_actuacion=query.importe_actuacion,
			saldo_actual_gastos=query.saldo_actual_gastos,
			importe_embargable=query.importe_embargable,
			importe_principal=query.importe_principal,
			importe_demora=query.importe_demora,
			importe_recargo=query.importe_recargo,
			importe_contraido=query.importe_contraido
	WHEN NOT MATCHED THEN
		INSERT (id_dim_expedientes,id_dim_fechas,id_dim_contribuyentes,id_dim_actuaciones,id_dim_detalles_actuacion,id_dim_fechas_gastos,id_dim_valores,id_dim_deudas,importe,importe_actuacion,saldo_actual_gastos,importe_embargable,importe_principal,importe_demora,importe_recargo,importe_contraido) VALUES (
			query.id_dim_expedientes,
			query.id_dim_fechas,
			query.id_dim_contribuyentes,
			query.id_dim_actuaciones,
			query.id_dim_detalles_actuacion,
			query.id_dim_fechas_gastos,
			query.id_dim_valores,
			query.id_dim_deudas,
			query.importe,
			query.importe_actuacion,
			query.saldo_actual_gastos,
			query.importe_embargable,
			query.importe_principal,
			query.importe_demora,
			query.importe_recargo,
			query.importe_contraido
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_z3_dm_actuaciones' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_z3_dm_actuaciones;
GO

CREATE PROCEDURE dbo.spn1_cargar_z3_dm_actuaciones(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_z3_dm_actuaciones'
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
		EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_z3_actu_dim_expedientes @log;
		EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_z3_actu_dim_fechas @log;
		EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_z3_actu_dim_contribuyentes @log;
		EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_z3_actu_dim_actuaciones @log;
		EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_z3_actu_dim_detalles_actuacion @log;
		EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_z3_actu_dim_fechas_gastos @log;
		EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_z3_actu_dim_valores @log;
		EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_z3_actu_dim_deudas @log;
		EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_z3_actu_fact @log;
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

