PRINT 'preparacion.sql'
GO

-----------------------------------------
---------------- SOCIEDADES -------------
-----------------------------------------


-----------------------------------------
-------------- RECAUDACIÓN --------------
-----------------------------------------

IF EXISTS (	SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.TABLES 
			WHERE TABLE_SCHEMA='dbo' 
			AND TABLE_NAME='tbn1_ssrs_vencimientos_detalle' 
			AND TABLE_TYPE='BASE TABLE')
DROP TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_vencimientos_detalle

IF EXISTS (	SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.TABLES 
			WHERE TABLE_SCHEMA='dbo' 
			AND TABLE_NAME='tbn1_ssrs_vencimientos_resumen' 
			AND TABLE_TYPE='BASE TABLE')
DROP TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_vencimientos_resumen

IF EXISTS (	SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.TABLES 
			WHERE TABLE_SCHEMA='dbo' 
			AND TABLE_NAME='tbn1_ssrs_derechos_reconocidos_comparativas' 
			AND TABLE_TYPE='BASE TABLE')
DROP TABLE dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_derechos_reconocidos_comparativas

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
