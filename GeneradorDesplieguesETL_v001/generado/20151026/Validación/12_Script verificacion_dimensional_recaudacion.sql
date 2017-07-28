PRINT 'verificacion_dimensional_recaudacion.sql'
GO

USE dbn1_stg_dhyf_v
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf_v.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_verificacion_dimensional_recaudacion' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_verificacion_dimensional_recaudacion;
GO

CREATE PROCEDURE dbo.spn1_verificacion_dimensional_recaudacion(@logpadre int=null) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf_v.dbo.spn1_verificacion_dimensional_recaudacion'
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

  IF NOT EXISTS (
    SELECT 1 FROM (
      SELECT
        ejercicio_tributario,
        count(*) AS liquidaciones,
        sum(cuadre) AS cuadre,
        1.0*sum(cuadre)/count(*) AS pct
      FROM
        (SELECT
           d.num_liquidacion AS num_liquidacion,
           d.ejercicio_tributario AS ejercicio_tributario,
           d.importe_deuda_pendiente AS pendiente,
           sum(importe) AS suma,
           CASE WHEN sum(importe)=d.importe_deuda_pendiente THEN 1 END AS cuadre
         FROM dbn1_dmr_dhyf_v.dbo.tbn1_fact_ot_operaciones_contables f
         INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_dim_ot_deudas d ON (d.id_deuda=f.id_deuda)
         WHERE d.ejercicio_tributario>CAST(year(getdate())-7 AS varchar)
         GROUP BY
           d.num_liquidacion,
           d.ejercicio_tributario,
           d.importe_deuda_pendiente) a
      GROUP BY ejercicio_tributario
    ) a HAVING count(CASE WHEN pct>0.94 THEN 1 END)=count(*) AND count(*)<>0
  )
  THROW 50001,'Hay un porcentaje significativo de liquidaciones con descuadre entre movimientos y deuda pendiente en los ultimos 7 ejercicios tributarios',1
  
  IF NOT EXISTS (
    SELECT 1 FROM (
      SELECT
        anyo,
        count(8) AS num_exp
      FROM dbn1_dmr_dhyf_v.dbo.tbn1_dim_ot_z3_expedientes_embargo
      WHERE
        anyo>CAST(year(getdate())-10 AS varchar)
        AND anyo<CAST(year(getdate()) AS varchar)
      GROUP BY anyo
    ) a HAVING count(CASE WHEN num_exp>10000 THEN 1 END)=count(*) AND count(*)<>0
  )
  THROW 50001,'Hay un número anormalmente bajo de expedientes de embargo (menos de 10.000) en alguno de los últimos 10 años',1
  
  IF NOT EXISTS (
    SELECT 1 FROM (
      SELECT
        anyo,
        count(8) AS num_exp
      FROM dbn1_dmr_dhyf_v.dbo.tbn1_dim_ot_sz_expedientes_aplazamiento
      WHERE
        anyo>CAST(year(getdate())-5 AS varchar)
        AND anyo<CAST(year(getdate()) AS varchar)
      GROUP BY anyo
    ) a HAVING count(CASE WHEN num_exp>25000 THEN 1 END)=count(*) AND count(*)<>0
  )
  THROW 50001,'Hay un número anormalmente bajo de expedientes de aplazamiento (menos de 25.000) en alguno de los últimos 5 años',1
  
  IF NOT EXISTS (
    SELECT 1 FROM (
      SELECT
        left(numero_expediente,4) AS anyo,
        count(8) AS num_exp
      FROM dbn1_dmr_dhyf_v.dbo.tbn1_dim_ot_av_expedientes_fianza
      WHERE
        left(numero_expediente,4)>CAST(year(getdate())-10 AS varchar)
        AND left(numero_expediente,4)<CAST(year(getdate()) AS varchar)
      GROUP BY left(numero_expediente,4)
    ) a HAVING count(CASE WHEN num_exp>300 THEN 1 END)=count(*) AND count(*)<>0
  )
  THROW 50001,'Hay un número anormalmente bajo de expedientes de fianza (menos de 300) en alguno de los últimos 10 años',1
  
  IF NOT EXISTS (
    SELECT 1 FROM (
      SELECT
        anyo_expediente,
        count(8) AS num_exp
      FROM dbn1_dmr_dhyf_v.dbo.tbn1_dim_ot_z6_expedientes_concursales
      WHERE
        anyo_expediente>CAST(year(getdate())-7 AS varchar)
        AND anyo_expediente<CAST(year(getdate()) AS varchar)
      GROUP BY anyo_expediente
    ) a HAVING count(CASE WHEN num_exp>=150 THEN 1 END)=count(*) AND count(*)<>0
  )
  THROW 50001,'Hay un número anormalmente bajo de expedientes concursales (menos de 150) en alguno de los últimos 7 años',1
  
  IF NOT EXISTS (
    SELECT 1 FROM (
      SELECT
        anyo,
        count(8) AS num_exp
      FROM dbn1_dmr_dhyf_v.dbo.tbn1_dim_ot_dz_expedientes_derivacion
      WHERE
        anyo>CAST(year(getdate())-7 AS varchar)
        AND anyo<CAST(year(getdate()) AS varchar)
      GROUP BY anyo
    ) a HAVING count(CASE WHEN num_exp>300 THEN 1 END)=count(*) AND count(*)<>0
  )
  THROW 50001,'Hay un número anormalmente bajo de expedientes de derivación (menos de 300) en alguno de los últimos 7 años',1
  
  IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf_v.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='audit' AND TABLE_NAME='tbn1_test_cuadre_s1' AND TABLE_TYPE='BASE TABLE')
  DROP TABLE dbn1_norm_dhyf_v.audit.tbn1_test_cuadre_s1
  
  
  SELECT
    ejercicio,
    cod_modelo,
    situacion,
    tipo_situacion,
    des_estado,
    des_familia_modelo,
    tipo_ingreso,
    num_movimientos,
    sum(deuda_dwh) AS deuda_dwh_total,
    sum(deuda_host) AS deuda_host_total,
    CASE
        WHEN ((deuda_dwh <> deuda_host OR deuda_dwh IS NULL OR deuda_host IS NULL) AND NOT (deuda_dwh IS NULL AND deuda_host IS NULL)) THEN 'No cuadra'
        ELSE 'Cuadra'
    END AS cuadre,
    count(*) AS num_liquidaciones,
    max(num_liquidacion) AS liquidacion_ejemplo
  INTO dbn1_norm_dhyf_v.audit.tbn1_test_cuadre_s1
  FROM
    (SELECT
       coalesce(dimensional.num_liquidacion,staging.num_liquidacion) num_liquidacion,
       dimensional.ejercicio ejercicio,
       dimensional.cod_modelo cod_modelo,
       dimensional.situacion situacion,
       dimensional.tipo_situacion tipo_situacion,
       dimensional.des_estado des_estado,
       dimensional.des_familia_modelo des_familia_modelo,
       dimensional.tipo_ingreso tipo_ingreso,
       dimensional.num_movimientos num_movimientos,
       dimensional.deuda_dwh deuda_dwh,
       staging.deuda_host deuda_host
     FROM
         (SELECT
           d.num_liquidacion AS num_liquidacion,
           perfil.ejercicio AS ejercicio,
           perfil.cod_modelo AS cod_modelo,
           perfil.situacion AS situacion,
           perfil.tipo_situacion AS tipo_situacion,
           perfil.des_estado AS des_estado,
           perfil.des_familia_modelo AS des_familia_modelo,
           perfil.tipo_ingreso AS tipo_ingreso,
           count(*) AS num_movimientos,
           sum(importe) AS deuda_dwh
         FROM dbn1_dmr_dhyf_v.dbo.tbn1_fact_ot_operaciones_contables f
         INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_dim_ot_deudas d ON (d.id_deuda=f.id_deuda)
         INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_dim_ot_deudas_perfil1 perfil ON (perfil.id_perfil_deuda=d.id_perfil_deuda)
         GROUP BY
           d.num_liquidacion,
           perfil.ejercicio,
           perfil.cod_modelo,
           perfil.situacion,
           perfil.tipo_situacion,
           perfil.des_estado,
           perfil.des_familia_modelo,
           perfil.tipo_ingreso) dimensional
     FULL JOIN
         (SELECT
           liqliqui AS num_liquidacion,
           liqdeuda/100 AS deuda_host
         FROM dbo.tbn1liqu_s1 liq) AS staging ON (dimensional.num_liquidacion=staging.num_liquidacion)) a
  GROUP BY
    ejercicio,
    cod_modelo,
    situacion,
    tipo_situacion,
    des_estado,
    des_familia_modelo,
    tipo_ingreso,
    num_movimientos,
    CASE
        WHEN ((deuda_dwh <> deuda_host OR deuda_dwh IS NULL OR deuda_host IS NULL) AND NOT (deuda_dwh IS NULL AND deuda_host IS NULL)) THEN 'No cuadra'
        ELSE 'Cuadra'
    END
  
  
  -- IF NOT EXISTS (
    -- SELECT * FROM (
      -- SELECT count(8) AS cont
      -- FROM dbn1_dmr_dhyf_v.dbo.tbn1_fact_ot_operaciones_contables
      -- WHERE des_clave_contable='Clave contable faltante en Maestro'
    -- ) a WHERE cont=0
  -- )
  -- EXECUTE dbn1_stg_dhyf_v.dbo.spn1_apuntar_warning @logpadre,'Existen claves contables asociadas a movimientos, que no figuran en el maestro';
  
  -- IF NOT EXISTS (
    -- SELECT * FROM (
      -- SELECT count(8) AS cont
      -- FROM dbn1_dmr_dhyf_v.dbo.tbn1_fact_ot_operaciones_contables
      -- WHERE des_operacion='Código de operación faltante en Maestro'
    -- ) a WHERE cont=0
  -- )
  -- EXECUTE dbn1_stg_dhyf_v.dbo.spn1_apuntar_warning @logpadre,'Existen códigos de operación asociados a movimientos, que no figuran en el maestro';

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

