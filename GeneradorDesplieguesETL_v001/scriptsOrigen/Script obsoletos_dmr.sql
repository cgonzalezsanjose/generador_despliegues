PRINT 'obsoletos_dmr.sql'
GO


-----------------------------------------
---------------- SOCIEDADES -------------
-----------------------------------------


-----------------------------------------
-------------- RECAUDACIÓN --------------
-----------------------------------------

IF EXISTS (	SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES 
			WHERE TABLE_SCHEMA='dbo' 
			AND TABLE_NAME='tbn1_z3_actu_fact' 
			AND TABLE_TYPE='BASE TABLE')
DROP TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_fact;

IF EXISTS (	SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES 
			WHERE TABLE_SCHEMA='dbo' 
			AND TABLE_NAME='tbn1_z3_actu_dim_expedientes' 
			AND TABLE_TYPE='BASE TABLE')
DROP TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_expedientes;

IF EXISTS (	SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES 
			WHERE TABLE_SCHEMA='dbo' 
			AND TABLE_NAME='tbn1_z3_actu_dim_fechas' 
			AND TABLE_TYPE='BASE TABLE')
DROP TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas;

IF EXISTS (	SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES 
			WHERE TABLE_SCHEMA='dbo' 
			AND TABLE_NAME='tbn1_z3_actu_dim_contribuyentes' 
			AND TABLE_TYPE='BASE TABLE')
DROP TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_contribuyentes;

IF EXISTS (	SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES 
			WHERE TABLE_SCHEMA='dbo' 
			AND TABLE_NAME='tbn1_z3_actu_dim_actuaciones' 
			AND TABLE_TYPE='BASE TABLE')
DROP TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_actuaciones;

IF EXISTS (	SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES 
			WHERE TABLE_SCHEMA='dbo' 
			AND TABLE_NAME='tbn1_z3_actu_dim_detalles_actuacion' 
			AND TABLE_TYPE='BASE TABLE')
DROP TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_detalles_actuacion;

IF EXISTS (	SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES 
			WHERE TABLE_SCHEMA='dbo' 
			AND TABLE_NAME='tbn1_z3_actu_dim_fechas_gastos' 
			AND TABLE_TYPE='BASE TABLE')
DROP TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas_gastos;

IF EXISTS (	SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES 
			WHERE TABLE_SCHEMA='dbo' 
			AND TABLE_NAME='tbn1_z3_actu_dim_cuentas' 
			AND TABLE_TYPE='BASE TABLE')
DROP TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_cuentas;

IF EXISTS (	SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES 
			WHERE TABLE_SCHEMA='dbo' 
			AND TABLE_NAME='tbn1_z3_actu_dim_fechas_cuentas' 
			AND TABLE_TYPE='BASE TABLE')
DROP TABLE dbn1_dmr_dhyf.dbo.tbn1_z3_actu_dim_fechas_cuentas;

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

IF EXISTS (	SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES 
			WHERE TABLE_SCHEMA='dbo' 
			AND TABLE_NAME='tbn1_ku_fact' 
			AND TABLE_TYPE='BASE TABLE')
DROP TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_fact


IF EXISTS (	SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES 
			WHERE TABLE_SCHEMA='dbo' 
			AND TABLE_NAME='tbn1_ku_dim_titulares' 
			AND TABLE_TYPE='BASE TABLE')
DROP TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_titulares


IF EXISTS (	SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES 
			WHERE TABLE_SCHEMA='dbo' 
			AND TABLE_NAME='tbn1_ku_dim_objetos' 
			AND TABLE_TYPE='BASE TABLE')
DROP TABLE dbn1_dmr_dhyf.dbo.tbn1_ku_dim_objetos
