PRINT 'dimensional_ku_hechos.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact(
  id int IDENTITY(1,1),
  id_dim_objetos int NOT NULL,
  id_dim_otros_atributos int NOT NULL,
  id_dim_ucm int NOT NULL,
  id_dim_edificios int NOT NULL,
  id_dim_marcas int NOT NULL,
  id_dim_fechas int NOT NULL,
  id_dim_parcelas int NOT NULL,
  id_dim_titulares int NOT NULL,
  id_dim_comercios int NOT NULL,
  coeficiente_participacion_comunes decimal(9,6) NOT NULL,
  valor_catastral_objeto decimal(12,2) NOT NULL,
  valor_suelo_objeto decimal(12,2) NOT NULL,
  valor_construido_objeto decimal(12,2) NOT NULL,
  valor_suelo_edificio decimal(12,2) NOT NULL,
  valor_construccion_edificio decimal(12,2) NOT NULL,
  valor_catastral_edificio decimal(12,2) NOT NULL,  
  categoria_construccion decimal(2,0) NOT NULL,
  valor_catastral_parcela decimal(12,2) NOT NULL,
  valor_construccion_parcela decimal(12,2) NOT NULL,
  valor_suelo_parcela decimal(12,2) NOT NULL,
  coeficiente_participacion_titularidad decimal(5,2) NOT NULL,
  num_real_parcelas decimal(6,0) NOT NULL,
  superficie_planta decimal(5) NOT NULL,
  superficie_objeto decimal(11,6) NOT NULL,  
  CONSTRAINT PK_tbn1_ku_fact PRIMARY KEY CLUSTERED (id),
  CONSTRAINT FK_tbn1_ku_fact_tbn1_ku_dim_objetos FOREIGN KEY (id_dim_objetos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_dim_objetos(id_dim_objetos),
  CONSTRAINT FK_tbn1_ku_fact_tbn1_ku_dim_otros_atributos FOREIGN KEY (id_dim_otros_atributos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_dim_otros_atributos(id_dim_otros_atributos),
  CONSTRAINT FK_tbn1_ku_fact_tbn1_ku_dim_ucm FOREIGN KEY (id_dim_ucm) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_dim_ucm(id_dim_ucm),
  CONSTRAINT FK_tbn1_ku_fact_tbn1_ku_dim_edificios FOREIGN KEY (id_dim_edificios) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_dim_edificios(id_dim_edificios),
  CONSTRAINT FK_tbn1_ku_fact_tbn1_ku_dim_marcas FOREIGN KEY (id_dim_marcas) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_dim_marcas(id_dim_marcas),
  CONSTRAINT FK_tbn1_ku_fact_tbn1_ku_dim_fechas FOREIGN KEY (id_dim_fechas) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_dim_fechas(id_dim_fechas),
  CONSTRAINT FK_tbn1_ku_fact_tbn1_ku_dim_parcelas FOREIGN KEY (id_dim_parcelas) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_dim_parcelas(id_dim_parcelas),
  CONSTRAINT FK_tbn1_ku_fact_tbn1_ku_dim_titulares FOREIGN KEY (id_dim_titulares) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_dim_titulares(id_dim_titulares),
  CONSTRAINT FK_tbn1_ku_fact_tbn1_ku_dim_comercios FOREIGN KEY (id_dim_comercios) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_dim_comercios(id_dim_comercios)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='id')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ADD id int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='id_dim_objetos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ADD id_dim_objetos int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='id_dim_otros_atributos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ADD id_dim_otros_atributos int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='id_dim_ucm')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ADD id_dim_ucm int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='id_dim_edificios')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ADD id_dim_edificios int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='id_dim_marcas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ADD id_dim_marcas int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='id_dim_fechas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ADD id_dim_fechas int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='id_dim_parcelas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ADD id_dim_parcelas int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='id_dim_titulares')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ADD id_dim_titulares int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='id_dim_comercios')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ADD id_dim_comercios int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='coeficiente_participacion_comunes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ADD coeficiente_participacion_comunes decimal(9,6)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='valor_catastral_objeto')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ADD valor_catastral_objeto decimal(12,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='valor_suelo_objeto')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ADD valor_suelo_objeto decimal(12,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='valor_construido_objeto')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ADD valor_construido_objeto decimal(12,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='valor_suelo_edificio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ADD valor_suelo_edificio decimal(12,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='valor_construccion_edificio')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ADD valor_construccion_edificio decimal(12,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='categoria_construccion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ADD categoria_construccion decimal(2,0)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='valor_catastral_parcela')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ADD valor_catastral_parcela decimal(12,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='valor_construccion_parcela')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ADD valor_construccion_parcela decimal(12,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='valor_suelo_parcela')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ADD valor_suelo_parcela decimal(12,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='coeficiente_participacion_titularidad')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ADD coeficiente_participacion_titularidad decimal(5,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='num_real_parcelas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ADD num_real_parcelas decimal(6,0)

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='id' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ALTER COLUMN id int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='id_dim_objetos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ALTER COLUMN id_dim_objetos int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='id_dim_otros_atributos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ALTER COLUMN id_dim_otros_atributos int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='id_dim_ucm' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ALTER COLUMN id_dim_ucm int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='id_dim_edificios' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ALTER COLUMN id_dim_edificios int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='id_dim_marcas' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ALTER COLUMN id_dim_marcas int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='id_dim_fechas' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ALTER COLUMN id_dim_fechas int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='id_dim_parcelas' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ALTER COLUMN id_dim_parcelas int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='id_dim_titulares' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ALTER COLUMN id_dim_titulares int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='id_dim_comercios' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ALTER COLUMN id_dim_comercios int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='coeficiente_participacion_comunes' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ALTER COLUMN coeficiente_participacion_comunes decimal(9,6) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='valor_catastral_objeto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ALTER COLUMN valor_catastral_objeto decimal(12,2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='valor_suelo_objeto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ALTER COLUMN valor_suelo_objeto decimal(12,2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='valor_construido_objeto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ALTER COLUMN valor_construido_objeto decimal(12,2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='valor_suelo_edificio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ALTER COLUMN valor_suelo_edificio decimal(12,2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='valor_construccion_edificio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ALTER COLUMN valor_construccion_edificio decimal(12,2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='categoria_construccion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ALTER COLUMN categoria_construccion decimal(2,0) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='valor_catastral_parcela' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ALTER COLUMN valor_catastral_parcela decimal(12,2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='valor_construccion_parcela' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ALTER COLUMN valor_construccion_parcela decimal(12,2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='valor_suelo_parcela' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ALTER COLUMN valor_suelo_parcela decimal(12,2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='coeficiente_participacion_titularidad' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ALTER COLUMN coeficiente_participacion_titularidad decimal(5,2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND COLUMN_NAME='num_real_parcelas' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ALTER COLUMN num_real_parcelas decimal(6,0) NOT NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND CONSTRAINT_NAME='PK_tbn1_ku_fact')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ADD CONSTRAINT PK_tbn1_ku_fact PRIMARY KEY CLUSTERED (id)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND CONSTRAINT_NAME='FK_tbn1_ku_fact_tbn1_ku_dim_objetos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ADD CONSTRAINT FK_tbn1_ku_fact_tbn1_ku_dim_objetos FOREIGN KEY (id_dim_objetos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_dim_objetos(id_dim_objetos)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND CONSTRAINT_NAME='FK_tbn1_ku_fact_tbn1_ku_dim_otros_atributos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ADD CONSTRAINT FK_tbn1_ku_fact_tbn1_ku_dim_otros_atributos FOREIGN KEY (id_dim_otros_atributos) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_dim_otros_atributos(id_dim_otros_atributos)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND CONSTRAINT_NAME='FK_tbn1_ku_fact_tbn1_ku_dim_ucm')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ADD CONSTRAINT FK_tbn1_ku_fact_tbn1_ku_dim_ucm FOREIGN KEY (id_dim_ucm) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_dim_ucm(id_dim_ucm)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND CONSTRAINT_NAME='FK_tbn1_ku_fact_tbn1_ku_dim_edificios')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ADD CONSTRAINT FK_tbn1_ku_fact_tbn1_ku_dim_edificios FOREIGN KEY (id_dim_edificios) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_dim_edificios(id_dim_edificios)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND CONSTRAINT_NAME='FK_tbn1_ku_fact_tbn1_ku_dim_marcas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ADD CONSTRAINT FK_tbn1_ku_fact_tbn1_ku_dim_marcas FOREIGN KEY (id_dim_marcas) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_dim_marcas(id_dim_marcas)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND CONSTRAINT_NAME='FK_tbn1_ku_fact_tbn1_ku_dim_fechas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ADD CONSTRAINT FK_tbn1_ku_fact_tbn1_ku_dim_fechas FOREIGN KEY (id_dim_fechas) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_dim_fechas(id_dim_fechas)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND CONSTRAINT_NAME='FK_tbn1_ku_fact_tbn1_ku_dim_parcelas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ADD CONSTRAINT FK_tbn1_ku_fact_tbn1_ku_dim_parcelas FOREIGN KEY (id_dim_parcelas) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_dim_parcelas(id_dim_parcelas)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND CONSTRAINT_NAME='FK_tbn1_ku_fact_tbn1_ku_dim_titulares')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ADD CONSTRAINT FK_tbn1_ku_fact_tbn1_ku_dim_titulares FOREIGN KEY (id_dim_titulares) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_dim_titulares(id_dim_titulares)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_fact' AND CONSTRAINT_NAME='FK_tbn1_ku_fact_tbn1_ku_dim_comercios')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact ADD CONSTRAINT FK_tbn1_ku_fact_tbn1_ku_dim_comercios FOREIGN KEY (id_dim_comercios) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_ku_dim_comercios(id_dim_comercios)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_ku_fact' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_ku_fact;
GO

CREATE PROCEDURE dbo.spn1_cargar_ku_fact(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_ku_fact'
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
      objetos.id_dim_objetos AS id_dim_objetos,
      otros_atributos.id_dim_otros_atributos AS id_dim_otros_atributos,
      ucm.id_dim_ucm AS id_dim_ucm,
      edificios.id_dim_edificios AS id_dim_edificios,
      marcas.id_dim_marcas AS id_dim_marcas,
      fechas.id_dim_fechas AS id_dim_fechas,
      parcelas.id_dim_parcelas AS id_dim_parcelas,
      titulares.id_dim_titulares AS id_dim_titulares,
      comercios.id_dim_comercios AS id_dim_comercios,
      ds_t.coeficiente_participacion_comunes AS coeficiente_participacion_comunes,
      ds_t.valor_catastral_objeto AS valor_catastral_objeto,
      ds_t.valor_suelo_objeto AS valor_suelo_objeto,
      ds_t.valor_construido_objeto AS valor_construido_objeto,
      ds_t.valor_suelo_edificio AS valor_suelo_edificio,
      ds_t.valor_construccion_edificio AS valor_construccion_edificio,
	  ds_t.valor_catastral_edificio AS valor_catastral_edificio,
      ds_t.categoria_construccion AS categoria_construccion,
      ds_t.valor_catastral_parcela AS valor_catastral_parcela,
      ds_t.valor_construccion_parcela AS valor_construccion_parcela,
      ds_t.valor_suelo_parcela AS valor_suelo_parcela,
      ds_t.coeficiente_participacion_titularidad AS coeficiente_participacion_titularidad,
      ds_t.num_real_parcelas AS num_real_parcelas,
	  ds_t.superficie_planta AS superficie_planta,
	  ds_t.superficie_objeto AS superficie_objeto
    FROM dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ds_t
    INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_ku_dim_objetos objetos ON (objetos.origen=ds_t.origen AND objetos.numero_fijo=ds_t.numero_fijo AND objetos.letra_fija=ds_t.letra_fija AND objetos.indicador_desagregacion=ds_t.indicador_desagregacion)
    INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_ku_dim_otros_atributos otros_atributos ON (otros_atributos.escalera_planta_mano_puerta=ds_t.escalera_planta_mano_puerta AND otros_atributos.actividad_dedicada=ds_t.actividad_dedicada AND otros_atributos.tipo_titularidad_bien=ds_t.tipo_titularidad_bien AND otros_atributos.tipo_persona_fisica_juridica=ds_t.tipo_persona_fisica_juridica AND otros_atributos.tipo_propietario=ds_t.tipo_propietario AND otros_atributos.num_relacion=ds_t.num_relacion)
    INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_ku_dim_ucm ucm ON (ucm.id_uso_objeto=ds_t.id_uso_objeto AND ucm.id_clase_objeto=ds_t.id_clase_objeto AND ucm.id_modalidad_catastro_objeto=ds_t.id_modalidad_catastro_objeto AND ucm.id_uso_edificio=ds_t.id_uso_edificio AND ucm.id_clase_edificio=ds_t.id_clase_edificio AND ucm.id_modalidad_catastro_edificio=ds_t.id_modalidad_catastro_edificio)
    INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_ku_dim_edificios edificios ON (edificios.id_edificio=ds_t.id_edificio)
    INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_ku_dim_marcas marcas ON (marcas.es_caserio_rural=ds_t.es_caserio_rural AND marcas.tiene_cubierta=ds_t.tiene_cubierta AND marcas.servicio_urbanistico_agua=ds_t.servicio_urbanistico_agua AND marcas.servicio_urbanistico_luz=ds_t.servicio_urbanistico_luz AND marcas.servicio_alcantarillado=ds_t.servicio_alcantarillado AND marcas.servicio_pavimento_calzada=ds_t.servicio_pavimento_calzada AND marcas.servicio_encintado_acero=ds_t.servicio_encintado_acero AND marcas.es_subedificada=ds_t.es_subedificada AND marcas.es_identificado=ds_t.es_identificado AND marcas.tiene_acceso_por_portal=ds_t.tiene_acceso_por_portal AND marcas.es_local_interior=ds_t.es_local_interior)
    INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_ku_dim_fechas fechas ON (fechas.fecha_baja_edificio=ds_t.fecha_baja_edificio AND fechas.fecha_valoracion_edificio=ds_t.fecha_valoracion_edificio AND fechas.fecha_categoria_construccion=ds_t.fecha_categoria_construccion AND fechas.fecha_valoracion_parcela=ds_t.fecha_valoracion_parcela AND fechas.fecha_baja_titular=ds_t.fecha_baja_titular AND fechas.fecha_identificacion=ds_t.fecha_identificacion AND fechas.fecha_alta_titular=ds_t.fecha_alta_titular AND fechas.fecha_transmision_dominio=ds_t.fecha_transmision_dominio)
    INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_ku_dim_parcelas parcelas ON (parcelas.id_parcela=ds_t.id_parcela)
    INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_ku_dim_titulares titulares ON (titulares.secuencia_propietario=ds_t.secuencia_propietario AND titulares.nif=ds_t.nif AND titulares.discriminante_nif=ds_t.discriminante_nif AND titulares.nombre_apellidos=ds_t.nombre_apellidos)
    INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_ku_dim_comercios comercios ON (comercios.id_calle_principal=ds_t.id_calle_principal AND comercios.longitud_fachada_principal=ds_t.longitud_fachada_principal AND comercios.id_calle_secundaria_1=ds_t.id_calle_secundaria_1 AND comercios.longitud_calle_secundaria_1=ds_t.longitud_calle_secundaria_1 AND comercios.id_calle_secundaria_2=ds_t.id_calle_secundaria_2 AND comercios.longitud_calle_secundaria_2=ds_t.longitud_calle_secundaria_2 AND comercios.longitud_galeria_comercial=ds_t.longitud_galeria_comercial AND comercios.id_calle_zaguera=ds_t.id_calle_zaguera AND comercios.longitud_zaguera=ds_t.longitud_zaguera AND comercios.altura_libre_local=ds_t.altura_libre_local AND comercios.altura_local_respecto_rasante=ds_t.altura_local_respecto_rasante)
    WHERE ds_t.fec_baja IS NULL
    GROUP BY
      objetos.id_dim_objetos,
      otros_atributos.id_dim_otros_atributos,
      ucm.id_dim_ucm,
      edificios.id_dim_edificios,
      marcas.id_dim_marcas,
      fechas.id_dim_fechas,
      parcelas.id_dim_parcelas,
      titulares.id_dim_titulares,
      comercios.id_dim_comercios,
      ds_t.coeficiente_participacion_comunes,
      ds_t.valor_catastral_objeto,
      ds_t.valor_suelo_objeto,
      ds_t.valor_construido_objeto,
      ds_t.valor_suelo_edificio,
      ds_t.valor_construccion_edificio,
	  ds_t.valor_catastral_edificio,
      ds_t.categoria_construccion,
      ds_t.valor_catastral_parcela,
      ds_t.valor_construccion_parcela,
      ds_t.valor_suelo_parcela,
      ds_t.coeficiente_participacion_titularidad,
      ds_t.num_real_parcelas,
	  ds_t.superficie_planta,
	  ds_t.superficie_objeto
  )
  MERGE dbn1_dmr_dhyf.dbo.tbn1_ku_fact AS tbn1_ku_fact
  USING query ON query.id_dim_objetos=tbn1_ku_fact.id_dim_objetos AND query.id_dim_otros_atributos=tbn1_ku_fact.id_dim_otros_atributos AND query.id_dim_ucm=tbn1_ku_fact.id_dim_ucm AND query.id_dim_edificios=tbn1_ku_fact.id_dim_edificios AND query.id_dim_marcas=tbn1_ku_fact.id_dim_marcas AND query.id_dim_fechas=tbn1_ku_fact.id_dim_fechas AND query.id_dim_parcelas=tbn1_ku_fact.id_dim_parcelas AND query.id_dim_titulares=tbn1_ku_fact.id_dim_titulares AND query.id_dim_comercios=tbn1_ku_fact.id_dim_comercios
  WHEN MATCHED AND ((tbn1_ku_fact.coeficiente_participacion_comunes<>query.coeficiente_participacion_comunes OR (tbn1_ku_fact.coeficiente_participacion_comunes IS NULL AND query.coeficiente_participacion_comunes IS NOT NULL) OR  (tbn1_ku_fact.coeficiente_participacion_comunes IS NOT NULL AND query.coeficiente_participacion_comunes IS NULL)
                    OR tbn1_ku_fact.valor_catastral_objeto<>query.valor_catastral_objeto OR (tbn1_ku_fact.valor_catastral_objeto IS NULL AND query.valor_catastral_objeto IS NOT NULL) OR  (tbn1_ku_fact.valor_catastral_objeto IS NOT NULL AND query.valor_catastral_objeto IS NULL)
                    OR tbn1_ku_fact.valor_suelo_objeto<>query.valor_suelo_objeto OR (tbn1_ku_fact.valor_suelo_objeto IS NULL AND query.valor_suelo_objeto IS NOT NULL) OR  (tbn1_ku_fact.valor_suelo_objeto IS NOT NULL AND query.valor_suelo_objeto IS NULL)
                    OR tbn1_ku_fact.valor_construido_objeto<>query.valor_construido_objeto OR (tbn1_ku_fact.valor_construido_objeto IS NULL AND query.valor_construido_objeto IS NOT NULL) OR  (tbn1_ku_fact.valor_construido_objeto IS NOT NULL AND query.valor_construido_objeto IS NULL)
                    OR tbn1_ku_fact.valor_suelo_edificio<>query.valor_suelo_edificio OR (tbn1_ku_fact.valor_suelo_edificio IS NULL AND query.valor_suelo_edificio IS NOT NULL) OR  (tbn1_ku_fact.valor_suelo_edificio IS NOT NULL AND query.valor_suelo_edificio IS NULL)
                    OR tbn1_ku_fact.valor_construccion_edificio<>query.valor_construccion_edificio OR (tbn1_ku_fact.valor_construccion_edificio IS NULL AND query.valor_construccion_edificio IS NOT NULL) OR  (tbn1_ku_fact.valor_construccion_edificio IS NOT NULL AND query.valor_construccion_edificio IS NULL)
                    OR tbn1_ku_fact.valor_catastral_edificio<>query.valor_catastral_edificio OR (tbn1_ku_fact.valor_catastral_edificio IS NULL AND query.valor_catastral_edificio IS NOT NULL) OR  (tbn1_ku_fact.valor_catastral_edificio IS NOT NULL AND query.valor_catastral_edificio IS NULL)					
                    OR tbn1_ku_fact.categoria_construccion<>query.categoria_construccion OR (tbn1_ku_fact.categoria_construccion IS NULL AND query.categoria_construccion IS NOT NULL) OR  (tbn1_ku_fact.categoria_construccion IS NOT NULL AND query.categoria_construccion IS NULL)
                    OR tbn1_ku_fact.valor_catastral_parcela<>query.valor_catastral_parcela OR (tbn1_ku_fact.valor_catastral_parcela IS NULL AND query.valor_catastral_parcela IS NOT NULL) OR  (tbn1_ku_fact.valor_catastral_parcela IS NOT NULL AND query.valor_catastral_parcela IS NULL)
                    OR tbn1_ku_fact.valor_construccion_parcela<>query.valor_construccion_parcela OR (tbn1_ku_fact.valor_construccion_parcela IS NULL AND query.valor_construccion_parcela IS NOT NULL) OR  (tbn1_ku_fact.valor_construccion_parcela IS NOT NULL AND query.valor_construccion_parcela IS NULL)
                    OR tbn1_ku_fact.valor_suelo_parcela<>query.valor_suelo_parcela OR (tbn1_ku_fact.valor_suelo_parcela IS NULL AND query.valor_suelo_parcela IS NOT NULL) OR  (tbn1_ku_fact.valor_suelo_parcela IS NOT NULL AND query.valor_suelo_parcela IS NULL)
                    OR tbn1_ku_fact.coeficiente_participacion_titularidad<>query.coeficiente_participacion_titularidad OR (tbn1_ku_fact.coeficiente_participacion_titularidad IS NULL AND query.coeficiente_participacion_titularidad IS NOT NULL) OR  (tbn1_ku_fact.coeficiente_participacion_titularidad IS NOT NULL AND query.coeficiente_participacion_titularidad IS NULL)
                    OR tbn1_ku_fact.superficie_planta<>query.superficie_planta OR (tbn1_ku_fact.superficie_planta IS NULL AND query.superficie_planta IS NOT NULL) OR  (tbn1_ku_fact.superficie_planta IS NOT NULL AND query.superficie_planta IS NULL)					
                    OR tbn1_ku_fact.superficie_objeto<>query.superficie_objeto OR (tbn1_ku_fact.superficie_objeto IS NULL AND query.superficie_objeto IS NOT NULL) OR  (tbn1_ku_fact.superficie_objeto IS NOT NULL AND query.superficie_objeto IS NULL)						
                    OR tbn1_ku_fact.num_real_parcelas<>query.num_real_parcelas OR (tbn1_ku_fact.num_real_parcelas IS NULL AND query.num_real_parcelas IS NOT NULL) OR  (tbn1_ku_fact.num_real_parcelas IS NOT NULL AND query.num_real_parcelas IS NULL))) THEN				
    UPDATE SET
      coeficiente_participacion_comunes=query.coeficiente_participacion_comunes,
      valor_catastral_objeto=query.valor_catastral_objeto,
      valor_suelo_objeto=query.valor_suelo_objeto,
      valor_construido_objeto=query.valor_construido_objeto,
      valor_suelo_edificio=query.valor_suelo_edificio,
      valor_construccion_edificio=query.valor_construccion_edificio,
	  valor_catastral_edificio=query.valor_catastral_edificio,
      categoria_construccion=query.categoria_construccion,
      valor_catastral_parcela=query.valor_catastral_parcela,
      valor_construccion_parcela=query.valor_construccion_parcela,
      valor_suelo_parcela=query.valor_suelo_parcela,
      coeficiente_participacion_titularidad=query.coeficiente_participacion_titularidad,
      num_real_parcelas=query.num_real_parcelas,
	  superficie_planta=query.superficie_planta,
	  superficie_objeto=query.superficie_objeto
  WHEN NOT MATCHED THEN
    INSERT (id_dim_objetos,id_dim_otros_atributos,id_dim_ucm,id_dim_edificios,id_dim_marcas,id_dim_fechas,id_dim_parcelas,id_dim_titulares,id_dim_comercios,coeficiente_participacion_comunes,valor_catastral_objeto,valor_suelo_objeto,valor_construido_objeto,valor_suelo_edificio,valor_construccion_edificio,valor_catastral_edificio,categoria_construccion,valor_catastral_parcela,valor_construccion_parcela,valor_suelo_parcela,coeficiente_participacion_titularidad,num_real_parcelas,superficie_planta, superficie_objeto) VALUES (
      query.id_dim_objetos,
      query.id_dim_otros_atributos,
      query.id_dim_ucm,
      query.id_dim_edificios,
      query.id_dim_marcas,
      query.id_dim_fechas,
      query.id_dim_parcelas,
      query.id_dim_titulares,
      query.id_dim_comercios,
      query.coeficiente_participacion_comunes,
      query.valor_catastral_objeto,
      query.valor_suelo_objeto,
      query.valor_construido_objeto,
      query.valor_suelo_edificio,
      query.valor_construccion_edificio,
	  query.valor_catastral_edificio,
      query.categoria_construccion,
      query.valor_catastral_parcela,
      query.valor_construccion_parcela,
      query.valor_suelo_parcela,
      query.coeficiente_participacion_titularidad,
      query.num_real_parcelas,
	  query.superficie_planta,
	  query.superficie_objeto)
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_ku_dm' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_ku_dm;
GO

CREATE PROCEDURE dbo.spn1_cargar_ku_dm(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_ku_dm'
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

  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_ku_maestros @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_ku_dim_objetos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_ku_dim_otros_atributos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_ku_dim_ucm @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_ku_dim_edificios @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_ku_dim_marcas @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_ku_dim_fechas @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_ku_dim_parcelas @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_ku_dim_titulares @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_ku_dim_comercios @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_ku_fact @log;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_catastro_urbano' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_catastro_urbano;
GO

CREATE PROCEDURE dbo.spn1_cargar_catastro_urbano(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_catastro_urbano'
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

  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_ku_ds @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_ku_dm @log;
--  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_ku_pl_dm @log;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_catastro' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_catastro;
GO

CREATE PROCEDURE dbo.spn1_cargar_catastro(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_catastro'
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

  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_catastro_urbano @log;

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

