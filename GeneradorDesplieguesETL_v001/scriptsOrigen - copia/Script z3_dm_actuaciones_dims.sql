PRINT 'dimensional_z3_actu_dims.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_expedientes')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_expedientes(
	id_dim_expedientes int IDENTITY(1,1),
	id_expediente_z3 int NOT NULL,
	num_expediente numeric(6) NOT NULL,
	CONSTRAINT uk_z3_actu_dim_expedientes UNIQUE (id_expediente_z3,num_expediente),
	CONSTRAINT FK_tbn1_z3_actu_dim_expedientes_tbn1_dim_ot_z3_expedientes_embargo FOREIGN KEY (id_expediente_z3) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_ot_z3_expedientes_embargo(id_expediente_z3),
	CONSTRAINT PK_tbn1_z3_actu_dim_expedientes PRIMARY KEY CLUSTERED (id_dim_expedientes)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_expedientes' AND COLUMN_NAME='id_dim_expedientes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_expedientes ADD id_dim_expedientes int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_expedientes' AND COLUMN_NAME='id_expediente_z3')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_expedientes ADD id_expediente_z3 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_expedientes' AND COLUMN_NAME='num_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_expedientes ADD num_expediente numeric(6)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_expedientes' AND COLUMN_NAME='id_dim_expedientes' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_expedientes ALTER COLUMN id_dim_expedientes int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_expedientes' AND COLUMN_NAME='id_expediente_z3' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_expedientes ALTER COLUMN id_expediente_z3 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_expedientes' AND COLUMN_NAME='num_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_expedientes ALTER COLUMN num_expediente numeric(6) NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_expedientes' AND CONSTRAINT_NAME='PK_tbn1_z3_actu_dim_expedientes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_expedientes ADD CONSTRAINT PK_tbn1_z3_actu_dim_expedientes PRIMARY KEY CLUSTERED (id_dim_expedientes)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_expedientes' AND CONSTRAINT_NAME='FK_tbn1_z3_actu_dim_expedientes_tbn1_dim_ot_z3_expedientes_embargo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_expedientes ADD CONSTRAINT FK_tbn1_z3_actu_dim_expedientes_tbn1_dim_ot_z3_expedientes_embargo FOREIGN KEY (id_expediente_z3) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_ot_z3_expedientes_embargo(id_expediente_z3)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_z3_actu_dim_expedientes' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_z3_actu_dim_expedientes;
GO

CREATE PROCEDURE dbo.spn1_cargar_z3_actu_dim_expedientes(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_z3_actu_dim_expedientes'
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
			id_expediente_z3,
			num_expediente
		FROM dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			id_expediente_z3,
			num_expediente
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_expedientes AS tbn1_z3_actu_dim_expedientes
	USING query ON query.id_expediente_z3=tbn1_z3_actu_dim_expedientes.id_expediente_z3 AND query.num_expediente=tbn1_z3_actu_dim_expedientes.num_expediente
	WHEN NOT MATCHED THEN
		INSERT (id_expediente_z3,num_expediente) VALUES (
			query.id_expediente_z3,
			query.num_expediente)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_fechas')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas(
	id_dim_fechas int IDENTITY(1,1),
	anyo_expediente numeric(4) NOT NULL,
	fec_actuacion date NOT NULL,
	fec_actuacion_anterior date NOT NULL,
	fec_actuacion_relacionada date NOT NULL,
	fec_actuacion_subasta date NOT NULL,
	fec_visto_bueno date NOT NULL,
	CONSTRAINT uk_z3_actu_dim_fechas UNIQUE (anyo_expediente,fec_actuacion,fec_actuacion_anterior,fec_actuacion_relacionada,fec_actuacion_subasta,fec_visto_bueno),
	CONSTRAINT PK_tbn1_z3_actu_dim_fechas PRIMARY KEY CLUSTERED (id_dim_fechas)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_fechas' AND COLUMN_NAME='id_dim_fechas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas ADD id_dim_fechas int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_fechas' AND COLUMN_NAME='anyo_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas ADD anyo_expediente numeric(4)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_fechas' AND COLUMN_NAME='fec_actuacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas ADD fec_actuacion date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_fechas' AND COLUMN_NAME='fec_actuacion_anterior')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas ADD fec_actuacion_anterior date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_fechas' AND COLUMN_NAME='fec_actuacion_relacionada')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas ADD fec_actuacion_relacionada date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_fechas' AND COLUMN_NAME='fec_actuacion_subasta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas ADD fec_actuacion_subasta date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_fechas' AND COLUMN_NAME='fec_visto_bueno')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas ADD fec_visto_bueno date
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_fechas' AND COLUMN_NAME='id_dim_fechas' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas ALTER COLUMN id_dim_fechas int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_fechas' AND COLUMN_NAME='anyo_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas ALTER COLUMN anyo_expediente numeric(4) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_fechas' AND COLUMN_NAME='fec_actuacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas ALTER COLUMN fec_actuacion date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_fechas' AND COLUMN_NAME='fec_actuacion_anterior' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas ALTER COLUMN fec_actuacion_anterior date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_fechas' AND COLUMN_NAME='fec_actuacion_relacionada' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas ALTER COLUMN fec_actuacion_relacionada date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_fechas' AND COLUMN_NAME='fec_actuacion_subasta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas ALTER COLUMN fec_actuacion_subasta date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_fechas' AND COLUMN_NAME='fec_visto_bueno' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas ALTER COLUMN fec_visto_bueno date NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_fechas' AND CONSTRAINT_NAME='PK_tbn1_z3_actu_dim_fechas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas ADD CONSTRAINT PK_tbn1_z3_actu_dim_fechas PRIMARY KEY CLUSTERED (id_dim_fechas)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_z3_actu_dim_fechas' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_z3_actu_dim_fechas;
GO

CREATE PROCEDURE dbo.spn1_cargar_z3_actu_dim_fechas(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_z3_actu_dim_fechas'
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
			anyo_expediente,
			fec_actuacion,
			fec_actuacion_anterior,
			fec_actuacion_relacionada,
			fec_actuacion_subasta,
			fec_visto_bueno
		FROM dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			anyo_expediente,
			fec_actuacion,
			fec_actuacion_anterior,
			fec_actuacion_relacionada,
			fec_actuacion_subasta,
			fec_visto_bueno
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas AS tbn1_z3_actu_dim_fechas
	USING query ON query.anyo_expediente=tbn1_z3_actu_dim_fechas.anyo_expediente AND query.fec_actuacion=tbn1_z3_actu_dim_fechas.fec_actuacion AND query.fec_actuacion_anterior=tbn1_z3_actu_dim_fechas.fec_actuacion_anterior AND query.fec_actuacion_relacionada=tbn1_z3_actu_dim_fechas.fec_actuacion_relacionada AND query.fec_actuacion_subasta=tbn1_z3_actu_dim_fechas.fec_actuacion_subasta AND query.fec_visto_bueno=tbn1_z3_actu_dim_fechas.fec_visto_bueno
	WHEN NOT MATCHED THEN
		INSERT (anyo_expediente,fec_actuacion,fec_actuacion_anterior,fec_actuacion_relacionada,fec_actuacion_subasta,fec_visto_bueno) VALUES (
			query.anyo_expediente,
			query.fec_actuacion,
			query.fec_actuacion_anterior,
			query.fec_actuacion_relacionada,
			query.fec_actuacion_subasta,
			query.fec_visto_bueno)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_contribuyentes')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_contribuyentes(
	id_dim_contribuyentes int IDENTITY(1,1),
	id_contribuyente int NOT NULL,
	nif varchar(11) NOT NULL,
	CONSTRAINT uk_z3_actu_dim_contribuyentes UNIQUE (id_contribuyente,nif),
	CONSTRAINT FK_tbn1_z3_actu_dim_contribuyentes_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente),
	CONSTRAINT PK_tbn1_z3_actu_dim_contribuyentes PRIMARY KEY CLUSTERED (id_dim_contribuyentes)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_contribuyentes' AND COLUMN_NAME='id_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_contribuyentes ADD id_dim_contribuyentes int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_contribuyentes' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_contribuyentes ADD id_contribuyente int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_contribuyentes' AND COLUMN_NAME='nif')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_contribuyentes ADD nif varchar(11)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_contribuyentes' AND COLUMN_NAME='id_dim_contribuyentes' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_contribuyentes ALTER COLUMN id_dim_contribuyentes int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_contribuyentes' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_contribuyentes ALTER COLUMN id_contribuyente int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_contribuyentes' AND COLUMN_NAME='nif' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_contribuyentes ALTER COLUMN nif varchar(11) NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_contribuyentes' AND CONSTRAINT_NAME='PK_tbn1_z3_actu_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_contribuyentes ADD CONSTRAINT PK_tbn1_z3_actu_dim_contribuyentes PRIMARY KEY CLUSTERED (id_dim_contribuyentes)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_contribuyentes' AND CONSTRAINT_NAME='FK_tbn1_z3_actu_dim_contribuyentes_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_contribuyentes ADD CONSTRAINT FK_tbn1_z3_actu_dim_contribuyentes_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_z3_actu_dim_contribuyentes' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_z3_actu_dim_contribuyentes;
GO

CREATE PROCEDURE dbo.spn1_cargar_z3_actu_dim_contribuyentes(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_z3_actu_dim_contribuyentes'
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
			id_contribuyente,
			nif
		FROM dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			id_contribuyente,
			nif
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_contribuyentes AS tbn1_z3_actu_dim_contribuyentes
	USING query ON query.id_contribuyente=tbn1_z3_actu_dim_contribuyentes.id_contribuyente AND query.nif=tbn1_z3_actu_dim_contribuyentes.nif
	WHEN NOT MATCHED THEN
		INSERT (id_contribuyente,nif) VALUES (
			query.id_contribuyente,
			query.nif)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_actuaciones')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_actuaciones(
	id_dim_actuaciones int IDENTITY(1,1),
	id_tipo_actuacion_z3 int NOT NULL,
	id_tipo_actuacion int NOT NULL,
	num_empleado varchar(8) NOT NULL,
	oficina_recaudacion varchar(4) NOT NULL,
	id_tipo_actuacion_anterior int NOT NULL,
	id_referencia_actuacion int NOT NULL,
	id_tipo_actuacion_relacionada int NOT NULL,
	id_tipo_actuacion_subasta int NOT NULL,
	es_ultima bit NOT NULL,
	CONSTRAINT uk_z3_actu_dim_actuaciones UNIQUE (id_tipo_actuacion_z3,id_tipo_actuacion,num_empleado,oficina_recaudacion,id_tipo_actuacion_anterior,id_referencia_actuacion,id_tipo_actuacion_relacionada,id_tipo_actuacion_subasta,es_ultima),
	CONSTRAINT FK_tbn1_z3_actu_dim_actuaciones_tbn1_dim_ot_z3_actuaciones_embargo FOREIGN KEY (id_tipo_actuacion_z3) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_ot_z3_actuaciones_embargo(id_tipo_actuacion_z3),
	CONSTRAINT FK_tbn1_z3_actu_dim_actuaciones_tbn1_ot_z3_tipos_actuacion FOREIGN KEY (id_tipo_actuacion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_ot_z3_tipos_actuacion(id_tipo_actuacion),
	CONSTRAINT FK_tbn1_z3_actu_dim_actuaciones_tbn1_ot_z3_tipos_actuacion1 FOREIGN KEY (id_tipo_actuacion_anterior) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_ot_z3_tipos_actuacion(id_tipo_actuacion),
	CONSTRAINT FK_tbn1_z3_actu_dim_actuaciones_tbn1_ot_z3_referencias_actuaciones FOREIGN KEY (id_referencia_actuacion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_ot_z3_referencias_actuaciones(id_referencia_actuacion),
	CONSTRAINT FK_tbn1_z3_actu_dim_actuaciones_tbn1_ot_z3_tipos_actuacion2 FOREIGN KEY (id_tipo_actuacion_relacionada) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_ot_z3_tipos_actuacion(id_tipo_actuacion),
	CONSTRAINT FK_tbn1_z3_actu_dim_actuaciones_tbn1_ot_z3_tipos_actuacion3 FOREIGN KEY (id_tipo_actuacion_subasta) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_ot_z3_tipos_actuacion(id_tipo_actuacion),
	CONSTRAINT PK_tbn1_z3_actu_dim_actuaciones PRIMARY KEY CLUSTERED (id_dim_actuaciones)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_actuaciones' AND COLUMN_NAME='id_dim_actuaciones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_actuaciones ADD id_dim_actuaciones int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_actuaciones' AND COLUMN_NAME='id_tipo_actuacion_z3')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_actuaciones ADD id_tipo_actuacion_z3 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_actuaciones' AND COLUMN_NAME='id_tipo_actuacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_actuaciones ADD id_tipo_actuacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_actuaciones' AND COLUMN_NAME='num_empleado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_actuaciones ADD num_empleado varchar(8)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_actuaciones' AND COLUMN_NAME='oficina_recaudacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_actuaciones ADD oficina_recaudacion varchar(4)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_actuaciones' AND COLUMN_NAME='id_tipo_actuacion_anterior')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_actuaciones ADD id_tipo_actuacion_anterior int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_actuaciones' AND COLUMN_NAME='id_referencia_actuacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_actuaciones ADD id_referencia_actuacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_actuaciones' AND COLUMN_NAME='id_tipo_actuacion_relacionada')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_actuaciones ADD id_tipo_actuacion_relacionada int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_actuaciones' AND COLUMN_NAME='id_tipo_actuacion_subasta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_actuaciones ADD id_tipo_actuacion_subasta int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_actuaciones' AND COLUMN_NAME='es_ultima')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_actuaciones ADD es_ultima bit
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_actuaciones' AND COLUMN_NAME='id_dim_actuaciones' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_actuaciones ALTER COLUMN id_dim_actuaciones int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_actuaciones' AND COLUMN_NAME='id_tipo_actuacion_z3' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_actuaciones ALTER COLUMN id_tipo_actuacion_z3 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_actuaciones' AND COLUMN_NAME='id_tipo_actuacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_actuaciones ALTER COLUMN id_tipo_actuacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_actuaciones' AND COLUMN_NAME='num_empleado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_actuaciones ALTER COLUMN num_empleado varchar(8) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_actuaciones' AND COLUMN_NAME='oficina_recaudacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_actuaciones ALTER COLUMN oficina_recaudacion varchar(4) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_actuaciones' AND COLUMN_NAME='id_tipo_actuacion_anterior' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_actuaciones ALTER COLUMN id_tipo_actuacion_anterior int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_actuaciones' AND COLUMN_NAME='id_referencia_actuacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_actuaciones ALTER COLUMN id_referencia_actuacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_actuaciones' AND COLUMN_NAME='id_tipo_actuacion_relacionada' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_actuaciones ALTER COLUMN id_tipo_actuacion_relacionada int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_actuaciones' AND COLUMN_NAME='id_tipo_actuacion_subasta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_actuaciones ALTER COLUMN id_tipo_actuacion_subasta int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_actuaciones' AND COLUMN_NAME='es_ultima' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_actuaciones ALTER COLUMN es_ultima bit NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_actuaciones' AND CONSTRAINT_NAME='PK_tbn1_z3_actu_dim_actuaciones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_actuaciones ADD CONSTRAINT PK_tbn1_z3_actu_dim_actuaciones PRIMARY KEY CLUSTERED (id_dim_actuaciones)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_actuaciones' AND CONSTRAINT_NAME='FK_tbn1_z3_actu_dim_actuaciones_tbn1_dim_ot_z3_actuaciones_embargo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_actuaciones ADD CONSTRAINT FK_tbn1_z3_actu_dim_actuaciones_tbn1_dim_ot_z3_actuaciones_embargo FOREIGN KEY (id_tipo_actuacion_z3) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_ot_z3_actuaciones_embargo(id_tipo_actuacion_z3)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_actuaciones' AND CONSTRAINT_NAME='FK_tbn1_z3_actu_dim_actuaciones_tbn1_ot_z3_tipos_actuacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_actuaciones ADD CONSTRAINT FK_tbn1_z3_actu_dim_actuaciones_tbn1_ot_z3_tipos_actuacion FOREIGN KEY (id_tipo_actuacion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_ot_z3_tipos_actuacion(id_tipo_actuacion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_actuaciones' AND CONSTRAINT_NAME='FK_tbn1_z3_actu_dim_actuaciones_tbn1_ot_z3_tipos_actuacion1')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_actuaciones ADD CONSTRAINT FK_tbn1_z3_actu_dim_actuaciones_tbn1_ot_z3_tipos_actuacion1 FOREIGN KEY (id_tipo_actuacion_anterior) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_ot_z3_tipos_actuacion(id_tipo_actuacion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_actuaciones' AND CONSTRAINT_NAME='FK_tbn1_z3_actu_dim_actuaciones_tbn1_ot_z3_referencias_actuaciones')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_actuaciones ADD CONSTRAINT FK_tbn1_z3_actu_dim_actuaciones_tbn1_ot_z3_referencias_actuaciones FOREIGN KEY (id_referencia_actuacion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_ot_z3_referencias_actuaciones(id_referencia_actuacion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_actuaciones' AND CONSTRAINT_NAME='FK_tbn1_z3_actu_dim_actuaciones_tbn1_ot_z3_tipos_actuacion2')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_actuaciones ADD CONSTRAINT FK_tbn1_z3_actu_dim_actuaciones_tbn1_ot_z3_tipos_actuacion2 FOREIGN KEY (id_tipo_actuacion_relacionada) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_ot_z3_tipos_actuacion(id_tipo_actuacion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_actuaciones' AND CONSTRAINT_NAME='FK_tbn1_z3_actu_dim_actuaciones_tbn1_ot_z3_tipos_actuacion3')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_actuaciones ADD CONSTRAINT FK_tbn1_z3_actu_dim_actuaciones_tbn1_ot_z3_tipos_actuacion3 FOREIGN KEY (id_tipo_actuacion_subasta) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_ot_z3_tipos_actuacion(id_tipo_actuacion)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_z3_actu_dim_actuaciones' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_z3_actu_dim_actuaciones;
GO

CREATE PROCEDURE dbo.spn1_cargar_z3_actu_dim_actuaciones(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_z3_actu_dim_actuaciones'
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
			id_tipo_actuacion_z3,
			id_tipo_actuacion,
			num_empleado,
			oficina_recaudacion,
			id_tipo_actuacion_anterior,
			id_referencia_actuacion,
			id_tipo_actuacion_relacionada,
			id_tipo_actuacion_subasta,
			es_ultima
		FROM dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			id_tipo_actuacion_z3,
			id_tipo_actuacion,
			num_empleado,
			oficina_recaudacion,
			id_tipo_actuacion_anterior,
			id_referencia_actuacion,
			id_tipo_actuacion_relacionada,
			id_tipo_actuacion_subasta,
			es_ultima
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_actuaciones AS tbn1_z3_actu_dim_actuaciones
	USING query ON query.id_tipo_actuacion_z3=tbn1_z3_actu_dim_actuaciones.id_tipo_actuacion_z3 AND query.id_tipo_actuacion=tbn1_z3_actu_dim_actuaciones.id_tipo_actuacion AND query.num_empleado=tbn1_z3_actu_dim_actuaciones.num_empleado AND query.oficina_recaudacion=tbn1_z3_actu_dim_actuaciones.oficina_recaudacion AND query.id_tipo_actuacion_anterior=tbn1_z3_actu_dim_actuaciones.id_tipo_actuacion_anterior AND query.id_referencia_actuacion=tbn1_z3_actu_dim_actuaciones.id_referencia_actuacion AND query.id_tipo_actuacion_relacionada=tbn1_z3_actu_dim_actuaciones.id_tipo_actuacion_relacionada AND query.id_tipo_actuacion_subasta=tbn1_z3_actu_dim_actuaciones.id_tipo_actuacion_subasta AND query.es_ultima=tbn1_z3_actu_dim_actuaciones.es_ultima
	WHEN NOT MATCHED THEN
		INSERT (id_tipo_actuacion_z3,id_tipo_actuacion,num_empleado,oficina_recaudacion,id_tipo_actuacion_anterior,id_referencia_actuacion,id_tipo_actuacion_relacionada,id_tipo_actuacion_subasta,es_ultima) VALUES (
			query.id_tipo_actuacion_z3,
			query.id_tipo_actuacion,
			query.num_empleado,
			query.oficina_recaudacion,
			query.id_tipo_actuacion_anterior,
			query.id_referencia_actuacion,
			query.id_tipo_actuacion_relacionada,
			query.id_tipo_actuacion_subasta,
			query.es_ultima)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_detalles_actuacion')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_detalles_actuacion(
	id_dim_detalles_actuacion int IDENTITY(1,1),
	control_salida varchar(2) NOT NULL,
	motivo_levantamiento varchar(1) NOT NULL,
	situacion varchar(2) NOT NULL,
	id_organismo_anotacion_preventiva int NOT NULL,
	id_tipo_unidad_familiar int NOT NULL,
	es_actuacion_reconstruida bit NOT NULL,
	auto_judicial varchar(12) NOT NULL,
	expediente_relacionado varchar(10) NOT NULL,
	act_definitiva_pasada_Z3 bit NOT NULL,
	clase_embargo varchar(2) NOT NULL,
	sentencia_judicial varchar(30) NOT NULL,
	CONSTRAINT uk_z3_actu_dim_detalles_actuacion UNIQUE (control_salida,motivo_levantamiento,situacion,id_organismo_anotacion_preventiva,id_tipo_unidad_familiar,es_actuacion_reconstruida,auto_judicial,expediente_relacionado,act_definitiva_pasada_Z3,clase_embargo,sentencia_judicial),
	CONSTRAINT FK_tbn1_z3_actu_dim_detalles_actuacion_tbn1_ot_z3_organismos_anotacion_preventiva FOREIGN KEY (id_organismo_anotacion_preventiva) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_ot_z3_organismos_anotacion_preventiva(id_organismo_anotacion_preventiva),
	CONSTRAINT FK_tbn1_z3_actu_dim_detalles_actuacion_tbn1_ot_z3_tipos_unidad_familiar FOREIGN KEY (id_tipo_unidad_familiar) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_ot_z3_tipos_unidad_familiar(id_tipo_unidad_familiar),
	CONSTRAINT PK_tbn1_z3_actu_dim_detalles_actuacion PRIMARY KEY CLUSTERED (id_dim_detalles_actuacion)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_detalles_actuacion' AND COLUMN_NAME='id_dim_detalles_actuacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_detalles_actuacion ADD id_dim_detalles_actuacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_detalles_actuacion' AND COLUMN_NAME='control_salida')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_detalles_actuacion ADD control_salida varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_detalles_actuacion' AND COLUMN_NAME='motivo_levantamiento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_detalles_actuacion ADD motivo_levantamiento varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_detalles_actuacion' AND COLUMN_NAME='situacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_detalles_actuacion ADD situacion varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_detalles_actuacion' AND COLUMN_NAME='id_organismo_anotacion_preventiva')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_detalles_actuacion ADD id_organismo_anotacion_preventiva int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_detalles_actuacion' AND COLUMN_NAME='id_tipo_unidad_familiar')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_detalles_actuacion ADD id_tipo_unidad_familiar int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_detalles_actuacion' AND COLUMN_NAME='es_actuacion_reconstruida')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_detalles_actuacion ADD es_actuacion_reconstruida bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_detalles_actuacion' AND COLUMN_NAME='auto_judicial')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_detalles_actuacion ADD auto_judicial varchar(12)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_detalles_actuacion' AND COLUMN_NAME='expediente_relacionado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_detalles_actuacion ADD expediente_relacionado varchar(10)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_detalles_actuacion' AND COLUMN_NAME='act_definitiva_pasada_Z3')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_detalles_actuacion ADD act_definitiva_pasada_Z3 bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_detalles_actuacion' AND COLUMN_NAME='clase_embargo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_detalles_actuacion ADD clase_embargo varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_detalles_actuacion' AND COLUMN_NAME='sentencia_judicial')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_detalles_actuacion ADD sentencia_judicial varchar(30)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_detalles_actuacion' AND COLUMN_NAME='id_dim_detalles_actuacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_detalles_actuacion ALTER COLUMN id_dim_detalles_actuacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_detalles_actuacion' AND COLUMN_NAME='control_salida' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_detalles_actuacion ALTER COLUMN control_salida varchar(2) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_detalles_actuacion' AND COLUMN_NAME='motivo_levantamiento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_detalles_actuacion ALTER COLUMN motivo_levantamiento varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_detalles_actuacion' AND COLUMN_NAME='situacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_detalles_actuacion ALTER COLUMN situacion varchar(2) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_detalles_actuacion' AND COLUMN_NAME='id_organismo_anotacion_preventiva' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_detalles_actuacion ALTER COLUMN id_organismo_anotacion_preventiva int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_detalles_actuacion' AND COLUMN_NAME='id_tipo_unidad_familiar' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_detalles_actuacion ALTER COLUMN id_tipo_unidad_familiar int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_detalles_actuacion' AND COLUMN_NAME='es_actuacion_reconstruida' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_detalles_actuacion ALTER COLUMN es_actuacion_reconstruida bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_detalles_actuacion' AND COLUMN_NAME='auto_judicial' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_detalles_actuacion ALTER COLUMN auto_judicial varchar(12) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_detalles_actuacion' AND COLUMN_NAME='expediente_relacionado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_detalles_actuacion ALTER COLUMN expediente_relacionado varchar(10) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_detalles_actuacion' AND COLUMN_NAME='act_definitiva_pasada_Z3' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_detalles_actuacion ALTER COLUMN act_definitiva_pasada_Z3 bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_detalles_actuacion' AND COLUMN_NAME='clase_embargo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_detalles_actuacion ALTER COLUMN clase_embargo varchar(2) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_detalles_actuacion' AND COLUMN_NAME='sentencia_judicial' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_detalles_actuacion ALTER COLUMN sentencia_judicial varchar(30) NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_detalles_actuacion' AND CONSTRAINT_NAME='PK_tbn1_z3_actu_dim_detalles_actuacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_detalles_actuacion ADD CONSTRAINT PK_tbn1_z3_actu_dim_detalles_actuacion PRIMARY KEY CLUSTERED (id_dim_detalles_actuacion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_detalles_actuacion' AND CONSTRAINT_NAME='FK_tbn1_z3_actu_dim_detalles_actuacion_tbn1_ot_z3_organismos_anotacion_preventiva')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_detalles_actuacion ADD CONSTRAINT FK_tbn1_z3_actu_dim_detalles_actuacion_tbn1_ot_z3_organismos_anotacion_preventiva FOREIGN KEY (id_organismo_anotacion_preventiva) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_ot_z3_organismos_anotacion_preventiva(id_organismo_anotacion_preventiva)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_detalles_actuacion' AND CONSTRAINT_NAME='FK_tbn1_z3_actu_dim_detalles_actuacion_tbn1_ot_z3_tipos_unidad_familiar')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_detalles_actuacion ADD CONSTRAINT FK_tbn1_z3_actu_dim_detalles_actuacion_tbn1_ot_z3_tipos_unidad_familiar FOREIGN KEY (id_tipo_unidad_familiar) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_ot_z3_tipos_unidad_familiar(id_tipo_unidad_familiar)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_z3_actu_dim_detalles_actuacion' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_z3_actu_dim_detalles_actuacion;
GO

CREATE PROCEDURE dbo.spn1_cargar_z3_actu_dim_detalles_actuacion(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_z3_actu_dim_detalles_actuacion'
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
			control_salida,
			motivo_levantamiento,
			situacion,
			id_organismo_anotacion_preventiva,
			id_tipo_unidad_familiar,
			es_actuacion_reconstruida,
			auto_judicial,
			expediente_relacionado,
			act_definitiva_pasada_Z3,
			clase_embargo,
			sentencia_judicial
		FROM dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			control_salida,
			motivo_levantamiento,
			situacion,
			id_organismo_anotacion_preventiva,
			id_tipo_unidad_familiar,
			es_actuacion_reconstruida,
			auto_judicial,
			expediente_relacionado,
			act_definitiva_pasada_Z3,
			clase_embargo,
			sentencia_judicial
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_detalles_actuacion AS tbn1_z3_actu_dim_detalles_actuacion
	USING query ON query.control_salida=tbn1_z3_actu_dim_detalles_actuacion.control_salida AND query.motivo_levantamiento=tbn1_z3_actu_dim_detalles_actuacion.motivo_levantamiento AND query.situacion=tbn1_z3_actu_dim_detalles_actuacion.situacion AND query.id_organismo_anotacion_preventiva=tbn1_z3_actu_dim_detalles_actuacion.id_organismo_anotacion_preventiva AND query.id_tipo_unidad_familiar=tbn1_z3_actu_dim_detalles_actuacion.id_tipo_unidad_familiar AND query.es_actuacion_reconstruida=tbn1_z3_actu_dim_detalles_actuacion.es_actuacion_reconstruida AND query.auto_judicial=tbn1_z3_actu_dim_detalles_actuacion.auto_judicial AND query.expediente_relacionado=tbn1_z3_actu_dim_detalles_actuacion.expediente_relacionado AND query.act_definitiva_pasada_Z3=tbn1_z3_actu_dim_detalles_actuacion.act_definitiva_pasada_Z3 AND query.clase_embargo=tbn1_z3_actu_dim_detalles_actuacion.clase_embargo AND query.sentencia_judicial=tbn1_z3_actu_dim_detalles_actuacion.sentencia_judicial
	WHEN NOT MATCHED THEN
		INSERT (control_salida,motivo_levantamiento,situacion,id_organismo_anotacion_preventiva,id_tipo_unidad_familiar,es_actuacion_reconstruida,auto_judicial,expediente_relacionado,act_definitiva_pasada_Z3,clase_embargo,sentencia_judicial) VALUES (
			query.control_salida,
			query.motivo_levantamiento,
			query.situacion,
			query.id_organismo_anotacion_preventiva,
			query.id_tipo_unidad_familiar,
			query.es_actuacion_reconstruida,
			query.auto_judicial,
			query.expediente_relacionado,
			query.act_definitiva_pasada_Z3,
			query.clase_embargo,
			query.sentencia_judicial)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_fechas_gastos')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas_gastos(
	id_dim_fechas_gastos int IDENTITY(1,1),
	fecha_embargo date NOT NULL,
	fecha_anotacion date NOT NULL,
	fecha_prorroga date NOT NULL,
	fecha_rectificacion_negativa date NOT NULL,
	fecha_cancelacion date NOT NULL,
	fecha_prevista_prorroga date NOT NULL,
	CONSTRAINT uk_z3_actu_dim_fechas_gastos UNIQUE (fecha_embargo,fecha_anotacion,fecha_prorroga,fecha_rectificacion_negativa,fecha_cancelacion,fecha_prevista_prorroga),
	CONSTRAINT PK_tbn1_z3_actu_dim_fechas_gastos PRIMARY KEY CLUSTERED (id_dim_fechas_gastos)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_fechas_gastos' AND COLUMN_NAME='id_dim_fechas_gastos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas_gastos ADD id_dim_fechas_gastos int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_fechas_gastos' AND COLUMN_NAME='fecha_embargo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas_gastos ADD fecha_embargo date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_fechas_gastos' AND COLUMN_NAME='fecha_anotacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas_gastos ADD fecha_anotacion date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_fechas_gastos' AND COLUMN_NAME='fecha_prorroga')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas_gastos ADD fecha_prorroga date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_fechas_gastos' AND COLUMN_NAME='fecha_rectificacion_negativa')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas_gastos ADD fecha_rectificacion_negativa date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_fechas_gastos' AND COLUMN_NAME='fecha_cancelacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas_gastos ADD fecha_cancelacion date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_fechas_gastos' AND COLUMN_NAME='fecha_prevista_prorroga')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas_gastos ADD fecha_prevista_prorroga date
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_fechas_gastos' AND COLUMN_NAME='id_dim_fechas_gastos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas_gastos ALTER COLUMN id_dim_fechas_gastos int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_fechas_gastos' AND COLUMN_NAME='fecha_embargo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas_gastos ALTER COLUMN fecha_embargo date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_fechas_gastos' AND COLUMN_NAME='fecha_anotacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas_gastos ALTER COLUMN fecha_anotacion date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_fechas_gastos' AND COLUMN_NAME='fecha_prorroga' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas_gastos ALTER COLUMN fecha_prorroga date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_fechas_gastos' AND COLUMN_NAME='fecha_rectificacion_negativa' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas_gastos ALTER COLUMN fecha_rectificacion_negativa date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_fechas_gastos' AND COLUMN_NAME='fecha_cancelacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas_gastos ALTER COLUMN fecha_cancelacion date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_fechas_gastos' AND COLUMN_NAME='fecha_prevista_prorroga' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas_gastos ALTER COLUMN fecha_prevista_prorroga date NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_fechas_gastos' AND CONSTRAINT_NAME='PK_tbn1_z3_actu_dim_fechas_gastos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas_gastos ADD CONSTRAINT PK_tbn1_z3_actu_dim_fechas_gastos PRIMARY KEY CLUSTERED (id_dim_fechas_gastos)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_z3_actu_dim_fechas_gastos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_z3_actu_dim_fechas_gastos;
GO

CREATE PROCEDURE dbo.spn1_cargar_z3_actu_dim_fechas_gastos(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_z3_actu_dim_fechas_gastos'
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
			fecha_embargo,
			fecha_anotacion,
			fecha_prorroga,
			fecha_rectificacion_negativa,
			fecha_cancelacion,
			fecha_prevista_prorroga
		FROM dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			fecha_embargo,
			fecha_anotacion,
			fecha_prorroga,
			fecha_rectificacion_negativa,
			fecha_cancelacion,
			fecha_prevista_prorroga
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas_gastos AS tbn1_z3_actu_dim_fechas_gastos
	USING query ON query.fecha_embargo=tbn1_z3_actu_dim_fechas_gastos.fecha_embargo AND query.fecha_anotacion=tbn1_z3_actu_dim_fechas_gastos.fecha_anotacion AND query.fecha_prorroga=tbn1_z3_actu_dim_fechas_gastos.fecha_prorroga AND query.fecha_rectificacion_negativa=tbn1_z3_actu_dim_fechas_gastos.fecha_rectificacion_negativa AND query.fecha_cancelacion=tbn1_z3_actu_dim_fechas_gastos.fecha_cancelacion AND query.fecha_prevista_prorroga=tbn1_z3_actu_dim_fechas_gastos.fecha_prevista_prorroga
	WHEN NOT MATCHED THEN
		INSERT (fecha_embargo,fecha_anotacion,fecha_prorroga,fecha_rectificacion_negativa,fecha_cancelacion,fecha_prevista_prorroga) VALUES (
			query.fecha_embargo,
			query.fecha_anotacion,
			query.fecha_prorroga,
			query.fecha_rectificacion_negativa,
			query.fecha_cancelacion,
			query.fecha_prevista_prorroga)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_valores')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_valores(
	id_dim_valores int IDENTITY(1,1),
	tipo_documento varchar(2) NOT NULL,
	documento varchar(13) NOT NULL,
	a_favor_de varchar(1) NOT NULL,
	CONSTRAINT uk_z3_actu_dim_valores UNIQUE (tipo_documento,documento,a_favor_de),
	CONSTRAINT PK_tbn1_z3_actu_dim_valores PRIMARY KEY CLUSTERED (id_dim_valores)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_valores' AND COLUMN_NAME='id_dim_valores')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_valores ADD id_dim_valores int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_valores' AND COLUMN_NAME='tipo_documento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_valores ADD tipo_documento varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_valores' AND COLUMN_NAME='documento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_valores ADD documento varchar(13)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_valores' AND COLUMN_NAME='a_favor_de')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_valores ADD a_favor_de varchar(1)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_valores' AND COLUMN_NAME='id_dim_valores' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_valores ALTER COLUMN id_dim_valores int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_valores' AND COLUMN_NAME='tipo_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_valores ALTER COLUMN tipo_documento varchar(2) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_valores' AND COLUMN_NAME='documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_valores ALTER COLUMN documento varchar(13) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_valores' AND COLUMN_NAME='a_favor_de' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_valores ALTER COLUMN a_favor_de varchar(1) NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_valores' AND CONSTRAINT_NAME='PK_tbn1_z3_actu_dim_valores')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_valores ADD CONSTRAINT PK_tbn1_z3_actu_dim_valores PRIMARY KEY CLUSTERED (id_dim_valores)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_z3_actu_dim_valores' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_z3_actu_dim_valores;
GO

CREATE PROCEDURE dbo.spn1_cargar_z3_actu_dim_valores(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_z3_actu_dim_valores'
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
			tipo_documento,
			documento,
			a_favor_de
		FROM dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			tipo_documento,
			documento,
			a_favor_de
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_valores AS tbn1_z3_actu_dim_valores
	USING query ON query.tipo_documento=tbn1_z3_actu_dim_valores.tipo_documento AND query.documento=tbn1_z3_actu_dim_valores.documento AND query.a_favor_de=tbn1_z3_actu_dim_valores.a_favor_de
	WHEN NOT MATCHED THEN
		INSERT (tipo_documento,documento,a_favor_de) VALUES (
			query.tipo_documento,
			query.documento,
			query.a_favor_de)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_deudas')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_deudas(
	id_dim_deudas int IDENTITY(1,1),
	id_deuda int NOT NULL,
	CONSTRAINT uk_z3_actu_dim_deudas UNIQUE (id_deuda),
	CONSTRAINT PK_tbn1_z3_actu_dim_deudas PRIMARY KEY CLUSTERED (id_dim_deudas)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_deudas' AND COLUMN_NAME='id_dim_deudas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_deudas ADD id_dim_deudas int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_deudas' AND COLUMN_NAME='id_deuda')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_deudas ADD id_deuda int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_deudas' AND COLUMN_NAME='id_dim_deudas' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_deudas ALTER COLUMN id_dim_deudas int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_deudas' AND COLUMN_NAME='id_deuda' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_deudas ALTER COLUMN id_deuda int NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_actu_dim_deudas' AND CONSTRAINT_NAME='PK_tbn1_z3_actu_dim_deudas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_deudas ADD CONSTRAINT PK_tbn1_z3_actu_dim_deudas PRIMARY KEY CLUSTERED (id_dim_deudas)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_z3_actu_dim_deudas' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_z3_actu_dim_deudas;
GO

CREATE PROCEDURE dbo.spn1_cargar_z3_actu_dim_deudas(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_z3_actu_dim_deudas'
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
			id_deuda
		FROM dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			id_deuda
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_deudas AS tbn1_z3_actu_dim_deudas
	USING query ON query.id_deuda=tbn1_z3_actu_dim_deudas.id_deuda
	WHEN NOT MATCHED THEN
		INSERT (id_deuda) VALUES (
			query.id_deuda)
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

