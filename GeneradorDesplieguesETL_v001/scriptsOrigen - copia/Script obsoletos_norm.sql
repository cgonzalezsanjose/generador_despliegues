PRINT 'obsoletos_norm.sql'
GO


-----------------------------------------
---------------- SOCIEDADES -------------
-----------------------------------------


-----------------------------------------
-------------- RECAUDACIÓN --------------
-----------------------------------------
TRUNCATE TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones

IF EXISTS (SELECT 1 FROM (
  SELECT TABLE_SCHEMA, TABLE_NAME, CONSTRAINT_NAME,CONSTRAINT_TYPE from dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS
  UNION SELECT schemas.name TABLE_SCHEMA,  tables.name TABLE_NAME, default_constraints.name,'DEFAULT'
  FROM dbn1_norm_dhyf.sys.default_constraints
  INNER JOIN dbn1_norm_dhyf.sys.all_columns ON all_columns.default_object_id = default_constraints.object_id
  INNER JOIN dbn1_norm_dhyf.sys.tables ON all_columns.object_id = tables.object_id
  INNER JOIN dbn1_norm_dhyf.sys.schemas ON tables.schema_id = schemas.schema_id
) all_constraints WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND CONSTRAINT_NAME='uk_z3_ds_actuaciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones DROP CONSTRAINT uk_z3_ds_actuaciones

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='entidad_sucursal')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones DROP COLUMN entidad_sucursal;

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='num_cuenta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones DROP COLUMN num_cuenta;

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='tipo_cuentas')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones DROP COLUMN tipo_cuentas;

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='valores_depositados')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones DROP COLUMN valores_depositados;

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='entidad_destino')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones DROP COLUMN entidad_destino;

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='fecha_envio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones DROP COLUMN fecha_envio;

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='fecha_ejecucion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones DROP COLUMN fecha_ejecucion;

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='importe_trabado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones DROP COLUMN importe_trabado;

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='importe_real')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones DROP COLUMN importe_real;

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='importe_neto')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones DROP COLUMN importe_neto;

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='importe_levantado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones DROP COLUMN importe_levantado;

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_z3_ds_actuaciones' AND COLUMN_NAME='importe_indebido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_z3_ds_actuaciones DROP COLUMN importe_indebido;

-----------------------------------------
---------------- IVA --------------------
-----------------------------------------


-----------------------------------------
--------------- PILOTO ------------------
-----------------------------------------


-----------------------------------------
-------- MODELOS INFORMATIVOS -----------
-----------------------------------------


-----------------------------------------
----------------- CATASTRO --------------
-----------------------------------------

IF EXISTS (	SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES 
			WHERE TABLE_SCHEMA='dbo' 
			AND TABLE_NAME='tbn1_ku_ds_objetos_titular' 
			AND TABLE_TYPE='BASE TABLE')
DROP TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular
