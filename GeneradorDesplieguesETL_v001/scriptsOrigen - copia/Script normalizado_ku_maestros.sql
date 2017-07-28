PRINT 'normalizado_ku_maestros.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_calles')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_ku_calles(
  id_calle int IDENTITY(1,1),
  cod_municipio varchar(3) NOT NULL,
  cod_calle varchar(5) NOT NULL,
  tipo_calle varchar(2) NULL,
  des_calle varchar(33) NULL,
  origen varchar(10) NOT NULL,
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_calles UNIQUE (cod_municipio,cod_calle),
  CONSTRAINT PK_tbn1_ku_calles PRIMARY KEY CLUSTERED (id_calle)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_calles' AND COLUMN_NAME='id_calle')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_calles ADD id_calle int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_calles' AND COLUMN_NAME='cod_municipio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_calles ADD cod_municipio varchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_calles' AND COLUMN_NAME='cod_calle')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_calles ADD cod_calle varchar(5)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_calles' AND COLUMN_NAME='tipo_calle')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_calles ADD tipo_calle varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_calles' AND COLUMN_NAME='des_calle')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_calles ADD des_calle varchar(33)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_calles' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_calles ADD origen varchar(10)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_calles' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_calles ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_calles' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_calles ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_calles' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_calles ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_calles' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_calles ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_calles' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_calles ADD CONSTRAINT DF_DBO_TBN1_KU_CALLES_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_calles' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_calles ADD CONSTRAINT DF_DBO_TBN1_KU_CALLES_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_calles' AND COLUMN_NAME='id_calle' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_calles ALTER COLUMN id_calle int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_calles' AND COLUMN_NAME='cod_municipio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_calles ALTER COLUMN cod_municipio varchar(3) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_calles' AND COLUMN_NAME='cod_calle' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_calles ALTER COLUMN cod_calle varchar(5) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_calles' AND COLUMN_NAME='tipo_calle' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_calles ALTER COLUMN tipo_calle varchar(2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_calles' AND COLUMN_NAME='des_calle' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_calles ALTER COLUMN des_calle varchar(33) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_calles' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_ku_calles SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_calles ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_calles' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_calles ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_calles' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_calles ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_calles' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_calles ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_calles' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_calles ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_calles' AND CONSTRAINT_NAME='PK_tbn1_ku_calles')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_calles ADD CONSTRAINT PK_tbn1_ku_calles PRIMARY KEY CLUSTERED (id_calle)

GO

;WITH
query AS (
  SELECT 1 AS es_indefinido,'' AS cod_municipio,'' AS cod_calle,'' AS tipo_calle,'Indefinido' AS des_calle
)
MERGE dbn1_norm_dhyf.dbo.tbn1_ku_calles AS tbn1_ku_calles
USING query ON query.es_indefinido=tbn1_ku_calles.es_indefinido
WHEN MATCHED AND ((tbn1_ku_calles.cod_municipio<>query.cod_municipio OR (tbn1_ku_calles.cod_municipio IS NULL AND query.cod_municipio IS NOT NULL) OR  (tbn1_ku_calles.cod_municipio IS NOT NULL AND query.cod_municipio IS NULL)
                  OR tbn1_ku_calles.cod_calle<>query.cod_calle OR (tbn1_ku_calles.cod_calle IS NULL AND query.cod_calle IS NOT NULL) OR  (tbn1_ku_calles.cod_calle IS NOT NULL AND query.cod_calle IS NULL)
                  OR tbn1_ku_calles.tipo_calle<>query.tipo_calle OR (tbn1_ku_calles.tipo_calle IS NULL AND query.tipo_calle IS NOT NULL) OR  (tbn1_ku_calles.tipo_calle IS NOT NULL AND query.tipo_calle IS NULL)
                  OR tbn1_ku_calles.des_calle<>query.des_calle OR (tbn1_ku_calles.des_calle IS NULL AND query.des_calle IS NOT NULL) OR  (tbn1_ku_calles.des_calle IS NOT NULL AND query.des_calle IS NULL))) THEN
  UPDATE SET
    cod_municipio=query.cod_municipio,
    cod_calle=query.cod_calle,
    tipo_calle=query.tipo_calle,
    des_calle=query.des_calle
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,cod_municipio,cod_calle,tipo_calle,des_calle) VALUES (
    query.es_indefinido,
    query.cod_municipio,
    query.cod_calle,
    query.tipo_calle,
    query.des_calle);
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_ku_calles' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_ku_calles;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_ku_calles(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_calles'
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
      codmun AS cod_municipio,
      codcalle AS cod_calle,
      sigcalle AS tipo_calle,
      nomcalle AS des_calle,
      'MAESTRO' AS origen
    FROM dbo.tbn1cal1_cu
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_ku_calles AS tbn1_ku_calles
  USING query ON query.cod_municipio=tbn1_ku_calles.cod_municipio AND query.cod_calle=tbn1_ku_calles.cod_calle
  WHEN MATCHED AND ((tbn1_ku_calles.tipo_calle<>query.tipo_calle OR (tbn1_ku_calles.tipo_calle IS NULL AND query.tipo_calle IS NOT NULL) OR  (tbn1_ku_calles.tipo_calle IS NOT NULL AND query.tipo_calle IS NULL)
                    OR tbn1_ku_calles.des_calle<>query.des_calle OR (tbn1_ku_calles.des_calle IS NULL AND query.des_calle IS NOT NULL) OR  (tbn1_ku_calles.des_calle IS NOT NULL AND query.des_calle IS NULL)
                    OR tbn1_ku_calles.origen<>query.origen OR (tbn1_ku_calles.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_ku_calles.origen IS NOT NULL AND query.origen IS NULL))) THEN
    UPDATE SET
      tipo_calle=query.tipo_calle,
      des_calle=query.des_calle,
      origen=query.origen
  WHEN NOT MATCHED THEN
    INSERT (cod_municipio,cod_calle,tipo_calle,des_calle,origen) VALUES (
      query.cod_municipio,
      query.cod_calle,
      query.tipo_calle,
      query.des_calle,
      query.origen);

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_ku_calles_integridad_portales' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_ku_calles_integridad_portales;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_ku_calles_integridad_portales(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_calles_integridad_portales'
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
      por.codmun AS cod_municipio,
      por.codcalle AS cod_calle,
      'CALLE FALTANTE EN EL MAESTRO' AS des_calle,
      'PORTALES' AS origen
    FROM dbo.tbn1num2_cu por
    WHERE
      por.fechabaja=(SELECT max(fechabaja) AS expr1
      FROM dbo.tbn1num2_cu
      WHERE
        codmun=por.codmun
        AND codcalle=por.codcalle
        AND numero=por.numero
      )
    GROUP BY
      por.codmun,
      por.codcalle
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_ku_calles(cod_municipio,cod_calle,des_calle,origen)
  SELECT
    query.cod_municipio,
    query.cod_calle,
    query.des_calle,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_ku_calles ON (tbn1_ku_calles.cod_municipio=query.cod_municipio AND tbn1_ku_calles.cod_calle=query.cod_calle)
  WHERE tbn1_ku_calles.cod_municipio IS NULL;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_ku_calles_integridad_edificios' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_ku_calles_integridad_edificios;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_ku_calles_integridad_edificios(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_calles_integridad_edificios'
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
      edif.tecodmun AS cod_municipio,
      edif.tecodcal AS cod_calle,
      'CALLE FALTANTE EN EL MAESTRO' AS des_calle,
      'EDIFICIOS' AS origen
    FROM dbo.tbn1edif_cu edif
    GROUP BY
      edif.tecodmun,
      edif.tecodcal
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_ku_calles(cod_municipio,cod_calle,des_calle,origen)
  SELECT
    query.cod_municipio,
    query.cod_calle,
    query.des_calle,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_ku_calles ON (tbn1_ku_calles.cod_municipio=query.cod_municipio AND tbn1_ku_calles.cod_calle=query.cod_calle)
  WHERE tbn1_ku_calles.cod_municipio IS NULL;

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

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_portales')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_ku_portales(
  id_portal int IDENTITY(1,1),
  id_calle int NOT NULL,
  numero varchar(9) NULL,
  tramo varchar(3) NULL,
  origen varchar(10) NOT NULL,
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_portales UNIQUE (id_calle,numero),
  CONSTRAINT PK_tbn1_ku_portales PRIMARY KEY CLUSTERED (id_portal),
  CONSTRAINT FK_tbn1_ku_portales_tbn1_ku_calles FOREIGN KEY (id_calle) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_calles(id_calle)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_portales' AND COLUMN_NAME='id_portal')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_portales ADD id_portal int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_portales' AND COLUMN_NAME='id_calle')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_portales ADD id_calle int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_portales' AND COLUMN_NAME='numero')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_portales ADD numero varchar(9)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_portales' AND COLUMN_NAME='tramo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_portales ADD tramo varchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_portales' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_portales ADD origen varchar(10)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_portales' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_portales ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_portales' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_portales ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_portales' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_portales ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_portales' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_portales ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_portales' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_portales ADD CONSTRAINT DF_DBO_TBN1_KU_PORTALES_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_portales' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_portales ADD CONSTRAINT DF_DBO_TBN1_KU_PORTALES_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_portales' AND COLUMN_NAME='id_portal' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_portales ALTER COLUMN id_portal int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_portales' AND COLUMN_NAME='id_calle' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_portales ALTER COLUMN id_calle int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_portales' AND COLUMN_NAME='numero' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_portales ALTER COLUMN numero varchar(9) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_portales' AND COLUMN_NAME='tramo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_portales ALTER COLUMN tramo varchar(3) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_portales' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_ku_portales SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_portales ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_portales' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_portales ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_portales' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_portales ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_portales' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_portales ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_portales' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_portales ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_portales' AND CONSTRAINT_NAME='PK_tbn1_ku_portales')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_portales ADD CONSTRAINT PK_tbn1_ku_portales PRIMARY KEY CLUSTERED (id_portal)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_portales' AND CONSTRAINT_NAME='FK_tbn1_ku_portales_tbn1_ku_calles')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_portales ADD CONSTRAINT FK_tbn1_ku_portales_tbn1_ku_calles FOREIGN KEY (id_calle) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_calles(id_calle)

GO

;WITH
query AS (
  SELECT 1 AS es_indefinido,1 AS id_calle,'' AS numero
)
MERGE dbn1_norm_dhyf.dbo.tbn1_ku_portales AS tbn1_ku_portales
USING query ON query.es_indefinido=tbn1_ku_portales.es_indefinido
WHEN MATCHED AND ((tbn1_ku_portales.id_calle<>query.id_calle OR (tbn1_ku_portales.id_calle IS NULL AND query.id_calle IS NOT NULL) OR  (tbn1_ku_portales.id_calle IS NOT NULL AND query.id_calle IS NULL)
                  OR tbn1_ku_portales.numero<>query.numero OR (tbn1_ku_portales.numero IS NULL AND query.numero IS NOT NULL) OR  (tbn1_ku_portales.numero IS NOT NULL AND query.numero IS NULL))) THEN
  UPDATE SET
    id_calle=query.id_calle,
    numero=query.numero
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,id_calle,numero) VALUES (
    query.es_indefinido,
    query.id_calle,
    query.numero);
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_ku_portales' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_ku_portales;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_ku_portales(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_portales'
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
      cal.id_calle AS id_calle,
      por.numero AS numero,
      por.tramo AS tramo
    FROM dbo.tbn1num2_cu por
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_ku_calles cal ON (cal.cod_municipio=por.codmun AND cal.cod_calle=por.codcalle)
    WHERE
      por.fechabaja=(SELECT max(fechabaja) AS expr1
      FROM dbo.tbn1num2_cu
      WHERE
        codmun=por.codmun
        AND codcalle=por.codcalle
        AND numero=por.numero
      )
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_ku_portales AS tbn1_ku_portales
  USING query ON query.id_calle=tbn1_ku_portales.id_calle AND query.numero=tbn1_ku_portales.numero
  WHEN MATCHED AND ((tbn1_ku_portales.tramo<>query.tramo OR (tbn1_ku_portales.tramo IS NULL AND query.tramo IS NOT NULL) OR  (tbn1_ku_portales.tramo IS NOT NULL AND query.tramo IS NULL))) THEN
    UPDATE SET
      tramo=query.tramo
  WHEN NOT MATCHED THEN
    INSERT (id_calle,numero,tramo) VALUES (
      query.id_calle,
      query.numero,
      query.tramo);

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_ku_portales_integridad_edificios' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_ku_portales_integridad_edificios;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_ku_portales_integridad_edificios(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_portales_integridad_edificios'
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
      cal.id_calle AS id_calle,
      edif.tenumero AS numero,
      'EDIFICIOS' AS origen
    FROM dbo.tbn1edif_cu edif
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_ku_calles cal ON (cal.cod_municipio=edif.tecodmun AND cal.cod_calle=edif.tecodcal)
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_ku_portales(id_calle,numero,origen)
  SELECT
    query.id_calle,
    query.numero,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_ku_portales ON (tbn1_ku_portales.id_calle=query.id_calle AND tbn1_ku_portales.numero=query.numero)
  WHERE tbn1_ku_portales.id_calle IS NULL;

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

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_usos')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_ku_usos(
  id_uso int IDENTITY(1,1),
  cod_uso varchar(1) NOT NULL,
  des_uso varchar(30) NOT NULL,
  des_uso_euskera varchar(30) NOT NULL,
  origen varchar(10) NOT NULL,
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_usos UNIQUE (cod_uso),
  CONSTRAINT PK_tbn1_ku_usos PRIMARY KEY CLUSTERED (id_uso)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_usos' AND COLUMN_NAME='id_uso')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_usos ADD id_uso int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_usos' AND COLUMN_NAME='cod_uso')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_usos ADD cod_uso varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_usos' AND COLUMN_NAME='des_uso')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_usos ADD des_uso varchar(30)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_usos' AND COLUMN_NAME='des_uso_euskera')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_usos ADD des_uso_euskera varchar(30)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_usos' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_usos ADD origen varchar(10)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_usos' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_usos ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_usos' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_usos ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_usos' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_usos ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_usos' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_usos ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_usos' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_usos ADD CONSTRAINT DF_DBO_TBN1_KU_USOS_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_usos' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_usos ADD CONSTRAINT DF_DBO_TBN1_KU_USOS_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_usos' AND COLUMN_NAME='id_uso' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_usos ALTER COLUMN id_uso int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_usos' AND COLUMN_NAME='cod_uso' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_usos ALTER COLUMN cod_uso varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_usos' AND COLUMN_NAME='des_uso' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_usos ALTER COLUMN des_uso varchar(30) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_usos' AND COLUMN_NAME='des_uso_euskera' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_usos ALTER COLUMN des_uso_euskera varchar(30) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_usos' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_ku_usos SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_usos ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_usos' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_usos ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_usos' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_usos ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_usos' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_usos ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_usos' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_usos ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_usos' AND CONSTRAINT_NAME='PK_tbn1_ku_usos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_usos ADD CONSTRAINT PK_tbn1_ku_usos PRIMARY KEY CLUSTERED (id_uso)

GO

;WITH
query AS (
  SELECT 1 AS es_indefinido,'' AS cod_uso,'Indefinido' AS des_uso,'Indefinido' AS des_uso_euskera
)
MERGE dbn1_norm_dhyf.dbo.tbn1_ku_usos AS tbn1_ku_usos
USING query ON query.es_indefinido=tbn1_ku_usos.es_indefinido
WHEN MATCHED AND ((tbn1_ku_usos.cod_uso<>query.cod_uso OR (tbn1_ku_usos.cod_uso IS NULL AND query.cod_uso IS NOT NULL) OR  (tbn1_ku_usos.cod_uso IS NOT NULL AND query.cod_uso IS NULL)
                  OR tbn1_ku_usos.des_uso<>query.des_uso OR (tbn1_ku_usos.des_uso IS NULL AND query.des_uso IS NOT NULL) OR  (tbn1_ku_usos.des_uso IS NOT NULL AND query.des_uso IS NULL)
                  OR tbn1_ku_usos.des_uso_euskera<>query.des_uso_euskera OR (tbn1_ku_usos.des_uso_euskera IS NULL AND query.des_uso_euskera IS NOT NULL) OR  (tbn1_ku_usos.des_uso_euskera IS NOT NULL AND query.des_uso_euskera IS NULL))) THEN
  UPDATE SET
    cod_uso=query.cod_uso,
    des_uso=query.des_uso,
    des_uso_euskera=query.des_uso_euskera
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,cod_uso,des_uso,des_uso_euskera) VALUES (
    query.es_indefinido,
    query.cod_uso,
    query.des_uso,
    query.des_uso_euskera);
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_ku_usos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_ku_usos;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_ku_usos(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_usos'
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
      uso AS cod_uso,
      nombreuso AS des_uso,
      enombreuso AS des_uso_euskera,
      'MAESTRO' AS origen
    FROM dbo.tbn1uso1_cu
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_ku_usos AS tbn1_ku_usos
  USING query ON query.cod_uso=tbn1_ku_usos.cod_uso
  WHEN MATCHED AND ((tbn1_ku_usos.des_uso<>query.des_uso OR (tbn1_ku_usos.des_uso IS NULL AND query.des_uso IS NOT NULL) OR  (tbn1_ku_usos.des_uso IS NOT NULL AND query.des_uso IS NULL)
                    OR tbn1_ku_usos.des_uso_euskera<>query.des_uso_euskera OR (tbn1_ku_usos.des_uso_euskera IS NULL AND query.des_uso_euskera IS NOT NULL) OR  (tbn1_ku_usos.des_uso_euskera IS NOT NULL AND query.des_uso_euskera IS NULL)
                    OR tbn1_ku_usos.origen<>query.origen OR (tbn1_ku_usos.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_ku_usos.origen IS NOT NULL AND query.origen IS NULL))) THEN
    UPDATE SET
      des_uso=query.des_uso,
      des_uso_euskera=query.des_uso_euskera,
      origen=query.origen
  WHEN NOT MATCHED THEN
    INSERT (cod_uso,des_uso,des_uso_euskera,origen) VALUES (
      query.cod_uso,
      query.des_uso,
      query.des_uso_euskera,
      query.origen);

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_ku_usos_integridad_clases' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_ku_usos_integridad_clases;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_ku_usos_integridad_clases(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_usos_integridad_clases'
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
      cla.uso AS cod_uso,
      'USO FALTANTE EN MAESTRO' AS des_uso,
      'USO FALTANTE EN MAESTRO' AS des_uso_euskera,
      'CLASES' AS origen
    FROM dbo.tbn1cla2_cu cla
    GROUP BY cla.uso
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_ku_usos(cod_uso,des_uso,des_uso_euskera,origen)
  SELECT
    query.cod_uso,
    query.des_uso,
    query.des_uso_euskera,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_ku_usos ON (tbn1_ku_usos.cod_uso=query.cod_uso)
  WHERE tbn1_ku_usos.cod_uso IS NULL;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_ku_usos_integridad_modalidades' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_ku_usos_integridad_modalidades;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_ku_usos_integridad_modalidades(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_usos_integridad_modalidades'
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
      moda.uso AS cod_uso,
      'USO FALTANTE EN MAESTRO' AS des_uso,
      'USO FALTANTE EN MAESTRO' AS des_uso_euskera,
      'MODALIDAD' AS origen
    FROM dbo.tbn1mod3_cu moda
    GROUP BY moda.uso
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_ku_usos(cod_uso,des_uso,des_uso_euskera,origen)
  SELECT
    query.cod_uso,
    query.des_uso,
    query.des_uso_euskera,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_ku_usos ON (tbn1_ku_usos.cod_uso=query.cod_uso)
  WHERE tbn1_ku_usos.cod_uso IS NULL;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_ku_usos_integridad_edificios' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_ku_usos_integridad_edificios;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_ku_usos_integridad_edificios(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_usos_integridad_edificios'
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
      edif.tetmuso AS cod_uso,
      'USO FALTANTE EN MAESTRO' AS des_uso,
      'USO FALTANTE EN MAESTRO' AS des_uso_euskera,
      'EDIFICIOS' AS origen
    FROM dbo.tbn1edif_cu edif
    GROUP BY edif.tetmuso
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_ku_usos(cod_uso,des_uso,des_uso_euskera,origen)
  SELECT
    query.cod_uso,
    query.des_uso,
    query.des_uso_euskera,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_ku_usos ON (tbn1_ku_usos.cod_uso=query.cod_uso)
  WHERE tbn1_ku_usos.cod_uso IS NULL;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_ku_usos_integridad_objetos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_ku_usos_integridad_objetos;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_ku_usos_integridad_objetos(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_usos_integridad_objetos'
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
      obje.tbuso AS cod_uso,
      'USO FALTANTE EN MAESTRO' AS des_uso,
      'USO FALTANTE EN MAESTRO' AS des_uso_euskera,
      'OBJETOS' AS origen
    FROM dbo.tbn1obje_cu obje
    GROUP BY obje.tbuso
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_ku_usos(cod_uso,des_uso,des_uso_euskera,origen)
  SELECT
    query.cod_uso,
    query.des_uso,
    query.des_uso_euskera,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_ku_usos ON (tbn1_ku_usos.cod_uso=query.cod_uso)
  WHERE tbn1_ku_usos.cod_uso IS NULL;

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

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_clases')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_ku_clases(
  id_clase int IDENTITY(1,1),
  id_uso int NOT NULL,
  cod_clase varchar(1) NOT NULL,
  des_clase varchar(30) NOT NULL,
  des_clase_euskera varchar(30) NOT NULL,
  origen varchar(10) NOT NULL,
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_clases UNIQUE (id_uso,cod_clase),
  CONSTRAINT PK_tbn1_ku_clases PRIMARY KEY CLUSTERED (id_clase),
  CONSTRAINT FK_tbn1_ku_clases_tbn1_ku_usos FOREIGN KEY (id_uso) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_usos(id_uso)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_clases' AND COLUMN_NAME='id_clase')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_clases ADD id_clase int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_clases' AND COLUMN_NAME='id_uso')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_clases ADD id_uso int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_clases' AND COLUMN_NAME='cod_clase')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_clases ADD cod_clase varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_clases' AND COLUMN_NAME='des_clase')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_clases ADD des_clase varchar(30)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_clases' AND COLUMN_NAME='des_clase_euskera')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_clases ADD des_clase_euskera varchar(30)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_clases' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_clases ADD origen varchar(10)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_clases' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_clases ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_clases' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_clases ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_clases' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_clases ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_clases' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_clases ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_clases' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_clases ADD CONSTRAINT DF_DBO_TBN1_KU_CLASES_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_clases' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_clases ADD CONSTRAINT DF_DBO_TBN1_KU_CLASES_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_clases' AND COLUMN_NAME='id_clase' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_clases ALTER COLUMN id_clase int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_clases' AND COLUMN_NAME='id_uso' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_clases ALTER COLUMN id_uso int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_clases' AND COLUMN_NAME='cod_clase' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_clases ALTER COLUMN cod_clase varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_clases' AND COLUMN_NAME='des_clase' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_clases ALTER COLUMN des_clase varchar(30) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_clases' AND COLUMN_NAME='des_clase_euskera' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_clases ALTER COLUMN des_clase_euskera varchar(30) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_clases' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_ku_clases SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_clases ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_clases' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_clases ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_clases' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_clases ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_clases' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_clases ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_clases' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_clases ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_clases' AND CONSTRAINT_NAME='PK_tbn1_ku_clases')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_clases ADD CONSTRAINT PK_tbn1_ku_clases PRIMARY KEY CLUSTERED (id_clase)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_clases' AND CONSTRAINT_NAME='FK_tbn1_ku_clases_tbn1_ku_usos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_clases ADD CONSTRAINT FK_tbn1_ku_clases_tbn1_ku_usos FOREIGN KEY (id_uso) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_usos(id_uso)

GO

;WITH
query AS (
  SELECT 1 AS es_indefinido,1 AS id_uso,'' AS cod_clase,'Indefinido' AS des_clase,'Indefinido' AS des_clase_euskera
)
MERGE dbn1_norm_dhyf.dbo.tbn1_ku_clases AS tbn1_ku_clases
USING query ON query.es_indefinido=tbn1_ku_clases.es_indefinido
WHEN MATCHED AND ((tbn1_ku_clases.id_uso<>query.id_uso OR (tbn1_ku_clases.id_uso IS NULL AND query.id_uso IS NOT NULL) OR  (tbn1_ku_clases.id_uso IS NOT NULL AND query.id_uso IS NULL)
                  OR tbn1_ku_clases.cod_clase<>query.cod_clase OR (tbn1_ku_clases.cod_clase IS NULL AND query.cod_clase IS NOT NULL) OR  (tbn1_ku_clases.cod_clase IS NOT NULL AND query.cod_clase IS NULL)
                  OR tbn1_ku_clases.des_clase<>query.des_clase OR (tbn1_ku_clases.des_clase IS NULL AND query.des_clase IS NOT NULL) OR  (tbn1_ku_clases.des_clase IS NOT NULL AND query.des_clase IS NULL)
                  OR tbn1_ku_clases.des_clase_euskera<>query.des_clase_euskera OR (tbn1_ku_clases.des_clase_euskera IS NULL AND query.des_clase_euskera IS NOT NULL) OR  (tbn1_ku_clases.des_clase_euskera IS NOT NULL AND query.des_clase_euskera IS NULL))) THEN
  UPDATE SET
    id_uso=query.id_uso,
    cod_clase=query.cod_clase,
    des_clase=query.des_clase,
    des_clase_euskera=query.des_clase_euskera
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,id_uso,cod_clase,des_clase,des_clase_euskera) VALUES (
    query.es_indefinido,
    query.id_uso,
    query.cod_clase,
    query.des_clase,
    query.des_clase_euskera);
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_ku_clases' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_ku_clases;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_ku_clases(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_clases'
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
      uso.id_uso AS id_uso,
      cla.clase AS cod_clase,
      cla.nombreclase AS des_clase,
      cla.enombreclase AS des_clase_euskera,
      'MAESTRO' AS origen
    FROM dbo.tbn1cla2_cu cla
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_ku_usos uso ON (uso.cod_uso=cla.uso)
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_ku_clases AS tbn1_ku_clases
  USING query ON query.id_uso=tbn1_ku_clases.id_uso AND query.cod_clase=tbn1_ku_clases.cod_clase
  WHEN MATCHED AND ((tbn1_ku_clases.des_clase<>query.des_clase OR (tbn1_ku_clases.des_clase IS NULL AND query.des_clase IS NOT NULL) OR  (tbn1_ku_clases.des_clase IS NOT NULL AND query.des_clase IS NULL)
                    OR tbn1_ku_clases.des_clase_euskera<>query.des_clase_euskera OR (tbn1_ku_clases.des_clase_euskera IS NULL AND query.des_clase_euskera IS NOT NULL) OR  (tbn1_ku_clases.des_clase_euskera IS NOT NULL AND query.des_clase_euskera IS NULL)
                    OR tbn1_ku_clases.origen<>query.origen OR (tbn1_ku_clases.origen IS NULL AND query.origen IS NOT NULL) OR  (tbn1_ku_clases.origen IS NOT NULL AND query.origen IS NULL))) THEN
    UPDATE SET
      des_clase=query.des_clase,
      des_clase_euskera=query.des_clase_euskera,
      origen=query.origen
  WHEN NOT MATCHED THEN
    INSERT (id_uso,cod_clase,des_clase,des_clase_euskera,origen) VALUES (
      query.id_uso,
      query.cod_clase,
      query.des_clase,
      query.des_clase_euskera,
      query.origen);

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_ku_clases_integridad_modalidades' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_ku_clases_integridad_modalidades;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_ku_clases_integridad_modalidades(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_clases_integridad_modalidades'
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
      uso.id_uso AS id_uso,
      moda.clase AS cod_clase,
      'CLASE FALTANTE EN MAESTRO' AS des_clase,
      'CLASE FALTANTE EN MAESTRO' AS des_clase_euskera,
      'MODALIDAD' AS origen
    FROM dbo.tbn1mod3_cu moda
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_ku_usos uso ON (uso.cod_uso=moda.uso)
    GROUP BY
      uso.id_uso,
      moda.clase
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_ku_clases(id_uso,cod_clase,des_clase,des_clase_euskera,origen)
  SELECT
    query.id_uso,
    query.cod_clase,
    query.des_clase,
    query.des_clase_euskera,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_ku_clases ON (tbn1_ku_clases.id_uso=query.id_uso AND tbn1_ku_clases.cod_clase=query.cod_clase)
  WHERE tbn1_ku_clases.id_uso IS NULL;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_ku_clases_integridad_edificios' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_ku_clases_integridad_edificios;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_ku_clases_integridad_edificios(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_clases_integridad_edificios'
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
      uso.id_uso AS id_uso,
      edif.tetmclase AS cod_clase,
      'CLASE FALTANTE EN MAESTRO' AS des_clase,
      'CLASE FALTANTE EN MAESTRO' AS des_clase_euskera,
      'EDIFICIOS' AS origen
    FROM dbo.tbn1edif_cu edif
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_ku_usos uso ON (uso.cod_uso=edif.tetmuso)
    GROUP BY
      uso.id_uso,
      edif.tetmclase
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_ku_clases(id_uso,cod_clase,des_clase,des_clase_euskera,origen)
  SELECT
    query.id_uso,
    query.cod_clase,
    query.des_clase,
    query.des_clase_euskera,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_ku_clases ON (tbn1_ku_clases.id_uso=query.id_uso AND tbn1_ku_clases.cod_clase=query.cod_clase)
  WHERE tbn1_ku_clases.id_uso IS NULL;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_ku_clases_integridad_objetos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_ku_clases_integridad_objetos;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_ku_clases_integridad_objetos(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_clases_integridad_objetos'
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
      uso.id_uso AS id_uso,
      obje.tbclase AS cod_clase,
      'CLASE FALTANTE EN MAESTRO' AS des_clase,
      'CLASE FALTANTE EN MAESTRO' AS des_clase_euskera,
      'OBJETOS' AS origen
    FROM dbo.tbn1obje_cu obje
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_ku_usos uso ON (uso.cod_uso=obje.tbuso)
    GROUP BY
      uso.id_uso,
      obje.tbclase
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_ku_clases(id_uso,cod_clase,des_clase,des_clase_euskera,origen)
  SELECT
    query.id_uso,
    query.cod_clase,
    query.des_clase,
    query.des_clase_euskera,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_ku_clases ON (tbn1_ku_clases.id_uso=query.id_uso AND tbn1_ku_clases.cod_clase=query.cod_clase)
  WHERE tbn1_ku_clases.id_uso IS NULL;

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

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_modalidades')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_ku_modalidades(
  id_modalidad_catastro int IDENTITY(1,1),
  id_uso int NOT NULL,
  id_clase int NOT NULL,
  cod_modalidad varchar(1) NOT NULL,
  des_modalidad varchar(50) NOT NULL,
  des_modalidad_euskera varchar(50) NOT NULL,
  tipo_registro varchar(20),
  origen varchar(10) NOT NULL,
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_modalidad UNIQUE (id_uso,id_clase,cod_modalidad),
  CONSTRAINT PK_tbn1_ku_modalidades PRIMARY KEY CLUSTERED (id_modalidad_catastro),
  CONSTRAINT FK_tbn1_ku_modalidades_tbn1_ku_usos FOREIGN KEY (id_uso) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_usos(id_uso),
  CONSTRAINT FK_tbn1_ku_modalidades_tbn1_ku_clases FOREIGN KEY (id_clase) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_clases(id_clase)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_modalidades' AND COLUMN_NAME='id_modalidad_catastro')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_modalidades ADD id_modalidad_catastro int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_modalidades' AND COLUMN_NAME='id_uso')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_modalidades ADD id_uso int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_modalidades' AND COLUMN_NAME='id_clase')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_modalidades ADD id_clase int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_modalidades' AND COLUMN_NAME='cod_modalidad')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_modalidades ADD cod_modalidad varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_modalidades' AND COLUMN_NAME='des_modalidad')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_modalidades ADD des_modalidad varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_modalidades' AND COLUMN_NAME='des_modalidad_euskera')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_modalidades ADD des_modalidad_euskera varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_modalidades' AND COLUMN_NAME='tipo_registro')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_modalidades ADD tipo_registro varchar(20)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_modalidades' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_modalidades ADD origen varchar(10)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_modalidades' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_modalidades ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_modalidades' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_modalidades ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_modalidades' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_modalidades ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_modalidades' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_modalidades ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_modalidades' AND COLUMN_NAME='origen' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_modalidades ADD CONSTRAINT DF_DBO_TBN1_KU_MODALIDADES_ORIGEN DEFAULT 'MAESTRO' FOR origen

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_modalidades' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_modalidades ADD CONSTRAINT DF_DBO_TBN1_KU_MODALIDADES_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_modalidades' AND COLUMN_NAME='id_modalidad_catastro' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_modalidades ALTER COLUMN id_modalidad_catastro int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_modalidades' AND COLUMN_NAME='id_uso' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_modalidades ALTER COLUMN id_uso int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_modalidades' AND COLUMN_NAME='id_clase' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_modalidades ALTER COLUMN id_clase int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_modalidades' AND COLUMN_NAME='cod_modalidad' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_modalidades ALTER COLUMN cod_modalidad varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_modalidades' AND COLUMN_NAME='des_modalidad' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_modalidades ALTER COLUMN des_modalidad varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_modalidades' AND COLUMN_NAME='des_modalidad_euskera' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_modalidades ALTER COLUMN des_modalidad_euskera varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_modalidades' AND COLUMN_NAME='tipo_registro' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_modalidades ALTER COLUMN tipo_registro varchar(20) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_modalidades' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_ku_modalidades SET origen='MAESTRO' WHERE origen IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_modalidades ALTER COLUMN origen varchar(10) NOT NULL
END

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_modalidades' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_modalidades ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_modalidades' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_modalidades ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_modalidades' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_modalidades ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_modalidades' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_modalidades ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_modalidades' AND CONSTRAINT_NAME='PK_tbn1_ku_modalidades')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_modalidades ADD CONSTRAINT PK_tbn1_ku_modalidades PRIMARY KEY CLUSTERED (id_modalidad_catastro)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_modalidades' AND CONSTRAINT_NAME='FK_tbn1_ku_modalidades_tbn1_ku_usos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_modalidades ADD CONSTRAINT FK_tbn1_ku_modalidades_tbn1_ku_usos FOREIGN KEY (id_uso) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_usos(id_uso)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_modalidades' AND CONSTRAINT_NAME='FK_tbn1_ku_modalidades_tbn1_ku_clases')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_modalidades ADD CONSTRAINT FK_tbn1_ku_modalidades_tbn1_ku_clases FOREIGN KEY (id_clase) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_clases(id_clase)

GO

;WITH
query AS (
  SELECT 1 AS es_indefinido,1 AS id_uso,1 AS id_clase,'' AS cod_modalidad,'Indefinido' AS des_modalidad,'Indefinido' AS des_modalidad_euskera,'Desconocido' AS tipo_registro
)
MERGE dbn1_norm_dhyf.dbo.tbn1_ku_modalidades AS tbn1_ku_modalidades
USING query ON query.es_indefinido=tbn1_ku_modalidades.es_indefinido
WHEN MATCHED AND ((tbn1_ku_modalidades.id_uso<>query.id_uso OR (tbn1_ku_modalidades.id_uso IS NULL AND query.id_uso IS NOT NULL) OR  (tbn1_ku_modalidades.id_uso IS NOT NULL AND query.id_uso IS NULL)
                  OR tbn1_ku_modalidades.id_clase<>query.id_clase OR (tbn1_ku_modalidades.id_clase IS NULL AND query.id_clase IS NOT NULL) OR  (tbn1_ku_modalidades.id_clase IS NOT NULL AND query.id_clase IS NULL)
                  OR tbn1_ku_modalidades.cod_modalidad<>query.cod_modalidad OR (tbn1_ku_modalidades.cod_modalidad IS NULL AND query.cod_modalidad IS NOT NULL) OR  (tbn1_ku_modalidades.cod_modalidad IS NOT NULL AND query.cod_modalidad IS NULL)
                  OR tbn1_ku_modalidades.des_modalidad<>query.des_modalidad OR (tbn1_ku_modalidades.des_modalidad IS NULL AND query.des_modalidad IS NOT NULL) OR  (tbn1_ku_modalidades.des_modalidad IS NOT NULL AND query.des_modalidad IS NULL)
                  OR tbn1_ku_modalidades.des_modalidad_euskera<>query.des_modalidad_euskera OR (tbn1_ku_modalidades.des_modalidad_euskera IS NULL AND query.des_modalidad_euskera IS NOT NULL) OR  (tbn1_ku_modalidades.des_modalidad_euskera IS NOT NULL AND query.des_modalidad_euskera IS NULL)
                  OR tbn1_ku_modalidades.tipo_registro<>query.tipo_registro OR (tbn1_ku_modalidades.tipo_registro IS NULL AND query.tipo_registro IS NOT NULL) OR  (tbn1_ku_modalidades.tipo_registro IS NOT NULL AND query.tipo_registro IS NULL))) THEN
  UPDATE SET
    id_uso=query.id_uso,
    id_clase=query.id_clase,
    cod_modalidad=query.cod_modalidad,
    des_modalidad=query.des_modalidad,
    des_modalidad_euskera=query.des_modalidad_euskera,
    tipo_registro=query.tipo_registro
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,id_uso,id_clase,cod_modalidad,des_modalidad,des_modalidad_euskera,tipo_registro) VALUES (
    query.es_indefinido,
    query.id_uso,
    query.id_clase,
    query.cod_modalidad,
    query.des_modalidad,
    query.des_modalidad_euskera,
    query.tipo_registro);
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_ku_modalidades' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_ku_modalidades;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_ku_modalidades(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_modalidades'
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
      uso.id_uso AS id_uso,
      cla.id_clase AS id_clase,
      moda.modalidad AS cod_modalidad,
      moda.nombremodal AS des_modalidad,
      moda.enombremodal AS des_modalidad_euskera,
      CASE moda.tiporegistro
          WHEN '1' THEN 'Vivienda'
          WHEN '2' THEN 'Industria'
          WHEN '3' THEN 'Otros Usos'
          ELSE 'Desconocido'
      END AS tipo_registro
    FROM dbo.tbn1mod3_cu moda
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_ku_usos uso ON (uso.cod_uso=moda.uso)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_ku_clases cla ON (cla.cod_clase=moda.clase AND cla.id_uso=uso.id_uso)
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_ku_modalidades AS tbn1_ku_modalidades
  USING query ON query.id_uso=tbn1_ku_modalidades.id_uso AND query.id_clase=tbn1_ku_modalidades.id_clase AND query.cod_modalidad=tbn1_ku_modalidades.cod_modalidad
  WHEN MATCHED AND ((tbn1_ku_modalidades.des_modalidad<>query.des_modalidad OR (tbn1_ku_modalidades.des_modalidad IS NULL AND query.des_modalidad IS NOT NULL) OR  (tbn1_ku_modalidades.des_modalidad IS NOT NULL AND query.des_modalidad IS NULL)
                    OR tbn1_ku_modalidades.des_modalidad_euskera<>query.des_modalidad_euskera OR (tbn1_ku_modalidades.des_modalidad_euskera IS NULL AND query.des_modalidad_euskera IS NOT NULL) OR  (tbn1_ku_modalidades.des_modalidad_euskera IS NOT NULL AND query.des_modalidad_euskera IS NULL)
                    OR tbn1_ku_modalidades.tipo_registro<>query.tipo_registro OR (tbn1_ku_modalidades.tipo_registro IS NULL AND query.tipo_registro IS NOT NULL) OR  (tbn1_ku_modalidades.tipo_registro IS NOT NULL AND query.tipo_registro IS NULL))) THEN
    UPDATE SET
      des_modalidad=query.des_modalidad,
      des_modalidad_euskera=query.des_modalidad_euskera,
      tipo_registro=query.tipo_registro
  WHEN NOT MATCHED THEN
    INSERT (id_uso,id_clase,cod_modalidad,des_modalidad,des_modalidad_euskera,tipo_registro) VALUES (
      query.id_uso,
      query.id_clase,
      query.cod_modalidad,
      query.des_modalidad,
      query.des_modalidad_euskera,
      query.tipo_registro);

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_ku_modalidades_integridad_edificios' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_ku_modalidades_integridad_edificios;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_ku_modalidades_integridad_edificios(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_modalidades_integridad_edificios'
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
      uso.id_uso AS id_uso,
      cla.id_clase AS id_clase,
      edif.tetmmodal AS cod_modalidad,
      'MODALIDAD FALTANTE EN MAESTRO' AS des_modalidad,
      'MODALIDAD FALTANTE EN MAESTRO' AS des_modalidad_euskera,
      'Desconocido' AS tipo_registro,
      'EDIFICIOS' AS origen
    FROM dbo.tbn1edif_cu edif
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_ku_usos uso ON (uso.cod_uso=edif.tetmuso)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_ku_clases cla ON (cla.cod_clase=edif.tetmclase AND cla.id_uso=uso.id_uso)
    GROUP BY
      uso.id_uso,
      cla.id_clase,
      edif.tetmmodal
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_ku_modalidades(id_uso,id_clase,cod_modalidad,des_modalidad,des_modalidad_euskera,tipo_registro,origen)
  SELECT
    query.id_uso,
    query.id_clase,
    query.cod_modalidad,
    query.des_modalidad,
    query.des_modalidad_euskera,
    query.tipo_registro,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_ku_modalidades ON (tbn1_ku_modalidades.id_uso=query.id_uso AND tbn1_ku_modalidades.id_clase=query.id_clase AND tbn1_ku_modalidades.cod_modalidad=query.cod_modalidad)
  WHERE tbn1_ku_modalidades.id_uso IS NULL;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_ku_modalidades_integridad_objetos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_ku_modalidades_integridad_objetos;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_ku_modalidades_integridad_objetos(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_modalidades_integridad_objetos'
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
      uso.id_uso AS id_uso,
      cla.id_clase AS id_clase,
      obje.tbmodal AS cod_modalidad,
      'MODALIDAD FALTANTE EN MAESTRO' AS des_modalidad,
      'MODALIDAD FALTANTE EN MAESTRO' AS des_modalidad_euskera,
      'Desconocido' AS tipo_registro,
      'OBJETOS' AS origen
    FROM dbo.tbn1obje_cu obje
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_ku_usos uso ON (uso.cod_uso=obje.tbuso)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_ku_clases cla ON (cla.cod_clase=obje.tbclase AND cla.id_uso=uso.id_uso)
    GROUP BY
      uso.id_uso,
      cla.id_clase,
      obje.tbmodal
  )
  INSERT dbn1_norm_dhyf.dbo.tbn1_ku_modalidades(id_uso,id_clase,cod_modalidad,des_modalidad,des_modalidad_euskera,tipo_registro,origen)
  SELECT
    query.id_uso,
    query.id_clase,
    query.cod_modalidad,
    query.des_modalidad,
    query.des_modalidad_euskera,
    query.tipo_registro,
    query.origen
  FROM query
  LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_ku_modalidades ON (tbn1_ku_modalidades.id_uso=query.id_uso AND tbn1_ku_modalidades.id_clase=query.id_clase AND tbn1_ku_modalidades.cod_modalidad=query.cod_modalidad)
  WHERE tbn1_ku_modalidades.id_uso IS NULL;

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

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_conceptos_edificios')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(
  id_concepto_edificio int IDENTITY(1,1),
  cod_concepto varchar(3),
  des_concepto_larga varchar(50),
  des_concepto_breve varchar(12),
  num_puntos decimal(4,0),
  es_indefinido bit,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_conceptos_edificios UNIQUE (cod_concepto),
  CONSTRAINT PK_tbn1_ku_conceptos_edificios PRIMARY KEY CLUSTERED (id_concepto_edificio)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_conceptos_edificios' AND COLUMN_NAME='id_concepto_edificio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios ADD id_concepto_edificio int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_conceptos_edificios' AND COLUMN_NAME='cod_concepto')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios ADD cod_concepto varchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_conceptos_edificios' AND COLUMN_NAME='des_concepto_larga')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios ADD des_concepto_larga varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_conceptos_edificios' AND COLUMN_NAME='des_concepto_breve')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios ADD des_concepto_breve varchar(12)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_conceptos_edificios' AND COLUMN_NAME='num_puntos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios ADD num_puntos decimal(4,0)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_conceptos_edificios' AND COLUMN_NAME='es_indefinido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios ADD es_indefinido bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_conceptos_edificios' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_conceptos_edificios' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_conceptos_edificios' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_conceptos_edificios' AND COLUMN_NAME='es_indefinido' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios ADD CONSTRAINT DF_DBO_TBN1_KU_CONCEPTOS_EDIFICIOS_ES_INDEFINIDO DEFAULT 0 FOR es_indefinido

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_conceptos_edificios' AND COLUMN_NAME='id_concepto_edificio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios ALTER COLUMN id_concepto_edificio int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_conceptos_edificios' AND COLUMN_NAME='cod_concepto' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios ALTER COLUMN cod_concepto varchar(3) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_conceptos_edificios' AND COLUMN_NAME='des_concepto_larga' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios ALTER COLUMN des_concepto_larga varchar(50) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_conceptos_edificios' AND COLUMN_NAME='des_concepto_breve' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios ALTER COLUMN des_concepto_breve varchar(12) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_conceptos_edificios' AND COLUMN_NAME='num_puntos' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios ALTER COLUMN num_puntos decimal(4,0) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_conceptos_edificios' AND COLUMN_NAME='es_indefinido' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios ALTER COLUMN es_indefinido bit NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_conceptos_edificios' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_conceptos_edificios' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_conceptos_edificios' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_conceptos_edificios' AND CONSTRAINT_NAME='PK_tbn1_ku_conceptos_edificios')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios ADD CONSTRAINT PK_tbn1_ku_conceptos_edificios PRIMARY KEY CLUSTERED (id_concepto_edificio)

GO

;WITH
query AS (
  SELECT 1 AS es_indefinido,0 AS cod_concepto,'DESCONOCIDO' AS des_concepto_larga,'DESCONOCIDO' AS des_concepto_breve
)
MERGE dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios AS tbn1_ku_conceptos_edificios
USING query ON query.es_indefinido=tbn1_ku_conceptos_edificios.es_indefinido
WHEN MATCHED AND ((tbn1_ku_conceptos_edificios.cod_concepto<>query.cod_concepto OR (tbn1_ku_conceptos_edificios.cod_concepto IS NULL AND query.cod_concepto IS NOT NULL) OR  (tbn1_ku_conceptos_edificios.cod_concepto IS NOT NULL AND query.cod_concepto IS NULL)
                  OR tbn1_ku_conceptos_edificios.des_concepto_larga<>query.des_concepto_larga OR (tbn1_ku_conceptos_edificios.des_concepto_larga IS NULL AND query.des_concepto_larga IS NOT NULL) OR  (tbn1_ku_conceptos_edificios.des_concepto_larga IS NOT NULL AND query.des_concepto_larga IS NULL)
                  OR tbn1_ku_conceptos_edificios.des_concepto_breve<>query.des_concepto_breve OR (tbn1_ku_conceptos_edificios.des_concepto_breve IS NULL AND query.des_concepto_breve IS NOT NULL) OR  (tbn1_ku_conceptos_edificios.des_concepto_breve IS NOT NULL AND query.des_concepto_breve IS NULL))) THEN
  UPDATE SET
    cod_concepto=query.cod_concepto,
    des_concepto_larga=query.des_concepto_larga,
    des_concepto_breve=query.des_concepto_breve
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,cod_concepto,des_concepto_larga,des_concepto_breve) VALUES (
    query.es_indefinido,
    query.cod_concepto,
    query.des_concepto_larga,
    query.des_concepto_breve);
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_ku_conceptos_edificios' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_ku_conceptos_edificios;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_ku_conceptos_edificios(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_conceptos_edificios'
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
      right('00'+cast(tconclave as varchar),3) AS cod_concepto,
      tcondenomi AS des_concepto_larga,
      tcondenbrev AS des_concepto_breve,
      tconpuntos AS num_puntos
    FROM dbn1_stg_dhyf.dbo.tbn1tcon_ka con
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios AS tbn1_ku_conceptos_edificios
  USING query ON query.cod_concepto=tbn1_ku_conceptos_edificios.cod_concepto
  WHEN MATCHED AND (tbn1_ku_conceptos_edificios.es_indefinido=0
                    AND (tbn1_ku_conceptos_edificios.des_concepto_larga<>query.des_concepto_larga OR (tbn1_ku_conceptos_edificios.des_concepto_larga IS NULL AND query.des_concepto_larga IS NOT NULL) OR  (tbn1_ku_conceptos_edificios.des_concepto_larga IS NOT NULL AND query.des_concepto_larga IS NULL)
                    OR tbn1_ku_conceptos_edificios.des_concepto_breve<>query.des_concepto_breve OR (tbn1_ku_conceptos_edificios.des_concepto_breve IS NULL AND query.des_concepto_breve IS NOT NULL) OR  (tbn1_ku_conceptos_edificios.des_concepto_breve IS NOT NULL AND query.des_concepto_breve IS NULL)
                    OR tbn1_ku_conceptos_edificios.num_puntos<>query.num_puntos OR (tbn1_ku_conceptos_edificios.num_puntos IS NULL AND query.num_puntos IS NOT NULL) OR  (tbn1_ku_conceptos_edificios.num_puntos IS NOT NULL AND query.num_puntos IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      des_concepto_larga=query.des_concepto_larga,
      des_concepto_breve=query.des_concepto_breve,
      num_puntos=query.num_puntos,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (cod_concepto,des_concepto_larga,des_concepto_breve,num_puntos,fec_alta,fec_modificacion) VALUES (
      query.cod_concepto,
      query.des_concepto_larga,
      query.des_concepto_breve,
      query.num_puntos,
      getdate(),
      getdate())
  WHEN NOT MATCHED BY SOURCE AND (tbn1_ku_conceptos_edificios.es_indefinido=0
                                  AND fec_baja IS NULL) THEN
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

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_ku_maestros' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_ku_maestros;
GO

CREATE PROCEDURE dbo.spn1_cargar_ku_maestros(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_ku_maestros'
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

  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_calles @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_calles_integridad_portales @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_calles_integridad_edificios @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_portales @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_portales_integridad_edificios @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_usos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_usos_integridad_clases @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_usos_integridad_modalidades @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_usos_integridad_edificios @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_usos_integridad_objetos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_clases @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_clases_integridad_modalidades @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_clases_integridad_edificios @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_clases_integridad_objetos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_modalidades @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_modalidades_integridad_edificios @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_modalidades_integridad_objetos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_conceptos_edificios @log;

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

;WITH
query AS (
  SELECT
    1 AS es_indefinido,
    uso.id_uso AS id_uso,
    cla.id_clase AS id_clase,
    moda.id_modalidad_catastro AS id_modalidad_catastro,
    cal.id_calle AS id_calle,
    por.id_portal AS id_portal,
    con.id_concepto_edificio AS id_concepto_edificio
  FROM dbn1_norm_dhyf.dbo.tbn1_ku_usos uso
  CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_ku_clases cla
  CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_ku_modalidades moda
  CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_ku_calles cal
  CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_ku_portales por
  CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios con
  WHERE
    uso.es_indefinido=1
    AND cla.es_indefinido=1
    AND moda.es_indefinido=1
    AND cal.es_indefinido=1
    AND por.es_indefinido=1
    AND con.es_indefinido=1
)
MERGE dbn1_norm_dhyf.dbo.tbn1_indefinidos AS tbn1_indefinidos
USING query ON query.es_indefinido=tbn1_indefinidos.es_indefinido
WHEN MATCHED AND ((tbn1_indefinidos.id_uso<>query.id_uso OR (tbn1_indefinidos.id_uso IS NULL AND query.id_uso IS NOT NULL) OR  (tbn1_indefinidos.id_uso IS NOT NULL AND query.id_uso IS NULL)
                  OR tbn1_indefinidos.id_clase<>query.id_clase OR (tbn1_indefinidos.id_clase IS NULL AND query.id_clase IS NOT NULL) OR  (tbn1_indefinidos.id_clase IS NOT NULL AND query.id_clase IS NULL)
                  OR tbn1_indefinidos.id_modalidad_catastro<>query.id_modalidad_catastro OR (tbn1_indefinidos.id_modalidad_catastro IS NULL AND query.id_modalidad_catastro IS NOT NULL) OR  (tbn1_indefinidos.id_modalidad_catastro IS NOT NULL AND query.id_modalidad_catastro IS NULL)
                  OR tbn1_indefinidos.id_calle<>query.id_calle OR (tbn1_indefinidos.id_calle IS NULL AND query.id_calle IS NOT NULL) OR  (tbn1_indefinidos.id_calle IS NOT NULL AND query.id_calle IS NULL)
                  OR tbn1_indefinidos.id_portal<>query.id_portal OR (tbn1_indefinidos.id_portal IS NULL AND query.id_portal IS NOT NULL) OR  (tbn1_indefinidos.id_portal IS NOT NULL AND query.id_portal IS NULL)
                  OR tbn1_indefinidos.id_concepto_edificio<>query.id_concepto_edificio OR (tbn1_indefinidos.id_concepto_edificio IS NULL AND query.id_concepto_edificio IS NOT NULL) OR  (tbn1_indefinidos.id_concepto_edificio IS NOT NULL AND query.id_concepto_edificio IS NULL))) THEN
  UPDATE SET
    id_uso=query.id_uso,
    id_clase=query.id_clase,
    id_modalidad_catastro=query.id_modalidad_catastro,
    id_calle=query.id_calle,
    id_portal=query.id_portal,
    id_concepto_edificio=query.id_concepto_edificio
WHEN NOT MATCHED THEN
  INSERT (es_indefinido,id_uso,id_clase,id_modalidad_catastro,id_calle,id_portal,id_concepto_edificio) VALUES (
    query.es_indefinido,
    query.id_uso,
    query.id_clase,
    query.id_modalidad_catastro,
    query.id_calle,
    query.id_portal,
    query.id_concepto_edificio);
GO

