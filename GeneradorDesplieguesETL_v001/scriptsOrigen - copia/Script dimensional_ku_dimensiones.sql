PRINT 'dimensional_ku_dimensiones.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_objetos')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_objetos(
  id_dim_objetos int IDENTITY(1,1),
  origen varchar(1) NOT NULL,
  numero_fijo varchar(7) NOT NULL,
  letra_fija varchar(1) NOT NULL,
  indicador_desagregacion varchar(2) NOT NULL,
  id_calle int NOT NULL,
  id_portal int NOT NULL--,  
--  superficie_planta decimal(5) NOT NULL,
--  superficie_objeto decimal(11,6) NOT NULL  
  CONSTRAINT uk_ku_dim_objetos UNIQUE (origen,numero_fijo,letra_fija,indicador_desagregacion),--,superficie_planta,superficie_objeto),
  CONSTRAINT PK_tbn1_ku_dim_objetos PRIMARY KEY CLUSTERED (id_dim_objetos),
  CONSTRAINT FK_tbn1_ku_dim_objetos_tbn1_ku_mae_calles FOREIGN KEY (id_calle) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_mae_calles(id_calle),
  CONSTRAINT FK_tbn1_ku_dim_objetos_tbn1_ku_mae_portales FOREIGN KEY (id_portal) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_mae_portales(id_portal) 
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_objetos' AND COLUMN_NAME='id_dim_objetos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_objetos ADD id_dim_objetos int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_objetos' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_objetos ADD origen varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_objetos' AND COLUMN_NAME='numero_fijo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_objetos ADD numero_fijo varchar(7)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_objetos' AND COLUMN_NAME='letra_fija')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_objetos ADD letra_fija varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_objetos' AND COLUMN_NAME='indicador_desagregacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_objetos ADD indicador_desagregacion varchar(2)

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_objetos' AND COLUMN_NAME='id_dim_objetos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_objetos ALTER COLUMN id_dim_objetos int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_objetos' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_objetos ALTER COLUMN origen varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_objetos' AND COLUMN_NAME='numero_fijo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_objetos ALTER COLUMN numero_fijo varchar(7) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_objetos' AND COLUMN_NAME='letra_fija' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_objetos ALTER COLUMN letra_fija varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_objetos' AND COLUMN_NAME='indicador_desagregacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_objetos ALTER COLUMN indicador_desagregacion varchar(2) NOT NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_objetos' AND CONSTRAINT_NAME='PK_tbn1_ku_dim_objetos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_objetos ADD CONSTRAINT PK_tbn1_ku_dim_objetos PRIMARY KEY CLUSTERED (id_dim_objetos)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_ku_dim_objetos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_ku_dim_objetos;
GO

CREATE PROCEDURE dbo.spn1_cargar_ku_dim_objetos(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_ku_dim_objetos'
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
      origen,
      numero_fijo,
      letra_fija,
      indicador_desagregacion,
	  id_calle,
	  id_portal--,
--	  superficie_planta,
--	  superficie_objeto
    FROM dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ds_t
    WHERE ds_t.fec_baja IS NULL
    GROUP BY
      origen,
      numero_fijo,
      letra_fija,
      indicador_desagregacion,
	  id_calle,
	  id_portal--,	  
--	  superficie_planta,
--	  superficie_objeto
  )
  MERGE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_objetos AS tbn1_ku_dim_objetos
  USING query ON query.origen=tbn1_ku_dim_objetos.origen AND query.numero_fijo=tbn1_ku_dim_objetos.numero_fijo AND query.letra_fija=tbn1_ku_dim_objetos.letra_fija AND query.indicador_desagregacion=tbn1_ku_dim_objetos.indicador_desagregacion  --AND query.superficie_planta=tbn1_ku_dim_objetos.superficie_planta AND query.superficie_objeto=tbn1_ku_dim_objetos.superficie_objeto
  WHEN NOT MATCHED THEN
    INSERT (origen,numero_fijo,letra_fija,indicador_desagregacion,id_calle, id_portal--, superficie_planta,superficie_objeto
	) VALUES (
      query.origen,
      query.numero_fijo,
      query.letra_fija,
      query.indicador_desagregacion,
	  query.id_calle,
	  query.id_portal)--,
--	  query.superficie_planta,
--	  query.superficie_objeto)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_otros_atributos')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_otros_atributos(
  id_dim_otros_atributos int IDENTITY(1,1),
  escalera_planta_mano_puerta varchar(8) NOT NULL,
  actividad_dedicada varchar(2) NOT NULL,
  tipo_titularidad_bien varchar(1) NOT NULL,
  tipo_persona_fisica_juridica varchar(1) NOT NULL,
  tipo_propietario varchar(1) NOT NULL,
  num_relacion varchar(9) NOT NULL,
  CONSTRAINT uk_ku_dim_otros_atributos UNIQUE (escalera_planta_mano_puerta,actividad_dedicada,tipo_titularidad_bien,tipo_persona_fisica_juridica,tipo_propietario,num_relacion),
  CONSTRAINT PK_tbn1_ku_dim_otros_atributos PRIMARY KEY CLUSTERED (id_dim_otros_atributos)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_otros_atributos' AND COLUMN_NAME='id_dim_otros_atributos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_otros_atributos ADD id_dim_otros_atributos int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_otros_atributos' AND COLUMN_NAME='escalera_planta_mano_puerta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_otros_atributos ADD escalera_planta_mano_puerta varchar(8)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_otros_atributos' AND COLUMN_NAME='actividad_dedicada')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_otros_atributos ADD actividad_dedicada varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_otros_atributos' AND COLUMN_NAME='tipo_titularidad_bien')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_otros_atributos ADD tipo_titularidad_bien varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_otros_atributos' AND COLUMN_NAME='tipo_persona_fisica_juridica')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_otros_atributos ADD tipo_persona_fisica_juridica varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_otros_atributos' AND COLUMN_NAME='tipo_propietario')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_otros_atributos ADD tipo_propietario varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_otros_atributos' AND COLUMN_NAME='num_relacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_otros_atributos ADD num_relacion varchar(9)

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_otros_atributos' AND COLUMN_NAME='id_dim_otros_atributos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_otros_atributos ALTER COLUMN id_dim_otros_atributos int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_otros_atributos' AND COLUMN_NAME='escalera_planta_mano_puerta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_otros_atributos ALTER COLUMN escalera_planta_mano_puerta varchar(8) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_otros_atributos' AND COLUMN_NAME='actividad_dedicada' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_otros_atributos ALTER COLUMN actividad_dedicada varchar(2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_otros_atributos' AND COLUMN_NAME='tipo_titularidad_bien' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_otros_atributos ALTER COLUMN tipo_titularidad_bien varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_otros_atributos' AND COLUMN_NAME='tipo_persona_fisica_juridica' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_otros_atributos ALTER COLUMN tipo_persona_fisica_juridica varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_otros_atributos' AND COLUMN_NAME='tipo_propietario' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_otros_atributos ALTER COLUMN tipo_propietario varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_otros_atributos' AND COLUMN_NAME='num_relacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_otros_atributos ALTER COLUMN num_relacion varchar(9) NOT NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_otros_atributos' AND CONSTRAINT_NAME='PK_tbn1_ku_dim_otros_atributos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_otros_atributos ADD CONSTRAINT PK_tbn1_ku_dim_otros_atributos PRIMARY KEY CLUSTERED (id_dim_otros_atributos)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_ku_dim_otros_atributos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_ku_dim_otros_atributos;
GO

CREATE PROCEDURE dbo.spn1_cargar_ku_dim_otros_atributos(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_ku_dim_otros_atributos'
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
      escalera_planta_mano_puerta,
      actividad_dedicada,
      tipo_titularidad_bien,
      tipo_persona_fisica_juridica,
      tipo_propietario,
      num_relacion
    FROM dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ds_t
    WHERE ds_t.fec_baja IS NULL
    GROUP BY
      escalera_planta_mano_puerta,
      actividad_dedicada,
      tipo_titularidad_bien,
      tipo_persona_fisica_juridica,
      tipo_propietario,
      num_relacion
  )
  MERGE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_otros_atributos AS tbn1_ku_dim_otros_atributos
  USING query ON query.escalera_planta_mano_puerta=tbn1_ku_dim_otros_atributos.escalera_planta_mano_puerta AND query.actividad_dedicada=tbn1_ku_dim_otros_atributos.actividad_dedicada AND query.tipo_titularidad_bien=tbn1_ku_dim_otros_atributos.tipo_titularidad_bien AND query.tipo_persona_fisica_juridica=tbn1_ku_dim_otros_atributos.tipo_persona_fisica_juridica AND query.tipo_propietario=tbn1_ku_dim_otros_atributos.tipo_propietario AND query.num_relacion=tbn1_ku_dim_otros_atributos.num_relacion
  WHEN NOT MATCHED THEN
    INSERT (escalera_planta_mano_puerta,actividad_dedicada,tipo_titularidad_bien,tipo_persona_fisica_juridica,tipo_propietario,num_relacion) VALUES (
      query.escalera_planta_mano_puerta,
      query.actividad_dedicada,
      query.tipo_titularidad_bien,
      query.tipo_persona_fisica_juridica,
      query.tipo_propietario,
      query.num_relacion)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_ucm')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_ucm(
  id_dim_ucm int IDENTITY(1,1),
  id_uso_objeto int NOT NULL,
  id_clase_objeto int NOT NULL,
  id_modalidad_catastro_objeto int NOT NULL,
  id_uso_edificio int NOT NULL,
  id_clase_edificio int NOT NULL,
  id_modalidad_catastro_edificio int NOT NULL,
  CONSTRAINT uk_ku_dim_ucm UNIQUE (id_uso_objeto,id_clase_objeto,id_modalidad_catastro_objeto,id_uso_edificio,id_clase_edificio,id_modalidad_catastro_edificio),
  CONSTRAINT PK_tbn1_ku_dim_ucm PRIMARY KEY CLUSTERED (id_dim_ucm),
  CONSTRAINT FK_tbn1_ku_dim_ucm_tbn1_ku_mae_usos FOREIGN KEY (id_uso_objeto) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_mae_usos(id_uso),
  CONSTRAINT FK_tbn1_ku_dim_ucm_tbn1_ku_mae_clases FOREIGN KEY (id_clase_objeto) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_mae_clases(id_clase),
  CONSTRAINT FK_tbn1_ku_dim_ucm_tbn1_ku_mae_modalidades FOREIGN KEY (id_modalidad_catastro_objeto) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_mae_modalidades(id_modalidad_catastro),
  CONSTRAINT FK_tbn1_ku_dim_ucm_tbn1_ku_mae_usos1 FOREIGN KEY (id_uso_edificio) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_mae_usos(id_uso),
  CONSTRAINT FK_tbn1_ku_dim_ucm_tbn1_ku_mae_clases1 FOREIGN KEY (id_clase_edificio) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_mae_clases(id_clase),
  CONSTRAINT FK_tbn1_ku_dim_ucm_tbn1_ku_mae_modalidades1 FOREIGN KEY (id_modalidad_catastro_edificio) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_mae_modalidades(id_modalidad_catastro)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_ucm' AND COLUMN_NAME='id_dim_ucm')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_ucm ADD id_dim_ucm int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_ucm' AND COLUMN_NAME='id_uso_objeto')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_ucm ADD id_uso_objeto int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_ucm' AND COLUMN_NAME='id_clase_objeto')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_ucm ADD id_clase_objeto int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_ucm' AND COLUMN_NAME='id_modalidad_catastro_objeto')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_ucm ADD id_modalidad_catastro_objeto int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_ucm' AND COLUMN_NAME='id_uso_edificio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_ucm ADD id_uso_edificio int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_ucm' AND COLUMN_NAME='id_clase_edificio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_ucm ADD id_clase_edificio int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_ucm' AND COLUMN_NAME='id_modalidad_catastro_edificio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_ucm ADD id_modalidad_catastro_edificio int

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_ucm' AND COLUMN_NAME='id_dim_ucm' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_ucm ALTER COLUMN id_dim_ucm int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_ucm' AND COLUMN_NAME='id_uso_objeto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_ucm ALTER COLUMN id_uso_objeto int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_ucm' AND COLUMN_NAME='id_clase_objeto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_ucm ALTER COLUMN id_clase_objeto int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_ucm' AND COLUMN_NAME='id_modalidad_catastro_objeto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_ucm ALTER COLUMN id_modalidad_catastro_objeto int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_ucm' AND COLUMN_NAME='id_uso_edificio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_ucm ALTER COLUMN id_uso_edificio int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_ucm' AND COLUMN_NAME='id_clase_edificio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_ucm ALTER COLUMN id_clase_edificio int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_ucm' AND COLUMN_NAME='id_modalidad_catastro_edificio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_ucm ALTER COLUMN id_modalidad_catastro_edificio int NOT NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_ucm' AND CONSTRAINT_NAME='PK_tbn1_ku_dim_ucm')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_ucm ADD CONSTRAINT PK_tbn1_ku_dim_ucm PRIMARY KEY CLUSTERED (id_dim_ucm)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_ucm' AND CONSTRAINT_NAME='FK_tbn1_ku_dim_ucm_tbn1_ku_mae_usos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_ucm ADD CONSTRAINT FK_tbn1_ku_dim_ucm_tbn1_ku_mae_usos FOREIGN KEY (id_uso_objeto) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_mae_usos(id_uso)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_ucm' AND CONSTRAINT_NAME='FK_tbn1_ku_dim_ucm_tbn1_ku_mae_clases')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_ucm ADD CONSTRAINT FK_tbn1_ku_dim_ucm_tbn1_ku_mae_clases FOREIGN KEY (id_clase_objeto) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_mae_clases(id_clase)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_ucm' AND CONSTRAINT_NAME='FK_tbn1_ku_dim_ucm_tbn1_ku_mae_modalidades')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_ucm ADD CONSTRAINT FK_tbn1_ku_dim_ucm_tbn1_ku_mae_modalidades FOREIGN KEY (id_modalidad_catastro_objeto) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_mae_modalidades(id_modalidad_catastro)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_ucm' AND CONSTRAINT_NAME='FK_tbn1_ku_dim_ucm_tbn1_ku_mae_usos1')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_ucm ADD CONSTRAINT FK_tbn1_ku_dim_ucm_tbn1_ku_mae_usos1 FOREIGN KEY (id_uso_edificio) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_mae_usos(id_uso)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_ucm' AND CONSTRAINT_NAME='FK_tbn1_ku_dim_ucm_tbn1_ku_mae_clases1')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_ucm ADD CONSTRAINT FK_tbn1_ku_dim_ucm_tbn1_ku_mae_clases1 FOREIGN KEY (id_clase_edificio) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_mae_clases(id_clase)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_ucm' AND CONSTRAINT_NAME='FK_tbn1_ku_dim_ucm_tbn1_ku_mae_modalidades1')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_ucm ADD CONSTRAINT FK_tbn1_ku_dim_ucm_tbn1_ku_mae_modalidades1 FOREIGN KEY (id_modalidad_catastro_edificio) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_mae_modalidades(id_modalidad_catastro)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_ku_dim_ucm' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_ku_dim_ucm;
GO

CREATE PROCEDURE dbo.spn1_cargar_ku_dim_ucm(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_ku_dim_ucm'
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
      id_uso_objeto,
      id_clase_objeto,
      id_modalidad_catastro_objeto,
      id_uso_edificio,
      id_clase_edificio,
      id_modalidad_catastro_edificio
    FROM dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ds_t
    WHERE ds_t.fec_baja IS NULL
    GROUP BY
      id_uso_objeto,
      id_clase_objeto,
      id_modalidad_catastro_objeto,
      id_uso_edificio,
      id_clase_edificio,
      id_modalidad_catastro_edificio
  )
  MERGE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_ucm AS tbn1_ku_dim_ucm
  USING query ON query.id_uso_objeto=tbn1_ku_dim_ucm.id_uso_objeto AND query.id_clase_objeto=tbn1_ku_dim_ucm.id_clase_objeto AND query.id_modalidad_catastro_objeto=tbn1_ku_dim_ucm.id_modalidad_catastro_objeto AND query.id_uso_edificio=tbn1_ku_dim_ucm.id_uso_edificio AND query.id_clase_edificio=tbn1_ku_dim_ucm.id_clase_edificio AND query.id_modalidad_catastro_edificio=tbn1_ku_dim_ucm.id_modalidad_catastro_edificio
  WHEN NOT MATCHED THEN
    INSERT (id_uso_objeto,id_clase_objeto,id_modalidad_catastro_objeto,id_uso_edificio,id_clase_edificio,id_modalidad_catastro_edificio) VALUES (
      query.id_uso_objeto,
      query.id_clase_objeto,
      query.id_modalidad_catastro_objeto,
      query.id_uso_edificio,
      query.id_clase_edificio,
      query.id_modalidad_catastro_edificio)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_edificios')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_edificios(
  id_dim_edificios int IDENTITY(1,1),
  id_edificio int NOT NULL,
  CONSTRAINT uk_ku_dim_edificios UNIQUE (id_edificio),
  CONSTRAINT PK_tbn1_ku_dim_edificios PRIMARY KEY CLUSTERED (id_dim_edificios)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_edificios' AND COLUMN_NAME='id_dim_edificios')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_edificios ADD id_dim_edificios int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_edificios' AND COLUMN_NAME='id_edificio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_edificios ADD id_edificio int

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_edificios' AND COLUMN_NAME='id_dim_edificios' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_edificios ALTER COLUMN id_dim_edificios int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_edificios' AND COLUMN_NAME='id_edificio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_edificios ALTER COLUMN id_edificio int NOT NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_edificios' AND CONSTRAINT_NAME='PK_tbn1_ku_dim_edificios')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_edificios ADD CONSTRAINT PK_tbn1_ku_dim_edificios PRIMARY KEY CLUSTERED (id_dim_edificios)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_ku_dim_edificios' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_ku_dim_edificios;
GO

CREATE PROCEDURE dbo.spn1_cargar_ku_dim_edificios(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_ku_dim_edificios'
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
    SELECT id_edificio
    FROM dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ds_t
    WHERE ds_t.fec_baja IS NULL
    GROUP BY id_edificio
  )
  MERGE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_edificios AS tbn1_ku_dim_edificios
  USING query ON query.id_edificio=tbn1_ku_dim_edificios.id_edificio
  WHEN NOT MATCHED THEN
    INSERT (id_edificio) VALUES (
      query.id_edificio)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_marcas')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_marcas(
  id_dim_marcas int IDENTITY(1,1),
  es_caserio_rural bit NOT NULL,
  tiene_cubierta varchar(1) NOT NULL,
  servicio_urbanistico_agua bit NOT NULL,
  servicio_urbanistico_luz bit NOT NULL,
  servicio_alcantarillado bit NOT NULL,
  servicio_pavimento_calzada bit NOT NULL,
  servicio_encintado_acero bit NOT NULL,
  es_subedificada varchar(2) NOT NULL,
  es_identificado varchar(1) NOT NULL,
  tiene_acceso_por_portal bit NOT NULL,
  es_local_interior bit NOT NULL,
  CONSTRAINT uk_ku_dim_marcas UNIQUE (es_caserio_rural,tiene_cubierta,servicio_urbanistico_agua,servicio_urbanistico_luz,servicio_alcantarillado,servicio_pavimento_calzada,servicio_encintado_acero,es_subedificada,es_identificado,tiene_acceso_por_portal,es_local_interior),
  CONSTRAINT PK_tbn1_ku_dim_marcas PRIMARY KEY CLUSTERED (id_dim_marcas)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_marcas' AND COLUMN_NAME='id_dim_marcas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_marcas ADD id_dim_marcas int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_marcas' AND COLUMN_NAME='es_caserio_rural')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_marcas ADD es_caserio_rural bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_marcas' AND COLUMN_NAME='tiene_cubierta')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_marcas ADD tiene_cubierta varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_marcas' AND COLUMN_NAME='servicio_urbanistico_agua')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_marcas ADD servicio_urbanistico_agua bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_marcas' AND COLUMN_NAME='servicio_urbanistico_luz')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_marcas ADD servicio_urbanistico_luz bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_marcas' AND COLUMN_NAME='servicio_alcantarillado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_marcas ADD servicio_alcantarillado bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_marcas' AND COLUMN_NAME='servicio_pavimento_calzada')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_marcas ADD servicio_pavimento_calzada bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_marcas' AND COLUMN_NAME='servicio_encintado_acero')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_marcas ADD servicio_encintado_acero bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_marcas' AND COLUMN_NAME='es_subedificada')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_marcas ADD es_subedificada varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_marcas' AND COLUMN_NAME='es_identificado')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_marcas ADD es_identificado varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_marcas' AND COLUMN_NAME='tiene_acceso_por_portal')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_marcas ADD tiene_acceso_por_portal bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_marcas' AND COLUMN_NAME='es_local_interior')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_marcas ADD es_local_interior bit

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_marcas' AND COLUMN_NAME='es_caserio_rural' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_marcas ADD CONSTRAINT DF_DBO_TBN1_KU_DIM_MARCAS_ES_CASERIO_RURAL DEFAULT 0 FOR es_caserio_rural

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_marcas' AND COLUMN_NAME='id_dim_marcas' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_marcas ALTER COLUMN id_dim_marcas int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_marcas' AND COLUMN_NAME='es_caserio_rural' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_marcas SET es_caserio_rural=0 WHERE es_caserio_rural IS NULL
  ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_marcas ALTER COLUMN es_caserio_rural bit NOT NULL
END

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_marcas' AND COLUMN_NAME='tiene_cubierta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_marcas ALTER COLUMN tiene_cubierta varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_marcas' AND COLUMN_NAME='servicio_urbanistico_agua' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_marcas ALTER COLUMN servicio_urbanistico_agua bit NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_marcas' AND COLUMN_NAME='servicio_urbanistico_luz' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_marcas ALTER COLUMN servicio_urbanistico_luz bit NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_marcas' AND COLUMN_NAME='servicio_alcantarillado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_marcas ALTER COLUMN servicio_alcantarillado bit NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_marcas' AND COLUMN_NAME='servicio_pavimento_calzada' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_marcas ALTER COLUMN servicio_pavimento_calzada bit NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_marcas' AND COLUMN_NAME='servicio_encintado_acero' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_marcas ALTER COLUMN servicio_encintado_acero bit NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_marcas' AND COLUMN_NAME='es_subedificada' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_marcas ALTER COLUMN es_subedificada varchar(2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_marcas' AND COLUMN_NAME='es_identificado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_marcas ALTER COLUMN es_identificado varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_marcas' AND COLUMN_NAME='tiene_acceso_por_portal' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_marcas ALTER COLUMN tiene_acceso_por_portal bit NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_marcas' AND COLUMN_NAME='es_local_interior' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_marcas ALTER COLUMN es_local_interior bit NOT NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_marcas' AND CONSTRAINT_NAME='PK_tbn1_ku_dim_marcas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_marcas ADD CONSTRAINT PK_tbn1_ku_dim_marcas PRIMARY KEY CLUSTERED (id_dim_marcas)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_ku_dim_marcas' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_ku_dim_marcas;
GO

CREATE PROCEDURE dbo.spn1_cargar_ku_dim_marcas(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_ku_dim_marcas'
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
      es_caserio_rural,
      tiene_cubierta,
      servicio_urbanistico_agua,
      servicio_urbanistico_luz,
      servicio_alcantarillado,
      servicio_pavimento_calzada,
      servicio_encintado_acero,
      es_subedificada,
      es_identificado,
      tiene_acceso_por_portal,
      es_local_interior
    FROM dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ds_t
    WHERE ds_t.fec_baja IS NULL
    GROUP BY
      es_caserio_rural,
      tiene_cubierta,
      servicio_urbanistico_agua,
      servicio_urbanistico_luz,
      servicio_alcantarillado,
      servicio_pavimento_calzada,
      servicio_encintado_acero,
      es_subedificada,
      es_identificado,
      tiene_acceso_por_portal,
      es_local_interior
  )
  MERGE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_marcas AS tbn1_ku_dim_marcas
  USING query ON query.es_caserio_rural=tbn1_ku_dim_marcas.es_caserio_rural AND query.tiene_cubierta=tbn1_ku_dim_marcas.tiene_cubierta AND query.servicio_urbanistico_agua=tbn1_ku_dim_marcas.servicio_urbanistico_agua AND query.servicio_urbanistico_luz=tbn1_ku_dim_marcas.servicio_urbanistico_luz AND query.servicio_alcantarillado=tbn1_ku_dim_marcas.servicio_alcantarillado AND query.servicio_pavimento_calzada=tbn1_ku_dim_marcas.servicio_pavimento_calzada AND query.servicio_encintado_acero=tbn1_ku_dim_marcas.servicio_encintado_acero AND query.es_subedificada=tbn1_ku_dim_marcas.es_subedificada AND query.es_identificado=tbn1_ku_dim_marcas.es_identificado AND query.tiene_acceso_por_portal=tbn1_ku_dim_marcas.tiene_acceso_por_portal AND query.es_local_interior=tbn1_ku_dim_marcas.es_local_interior
  WHEN NOT MATCHED THEN
    INSERT (es_caserio_rural,tiene_cubierta,servicio_urbanistico_agua,servicio_urbanistico_luz,servicio_alcantarillado,servicio_pavimento_calzada,servicio_encintado_acero,es_subedificada,es_identificado,tiene_acceso_por_portal,es_local_interior) VALUES (
      query.es_caserio_rural,
      query.tiene_cubierta,
      query.servicio_urbanistico_agua,
      query.servicio_urbanistico_luz,
      query.servicio_alcantarillado,
      query.servicio_pavimento_calzada,
      query.servicio_encintado_acero,
      query.es_subedificada,
      query.es_identificado,
      query.tiene_acceso_por_portal,
      query.es_local_interior)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_fechas')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_fechas(
  id_dim_fechas int IDENTITY(1,1),
  fecha_baja_edificio date NOT NULL,
  fecha_valoracion_edificio date NOT NULL,
  fecha_categoria_construccion date NOT NULL,
  fecha_valoracion_parcela date NOT NULL,
  fecha_baja_titular date NOT NULL,
  fecha_identificacion date NOT NULL,
  fecha_alta_titular date NOT NULL,
  fecha_transmision_dominio date NOT NULL,
  CONSTRAINT uk_ku_dim_fechas UNIQUE (fecha_baja_edificio,fecha_valoracion_edificio,fecha_categoria_construccion,fecha_valoracion_parcela,fecha_baja_titular,fecha_identificacion,fecha_alta_titular,fecha_transmision_dominio),
  CONSTRAINT PK_tbn1_ku_dim_fechas PRIMARY KEY CLUSTERED (id_dim_fechas)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_fechas' AND COLUMN_NAME='id_dim_fechas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_fechas ADD id_dim_fechas int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_fechas' AND COLUMN_NAME='fecha_baja_edificio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_fechas ADD fecha_baja_edificio date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_fechas' AND COLUMN_NAME='fecha_valoracion_edificio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_fechas ADD fecha_valoracion_edificio date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_fechas' AND COLUMN_NAME='fecha_categoria_construccion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_fechas ADD fecha_categoria_construccion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_fechas' AND COLUMN_NAME='fecha_valoracion_parcela')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_fechas ADD fecha_valoracion_parcela date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_fechas' AND COLUMN_NAME='fecha_baja_titular')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_fechas ADD fecha_baja_titular date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_fechas' AND COLUMN_NAME='fecha_identificacion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_fechas ADD fecha_identificacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_fechas' AND COLUMN_NAME='fecha_alta_titular')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_fechas ADD fecha_alta_titular date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_fechas' AND COLUMN_NAME='fecha_transmision_dominio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_fechas ADD fecha_transmision_dominio date

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_fechas' AND COLUMN_NAME='id_dim_fechas' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_fechas ALTER COLUMN id_dim_fechas int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_fechas' AND COLUMN_NAME='fecha_baja_edificio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_fechas ALTER COLUMN fecha_baja_edificio date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_fechas' AND COLUMN_NAME='fecha_valoracion_edificio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_fechas ALTER COLUMN fecha_valoracion_edificio date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_fechas' AND COLUMN_NAME='fecha_categoria_construccion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_fechas ALTER COLUMN fecha_categoria_construccion date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_fechas' AND COLUMN_NAME='fecha_valoracion_parcela' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_fechas ALTER COLUMN fecha_valoracion_parcela date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_fechas' AND COLUMN_NAME='fecha_baja_titular' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_fechas ALTER COLUMN fecha_baja_titular date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_fechas' AND COLUMN_NAME='fecha_identificacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_fechas ALTER COLUMN fecha_identificacion date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_fechas' AND COLUMN_NAME='fecha_alta_titular' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_fechas ALTER COLUMN fecha_alta_titular date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_fechas' AND COLUMN_NAME='fecha_transmision_dominio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_fechas ALTER COLUMN fecha_transmision_dominio date NOT NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_fechas' AND CONSTRAINT_NAME='PK_tbn1_ku_dim_fechas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_fechas ADD CONSTRAINT PK_tbn1_ku_dim_fechas PRIMARY KEY CLUSTERED (id_dim_fechas)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_ku_dim_fechas' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_ku_dim_fechas;
GO

CREATE PROCEDURE dbo.spn1_cargar_ku_dim_fechas(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_ku_dim_fechas'
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
      fecha_baja_edificio,
      fecha_valoracion_edificio,
      fecha_categoria_construccion,
      fecha_valoracion_parcela,
      fecha_baja_titular,
      fecha_identificacion,
      fecha_alta_titular,
      fecha_transmision_dominio
    FROM dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ds_t
    WHERE ds_t.fec_baja IS NULL
    GROUP BY
      fecha_baja_edificio,
      fecha_valoracion_edificio,
      fecha_categoria_construccion,
      fecha_valoracion_parcela,
      fecha_baja_titular,
      fecha_identificacion,
      fecha_alta_titular,
      fecha_transmision_dominio
  )
  MERGE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_fechas AS tbn1_ku_dim_fechas
  USING query ON query.fecha_baja_edificio=tbn1_ku_dim_fechas.fecha_baja_edificio AND query.fecha_valoracion_edificio=tbn1_ku_dim_fechas.fecha_valoracion_edificio AND query.fecha_categoria_construccion=tbn1_ku_dim_fechas.fecha_categoria_construccion AND query.fecha_valoracion_parcela=tbn1_ku_dim_fechas.fecha_valoracion_parcela AND query.fecha_baja_titular=tbn1_ku_dim_fechas.fecha_baja_titular AND query.fecha_identificacion=tbn1_ku_dim_fechas.fecha_identificacion AND query.fecha_alta_titular=tbn1_ku_dim_fechas.fecha_alta_titular AND query.fecha_transmision_dominio=tbn1_ku_dim_fechas.fecha_transmision_dominio
  WHEN NOT MATCHED THEN
    INSERT (fecha_baja_edificio,fecha_valoracion_edificio,fecha_categoria_construccion,fecha_valoracion_parcela,fecha_baja_titular,fecha_identificacion,fecha_alta_titular,fecha_transmision_dominio) VALUES (
      query.fecha_baja_edificio,
      query.fecha_valoracion_edificio,
      query.fecha_categoria_construccion,
      query.fecha_valoracion_parcela,
      query.fecha_baja_titular,
      query.fecha_identificacion,
      query.fecha_alta_titular,
      query.fecha_transmision_dominio)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_parcelas')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_parcelas(
  id_dim_parcelas int IDENTITY(1,1),
  id_parcela int NOT NULL,
  CONSTRAINT uk_ku_dim_parcelas UNIQUE (id_parcela),
  CONSTRAINT PK_tbn1_ku_dim_parcelas PRIMARY KEY CLUSTERED (id_dim_parcelas),
  CONSTRAINT FK_tbn1_ku_dim_parcelas_tbn1_ku_mae_parcelas FOREIGN KEY (id_parcela) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_mae_parcelas(id_parcela)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_parcelas' AND COLUMN_NAME='id_dim_parcelas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_parcelas ADD id_dim_parcelas int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_parcelas' AND COLUMN_NAME='id_parcela')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_parcelas ADD id_parcela int

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_parcelas' AND COLUMN_NAME='id_dim_parcelas' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_parcelas ALTER COLUMN id_dim_parcelas int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_parcelas' AND COLUMN_NAME='id_parcela' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_parcelas ALTER COLUMN id_parcela int NOT NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_parcelas' AND CONSTRAINT_NAME='PK_tbn1_ku_dim_parcelas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_parcelas ADD CONSTRAINT PK_tbn1_ku_dim_parcelas PRIMARY KEY CLUSTERED (id_dim_parcelas)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_parcelas' AND CONSTRAINT_NAME='FK_tbn1_ku_dim_parcelas_tbn1_ku_mae_parcelas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_parcelas ADD CONSTRAINT FK_tbn1_ku_dim_parcelas_tbn1_ku_mae_parcelas FOREIGN KEY (id_parcela) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_mae_parcelas(id_parcela)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_ku_dim_parcelas' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_ku_dim_parcelas;
GO

CREATE PROCEDURE dbo.spn1_cargar_ku_dim_parcelas(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_ku_dim_parcelas'
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
    SELECT id_parcela
    FROM dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ds_t
    WHERE ds_t.fec_baja IS NULL
    GROUP BY id_parcela
  )
  MERGE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_parcelas AS tbn1_ku_dim_parcelas
  USING query ON query.id_parcela=tbn1_ku_dim_parcelas.id_parcela
  WHEN NOT MATCHED THEN
    INSERT (id_parcela) VALUES (
      query.id_parcela)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_titulares')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_titulares(
  id_dim_titulares int IDENTITY(1,1),
  secuencia_propietario decimal(2,0) NOT NULL,
  nif varchar(9) NOT NULL,
  discriminante_nif varchar(2) NOT NULL,
  nombre_apellidos varchar(40) NOT NULL,
  id_contribuyente	int NOT NULL 
  CONSTRAINT uk_ku_dim_titulares UNIQUE (secuencia_propietario,nif,discriminante_nif,nombre_apellidos, id_contribuyente),
  CONSTRAINT PK_tbn1_ku_dim_titulares PRIMARY KEY CLUSTERED (id_dim_titulares),
  CONSTRAINT FK_tbn1_ku_dim_titulares_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente),  
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_titulares' AND COLUMN_NAME='id_dim_titulares')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_titulares ADD id_dim_titulares int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_titulares' AND COLUMN_NAME='secuencia_propietario')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_titulares ADD secuencia_propietario decimal(2,0)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_titulares' AND COLUMN_NAME='nif')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_titulares ADD nif varchar(9)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_titulares' AND COLUMN_NAME='discriminante_nif')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_titulares ADD discriminante_nif varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_titulares' AND COLUMN_NAME='nombre_apellidos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_titulares ADD nombre_apellidos varchar(40)

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_titulares' AND COLUMN_NAME='id_dim_titulares' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_titulares ALTER COLUMN id_dim_titulares int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_titulares' AND COLUMN_NAME='secuencia_propietario' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_titulares ALTER COLUMN secuencia_propietario decimal(2,0) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_titulares' AND COLUMN_NAME='nif' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_titulares ALTER COLUMN nif varchar(9) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_titulares' AND COLUMN_NAME='discriminante_nif' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_titulares ALTER COLUMN discriminante_nif varchar(2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_titulares' AND COLUMN_NAME='nombre_apellidos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_titulares ALTER COLUMN nombre_apellidos varchar(40) NOT NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_titulares' AND CONSTRAINT_NAME='PK_tbn1_ku_dim_titulares')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_titulares ADD CONSTRAINT PK_tbn1_ku_dim_titulares PRIMARY KEY CLUSTERED (id_dim_titulares)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_ku_dim_titulares' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_ku_dim_titulares;
GO

CREATE PROCEDURE dbo.spn1_cargar_ku_dim_titulares(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_ku_dim_titulares'
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
      secuencia_propietario,
      nif,
      discriminante_nif,
      nombre_apellidos,
	  id_contribuyente
    FROM dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ds_t
    WHERE ds_t.fec_baja IS NULL
    GROUP BY
      secuencia_propietario,
      nif,
      discriminante_nif,
      nombre_apellidos,
	  id_contribuyente
  )
  MERGE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_titulares AS tbn1_ku_dim_titulares
  USING query ON query.secuencia_propietario=tbn1_ku_dim_titulares.secuencia_propietario AND query.nif=tbn1_ku_dim_titulares.nif AND query.discriminante_nif=tbn1_ku_dim_titulares.discriminante_nif AND query.nombre_apellidos=tbn1_ku_dim_titulares.nombre_apellidos AND query.id_contribuyente=tbn1_ku_dim_titulares.id_contribuyente
  WHEN NOT MATCHED THEN
    INSERT (secuencia_propietario,nif,discriminante_nif,nombre_apellidos, id_contribuyente) VALUES (
      query.secuencia_propietario,
      query.nif,
      query.discriminante_nif,
      query.nombre_apellidos,
	  query.id_contribuyente)
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

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_comercios')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_comercios(
  id_dim_comercios int IDENTITY(1,1),
  id_calle_principal int NOT NULL,
  longitud_fachada_principal decimal(8,2) NOT NULL,
  id_calle_secundaria_1 int NOT NULL,
  longitud_calle_secundaria_1 decimal(8,2) NOT NULL,
  id_calle_secundaria_2 int NOT NULL,
  longitud_calle_secundaria_2 decimal(8,2) NOT NULL,
  longitud_galeria_comercial decimal(8,2) NOT NULL,
  id_calle_zaguera int NOT NULL,
  longitud_zaguera decimal(8,2) NOT NULL,
  altura_libre_local varchar(1) NOT NULL,
  altura_local_respecto_rasante varchar(1) NOT NULL,
  CONSTRAINT uk_ku_dim_comercios UNIQUE (id_calle_principal,longitud_fachada_principal,id_calle_secundaria_1,longitud_calle_secundaria_1,id_calle_secundaria_2,longitud_calle_secundaria_2,longitud_galeria_comercial,id_calle_zaguera,longitud_zaguera,altura_libre_local,altura_local_respecto_rasante),
  CONSTRAINT PK_tbn1_ku_dim_comercios PRIMARY KEY CLUSTERED (id_dim_comercios),
  CONSTRAINT FK_tbn1_ku_dim_comercios_tbn1_ku_mae_calles FOREIGN KEY (id_calle_principal) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_mae_calles(id_calle),
  CONSTRAINT FK_tbn1_ku_dim_comercios_tbn1_ku_mae_calles1 FOREIGN KEY (id_calle_secundaria_1) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_mae_calles(id_calle),
  CONSTRAINT FK_tbn1_ku_dim_comercios_tbn1_ku_mae_calles2 FOREIGN KEY (id_calle_secundaria_2) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_mae_calles(id_calle),
  CONSTRAINT FK_tbn1_ku_dim_comercios_tbn1_ku_mae_calles3 FOREIGN KEY (id_calle_zaguera) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_mae_calles(id_calle)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_comercios' AND COLUMN_NAME='id_dim_comercios')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_comercios ADD id_dim_comercios int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_comercios' AND COLUMN_NAME='id_calle_principal')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_comercios ADD id_calle_principal int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_comercios' AND COLUMN_NAME='longitud_fachada_principal')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_comercios ADD longitud_fachada_principal decimal(8,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_comercios' AND COLUMN_NAME='id_calle_secundaria_1')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_comercios ADD id_calle_secundaria_1 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_comercios' AND COLUMN_NAME='longitud_calle_secundaria_1')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_comercios ADD longitud_calle_secundaria_1 decimal(8,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_comercios' AND COLUMN_NAME='id_calle_secundaria_2')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_comercios ADD id_calle_secundaria_2 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_comercios' AND COLUMN_NAME='longitud_calle_secundaria_2')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_comercios ADD longitud_calle_secundaria_2 decimal(8,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_comercios' AND COLUMN_NAME='longitud_galeria_comercial')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_comercios ADD longitud_galeria_comercial decimal(8,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_comercios' AND COLUMN_NAME='id_calle_zaguera')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_comercios ADD id_calle_zaguera int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_comercios' AND COLUMN_NAME='longitud_zaguera')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_comercios ADD longitud_zaguera decimal(8,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_comercios' AND COLUMN_NAME='altura_libre_local')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_comercios ADD altura_libre_local varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_comercios' AND COLUMN_NAME='altura_local_respecto_rasante')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_comercios ADD altura_local_respecto_rasante varchar(1)

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_comercios' AND COLUMN_NAME='id_dim_comercios' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_comercios ALTER COLUMN id_dim_comercios int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_comercios' AND COLUMN_NAME='id_calle_principal' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_comercios ALTER COLUMN id_calle_principal int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_comercios' AND COLUMN_NAME='longitud_fachada_principal' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_comercios ALTER COLUMN longitud_fachada_principal decimal(8,2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_comercios' AND COLUMN_NAME='id_calle_secundaria_1' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_comercios ALTER COLUMN id_calle_secundaria_1 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_comercios' AND COLUMN_NAME='longitud_calle_secundaria_1' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_comercios ALTER COLUMN longitud_calle_secundaria_1 decimal(8,2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_comercios' AND COLUMN_NAME='id_calle_secundaria_2' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_comercios ALTER COLUMN id_calle_secundaria_2 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_comercios' AND COLUMN_NAME='longitud_calle_secundaria_2' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_comercios ALTER COLUMN longitud_calle_secundaria_2 decimal(8,2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_comercios' AND COLUMN_NAME='longitud_galeria_comercial' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_comercios ALTER COLUMN longitud_galeria_comercial decimal(8,2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_comercios' AND COLUMN_NAME='id_calle_zaguera' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_comercios ALTER COLUMN id_calle_zaguera int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_comercios' AND COLUMN_NAME='longitud_zaguera' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_comercios ALTER COLUMN longitud_zaguera decimal(8,2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_comercios' AND COLUMN_NAME='altura_libre_local' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_comercios ALTER COLUMN altura_libre_local varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_comercios' AND COLUMN_NAME='altura_local_respecto_rasante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_comercios ALTER COLUMN altura_local_respecto_rasante varchar(1) NOT NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_comercios' AND CONSTRAINT_NAME='PK_tbn1_ku_dim_comercios')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_comercios ADD CONSTRAINT PK_tbn1_ku_dim_comercios PRIMARY KEY CLUSTERED (id_dim_comercios)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_comercios' AND CONSTRAINT_NAME='FK_tbn1_ku_dim_comercios_tbn1_ku_mae_calles')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_comercios ADD CONSTRAINT FK_tbn1_ku_dim_comercios_tbn1_ku_mae_calles FOREIGN KEY (id_calle_principal) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_mae_calles(id_calle)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_comercios' AND CONSTRAINT_NAME='FK_tbn1_ku_dim_comercios_tbn1_ku_mae_calles1')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_comercios ADD CONSTRAINT FK_tbn1_ku_dim_comercios_tbn1_ku_mae_calles1 FOREIGN KEY (id_calle_secundaria_1) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_mae_calles(id_calle)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_comercios' AND CONSTRAINT_NAME='FK_tbn1_ku_dim_comercios_tbn1_ku_mae_calles2')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_comercios ADD CONSTRAINT FK_tbn1_ku_dim_comercios_tbn1_ku_mae_calles2 FOREIGN KEY (id_calle_secundaria_2) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_mae_calles(id_calle)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_dim_comercios' AND CONSTRAINT_NAME='FK_tbn1_ku_dim_comercios_tbn1_ku_mae_calles3')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_comercios ADD CONSTRAINT FK_tbn1_ku_dim_comercios_tbn1_ku_mae_calles3 FOREIGN KEY (id_calle_zaguera) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_mae_calles(id_calle)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_ku_dim_comercios' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_ku_dim_comercios;
GO

CREATE PROCEDURE dbo.spn1_cargar_ku_dim_comercios(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_ku_dim_comercios'
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
      id_calle_principal,
      longitud_fachada_principal,
      id_calle_secundaria_1,
      longitud_calle_secundaria_1,
      id_calle_secundaria_2,
      longitud_calle_secundaria_2,
      longitud_galeria_comercial,
      id_calle_zaguera,
      longitud_zaguera,
      altura_libre_local,
      altura_local_respecto_rasante
    FROM dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ds_t
    WHERE ds_t.fec_baja IS NULL
    GROUP BY
      id_calle_principal,
      longitud_fachada_principal,
      id_calle_secundaria_1,
      longitud_calle_secundaria_1,
      id_calle_secundaria_2,
      longitud_calle_secundaria_2,
      longitud_galeria_comercial,
      id_calle_zaguera,
      longitud_zaguera,
      altura_libre_local,
      altura_local_respecto_rasante
  )
  MERGE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_comercios AS tbn1_ku_dim_comercios
  USING query ON query.id_calle_principal=tbn1_ku_dim_comercios.id_calle_principal AND query.longitud_fachada_principal=tbn1_ku_dim_comercios.longitud_fachada_principal AND query.id_calle_secundaria_1=tbn1_ku_dim_comercios.id_calle_secundaria_1 AND query.longitud_calle_secundaria_1=tbn1_ku_dim_comercios.longitud_calle_secundaria_1 AND query.id_calle_secundaria_2=tbn1_ku_dim_comercios.id_calle_secundaria_2 AND query.longitud_calle_secundaria_2=tbn1_ku_dim_comercios.longitud_calle_secundaria_2 AND query.longitud_galeria_comercial=tbn1_ku_dim_comercios.longitud_galeria_comercial AND query.id_calle_zaguera=tbn1_ku_dim_comercios.id_calle_zaguera AND query.longitud_zaguera=tbn1_ku_dim_comercios.longitud_zaguera AND query.altura_libre_local=tbn1_ku_dim_comercios.altura_libre_local AND query.altura_local_respecto_rasante=tbn1_ku_dim_comercios.altura_local_respecto_rasante
  WHEN NOT MATCHED THEN
    INSERT (id_calle_principal,longitud_fachada_principal,id_calle_secundaria_1,longitud_calle_secundaria_1,id_calle_secundaria_2,longitud_calle_secundaria_2,longitud_galeria_comercial,id_calle_zaguera,longitud_zaguera,altura_libre_local,altura_local_respecto_rasante) VALUES (
      query.id_calle_principal,
      query.longitud_fachada_principal,
      query.id_calle_secundaria_1,
      query.longitud_calle_secundaria_1,
      query.id_calle_secundaria_2,
      query.longitud_calle_secundaria_2,
      query.longitud_galeria_comercial,
      query.id_calle_zaguera,
      query.longitud_zaguera,
      query.altura_libre_local,
      query.altura_local_respecto_rasante)
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

