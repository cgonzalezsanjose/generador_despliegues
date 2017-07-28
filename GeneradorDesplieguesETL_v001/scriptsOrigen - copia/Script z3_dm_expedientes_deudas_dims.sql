PRINT 'dimensional_z3_exp_deuda_dims.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_expedientes')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_expedientes(
	id_dim_expedientes int IDENTITY(1,1),
	id_expediente_z3 int NOT NULL,
	num_expediente numeric(6) NOT NULL,
	num_expediente_en_NF varchar(13) NOT NULL,
	CONSTRAINT uk_z3_exp_deuda_dim_expedientes UNIQUE (id_expediente_z3,num_expediente,num_expediente_en_NF),
	CONSTRAINT FK_tbn1_z3_exp_deuda_dim_expedientes_tbn1_dim_ot_z3_expedientes_embargo FOREIGN KEY (id_expediente_z3) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_ot_z3_expedientes_embargo(id_expediente_z3),
	CONSTRAINT PK_tbn1_z3_exp_deuda_dim_expedientes PRIMARY KEY CLUSTERED (id_dim_expedientes)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_expedientes' AND COLUMN_NAME='id_dim_expedientes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_expedientes ADD id_dim_expedientes int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_expedientes' AND COLUMN_NAME='id_expediente_z3')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_expedientes ADD id_expediente_z3 int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_expedientes' AND COLUMN_NAME='num_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_expedientes ADD num_expediente numeric(6)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_expedientes' AND COLUMN_NAME='num_expediente_en_NF')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_expedientes ADD num_expediente_en_NF varchar(13)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_expedientes' AND COLUMN_NAME='id_dim_expedientes' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_expedientes ALTER COLUMN id_dim_expedientes int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_expedientes' AND COLUMN_NAME='id_expediente_z3' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_expedientes ALTER COLUMN id_expediente_z3 int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_expedientes' AND COLUMN_NAME='num_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_expedientes ALTER COLUMN num_expediente numeric(6) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_expedientes' AND COLUMN_NAME='num_expediente_en_NF' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_expedientes ALTER COLUMN num_expediente_en_NF varchar(13) NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_expedientes' AND CONSTRAINT_NAME='PK_tbn1_z3_exp_deuda_dim_expedientes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_expedientes ADD CONSTRAINT PK_tbn1_z3_exp_deuda_dim_expedientes PRIMARY KEY CLUSTERED (id_dim_expedientes)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_expedientes' AND CONSTRAINT_NAME='FK_tbn1_z3_exp_deuda_dim_expedientes_tbn1_dim_ot_z3_expedientes_embargo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_expedientes ADD CONSTRAINT FK_tbn1_z3_exp_deuda_dim_expedientes_tbn1_dim_ot_z3_expedientes_embargo FOREIGN KEY (id_expediente_z3) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_ot_z3_expedientes_embargo(id_expediente_z3)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_z3_exp_deuda_dim_expedientes' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_z3_exp_deuda_dim_expedientes;
GO

CREATE PROCEDURE dbo.spn1_cargar_z3_exp_deuda_dim_expedientes(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_z3_exp_deuda_dim_expedientes'
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
			num_expediente,
			num_expediente_en_NF
		FROM dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			id_expediente_z3,
			num_expediente,
			num_expediente_en_NF
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_expedientes AS tbn1_z3_exp_deuda_dim_expedientes
	USING query ON query.id_expediente_z3=tbn1_z3_exp_deuda_dim_expedientes.id_expediente_z3 AND query.num_expediente=tbn1_z3_exp_deuda_dim_expedientes.num_expediente AND query.num_expediente_en_NF=tbn1_z3_exp_deuda_dim_expedientes.num_expediente_en_NF
	WHEN NOT MATCHED THEN
		INSERT (id_expediente_z3,num_expediente,num_expediente_en_NF) VALUES (
			query.id_expediente_z3,
			query.num_expediente,
			query.num_expediente_en_NF)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_fechas')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_fechas(
	id_dim_fechas int IDENTITY(1,1),
	anyo_expediente numeric(4) NOT NULL,
	fecha_asiento date NOT NULL,
	anyo_asiento int NOT NULL,
	mes_asiento int NOT NULL,
	fecha_contraido date NOT NULL,
	CONSTRAINT uk_z3_exp_deuda_dim_fechas UNIQUE (anyo_expediente,fecha_asiento,anyo_asiento,mes_asiento,fecha_contraido),
	CONSTRAINT PK_tbn1_z3_exp_deuda_dim_fechas PRIMARY KEY CLUSTERED (id_dim_fechas)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_fechas' AND COLUMN_NAME='id_dim_fechas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_fechas ADD id_dim_fechas int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_fechas' AND COLUMN_NAME='anyo_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_fechas ADD anyo_expediente numeric(4)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_fechas' AND COLUMN_NAME='fecha_asiento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_fechas ADD fecha_asiento date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_fechas' AND COLUMN_NAME='anyo_asiento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_fechas ADD anyo_asiento int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_fechas' AND COLUMN_NAME='mes_asiento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_fechas ADD mes_asiento int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_fechas' AND COLUMN_NAME='fecha_contraido')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_fechas ADD fecha_contraido date
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_fechas' AND COLUMN_NAME='id_dim_fechas' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_fechas ALTER COLUMN id_dim_fechas int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_fechas' AND COLUMN_NAME='anyo_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_fechas ALTER COLUMN anyo_expediente numeric(4) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_fechas' AND COLUMN_NAME='fecha_asiento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_fechas ALTER COLUMN fecha_asiento date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_fechas' AND COLUMN_NAME='anyo_asiento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_fechas ALTER COLUMN anyo_asiento int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_fechas' AND COLUMN_NAME='mes_asiento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_fechas ALTER COLUMN mes_asiento int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_fechas' AND COLUMN_NAME='fecha_contraido' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_fechas ALTER COLUMN fecha_contraido date NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_fechas' AND CONSTRAINT_NAME='PK_tbn1_z3_exp_deuda_dim_fechas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_fechas ADD CONSTRAINT PK_tbn1_z3_exp_deuda_dim_fechas PRIMARY KEY CLUSTERED (id_dim_fechas)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_z3_exp_deuda_dim_fechas' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_z3_exp_deuda_dim_fechas;
GO

CREATE PROCEDURE dbo.spn1_cargar_z3_exp_deuda_dim_fechas(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_z3_exp_deuda_dim_fechas'
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
			fecha_asiento,
			anyo_asiento,
			mes_asiento,
			fecha_contraido
		FROM dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			anyo_expediente,
			fecha_asiento,
			anyo_asiento,
			mes_asiento,
			fecha_contraido
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_fechas AS tbn1_z3_exp_deuda_dim_fechas
	USING query ON query.anyo_expediente=tbn1_z3_exp_deuda_dim_fechas.anyo_expediente AND query.fecha_asiento=tbn1_z3_exp_deuda_dim_fechas.fecha_asiento AND query.anyo_asiento=tbn1_z3_exp_deuda_dim_fechas.anyo_asiento AND query.mes_asiento=tbn1_z3_exp_deuda_dim_fechas.mes_asiento AND query.fecha_contraido=tbn1_z3_exp_deuda_dim_fechas.fecha_contraido
	WHEN NOT MATCHED THEN
		INSERT (anyo_expediente,fecha_asiento,anyo_asiento,mes_asiento,fecha_contraido) VALUES (
			query.anyo_expediente,
			query.fecha_asiento,
			query.anyo_asiento,
			query.mes_asiento,
			query.fecha_contraido)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_contribuyentes')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_contribuyentes(
	id_dim_contribuyentes int IDENTITY(1,1),
	id_contribuyente int NOT NULL,
	nif varchar(11) NOT NULL,
	CONSTRAINT uk_z3_exp_deuda_dim_contribuyentes UNIQUE (id_contribuyente,nif),
	CONSTRAINT FK_tbn1_z3_exp_deuda_dim_contribuyentes_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente),
	CONSTRAINT PK_tbn1_z3_exp_deuda_dim_contribuyentes PRIMARY KEY CLUSTERED (id_dim_contribuyentes)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_contribuyentes' AND COLUMN_NAME='id_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_contribuyentes ADD id_dim_contribuyentes int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_contribuyentes' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_contribuyentes ADD id_contribuyente int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_contribuyentes' AND COLUMN_NAME='nif')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_contribuyentes ADD nif varchar(11)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_contribuyentes' AND COLUMN_NAME='id_dim_contribuyentes' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_contribuyentes ALTER COLUMN id_dim_contribuyentes int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_contribuyentes' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_contribuyentes ALTER COLUMN id_contribuyente int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_contribuyentes' AND COLUMN_NAME='nif' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_contribuyentes ALTER COLUMN nif varchar(11) NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_contribuyentes' AND CONSTRAINT_NAME='PK_tbn1_z3_exp_deuda_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_contribuyentes ADD CONSTRAINT PK_tbn1_z3_exp_deuda_dim_contribuyentes PRIMARY KEY CLUSTERED (id_dim_contribuyentes)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_contribuyentes' AND CONSTRAINT_NAME='FK_tbn1_z3_exp_deuda_dim_contribuyentes_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_contribuyentes ADD CONSTRAINT FK_tbn1_z3_exp_deuda_dim_contribuyentes_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_z3_exp_deuda_dim_contribuyentes' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_z3_exp_deuda_dim_contribuyentes;
GO

CREATE PROCEDURE dbo.spn1_cargar_z3_exp_deuda_dim_contribuyentes(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_z3_exp_deuda_dim_contribuyentes'
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
		FROM dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			id_contribuyente,
			nif
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_contribuyentes AS tbn1_z3_exp_deuda_dim_contribuyentes
	USING query ON query.id_contribuyente=tbn1_z3_exp_deuda_dim_contribuyentes.id_contribuyente AND query.nif=tbn1_z3_exp_deuda_dim_contribuyentes.nif
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_expediente')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_expediente(
	id_dim_detalles_expediente int IDENTITY(1,1),
	num_empleado varchar(8) NOT NULL,
	id_agente int NOT NULL,
	oficina_recaudacion varchar(4) NOT NULL,
	id_tipo_actuacion int NOT NULL,
	concepto_deuda varchar(7) NOT NULL,
	es_fallido bit NOT NULL,
	tipo_expediente varchar(1) NOT NULL,
	tiene_nifs_derivados bit NOT NULL,
	id_tipo_expediente_embargos int NOT NULL,
	CONSTRAINT uk_z3_exp_deuda_dim_detalles_expediente UNIQUE (num_empleado,id_agente,oficina_recaudacion,id_tipo_actuacion,concepto_deuda,es_fallido,tipo_expediente,tiene_nifs_derivados,id_tipo_expediente_embargos),
	CONSTRAINT FK_tbn1_z3_exp_deuda_dim_detalles_expediente_tbn1_ot_z3_agentes FOREIGN KEY (id_agente) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_ot_z3_agentes(id_agente),
	CONSTRAINT FK_tbn1_z3_exp_deuda_dim_detalles_expediente_tbn1_ot_z3_tipos_actuacion FOREIGN KEY (id_tipo_actuacion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_ot_z3_tipos_actuacion(id_tipo_actuacion),
	CONSTRAINT FK_tbn1_z3_exp_deuda_dim_detalles_expediente_tbn1_ot_z3_tipos_expediente FOREIGN KEY (id_tipo_expediente_embargos) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_ot_z3_tipos_expediente(id_tipo_expediente_embargos),
	CONSTRAINT PK_tbn1_z3_exp_deuda_dim_detalles_expediente PRIMARY KEY CLUSTERED (id_dim_detalles_expediente)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_expediente' AND COLUMN_NAME='id_dim_detalles_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_expediente ADD id_dim_detalles_expediente int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_expediente' AND COLUMN_NAME='num_empleado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_expediente ADD num_empleado varchar(8)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_expediente' AND COLUMN_NAME='id_agente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_expediente ADD id_agente int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_expediente' AND COLUMN_NAME='oficina_recaudacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_expediente ADD oficina_recaudacion varchar(4)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_expediente' AND COLUMN_NAME='id_tipo_actuacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_expediente ADD id_tipo_actuacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_expediente' AND COLUMN_NAME='concepto_deuda')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_expediente ADD concepto_deuda varchar(7)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_expediente' AND COLUMN_NAME='es_fallido')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_expediente ADD es_fallido bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_expediente' AND COLUMN_NAME='tipo_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_expediente ADD tipo_expediente varchar(1)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_expediente' AND COLUMN_NAME='tiene_nifs_derivados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_expediente ADD tiene_nifs_derivados bit
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_expediente' AND COLUMN_NAME='id_tipo_expediente_embargos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_expediente ADD id_tipo_expediente_embargos int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_expediente' AND COLUMN_NAME='id_dim_detalles_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_expediente ALTER COLUMN id_dim_detalles_expediente int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_expediente' AND COLUMN_NAME='num_empleado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_expediente ALTER COLUMN num_empleado varchar(8) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_expediente' AND COLUMN_NAME='id_agente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_expediente ALTER COLUMN id_agente int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_expediente' AND COLUMN_NAME='oficina_recaudacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_expediente ALTER COLUMN oficina_recaudacion varchar(4) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_expediente' AND COLUMN_NAME='id_tipo_actuacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_expediente ALTER COLUMN id_tipo_actuacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_expediente' AND COLUMN_NAME='concepto_deuda' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_expediente ALTER COLUMN concepto_deuda varchar(7) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_expediente' AND COLUMN_NAME='es_fallido' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_expediente ALTER COLUMN es_fallido bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_expediente' AND COLUMN_NAME='tipo_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_expediente ALTER COLUMN tipo_expediente varchar(1) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_expediente' AND COLUMN_NAME='tiene_nifs_derivados' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_expediente ALTER COLUMN tiene_nifs_derivados bit NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_expediente' AND COLUMN_NAME='id_tipo_expediente_embargos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_expediente ALTER COLUMN id_tipo_expediente_embargos int NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_expediente' AND CONSTRAINT_NAME='PK_tbn1_z3_exp_deuda_dim_detalles_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_expediente ADD CONSTRAINT PK_tbn1_z3_exp_deuda_dim_detalles_expediente PRIMARY KEY CLUSTERED (id_dim_detalles_expediente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_expediente' AND CONSTRAINT_NAME='FK_tbn1_z3_exp_deuda_dim_detalles_expediente_tbn1_ot_z3_agentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_expediente ADD CONSTRAINT FK_tbn1_z3_exp_deuda_dim_detalles_expediente_tbn1_ot_z3_agentes FOREIGN KEY (id_agente) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_ot_z3_agentes(id_agente)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_expediente' AND CONSTRAINT_NAME='FK_tbn1_z3_exp_deuda_dim_detalles_expediente_tbn1_ot_z3_tipos_actuacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_expediente ADD CONSTRAINT FK_tbn1_z3_exp_deuda_dim_detalles_expediente_tbn1_ot_z3_tipos_actuacion FOREIGN KEY (id_tipo_actuacion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_ot_z3_tipos_actuacion(id_tipo_actuacion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_expediente' AND CONSTRAINT_NAME='FK_tbn1_z3_exp_deuda_dim_detalles_expediente_tbn1_ot_z3_tipos_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_expediente ADD CONSTRAINT FK_tbn1_z3_exp_deuda_dim_detalles_expediente_tbn1_ot_z3_tipos_expediente FOREIGN KEY (id_tipo_expediente_embargos) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_ot_z3_tipos_expediente(id_tipo_expediente_embargos)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_z3_exp_deuda_dim_detalles_expediente' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_z3_exp_deuda_dim_detalles_expediente;
GO

CREATE PROCEDURE dbo.spn1_cargar_z3_exp_deuda_dim_detalles_expediente(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_z3_exp_deuda_dim_detalles_expediente'
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
			num_empleado,
			id_agente,
			oficina_recaudacion,
			id_tipo_actuacion,
			concepto_deuda,
			es_fallido,
			tipo_expediente,
			tiene_nifs_derivados,
			id_tipo_expediente_embargos
		FROM dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			num_empleado,
			id_agente,
			oficina_recaudacion,
			id_tipo_actuacion,
			concepto_deuda,
			es_fallido,
			tipo_expediente,
			tiene_nifs_derivados,
			id_tipo_expediente_embargos
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_expediente AS tbn1_z3_exp_deuda_dim_detalles_expediente
	USING query ON query.num_empleado=tbn1_z3_exp_deuda_dim_detalles_expediente.num_empleado AND query.id_agente=tbn1_z3_exp_deuda_dim_detalles_expediente.id_agente AND query.oficina_recaudacion=tbn1_z3_exp_deuda_dim_detalles_expediente.oficina_recaudacion AND query.id_tipo_actuacion=tbn1_z3_exp_deuda_dim_detalles_expediente.id_tipo_actuacion AND query.concepto_deuda=tbn1_z3_exp_deuda_dim_detalles_expediente.concepto_deuda AND query.es_fallido=tbn1_z3_exp_deuda_dim_detalles_expediente.es_fallido AND query.tipo_expediente=tbn1_z3_exp_deuda_dim_detalles_expediente.tipo_expediente AND query.tiene_nifs_derivados=tbn1_z3_exp_deuda_dim_detalles_expediente.tiene_nifs_derivados AND query.id_tipo_expediente_embargos=tbn1_z3_exp_deuda_dim_detalles_expediente.id_tipo_expediente_embargos
	WHEN NOT MATCHED THEN
		INSERT (num_empleado,id_agente,oficina_recaudacion,id_tipo_actuacion,concepto_deuda,es_fallido,tipo_expediente,tiene_nifs_derivados,id_tipo_expediente_embargos) VALUES (
			query.num_empleado,
			query.id_agente,
			query.oficina_recaudacion,
			query.id_tipo_actuacion,
			query.concepto_deuda,
			query.es_fallido,
			query.tipo_expediente,
			query.tiene_nifs_derivados,
			query.id_tipo_expediente_embargos)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_fechas_expediente')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_fechas_expediente(
	id_dim_fechas_expediente int IDENTITY(1,1),
	fec_actuacion date NOT NULL,
	fec_carga_expediente date NOT NULL,
	anyo_carga_expediente int NOT NULL,
	mes_carga_expediente int NOT NULL,
	CONSTRAINT uk_z3_exp_deuda_dim_fechas_expediente UNIQUE (fec_actuacion,fec_carga_expediente,anyo_carga_expediente,mes_carga_expediente),
	CONSTRAINT PK_tbn1_z3_exp_deuda_dim_fechas_expediente PRIMARY KEY CLUSTERED (id_dim_fechas_expediente)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_fechas_expediente' AND COLUMN_NAME='id_dim_fechas_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_fechas_expediente ADD id_dim_fechas_expediente int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_fechas_expediente' AND COLUMN_NAME='fec_actuacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_fechas_expediente ADD fec_actuacion date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_fechas_expediente' AND COLUMN_NAME='fec_carga_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_fechas_expediente ADD fec_carga_expediente date
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_fechas_expediente' AND COLUMN_NAME='anyo_carga_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_fechas_expediente ADD anyo_carga_expediente int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_fechas_expediente' AND COLUMN_NAME='mes_carga_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_fechas_expediente ADD mes_carga_expediente int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_fechas_expediente' AND COLUMN_NAME='id_dim_fechas_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_fechas_expediente ALTER COLUMN id_dim_fechas_expediente int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_fechas_expediente' AND COLUMN_NAME='fec_actuacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_fechas_expediente ALTER COLUMN fec_actuacion date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_fechas_expediente' AND COLUMN_NAME='fec_carga_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_fechas_expediente ALTER COLUMN fec_carga_expediente date NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_fechas_expediente' AND COLUMN_NAME='anyo_carga_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_fechas_expediente ALTER COLUMN anyo_carga_expediente int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_fechas_expediente' AND COLUMN_NAME='mes_carga_expediente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_fechas_expediente ALTER COLUMN mes_carga_expediente int NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_fechas_expediente' AND CONSTRAINT_NAME='PK_tbn1_z3_exp_deuda_dim_fechas_expediente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_fechas_expediente ADD CONSTRAINT PK_tbn1_z3_exp_deuda_dim_fechas_expediente PRIMARY KEY CLUSTERED (id_dim_fechas_expediente)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_z3_exp_deuda_dim_fechas_expediente' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_z3_exp_deuda_dim_fechas_expediente;
GO

CREATE PROCEDURE dbo.spn1_cargar_z3_exp_deuda_dim_fechas_expediente(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_z3_exp_deuda_dim_fechas_expediente'
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
			fec_actuacion,
			fec_carga_expediente,
			anyo_carga_expediente,
			mes_carga_expediente
		FROM dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			fec_actuacion,
			fec_carga_expediente,
			anyo_carga_expediente,
			mes_carga_expediente
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_fechas_expediente AS tbn1_z3_exp_deuda_dim_fechas_expediente
	USING query ON query.fec_actuacion=tbn1_z3_exp_deuda_dim_fechas_expediente.fec_actuacion AND query.fec_carga_expediente=tbn1_z3_exp_deuda_dim_fechas_expediente.fec_carga_expediente AND query.anyo_carga_expediente=tbn1_z3_exp_deuda_dim_fechas_expediente.anyo_carga_expediente AND query.mes_carga_expediente=tbn1_z3_exp_deuda_dim_fechas_expediente.mes_carga_expediente
	WHEN NOT MATCHED THEN
		INSERT (fec_actuacion,fec_carga_expediente,anyo_carga_expediente,mes_carga_expediente) VALUES (
			query.fec_actuacion,
			query.fec_carga_expediente,
			query.anyo_carga_expediente,
			query.mes_carga_expediente)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_deudas')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_deudas(
	id_dim_deudas int IDENTITY(1,1),
	id_deuda int NOT NULL,
	CONSTRAINT uk_z3_exp_deuda_dim_deudas UNIQUE (id_deuda),
	CONSTRAINT FK_tbn1_z3_exp_deuda_dim_deudas_tbn1_dim_ot_deudas FOREIGN KEY (id_deuda) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_ot_deudas(id_deuda),
	CONSTRAINT PK_tbn1_z3_exp_deuda_dim_deudas PRIMARY KEY CLUSTERED (id_dim_deudas)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_deudas' AND COLUMN_NAME='id_dim_deudas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_deudas ADD id_dim_deudas int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_deudas' AND COLUMN_NAME='id_deuda')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_deudas ADD id_deuda int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_deudas' AND COLUMN_NAME='id_dim_deudas' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_deudas ALTER COLUMN id_dim_deudas int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_deudas' AND COLUMN_NAME='id_deuda' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_deudas ALTER COLUMN id_deuda int NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_deudas' AND CONSTRAINT_NAME='PK_tbn1_z3_exp_deuda_dim_deudas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_deudas ADD CONSTRAINT PK_tbn1_z3_exp_deuda_dim_deudas PRIMARY KEY CLUSTERED (id_dim_deudas)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_deudas' AND CONSTRAINT_NAME='FK_tbn1_z3_exp_deuda_dim_deudas_tbn1_dim_ot_deudas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_deudas ADD CONSTRAINT FK_tbn1_z3_exp_deuda_dim_deudas_tbn1_dim_ot_deudas FOREIGN KEY (id_deuda) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_ot_deudas(id_deuda)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_z3_exp_deuda_dim_deudas' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_z3_exp_deuda_dim_deudas;
GO

CREATE PROCEDURE dbo.spn1_cargar_z3_exp_deuda_dim_deudas(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_z3_exp_deuda_dim_deudas'
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
		FROM dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			id_deuda
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_deudas AS tbn1_z3_exp_deuda_dim_deudas
	USING query ON query.id_deuda=tbn1_z3_exp_deuda_dim_deudas.id_deuda
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_deuda')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_deuda(
	id_dim_detalles_deuda int IDENTITY(1,1),
	id_estado_documento int NOT NULL,
	id_modelo int NOT NULL,
	cod_modelo varchar(3) NOT NULL,
	CONSTRAINT uk_z3_exp_deuda_dim_detalles_deuda UNIQUE (id_estado_documento,id_modelo,cod_modelo),
	CONSTRAINT FK_tbn1_z3_exp_deuda_dim_detalles_deuda_tbn1_dim_ot_estados FOREIGN KEY (id_estado_documento) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_ot_estados(id_estado),
	CONSTRAINT FK_tbn1_z3_exp_deuda_dim_detalles_deuda_tbn1_dim_modelos FOREIGN KEY (id_modelo) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_modelos(id_modelo),
	CONSTRAINT PK_tbn1_z3_exp_deuda_dim_detalles_deuda PRIMARY KEY CLUSTERED (id_dim_detalles_deuda)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_deuda' AND COLUMN_NAME='id_dim_detalles_deuda')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_deuda ADD id_dim_detalles_deuda int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_deuda' AND COLUMN_NAME='id_estado_documento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_deuda ADD id_estado_documento int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_deuda' AND COLUMN_NAME='id_modelo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_deuda ADD id_modelo int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_deuda' AND COLUMN_NAME='cod_modelo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_deuda ADD cod_modelo varchar(3)
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_deuda' AND COLUMN_NAME='id_dim_detalles_deuda' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_deuda ALTER COLUMN id_dim_detalles_deuda int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_deuda' AND COLUMN_NAME='id_estado_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_deuda ALTER COLUMN id_estado_documento int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_deuda' AND COLUMN_NAME='id_modelo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_deuda ALTER COLUMN id_modelo int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_deuda' AND COLUMN_NAME='cod_modelo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_deuda ALTER COLUMN cod_modelo varchar(3) NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_deuda' AND CONSTRAINT_NAME='PK_tbn1_z3_exp_deuda_dim_detalles_deuda')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_deuda ADD CONSTRAINT PK_tbn1_z3_exp_deuda_dim_detalles_deuda PRIMARY KEY CLUSTERED (id_dim_detalles_deuda)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_deuda' AND CONSTRAINT_NAME='FK_tbn1_z3_exp_deuda_dim_detalles_deuda_tbn1_dim_ot_estados')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_deuda ADD CONSTRAINT FK_tbn1_z3_exp_deuda_dim_detalles_deuda_tbn1_dim_ot_estados FOREIGN KEY (id_estado_documento) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_ot_estados(id_estado)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_deuda' AND CONSTRAINT_NAME='FK_tbn1_z3_exp_deuda_dim_detalles_deuda_tbn1_dim_modelos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_deuda ADD CONSTRAINT FK_tbn1_z3_exp_deuda_dim_detalles_deuda_tbn1_dim_modelos FOREIGN KEY (id_modelo) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_modelos(id_modelo)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_z3_exp_deuda_dim_detalles_deuda' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_z3_exp_deuda_dim_detalles_deuda;
GO

CREATE PROCEDURE dbo.spn1_cargar_z3_exp_deuda_dim_detalles_deuda(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_z3_exp_deuda_dim_detalles_deuda'
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
			id_estado_documento,
			id_modelo,
			cod_modelo
		FROM dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			id_estado_documento,
			id_modelo,
			cod_modelo
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_deuda AS tbn1_z3_exp_deuda_dim_detalles_deuda
	USING query ON query.id_estado_documento=tbn1_z3_exp_deuda_dim_detalles_deuda.id_estado_documento AND query.id_modelo=tbn1_z3_exp_deuda_dim_detalles_deuda.id_modelo AND query.cod_modelo=tbn1_z3_exp_deuda_dim_detalles_deuda.cod_modelo
	WHEN NOT MATCHED THEN
		INSERT (id_estado_documento,id_modelo,cod_modelo) VALUES (
			query.id_estado_documento,
			query.id_modelo,
			query.cod_modelo)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_movimiento')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_movimiento(
	id_dim_detalles_movimiento int IDENTITY(1,1),
	anyo_contraido varchar(2) NOT NULL,
	secuencia int NOT NULL,
	id_codigo_operacion int NOT NULL,
	id_tipo_ingreso int NOT NULL,
	id_clave_ingreso int NOT NULL,
	CONSTRAINT uk_z3_exp_deuda_dim_detalles_movimiento UNIQUE (anyo_contraido,secuencia,id_codigo_operacion,id_tipo_ingreso,id_clave_ingreso),
	CONSTRAINT FK_tbn1_z3_exp_deuda_dim_detalles_movimiento_tbn1_dim_ot_codigos_operacion FOREIGN KEY (id_codigo_operacion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_ot_codigos_operacion(id_codigo_operacion),
	CONSTRAINT FK_tbn1_z3_exp_deuda_dim_detalles_movimiento_tbn1_dim_ot_tipos_ingreso FOREIGN KEY (id_tipo_ingreso) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_ot_tipos_ingreso(id_tipo_ingreso),
	CONSTRAINT FK_tbn1_z3_exp_deuda_dim_detalles_movimiento_tbn1_dim_ot_claves_ingreso FOREIGN KEY (id_clave_ingreso) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_ot_claves_ingreso(id_clave_ingreso),
	CONSTRAINT PK_tbn1_z3_exp_deuda_dim_detalles_movimiento PRIMARY KEY CLUSTERED (id_dim_detalles_movimiento)
)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_movimiento' AND COLUMN_NAME='id_dim_detalles_movimiento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_movimiento ADD id_dim_detalles_movimiento int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_movimiento' AND COLUMN_NAME='anyo_contraido')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_movimiento ADD anyo_contraido varchar(2)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_movimiento' AND COLUMN_NAME='secuencia')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_movimiento ADD secuencia int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_movimiento' AND COLUMN_NAME='id_codigo_operacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_movimiento ADD id_codigo_operacion int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_movimiento' AND COLUMN_NAME='id_tipo_ingreso')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_movimiento ADD id_tipo_ingreso int
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_movimiento' AND COLUMN_NAME='id_clave_ingreso')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_movimiento ADD id_clave_ingreso int
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_movimiento' AND COLUMN_NAME='id_dim_detalles_movimiento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_movimiento ALTER COLUMN id_dim_detalles_movimiento int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_movimiento' AND COLUMN_NAME='anyo_contraido' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_movimiento ALTER COLUMN anyo_contraido varchar(2) NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_movimiento' AND COLUMN_NAME='secuencia' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_movimiento ALTER COLUMN secuencia int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_movimiento' AND COLUMN_NAME='id_codigo_operacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_movimiento ALTER COLUMN id_codigo_operacion int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_movimiento' AND COLUMN_NAME='id_tipo_ingreso' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_movimiento ALTER COLUMN id_tipo_ingreso int NOT NULL
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_movimiento' AND COLUMN_NAME='id_clave_ingreso' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_movimiento ALTER COLUMN id_clave_ingreso int NOT NULL
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_movimiento' AND CONSTRAINT_NAME='PK_tbn1_z3_exp_deuda_dim_detalles_movimiento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_movimiento ADD CONSTRAINT PK_tbn1_z3_exp_deuda_dim_detalles_movimiento PRIMARY KEY CLUSTERED (id_dim_detalles_movimiento)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_movimiento' AND CONSTRAINT_NAME='FK_tbn1_z3_exp_deuda_dim_detalles_movimiento_tbn1_dim_ot_codigos_operacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_movimiento ADD CONSTRAINT FK_tbn1_z3_exp_deuda_dim_detalles_movimiento_tbn1_dim_ot_codigos_operacion FOREIGN KEY (id_codigo_operacion) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_ot_codigos_operacion(id_codigo_operacion)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_movimiento' AND CONSTRAINT_NAME='FK_tbn1_z3_exp_deuda_dim_detalles_movimiento_tbn1_dim_ot_tipos_ingreso')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_movimiento ADD CONSTRAINT FK_tbn1_z3_exp_deuda_dim_detalles_movimiento_tbn1_dim_ot_tipos_ingreso FOREIGN KEY (id_tipo_ingreso) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_ot_tipos_ingreso(id_tipo_ingreso)
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_exp_deuda_dim_detalles_movimiento' AND CONSTRAINT_NAME='FK_tbn1_z3_exp_deuda_dim_detalles_movimiento_tbn1_dim_ot_claves_ingreso')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_movimiento ADD CONSTRAINT FK_tbn1_z3_exp_deuda_dim_detalles_movimiento_tbn1_dim_ot_claves_ingreso FOREIGN KEY (id_clave_ingreso) REFERENCES  dbn1_dmr_dhyf.dbo.tbn1_dim_ot_claves_ingreso(id_clave_ingreso)
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_z3_exp_deuda_dim_detalles_movimiento' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_z3_exp_deuda_dim_detalles_movimiento;
GO

CREATE PROCEDURE dbo.spn1_cargar_z3_exp_deuda_dim_detalles_movimiento(@logpadre int) AS
BEGIN

	DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_z3_exp_deuda_dim_detalles_movimiento'
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
			anyo_contraido,
			secuencia,
			id_codigo_operacion,
			id_tipo_ingreso,
			id_clave_ingreso
		FROM dbn1_norm_dhyf.dbo.tbn1_z3_ds_expedientes_deudas ds_t
		WHERE ds_t.fec_baja IS NULL
		GROUP BY
			anyo_contraido,
			secuencia,
			id_codigo_operacion,
			id_tipo_ingreso,
			id_clave_ingreso
	)
	MERGE dbn1_dmr_dhyf.dbo.tbn1_z3_exp_deuda_dim_detalles_movimiento AS tbn1_z3_exp_deuda_dim_detalles_movimiento
	USING query ON query.anyo_contraido=tbn1_z3_exp_deuda_dim_detalles_movimiento.anyo_contraido AND query.secuencia=tbn1_z3_exp_deuda_dim_detalles_movimiento.secuencia AND query.id_codigo_operacion=tbn1_z3_exp_deuda_dim_detalles_movimiento.id_codigo_operacion AND query.id_tipo_ingreso=tbn1_z3_exp_deuda_dim_detalles_movimiento.id_tipo_ingreso AND query.id_clave_ingreso=tbn1_z3_exp_deuda_dim_detalles_movimiento.id_clave_ingreso
	WHEN NOT MATCHED THEN
		INSERT (anyo_contraido,secuencia,id_codigo_operacion,id_tipo_ingreso,id_clave_ingreso) VALUES (
			query.anyo_contraido,
			query.secuencia,
			query.id_codigo_operacion,
			query.id_tipo_ingreso,
			query.id_clave_ingreso)
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

