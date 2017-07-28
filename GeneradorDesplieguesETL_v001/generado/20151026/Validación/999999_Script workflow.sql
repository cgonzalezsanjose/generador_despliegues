PRINT 'workflow.sql'
GO

USE dbn1_stg_dhyf_v
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf_v.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_staging' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_staging;
GO

CREATE PROCEDURE dbo.spn1_cargar_staging(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf_v.dbo.spn1_cargar_staging'
  SET NOCOUNT ON;
  DECLARE @log int;
  EXECUTE @log = dbn1_stg_dhyf_v.dbo.spn1_apuntar_log @logpadre,@procedure_name;
  DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf_v.dbo.fnn1_fecha_ultima_carga(@log);
  DECLARE @continuar_en_caso_error bit=0;
  IF @logpadre IS NOT NULL AND EXISTS (SELECT 1 AS expr1
  FROM dbn1_norm_dhyf_v.audit.tbn1_procedimientos_excluidos
  WHERE
    'dbn1_stg_dhyf_v.dbo.'+procedimiento=@procedure_name
    AND excluido=1
  ) BEGIN
    UPDATE dbn1_norm_dhyf_v.audit.tbn1_logs SET
      mensaje_error='EXCLUÍDO'
    WHERE
      id_log=@log;
    RETURN
  END
     BEGIN TRY

  EXECUTE dbn1_stg_dhyf_v.dbo.spn1_verificacion_estado_inicial @log
  EXECUTE dbn1_stg_dhyf_v.dbo.spn1_cargar_staging_temporal_fpar @log
  EXECUTE dbn1_stg_dhyf_v.dbo.spn1_cargar_staging_dcto @log
  EXECUTE dbn1_stg_dhyf_v.dbo.spn1_cargar_staging_temporal_AULI @log
  EXECUTE dbn1_stg_dhyf_v.dbo.spn1_cargar_staging_temporal_AUVA @log
  EXECUTE dbn1_stg_dhyf_v.dbo.spn1_cargar_staging_temporal_AUSO @log
  EXECUTE dbn1_stg_dhyf_v.dbo.spn1_cargar_staging_temporal_AUDF @log
  EXECUTE dbn1_stg_dhyf_v.dbo.spn1_cargar_staging_temporal_nemotecnicos @log
  EXECUTE dbn1_stg_dhyf_v.dbo.spn1_cargar_staging_cabeceras_sociedades @log
  EXECUTE dbn1_stg_dhyf_v.dbo.spn1_cargar_staging_documentos @log
  EXECUTE dbn1_stg_dhyf_v.dbo.spn1_cargar_staging_iva @log
  EXECUTE dbn1_stg_dhyf_v.dbo.spn1_cargar_staging_detalles @log

  EXECUTE dbn1_stg_dhyf_v.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
   END TRY
  BEGIN CATCH
    EXECUTE dbn1_stg_dhyf_v.dbo.spn1_finalizar_log @log,null;
    UPDATE dbn1_norm_dhyf_v.audit.tbn1_logs SET
      mensaje_error=error_message(),
      procedimiento_error=error_procedure()
    WHERE
      id_log=@log;
    IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
  END CATCH


END

GO

USE dbn1_stg_dhyf_v
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf_v.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar;
GO

CREATE PROCEDURE dbo.spn1_cargar(@logpadre int=null) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf_v.dbo.spn1_cargar'
  SET NOCOUNT ON;
  DECLARE @log int;
  EXECUTE @log = dbn1_stg_dhyf_v.dbo.spn1_apuntar_log @logpadre,@procedure_name;
  DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf_v.dbo.fnn1_fecha_ultima_carga(@log);
  DECLARE @continuar_en_caso_error bit=0;
  IF @logpadre IS NOT NULL AND EXISTS (SELECT 1 AS expr1
  FROM dbn1_norm_dhyf_v.audit.tbn1_procedimientos_excluidos
  WHERE
    'dbn1_stg_dhyf_v.dbo.'+procedimiento=@procedure_name
    AND excluido=1
  ) BEGIN
    UPDATE dbn1_norm_dhyf_v.audit.tbn1_logs SET
      mensaje_error='EXCLUÍDO'
    WHERE
      id_log=@log;
    RETURN
  END
  
--PROVISIONAL: mientras duren los problemos de tiempo del batch, solo correrá el módulo de Modelos Informativos con las cargas completas del fin de semana  
  IF dbn1_stg_dhyf_v.dbo.fnn1_es_carga_completa(@log)=0 --Si no es carga completa, es decir, si es intrasemanal
     IF EXISTS (SELECT 1 AS expr1 FROM dbn1_norm_dhyf_v.audit.tbn1_procedimientos_excluidos where procedimiento = 'spn1_cargar_modelos_informativos')
     BEGIN
	    update dbn1_norm_dhyf_v.audit.tbn1_procedimientos_excluidos
		set excluido = 1 --Desactivar
		where procedimiento = 'spn1_cargar_modelos_informativos';
     END
	 ELSE
	 BEGIN
		insert into dbn1_norm_dhyf_v.audit.tbn1_procedimientos_excluidos (procedimiento, excluido)
		values ('spn1_cargar_modelos_informativos',1);

     END
  IF dbn1_stg_dhyf_v.dbo.fnn1_es_carga_completa(@log)=1 --Si es carga completa, es decir, dominical
     BEGIN
		--delete dbn1_norm_dhyf_v.audit.tbn1_procedimientos_excluidos where procedimiento = 'spn1_cargar_modelos_informativos'
		update dbn1_norm_dhyf_v.audit.tbn1_procedimientos_excluidos
		set excluido = 0 --Activar
		where procedimiento = 'spn1_cargar_modelos_informativos';
     END
--FIN PROVISIONAL:....	 
  
     BEGIN TRY

  EXECUTE dbn1_stg_dhyf_v.dbo.spn1_cargar_staging @log
  EXECUTE dbn1_stg_dhyf_v.dbo.spn1_cargar_normalizado @log
  EXECUTE dbn1_stg_dhyf_v.dbo.spn1_cargar_dimensional @log
  EXECUTE dbn1_stg_dhyf_v.dbo.spn1_cargar_iva @log
  EXECUTE dbn1_stg_dhyf_v.dbo.spn1_cargar_recaudacion @log
  EXECUTE dbn1_stg_dhyf_v.dbo.spn1_cargar_catastro @log
  EXECUTE dbn1_stg_dhyf_v.dbo.spn1_cargar_dimensional_informes @log
  EXECUTE dbn1_stg_dhyf_v.dbo.spn1_cargar_modelos_informativos @log
  EXECUTE dbn1_stg_dhyf_v.dbo.spn1_cargar_otros @log
  EXECUTE dbn1_stg_dhyf_v.dbo.spn1_finalizar_carga @log

  EXECUTE dbn1_stg_dhyf_v.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
   END TRY
  BEGIN CATCH
    EXECUTE dbn1_stg_dhyf_v.dbo.spn1_finalizar_log @log,null;
    UPDATE dbn1_norm_dhyf_v.audit.tbn1_logs SET
      mensaje_error=error_message(),
      procedimiento_error=error_procedure()
    WHERE
      id_log=@log;
    IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
  END CATCH


END

GO

USE dbn1_stg_dhyf_v
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf_v.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_carga_completa' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_carga_completa;
GO

CREATE PROCEDURE dbo.spn1_carga_completa(@logpadre int=null) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf_v.dbo.spn1_carga_completa'
  SET NOCOUNT ON;
  DECLARE @log int;
  EXECUTE @log = dbn1_stg_dhyf_v.dbo.spn1_apuntar_log @logpadre,@procedure_name;
  DECLARE @fecha_ultima_carga datetime=dbn1_stg_dhyf_v.dbo.fnn1_fecha_ultima_carga(@log);
  DECLARE @continuar_en_caso_error bit=0;
  IF @logpadre IS NOT NULL AND EXISTS (SELECT 1 AS expr1
  FROM dbn1_norm_dhyf_v.audit.tbn1_procedimientos_excluidos
  WHERE
    'dbn1_stg_dhyf_v.dbo.'+procedimiento=@procedure_name
    AND excluido=1
  ) BEGIN
    UPDATE dbn1_norm_dhyf_v.audit.tbn1_logs SET
      mensaje_error='EXCLUÍDO'
    WHERE
      id_log=@log;
    RETURN
  END
     BEGIN TRY

  EXECUTE dbn1_stg_dhyf_v.dbo.spn1_cargar 1;

  EXECUTE dbn1_stg_dhyf_v.dbo.spn1_finalizar_log @log,@@ROWCOUNT;
   END TRY
  BEGIN CATCH
    EXECUTE dbn1_stg_dhyf_v.dbo.spn1_finalizar_log @log,null;
    UPDATE dbn1_norm_dhyf_v.audit.tbn1_logs SET
      mensaje_error=error_message(),
      procedimiento_error=error_procedure()
    WHERE
      id_log=@log;
    IF @continuar_en_caso_error=0 OR @logpadre IS NULL THROW
  END CATCH


END

GO

USE dbn1_stg_dhyf_v
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf_v.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_carga_diaria_dwh' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_carga_diaria_dwh;
GO



CREATE PROCEDURE dbo.spn1_carga_diaria_dwh AS
BEGIN

  BEGIN TRY

  	  EXECUTE dbn1_stg_dhyf_v.dbo.spn1_cargar;

      PRINT 'Carga finaliza OK.'

	     
  END TRY
  BEGIN CATCH
  

    PRINT 'Carga finalizada con ERROR.'
  
  END CATCH


END


GO

EXECUTE dbn1_stg_dhyf_v.dbo.spn1_comprimir_tablas;
GO

EXECUTE dbn1_stg_dhyf_v.dbo.spn1_documentar_tablas;
GO

EXECUTE dbn1_stg_dhyf_v.dbo.spn1_documentar_campos;
GO

