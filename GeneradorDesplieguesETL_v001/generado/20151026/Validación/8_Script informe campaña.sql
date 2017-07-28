PRINT 'informe campaña.sql'
GO

USE dbn1_dmr_dhyf_v
GO

IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ssrs_aux_ingresar_devolver_kanpaina') DROP VIEW dbo.tbn1_ssrs_aux_ingresar_devolver_kanpaina
GO

CREATE VIEW dbo.tbn1_ssrs_aux_ingresar_devolver_kanpaina AS
SELECT 'Resumen' AS tipo,'Liquido a ingresar/devolver' AS grupo,1 AS orden,'200-TH-LiqIngDev' AS nemo
UNION SELECT 'Resumen' AS tipo,'Liquido a ingresar/devolver' AS grupo,1 AS orden,'220-TH-LiqIngDev' AS nemo
UNION SELECT 'Resumen' AS tipo,'Liquido a ingresar/devolver' AS grupo,1 AS orden,'200-TH-DeclOrig' AS nemo
UNION SELECT 'Resumen' AS tipo,'Liquido a ingresar/devolver' AS grupo,1 AS orden,'220-TH-DeclOrig' AS nemo
UNION SELECT 'Resumen' AS tipo,'Liquido a ingresar/devolver' AS grupo,1 AS orden,'DWH-CompAdmin' AS nemo
UNION SELECT 'Pagos Fraccionados' AS tipo,'Pagos Fraccionados' AS grupo,2 AS orden,'200-TH-PagFracUTE-AIE' AS nemo
UNION SELECT 'Pagos Fraccionados' AS tipo,'Pagos fraccionados' AS grupo,2 AS orden,'220-TH-PagFracUTE-AIE' AS nemo
UNION SELECT 'Pagos Fraccionados' AS tipo,'Pagos fraccionados' AS grupo,2 AS orden,'200-RS-LI-BI-PF1' AS nemo
UNION SELECT 'Pagos Fraccionados' AS tipo,'Pagos fraccionados' AS grupo,2 AS orden,'220-TH-BI-Franc1' AS nemo
UNION SELECT 'Pagos Fraccionados' AS tipo,'Pagos fraccionados' AS grupo,2 AS orden,'200-RS-LI-BI-PF2' AS nemo
UNION SELECT 'Pagos Fraccionados' AS tipo,'Pagos fraccionados' AS grupo,2 AS orden,'220-TH-BI-Franc2' AS nemo
UNION SELECT 'Pagos Fraccionados' AS tipo,'Pagos fraccionados' AS grupo,2 AS orden,'200-RS-LI-BI-PF3' AS nemo
UNION SELECT 'Pagos Fraccionados' AS tipo,'Pagos fraccionados' AS grupo,2 AS orden,'220-TH-BI-Franc3' AS nemo
UNION SELECT 'Retenciones' AS tipo,'Retenciones' AS grupo,3 AS orden,'200-RIIngFin' AS nemo
UNION SELECT 'Retenciones' AS tipo,'Retenciones' AS grupo,3 AS orden,'200-RIArrInm' AS nemo
UNION SELECT 'Retenciones' AS tipo,'Retenciones' AS grupo,3 AS orden,'200-RIImpOtrEnt' AS nemo
UNION SELECT 'Retenciones' AS tipo,'Retenciones' AS grupo,3 AS orden,'220-RIIngFin' AS nemo
UNION SELECT 'Retenciones' AS tipo,'Retenciones' AS grupo,3 AS orden,'220-RIArrInm' AS nemo
UNION SELECT 'Retenciones' AS tipo,'Retenciones' AS grupo,3 AS orden,'220-RIImpOtrEnt' AS nemo
UNION SELECT 'Retenciones' AS tipo,'Retenciones' AS grupo,3 AS orden,'200-RS-CE-RetIngCue' AS nemo
UNION SELECT 'Retenciones' AS tipo,'Retenciones' AS grupo,3 AS orden,'200-RS-CE-RetIngCueAIE' AS nemo
UNION SELECT 'Retenciones' AS tipo,'Retenciones' AS grupo,3 AS orden,'200-RS-CE-RetLotApu' AS nemo
UNION SELECT 'Retenciones' AS tipo,'Retenciones' AS grupo,3 AS orden,'220-CU-PO-RetCuent' AS nemo
UNION SELECT 'Retenciones' AS tipo,'Retenciones' AS grupo,3 AS orden,'220-CU-PO-RetAie' AS nemo
UNION SELECT 'Retenciones' AS tipo,'Retenciones' AS grupo,3 AS orden,'220-RS-CE-RetLotApu' AS nemo

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina')
CREATE TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina(
  id int NOT NULL,
  Paso varchar(1) NOT NULL,
  Periodo int,
  Tipo varchar(30),
  Orden int,
  Agrupacion varchar(50),
  Tamano varchar(20),
  Resultado varchar(20),
  Normativa varchar(20),
  Grupo_fiscal varchar(20),
  Regimen_fiscal varchar(60),
  Supuesto varchar(30),
  Fase varchar(50),
  Orden_fase int,
  Vigente varchar(20),
  Modelo varchar(3),
  Importe numeric(18,4),
  Num_contribuyentes int,
  CONSTRAINT PK_tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina PRIMARY KEY CLUSTERED (id,Paso)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina' AND COLUMN_NAME='id')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina ADD id int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina' AND COLUMN_NAME='Paso')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina ADD Paso varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina' AND COLUMN_NAME='Periodo')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina ADD Periodo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina' AND COLUMN_NAME='Tipo')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina ADD Tipo varchar(30)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina' AND COLUMN_NAME='Orden')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina ADD Orden int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina' AND COLUMN_NAME='Agrupacion')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina ADD Agrupacion varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina' AND COLUMN_NAME='Tamano')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina ADD Tamano varchar(20)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina' AND COLUMN_NAME='Resultado')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina ADD Resultado varchar(20)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina' AND COLUMN_NAME='Normativa')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina ADD Normativa varchar(20)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina' AND COLUMN_NAME='Grupo_fiscal')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina ADD Grupo_fiscal varchar(20)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina' AND COLUMN_NAME='Regimen_fiscal')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina ADD Regimen_fiscal varchar(60)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina' AND COLUMN_NAME='Supuesto')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina ADD Supuesto varchar(30)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina' AND COLUMN_NAME='Fase')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina ADD Fase varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina' AND COLUMN_NAME='Orden_fase')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina ADD Orden_fase int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina' AND COLUMN_NAME='Vigente')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina ADD Vigente varchar(20)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina' AND COLUMN_NAME='Modelo')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina ADD Modelo varchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina' AND COLUMN_NAME='Importe')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina ADD Importe numeric(18,4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina' AND COLUMN_NAME='Num_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina ADD Num_contribuyentes int

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina' AND COLUMN_NAME='id' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina ALTER COLUMN id int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina' AND COLUMN_NAME='Paso' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina ALTER COLUMN Paso varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina' AND COLUMN_NAME='Periodo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina ALTER COLUMN Periodo int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina' AND COLUMN_NAME='Tipo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina ALTER COLUMN Tipo varchar(30) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina' AND COLUMN_NAME='Orden' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina ALTER COLUMN Orden int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina' AND COLUMN_NAME='Agrupacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina ALTER COLUMN Agrupacion varchar(50) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina' AND COLUMN_NAME='Tamano' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina ALTER COLUMN Tamano varchar(20) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina' AND COLUMN_NAME='Resultado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina ALTER COLUMN Resultado varchar(20) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina' AND COLUMN_NAME='Normativa' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina ALTER COLUMN Normativa varchar(20) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina' AND COLUMN_NAME='Grupo_fiscal' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina ALTER COLUMN Grupo_fiscal varchar(20) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina' AND COLUMN_NAME='Regimen_fiscal' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina ALTER COLUMN Regimen_fiscal varchar(60) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina' AND COLUMN_NAME='Supuesto' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina ALTER COLUMN Supuesto varchar(30) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina' AND COLUMN_NAME='Fase' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina ALTER COLUMN Fase varchar(50) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina' AND COLUMN_NAME='Orden_fase' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina ALTER COLUMN Orden_fase int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina' AND COLUMN_NAME='Vigente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina ALTER COLUMN Vigente varchar(20) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina' AND COLUMN_NAME='Modelo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina ALTER COLUMN Modelo varchar(3) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina' AND COLUMN_NAME='Importe' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina ALTER COLUMN Importe numeric(18,4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina' AND COLUMN_NAME='Num_contribuyentes' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina ALTER COLUMN Num_contribuyentes int NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina' AND CONSTRAINT_NAME='PK_tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina ADD CONSTRAINT PK_tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina PRIMARY KEY CLUSTERED (id,Paso)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia')
CREATE TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia(
  id int NOT NULL,
  Paso varchar(1) NOT NULL,
  Fecha_presentacion date,
  Periodo int,
  Tipo varchar(30),
  Orden int,
  Agrupacion varchar(50),
  Tamano varchar(20),
  Resultado varchar(20),
  Normativa varchar(20),
  Grupo_fiscal varchar(20),
  Regimen_fiscal varchar(60),
  Supuesto varchar(30),
  Fase varchar(50),
  Orden_fase int,
  Vigente varchar(20),
  Modelo varchar(3),
  Importe numeric(18,4),
  Num_contribuyentes int,
  ImporteAcum numeric(18,4),
  Num_contribuyentesAcum int,
  CONSTRAINT PK_tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia PRIMARY KEY CLUSTERED (id,Paso),
  CONSTRAINT FK_tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia_tbn1_dim_fechas FOREIGN KEY (Fecha_presentacion) REFERENCES dbn1_dmr_dhyf_v.dbo.tbn1_dim_fechas(fecha)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='id')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ADD id int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='Paso')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ADD Paso varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='Fecha_presentacion')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ADD Fecha_presentacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='Periodo')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ADD Periodo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='Tipo')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ADD Tipo varchar(30)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='Orden')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ADD Orden int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='Agrupacion')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ADD Agrupacion varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='Tamano')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ADD Tamano varchar(20)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='Resultado')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ADD Resultado varchar(20)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='Normativa')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ADD Normativa varchar(20)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='Grupo_fiscal')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ADD Grupo_fiscal varchar(20)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='Regimen_fiscal')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ADD Regimen_fiscal varchar(60)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='Supuesto')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ADD Supuesto varchar(30)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='Fase')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ADD Fase varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='Orden_fase')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ADD Orden_fase int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='Vigente')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ADD Vigente varchar(20)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='Modelo')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ADD Modelo varchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='Importe')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ADD Importe numeric(18,4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='Num_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ADD Num_contribuyentes int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='ImporteAcum')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ADD ImporteAcum numeric(18,4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='Num_contribuyentesAcum')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ADD Num_contribuyentesAcum int

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='id' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ALTER COLUMN id int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='Paso' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ALTER COLUMN Paso varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='Fecha_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ALTER COLUMN Fecha_presentacion date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='Periodo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ALTER COLUMN Periodo int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='Tipo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ALTER COLUMN Tipo varchar(30) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='Orden' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ALTER COLUMN Orden int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='Agrupacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ALTER COLUMN Agrupacion varchar(50) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='Tamano' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ALTER COLUMN Tamano varchar(20) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='Resultado' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ALTER COLUMN Resultado varchar(20) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='Normativa' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ALTER COLUMN Normativa varchar(20) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='Grupo_fiscal' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ALTER COLUMN Grupo_fiscal varchar(20) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='Regimen_fiscal' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ALTER COLUMN Regimen_fiscal varchar(60) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='Supuesto' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ALTER COLUMN Supuesto varchar(30) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='Fase' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ALTER COLUMN Fase varchar(50) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='Orden_fase' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ALTER COLUMN Orden_fase int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='Vigente' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ALTER COLUMN Vigente varchar(20) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='Modelo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ALTER COLUMN Modelo varchar(3) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='Importe' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ALTER COLUMN Importe numeric(18,4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='Num_contribuyentes' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ALTER COLUMN Num_contribuyentes int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='ImporteAcum' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ALTER COLUMN ImporteAcum numeric(18,4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND COLUMN_NAME='Num_contribuyentesAcum' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ALTER COLUMN Num_contribuyentesAcum int NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND CONSTRAINT_NAME='PK_tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ADD CONSTRAINT PK_tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia PRIMARY KEY CLUSTERED (id,Paso)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia' AND CONSTRAINT_NAME='FK_tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia_tbn1_dim_fechas')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia ADD CONSTRAINT FK_tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia_tbn1_dim_fechas FOREIGN KEY (Fecha_presentacion) REFERENCES dbn1_dmr_dhyf_v.dbo.tbn1_dim_fechas(fecha)

GO

USE dbn1_stg_dhyf_v
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf_v.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_fact_detalles_ssrs_ingresar_devolver_kanpaina_1' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_fact_detalles_ssrs_ingresar_devolver_kanpaina_1;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_fact_detalles_ssrs_ingresar_devolver_kanpaina_1(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf_v.dbo.spn1_cargar_dimensional_fact_detalles_ssrs_ingresar_devolver_kanpaina_1'
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

  ;WITH
  query AS (
    SELECT
      '1' AS Paso,
      min(id_detalle) AS id,
      doc.Periodo AS Periodo,
      aux.Tipo AS Tipo,
      aux.Orden AS Orden,
      aux.grupo AS Agrupacion,
      doc.Tamano AS Tamano,
      doc.signo_resultado AS Resultado,
      doc.Normativa AS Normativa,
      doc.grupo_no_grupo AS Grupo_fiscal,
      doc.regimen_fiscal AS Regimen_fiscal,
      doc.fase_supuesto AS Supuesto,
      doc.Fase AS Fase,
      doc.Orden_fase AS Orden_fase,
      doc.es_vigente AS Vigente,
      doc.cod_modelo AS Modelo,
      count(DISTINCT det.id_contribuyente) AS Num_contribuyentes
    FROM dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles det
    INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_dim_nemotecnicos nemo ON (nemo.id_nemotecnico=det.id_nemotecnico)
    INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_aux_ingresar_devolver_kanpaina aux ON (aux.nemo=nemo.nemotecnico)
    INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_dim_documentos doc ON (doc.id_documento=det.id_documento)
    WHERE
      doc.cod_modelo IN ('200','220')
      AND aux.orden=1
    GROUP BY
      doc.Periodo,
      aux.Tipo,
      aux.Orden,
      aux.grupo,
      doc.Tamano,
      doc.signo_resultado,
      doc.Normativa,
      doc.grupo_no_grupo,
      doc.regimen_fiscal,
      doc.fase_supuesto,
      doc.Fase,
      doc.Orden_fase,
      doc.es_vigente,
      doc.cod_modelo
  )
  MERGE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina AS tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina
  USING query ON query.Paso=tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Paso AND query.id=tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.id
  WHEN MATCHED AND (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Paso='1'
                    AND (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Periodo<>query.Periodo OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Periodo IS NULL AND query.Periodo IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Periodo IS NOT NULL AND query.Periodo IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Tipo<>query.Tipo OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Tipo IS NULL AND query.Tipo IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Tipo IS NOT NULL AND query.Tipo IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Orden<>query.Orden OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Orden IS NULL AND query.Orden IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Orden IS NOT NULL AND query.Orden IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Agrupacion<>query.Agrupacion OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Agrupacion IS NULL AND query.Agrupacion IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Agrupacion IS NOT NULL AND query.Agrupacion IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Tamano<>query.Tamano OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Tamano IS NULL AND query.Tamano IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Tamano IS NOT NULL AND query.Tamano IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Resultado<>query.Resultado OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Resultado IS NULL AND query.Resultado IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Resultado IS NOT NULL AND query.Resultado IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Normativa<>query.Normativa OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Normativa IS NULL AND query.Normativa IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Normativa IS NOT NULL AND query.Normativa IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Grupo_fiscal<>query.Grupo_fiscal OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Grupo_fiscal IS NULL AND query.Grupo_fiscal IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Grupo_fiscal IS NOT NULL AND query.Grupo_fiscal IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Regimen_fiscal<>query.Regimen_fiscal OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Regimen_fiscal IS NULL AND query.Regimen_fiscal IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Regimen_fiscal IS NOT NULL AND query.Regimen_fiscal IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Supuesto<>query.Supuesto OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Supuesto IS NULL AND query.Supuesto IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Supuesto IS NOT NULL AND query.Supuesto IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Fase<>query.Fase OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Fase IS NULL AND query.Fase IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Fase IS NOT NULL AND query.Fase IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Orden_fase<>query.Orden_fase OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Orden_fase IS NULL AND query.Orden_fase IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Orden_fase IS NOT NULL AND query.Orden_fase IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Vigente<>query.Vigente OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Vigente IS NULL AND query.Vigente IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Vigente IS NOT NULL AND query.Vigente IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Modelo<>query.Modelo OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Modelo IS NULL AND query.Modelo IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Modelo IS NOT NULL AND query.Modelo IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Num_contribuyentes<>query.Num_contribuyentes OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Num_contribuyentes IS NULL AND query.Num_contribuyentes IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Num_contribuyentes IS NOT NULL AND query.Num_contribuyentes IS NULL))) THEN
    UPDATE SET
      Periodo=query.Periodo,
      Tipo=query.Tipo,
      Orden=query.Orden,
      Agrupacion=query.Agrupacion,
      Tamano=query.Tamano,
      Resultado=query.Resultado,
      Normativa=query.Normativa,
      Grupo_fiscal=query.Grupo_fiscal,
      Regimen_fiscal=query.Regimen_fiscal,
      Supuesto=query.Supuesto,
      Fase=query.Fase,
      Orden_fase=query.Orden_fase,
      Vigente=query.Vigente,
      Modelo=query.Modelo,
      Num_contribuyentes=query.Num_contribuyentes
  WHEN NOT MATCHED THEN
    INSERT (Paso,id,Periodo,Tipo,Orden,Agrupacion,Tamano,Resultado,Normativa,Grupo_fiscal,Regimen_fiscal,Supuesto,Fase,Orden_fase,Vigente,Modelo,Num_contribuyentes) VALUES (
      query.Paso,
      query.id,
      query.Periodo,
      query.Tipo,
      query.Orden,
      query.Agrupacion,
      query.Tamano,
      query.Resultado,
      query.Normativa,
      query.Grupo_fiscal,
      query.Regimen_fiscal,
      query.Supuesto,
      query.Fase,
      query.Orden_fase,
      query.Vigente,
      query.Modelo,
      query.Num_contribuyentes)
  WHEN NOT MATCHED BY SOURCE AND (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Paso='1') THEN
    DELETE;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf_v.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_fact_detalles_ssrs_ingresar_devolver_kanpaina_2' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_fact_detalles_ssrs_ingresar_devolver_kanpaina_2;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_fact_detalles_ssrs_ingresar_devolver_kanpaina_2(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf_v.dbo.spn1_cargar_dimensional_fact_detalles_ssrs_ingresar_devolver_kanpaina_2'
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

  ;WITH
  query AS (
    SELECT
      '2' AS Paso,
      min(id_detalle) AS id,
      doc.Periodo AS Periodo,
      aux.Tipo AS Tipo,
      aux.Orden AS Orden,
      aux.grupo AS Agrupacion,
      doc.Tamano AS Tamano,
      doc.signo_resultado AS Resultado,
      doc.Normativa AS Normativa,
      doc.grupo_no_grupo AS Grupo_fiscal,
      doc.regimen_fiscal AS Regimen_fiscal,
      doc.fase_supuesto AS Supuesto,
      doc.Fase AS Fase,
      doc.Orden_fase AS Orden_fase,
      doc.es_vigente AS Vigente,
      doc.cod_modelo AS Modelo,
      sum(det.valor) AS Importe,
      count(DISTINCT det.id_contribuyente) AS Num_contribuyentes
    FROM dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles det
    INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_dim_nemotecnicos nemo ON (nemo.id_nemotecnico=det.id_nemotecnico)
    INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_aux_ingresar_devolver_kanpaina aux ON (aux.nemo=nemo.nemotecnico)
    INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_dim_documentos doc ON (doc.id_documento=det.id_documento)
    WHERE
      doc.cod_modelo IN ('200')
      AND aux.orden IN (2,3)
      AND doc.grupo_no_grupo='No grupo'
    GROUP BY
      doc.Periodo,
      aux.Tipo,
      aux.Orden,
      aux.grupo,
      doc.Tamano,
      doc.signo_resultado,
      doc.Normativa,
      doc.grupo_no_grupo,
      doc.regimen_fiscal,
      doc.fase_supuesto,
      doc.Fase,
      doc.Orden_fase,
      doc.es_vigente,
      doc.cod_modelo
  )
  MERGE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina AS tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina
  USING query ON query.Paso=tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Paso AND query.id=tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.id
  WHEN MATCHED AND (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Paso='2'
                    AND (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Periodo<>query.Periodo OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Periodo IS NULL AND query.Periodo IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Periodo IS NOT NULL AND query.Periodo IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Tipo<>query.Tipo OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Tipo IS NULL AND query.Tipo IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Tipo IS NOT NULL AND query.Tipo IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Orden<>query.Orden OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Orden IS NULL AND query.Orden IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Orden IS NOT NULL AND query.Orden IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Agrupacion<>query.Agrupacion OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Agrupacion IS NULL AND query.Agrupacion IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Agrupacion IS NOT NULL AND query.Agrupacion IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Tamano<>query.Tamano OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Tamano IS NULL AND query.Tamano IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Tamano IS NOT NULL AND query.Tamano IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Resultado<>query.Resultado OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Resultado IS NULL AND query.Resultado IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Resultado IS NOT NULL AND query.Resultado IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Normativa<>query.Normativa OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Normativa IS NULL AND query.Normativa IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Normativa IS NOT NULL AND query.Normativa IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Grupo_fiscal<>query.Grupo_fiscal OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Grupo_fiscal IS NULL AND query.Grupo_fiscal IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Grupo_fiscal IS NOT NULL AND query.Grupo_fiscal IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Regimen_fiscal<>query.Regimen_fiscal OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Regimen_fiscal IS NULL AND query.Regimen_fiscal IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Regimen_fiscal IS NOT NULL AND query.Regimen_fiscal IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Supuesto<>query.Supuesto OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Supuesto IS NULL AND query.Supuesto IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Supuesto IS NOT NULL AND query.Supuesto IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Fase<>query.Fase OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Fase IS NULL AND query.Fase IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Fase IS NOT NULL AND query.Fase IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Orden_fase<>query.Orden_fase OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Orden_fase IS NULL AND query.Orden_fase IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Orden_fase IS NOT NULL AND query.Orden_fase IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Vigente<>query.Vigente OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Vigente IS NULL AND query.Vigente IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Vigente IS NOT NULL AND query.Vigente IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Modelo<>query.Modelo OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Modelo IS NULL AND query.Modelo IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Modelo IS NOT NULL AND query.Modelo IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Importe<>query.Importe OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Importe IS NULL AND query.Importe IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Importe IS NOT NULL AND query.Importe IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Num_contribuyentes<>query.Num_contribuyentes OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Num_contribuyentes IS NULL AND query.Num_contribuyentes IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Num_contribuyentes IS NOT NULL AND query.Num_contribuyentes IS NULL))) THEN
    UPDATE SET
      Periodo=query.Periodo,
      Tipo=query.Tipo,
      Orden=query.Orden,
      Agrupacion=query.Agrupacion,
      Tamano=query.Tamano,
      Resultado=query.Resultado,
      Normativa=query.Normativa,
      Grupo_fiscal=query.Grupo_fiscal,
      Regimen_fiscal=query.Regimen_fiscal,
      Supuesto=query.Supuesto,
      Fase=query.Fase,
      Orden_fase=query.Orden_fase,
      Vigente=query.Vigente,
      Modelo=query.Modelo,
      Importe=query.Importe,
      Num_contribuyentes=query.Num_contribuyentes
  WHEN NOT MATCHED THEN
    INSERT (Paso,id,Periodo,Tipo,Orden,Agrupacion,Tamano,Resultado,Normativa,Grupo_fiscal,Regimen_fiscal,Supuesto,Fase,Orden_fase,Vigente,Modelo,Importe,Num_contribuyentes) VALUES (
      query.Paso,
      query.id,
      query.Periodo,
      query.Tipo,
      query.Orden,
      query.Agrupacion,
      query.Tamano,
      query.Resultado,
      query.Normativa,
      query.Grupo_fiscal,
      query.Regimen_fiscal,
      query.Supuesto,
      query.Fase,
      query.Orden_fase,
      query.Vigente,
      query.Modelo,
      query.Importe,
      query.Num_contribuyentes)
  WHEN NOT MATCHED BY SOURCE AND (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Paso='2') THEN
    DELETE;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf_v.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_fact_detalles_ssrs_ingresar_devolver_kanpaina_3' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_fact_detalles_ssrs_ingresar_devolver_kanpaina_3;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_fact_detalles_ssrs_ingresar_devolver_kanpaina_3(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf_v.dbo.spn1_cargar_dimensional_fact_detalles_ssrs_ingresar_devolver_kanpaina_3'
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

  ;WITH
  query AS (
    SELECT
      '3' AS Paso,
      min(id_detalle) AS id,
      doc.Periodo AS Periodo,
      aux.Tipo AS Tipo,
      aux.Orden AS Orden,
      aux.grupo AS Agrupacion,
      doc.Tamano AS Tamano,
      doc.signo_resultado AS Resultado,
      doc.Normativa AS Normativa,
      doc.grupo_no_grupo AS Grupo_fiscal,
      doc.regimen_fiscal AS Regimen_fiscal,
      doc.fase_supuesto AS Supuesto,
      doc.Fase AS Fase,
      doc.Orden_fase AS Orden_fase,
      doc.es_vigente AS Vigente,
      doc.cod_modelo AS Modelo,
      sum(det.valor) AS Importe,
      count(DISTINCT det.id_contribuyente) AS Num_contribuyentes
    FROM dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles det
    INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_dim_nemotecnicos nemo ON (nemo.id_nemotecnico=det.id_nemotecnico)
    INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_aux_ingresar_devolver_kanpaina aux ON (aux.nemo=nemo.nemotecnico)
    INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_dim_documentos doc ON (doc.id_documento=det.id_documento)
    WHERE
      doc.cod_modelo IN ('220')
      AND aux.orden IN (2,3)
    GROUP BY
      doc.Periodo,
      aux.Tipo,
      aux.Orden,
      aux.grupo,
      doc.Tamano,
      doc.signo_resultado,
      doc.Normativa,
      doc.grupo_no_grupo,
      doc.regimen_fiscal,
      doc.fase_supuesto,
      doc.Fase,
      doc.Orden_fase,
      doc.es_vigente,
      doc.cod_modelo
  )
  MERGE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina AS tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina
  USING query ON query.Paso=tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Paso AND query.id=tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.id
  WHEN MATCHED AND (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Paso='3'
                    AND (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Periodo<>query.Periodo OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Periodo IS NULL AND query.Periodo IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Periodo IS NOT NULL AND query.Periodo IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Tipo<>query.Tipo OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Tipo IS NULL AND query.Tipo IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Tipo IS NOT NULL AND query.Tipo IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Orden<>query.Orden OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Orden IS NULL AND query.Orden IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Orden IS NOT NULL AND query.Orden IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Agrupacion<>query.Agrupacion OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Agrupacion IS NULL AND query.Agrupacion IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Agrupacion IS NOT NULL AND query.Agrupacion IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Tamano<>query.Tamano OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Tamano IS NULL AND query.Tamano IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Tamano IS NOT NULL AND query.Tamano IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Resultado<>query.Resultado OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Resultado IS NULL AND query.Resultado IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Resultado IS NOT NULL AND query.Resultado IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Normativa<>query.Normativa OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Normativa IS NULL AND query.Normativa IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Normativa IS NOT NULL AND query.Normativa IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Grupo_fiscal<>query.Grupo_fiscal OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Grupo_fiscal IS NULL AND query.Grupo_fiscal IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Grupo_fiscal IS NOT NULL AND query.Grupo_fiscal IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Regimen_fiscal<>query.Regimen_fiscal OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Regimen_fiscal IS NULL AND query.Regimen_fiscal IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Regimen_fiscal IS NOT NULL AND query.Regimen_fiscal IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Supuesto<>query.Supuesto OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Supuesto IS NULL AND query.Supuesto IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Supuesto IS NOT NULL AND query.Supuesto IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Fase<>query.Fase OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Fase IS NULL AND query.Fase IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Fase IS NOT NULL AND query.Fase IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Orden_fase<>query.Orden_fase OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Orden_fase IS NULL AND query.Orden_fase IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Orden_fase IS NOT NULL AND query.Orden_fase IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Vigente<>query.Vigente OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Vigente IS NULL AND query.Vigente IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Vigente IS NOT NULL AND query.Vigente IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Modelo<>query.Modelo OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Modelo IS NULL AND query.Modelo IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Modelo IS NOT NULL AND query.Modelo IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Importe<>query.Importe OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Importe IS NULL AND query.Importe IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Importe IS NOT NULL AND query.Importe IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Num_contribuyentes<>query.Num_contribuyentes OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Num_contribuyentes IS NULL AND query.Num_contribuyentes IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Num_contribuyentes IS NOT NULL AND query.Num_contribuyentes IS NULL))) THEN
    UPDATE SET
      Periodo=query.Periodo,
      Tipo=query.Tipo,
      Orden=query.Orden,
      Agrupacion=query.Agrupacion,
      Tamano=query.Tamano,
      Resultado=query.Resultado,
      Normativa=query.Normativa,
      Grupo_fiscal=query.Grupo_fiscal,
      Regimen_fiscal=query.Regimen_fiscal,
      Supuesto=query.Supuesto,
      Fase=query.Fase,
      Orden_fase=query.Orden_fase,
      Vigente=query.Vigente,
      Modelo=query.Modelo,
      Importe=query.Importe,
      Num_contribuyentes=query.Num_contribuyentes
  WHEN NOT MATCHED THEN
    INSERT (Paso,id,Periodo,Tipo,Orden,Agrupacion,Tamano,Resultado,Normativa,Grupo_fiscal,Regimen_fiscal,Supuesto,Fase,Orden_fase,Vigente,Modelo,Importe,Num_contribuyentes) VALUES (
      query.Paso,
      query.id,
      query.Periodo,
      query.Tipo,
      query.Orden,
      query.Agrupacion,
      query.Tamano,
      query.Resultado,
      query.Normativa,
      query.Grupo_fiscal,
      query.Regimen_fiscal,
      query.Supuesto,
      query.Fase,
      query.Orden_fase,
      query.Vigente,
      query.Modelo,
      query.Importe,
      query.Num_contribuyentes)
  WHEN NOT MATCHED BY SOURCE AND (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina.Paso='3') THEN
    DELETE;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf_v.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia_1' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia_1;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia_1(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf_v.dbo.spn1_cargar_dimensional_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia_1'
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

  ;WITH
  query AS (
    SELECT
      '1' AS Paso,
      min(id_detalle) AS id,
      doc.fecha_presentacion AS Fecha_presentacion,
      doc.Periodo AS Periodo,
      aux.Tipo AS Tipo,
      aux.Orden AS Orden,
      aux.grupo AS Agrupacion,
      doc.Tamano AS Tamano,
      doc.signo_resultado AS Resultado,
      doc.Normativa AS Normativa,
      doc.grupo_no_grupo AS Grupo_fiscal,
      doc.regimen_fiscal AS Regimen_fiscal,
      doc.fase_supuesto AS Supuesto,
      doc.Fase AS Fase,
      doc.Orden_fase AS Orden_fase,
      doc.es_vigente AS Vigente,
      doc.cod_modelo AS Modelo,
      sum(det.valor) AS Importe,
      count(DISTINCT det.id_contribuyente) AS Num_contribuyentes,
      sum(sum(det.valor)) OVER (ORDER BY doc.fecha_presentacion,min(id_detalle) ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS ImporteAcum,
      sum(count(DISTINCT det.id_contribuyente)) OVER (ORDER BY doc.fecha_presentacion,min(id_detalle) ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS Num_contribuyentesAcum
    FROM dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles det
    INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_dim_nemotecnicos nemo ON (det.id_nemotecnico=nemo.id_nemotecnico)
    INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_aux_ingresar_devolver_kanpaina aux ON (aux.nemo=nemo.nemotecnico)
    INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_dim_documentos doc ON (det.id_documento=doc.id_documento)
    WHERE
      doc.cod_modelo IN ('200','220')
      AND aux.orden=1
    GROUP BY
      doc.fecha_presentacion,
      doc.Periodo,
      aux.Tipo,
      aux.Orden,
      aux.grupo,
      doc.Tamano,
      doc.signo_resultado,
      doc.Normativa,
      doc.grupo_no_grupo,
      doc.regimen_fiscal,
      doc.fase_supuesto,
      doc.Fase,
      doc.Orden_fase,
      doc.es_vigente,
      doc.cod_modelo
  )
  MERGE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia AS tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia
  USING query ON query.Paso=tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Paso AND query.id=tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.id
  WHEN MATCHED AND (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Paso='1'
                    AND (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Fecha_presentacion<>query.Fecha_presentacion OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Fecha_presentacion IS NULL AND query.Fecha_presentacion IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Fecha_presentacion IS NOT NULL AND query.Fecha_presentacion IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Periodo<>query.Periodo OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Periodo IS NULL AND query.Periodo IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Periodo IS NOT NULL AND query.Periodo IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Tipo<>query.Tipo OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Tipo IS NULL AND query.Tipo IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Tipo IS NOT NULL AND query.Tipo IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Orden<>query.Orden OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Orden IS NULL AND query.Orden IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Orden IS NOT NULL AND query.Orden IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Agrupacion<>query.Agrupacion OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Agrupacion IS NULL AND query.Agrupacion IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Agrupacion IS NOT NULL AND query.Agrupacion IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Tamano<>query.Tamano OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Tamano IS NULL AND query.Tamano IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Tamano IS NOT NULL AND query.Tamano IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Resultado<>query.Resultado OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Resultado IS NULL AND query.Resultado IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Resultado IS NOT NULL AND query.Resultado IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Normativa<>query.Normativa OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Normativa IS NULL AND query.Normativa IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Normativa IS NOT NULL AND query.Normativa IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Grupo_fiscal<>query.Grupo_fiscal OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Grupo_fiscal IS NULL AND query.Grupo_fiscal IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Grupo_fiscal IS NOT NULL AND query.Grupo_fiscal IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Regimen_fiscal<>query.Regimen_fiscal OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Regimen_fiscal IS NULL AND query.Regimen_fiscal IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Regimen_fiscal IS NOT NULL AND query.Regimen_fiscal IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Supuesto<>query.Supuesto OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Supuesto IS NULL AND query.Supuesto IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Supuesto IS NOT NULL AND query.Supuesto IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Fase<>query.Fase OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Fase IS NULL AND query.Fase IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Fase IS NOT NULL AND query.Fase IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Orden_fase<>query.Orden_fase OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Orden_fase IS NULL AND query.Orden_fase IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Orden_fase IS NOT NULL AND query.Orden_fase IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Vigente<>query.Vigente OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Vigente IS NULL AND query.Vigente IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Vigente IS NOT NULL AND query.Vigente IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Modelo<>query.Modelo OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Modelo IS NULL AND query.Modelo IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Modelo IS NOT NULL AND query.Modelo IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Importe<>query.Importe OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Importe IS NULL AND query.Importe IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Importe IS NOT NULL AND query.Importe IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Num_contribuyentes<>query.Num_contribuyentes OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Num_contribuyentes IS NULL AND query.Num_contribuyentes IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Num_contribuyentes IS NOT NULL AND query.Num_contribuyentes IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.ImporteAcum<>query.ImporteAcum OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.ImporteAcum IS NULL AND query.ImporteAcum IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.ImporteAcum IS NOT NULL AND query.ImporteAcum IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Num_contribuyentesAcum<>query.Num_contribuyentesAcum OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Num_contribuyentesAcum IS NULL AND query.Num_contribuyentesAcum IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Num_contribuyentesAcum IS NOT NULL AND query.Num_contribuyentesAcum IS NULL))) THEN
    UPDATE SET
      Fecha_presentacion=query.Fecha_presentacion,
      Periodo=query.Periodo,
      Tipo=query.Tipo,
      Orden=query.Orden,
      Agrupacion=query.Agrupacion,
      Tamano=query.Tamano,
      Resultado=query.Resultado,
      Normativa=query.Normativa,
      Grupo_fiscal=query.Grupo_fiscal,
      Regimen_fiscal=query.Regimen_fiscal,
      Supuesto=query.Supuesto,
      Fase=query.Fase,
      Orden_fase=query.Orden_fase,
      Vigente=query.Vigente,
      Modelo=query.Modelo,
      Importe=query.Importe,
      Num_contribuyentes=query.Num_contribuyentes,
      ImporteAcum=query.ImporteAcum,
      Num_contribuyentesAcum=query.Num_contribuyentesAcum
  WHEN NOT MATCHED THEN
    INSERT (Paso,id,Fecha_presentacion,Periodo,Tipo,Orden,Agrupacion,Tamano,Resultado,Normativa,Grupo_fiscal,Regimen_fiscal,Supuesto,Fase,Orden_fase,Vigente,Modelo,Importe,Num_contribuyentes,ImporteAcum,Num_contribuyentesAcum) VALUES (
      query.Paso,
      query.id,
      query.Fecha_presentacion,
      query.Periodo,
      query.Tipo,
      query.Orden,
      query.Agrupacion,
      query.Tamano,
      query.Resultado,
      query.Normativa,
      query.Grupo_fiscal,
      query.Regimen_fiscal,
      query.Supuesto,
      query.Fase,
      query.Orden_fase,
      query.Vigente,
      query.Modelo,
      query.Importe,
      query.Num_contribuyentes,
      query.ImporteAcum,
      query.Num_contribuyentesAcum)
  WHEN NOT MATCHED BY SOURCE AND (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Paso='1') THEN
    DELETE;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf_v.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia_2' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia_2;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia_2(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf_v.dbo.spn1_cargar_dimensional_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia_2'
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

  ;WITH
  query AS (
    SELECT
      '2' AS Paso,
      min(id_detalle) AS id,
      doc.fecha_presentacion AS Fecha_presentacion,
      doc.Periodo AS Periodo,
      aux.Tipo AS Tipo,
      aux.Orden AS Orden,
      aux.grupo AS Agrupacion,
      doc.Tamano AS Tamano,
      doc.signo_resultado AS Resultado,
      doc.Normativa AS Normativa,
      doc.grupo_no_grupo AS Grupo_fiscal,
      doc.regimen_fiscal AS Regimen_fiscal,
      doc.fase_supuesto AS Supuesto,
      doc.Fase AS Fase,
      doc.Orden_fase AS Orden_fase,
      doc.es_vigente AS Vigente,
      doc.cod_modelo AS Modelo,
      sum(det.valor) AS Importe,
      count(DISTINCT det.id_contribuyente) AS Num_contribuyentes,
      sum(sum(det.valor)) OVER (ORDER BY doc.fecha_presentacion,min(id_detalle) ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS ImporteAcum,
      sum(count(DISTINCT det.id_contribuyente)) OVER (ORDER BY doc.fecha_presentacion,min(id_detalle) ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS Num_contribuyentesAcum
    FROM dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles det
    INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_dim_nemotecnicos nemo ON (det.id_nemotecnico=nemo.id_nemotecnico)
    INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_aux_ingresar_devolver_kanpaina aux ON (aux.nemo=nemo.nemotecnico)
    INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_dim_documentos doc ON (det.id_documento=doc.id_documento)
    WHERE
      doc.cod_modelo IN ('200')
      AND aux.orden IN (2,3)
      AND doc.grupo_no_grupo='No grupo'
    GROUP BY
      doc.fecha_presentacion,
      doc.Periodo,
      aux.Tipo,
      aux.Orden,
      aux.grupo,
      doc.Tamano,
      doc.signo_resultado,
      doc.Normativa,
      doc.grupo_no_grupo,
      doc.regimen_fiscal,
      doc.fase_supuesto,
      doc.Fase,
      doc.Orden_fase,
      doc.es_vigente,
      doc.cod_modelo
  )
  MERGE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia AS tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia
  USING query ON query.Paso=tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Paso AND query.id=tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.id
  WHEN MATCHED AND (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Paso='2'
                    AND (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Fecha_presentacion<>query.Fecha_presentacion OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Fecha_presentacion IS NULL AND query.Fecha_presentacion IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Fecha_presentacion IS NOT NULL AND query.Fecha_presentacion IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Periodo<>query.Periodo OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Periodo IS NULL AND query.Periodo IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Periodo IS NOT NULL AND query.Periodo IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Tipo<>query.Tipo OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Tipo IS NULL AND query.Tipo IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Tipo IS NOT NULL AND query.Tipo IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Orden<>query.Orden OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Orden IS NULL AND query.Orden IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Orden IS NOT NULL AND query.Orden IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Agrupacion<>query.Agrupacion OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Agrupacion IS NULL AND query.Agrupacion IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Agrupacion IS NOT NULL AND query.Agrupacion IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Tamano<>query.Tamano OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Tamano IS NULL AND query.Tamano IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Tamano IS NOT NULL AND query.Tamano IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Resultado<>query.Resultado OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Resultado IS NULL AND query.Resultado IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Resultado IS NOT NULL AND query.Resultado IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Normativa<>query.Normativa OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Normativa IS NULL AND query.Normativa IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Normativa IS NOT NULL AND query.Normativa IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Grupo_fiscal<>query.Grupo_fiscal OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Grupo_fiscal IS NULL AND query.Grupo_fiscal IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Grupo_fiscal IS NOT NULL AND query.Grupo_fiscal IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Regimen_fiscal<>query.Regimen_fiscal OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Regimen_fiscal IS NULL AND query.Regimen_fiscal IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Regimen_fiscal IS NOT NULL AND query.Regimen_fiscal IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Supuesto<>query.Supuesto OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Supuesto IS NULL AND query.Supuesto IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Supuesto IS NOT NULL AND query.Supuesto IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Fase<>query.Fase OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Fase IS NULL AND query.Fase IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Fase IS NOT NULL AND query.Fase IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Orden_fase<>query.Orden_fase OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Orden_fase IS NULL AND query.Orden_fase IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Orden_fase IS NOT NULL AND query.Orden_fase IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Vigente<>query.Vigente OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Vigente IS NULL AND query.Vigente IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Vigente IS NOT NULL AND query.Vigente IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Modelo<>query.Modelo OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Modelo IS NULL AND query.Modelo IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Modelo IS NOT NULL AND query.Modelo IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Importe<>query.Importe OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Importe IS NULL AND query.Importe IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Importe IS NOT NULL AND query.Importe IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Num_contribuyentes<>query.Num_contribuyentes OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Num_contribuyentes IS NULL AND query.Num_contribuyentes IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Num_contribuyentes IS NOT NULL AND query.Num_contribuyentes IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.ImporteAcum<>query.ImporteAcum OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.ImporteAcum IS NULL AND query.ImporteAcum IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.ImporteAcum IS NOT NULL AND query.ImporteAcum IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Num_contribuyentesAcum<>query.Num_contribuyentesAcum OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Num_contribuyentesAcum IS NULL AND query.Num_contribuyentesAcum IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Num_contribuyentesAcum IS NOT NULL AND query.Num_contribuyentesAcum IS NULL))) THEN
    UPDATE SET
      Fecha_presentacion=query.Fecha_presentacion,
      Periodo=query.Periodo,
      Tipo=query.Tipo,
      Orden=query.Orden,
      Agrupacion=query.Agrupacion,
      Tamano=query.Tamano,
      Resultado=query.Resultado,
      Normativa=query.Normativa,
      Grupo_fiscal=query.Grupo_fiscal,
      Regimen_fiscal=query.Regimen_fiscal,
      Supuesto=query.Supuesto,
      Fase=query.Fase,
      Orden_fase=query.Orden_fase,
      Vigente=query.Vigente,
      Modelo=query.Modelo,
      Importe=query.Importe,
      Num_contribuyentes=query.Num_contribuyentes,
      ImporteAcum=query.ImporteAcum,
      Num_contribuyentesAcum=query.Num_contribuyentesAcum
  WHEN NOT MATCHED THEN
    INSERT (Paso,id,Fecha_presentacion,Periodo,Tipo,Orden,Agrupacion,Tamano,Resultado,Normativa,Grupo_fiscal,Regimen_fiscal,Supuesto,Fase,Orden_fase,Vigente,Modelo,Importe,Num_contribuyentes,ImporteAcum,Num_contribuyentesAcum) VALUES (
      query.Paso,
      query.id,
      query.Fecha_presentacion,
      query.Periodo,
      query.Tipo,
      query.Orden,
      query.Agrupacion,
      query.Tamano,
      query.Resultado,
      query.Normativa,
      query.Grupo_fiscal,
      query.Regimen_fiscal,
      query.Supuesto,
      query.Fase,
      query.Orden_fase,
      query.Vigente,
      query.Modelo,
      query.Importe,
      query.Num_contribuyentes,
      query.ImporteAcum,
      query.Num_contribuyentesAcum)
  WHEN NOT MATCHED BY SOURCE AND (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Paso='2') THEN
    DELETE;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf_v.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia_3' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia_3;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia_3(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf_v.dbo.spn1_cargar_dimensional_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia_3'
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

  ;WITH
  query AS (
    SELECT
      '3' AS Paso,
      min(id_detalle) AS id,
      doc.fecha_presentacion AS Fecha_presentacion,
      doc.Periodo AS Periodo,
      aux.Tipo AS Tipo,
      aux.Orden AS Orden,
      aux.grupo AS Agrupacion,
      doc.Tamano AS Tamano,
      doc.signo_resultado AS Resultado,
      doc.Normativa AS Normativa,
      doc.grupo_no_grupo AS Grupo_fiscal,
      doc.regimen_fiscal AS Regimen_fiscal,
      doc.fase_supuesto AS Supuesto,
      doc.Fase AS Fase,
      doc.Orden_fase AS Orden_fase,
      doc.es_vigente AS Vigente,
      doc.cod_modelo AS Modelo,
      sum(det.valor) AS Importe,
      count(DISTINCT det.id_contribuyente) AS Num_contribuyentes,
      sum(sum(det.valor)) OVER (ORDER BY doc.fecha_presentacion,min(id_detalle) ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS ImporteAcum,
      sum(count(DISTINCT det.id_contribuyente)) OVER (ORDER BY doc.fecha_presentacion,min(id_detalle) ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS Num_contribuyentesAcum
    FROM dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles det
    INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_dim_nemotecnicos nemo ON (det.id_nemotecnico=nemo.id_nemotecnico)
    INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_aux_ingresar_devolver_kanpaina aux ON (aux.nemo=nemo.nemotecnico)
    INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_dim_documentos doc ON (det.id_documento=doc.id_documento)
    WHERE
      doc.cod_modelo IN ('220')
      AND aux.orden IN (2,3)
    GROUP BY
      doc.fecha_presentacion,
      doc.Periodo,
      aux.Tipo,
      aux.Orden,
      aux.grupo,
      doc.Tamano,
      doc.signo_resultado,
      doc.Normativa,
      doc.grupo_no_grupo,
      doc.regimen_fiscal,
      doc.fase_supuesto,
      doc.Fase,
      doc.Orden_fase,
      doc.es_vigente,
      doc.cod_modelo
  )
  MERGE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia AS tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia
  USING query ON query.Paso=tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Paso AND query.id=tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.id
  WHEN MATCHED AND (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Paso='3'
                    AND (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Fecha_presentacion<>query.Fecha_presentacion OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Fecha_presentacion IS NULL AND query.Fecha_presentacion IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Fecha_presentacion IS NOT NULL AND query.Fecha_presentacion IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Periodo<>query.Periodo OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Periodo IS NULL AND query.Periodo IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Periodo IS NOT NULL AND query.Periodo IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Tipo<>query.Tipo OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Tipo IS NULL AND query.Tipo IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Tipo IS NOT NULL AND query.Tipo IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Orden<>query.Orden OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Orden IS NULL AND query.Orden IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Orden IS NOT NULL AND query.Orden IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Agrupacion<>query.Agrupacion OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Agrupacion IS NULL AND query.Agrupacion IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Agrupacion IS NOT NULL AND query.Agrupacion IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Tamano<>query.Tamano OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Tamano IS NULL AND query.Tamano IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Tamano IS NOT NULL AND query.Tamano IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Resultado<>query.Resultado OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Resultado IS NULL AND query.Resultado IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Resultado IS NOT NULL AND query.Resultado IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Normativa<>query.Normativa OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Normativa IS NULL AND query.Normativa IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Normativa IS NOT NULL AND query.Normativa IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Grupo_fiscal<>query.Grupo_fiscal OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Grupo_fiscal IS NULL AND query.Grupo_fiscal IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Grupo_fiscal IS NOT NULL AND query.Grupo_fiscal IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Regimen_fiscal<>query.Regimen_fiscal OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Regimen_fiscal IS NULL AND query.Regimen_fiscal IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Regimen_fiscal IS NOT NULL AND query.Regimen_fiscal IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Supuesto<>query.Supuesto OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Supuesto IS NULL AND query.Supuesto IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Supuesto IS NOT NULL AND query.Supuesto IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Fase<>query.Fase OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Fase IS NULL AND query.Fase IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Fase IS NOT NULL AND query.Fase IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Orden_fase<>query.Orden_fase OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Orden_fase IS NULL AND query.Orden_fase IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Orden_fase IS NOT NULL AND query.Orden_fase IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Vigente<>query.Vigente OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Vigente IS NULL AND query.Vigente IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Vigente IS NOT NULL AND query.Vigente IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Modelo<>query.Modelo OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Modelo IS NULL AND query.Modelo IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Modelo IS NOT NULL AND query.Modelo IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Importe<>query.Importe OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Importe IS NULL AND query.Importe IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Importe IS NOT NULL AND query.Importe IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Num_contribuyentes<>query.Num_contribuyentes OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Num_contribuyentes IS NULL AND query.Num_contribuyentes IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Num_contribuyentes IS NOT NULL AND query.Num_contribuyentes IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.ImporteAcum<>query.ImporteAcum OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.ImporteAcum IS NULL AND query.ImporteAcum IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.ImporteAcum IS NOT NULL AND query.ImporteAcum IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Num_contribuyentesAcum<>query.Num_contribuyentesAcum OR (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Num_contribuyentesAcum IS NULL AND query.Num_contribuyentesAcum IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Num_contribuyentesAcum IS NOT NULL AND query.Num_contribuyentesAcum IS NULL))) THEN
    UPDATE SET
      Fecha_presentacion=query.Fecha_presentacion,
      Periodo=query.Periodo,
      Tipo=query.Tipo,
      Orden=query.Orden,
      Agrupacion=query.Agrupacion,
      Tamano=query.Tamano,
      Resultado=query.Resultado,
      Normativa=query.Normativa,
      Grupo_fiscal=query.Grupo_fiscal,
      Regimen_fiscal=query.Regimen_fiscal,
      Supuesto=query.Supuesto,
      Fase=query.Fase,
      Orden_fase=query.Orden_fase,
      Vigente=query.Vigente,
      Modelo=query.Modelo,
      Importe=query.Importe,
      Num_contribuyentes=query.Num_contribuyentes,
      ImporteAcum=query.ImporteAcum,
      Num_contribuyentesAcum=query.Num_contribuyentesAcum
  WHEN NOT MATCHED THEN
    INSERT (Paso,id,Fecha_presentacion,Periodo,Tipo,Orden,Agrupacion,Tamano,Resultado,Normativa,Grupo_fiscal,Regimen_fiscal,Supuesto,Fase,Orden_fase,Vigente,Modelo,Importe,Num_contribuyentes,ImporteAcum,Num_contribuyentesAcum) VALUES (
      query.Paso,
      query.id,
      query.Fecha_presentacion,
      query.Periodo,
      query.Tipo,
      query.Orden,
      query.Agrupacion,
      query.Tamano,
      query.Resultado,
      query.Normativa,
      query.Grupo_fiscal,
      query.Regimen_fiscal,
      query.Supuesto,
      query.Fase,
      query.Orden_fase,
      query.Vigente,
      query.Modelo,
      query.Importe,
      query.Num_contribuyentes,
      query.ImporteAcum,
      query.Num_contribuyentesAcum)
  WHEN NOT MATCHED BY SOURCE AND (tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina_dia.Paso='3') THEN
    DELETE;

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

USE dbn1_dmr_dhyf_v
GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='tbn1_ssrs_ingresar_devolver_periodo_kanpaina' AND ROUTINE_TYPE='FUNCTION')
DROP FUNCTION dbo.tbn1_ssrs_ingresar_devolver_periodo_kanpaina;
GO

CREATE FUNCTION dbo.tbn1_ssrs_ingresar_devolver_periodo_kanpaina(@periodo int) RETURNS TABLE AS
RETURN (
  WITH
  fact_detalles_ssrs_ingresar_devolver_kanpaina1 AS (
    SELECT
      @periodo AS Periodo,
      fact_detalles_ssrs_ingresar_devolver_kanpaina.Agrupacion AS Agrupacion,
      fact_detalles_ssrs_ingresar_devolver_kanpaina.Resultado AS Resultado,
      fact_detalles_ssrs_ingresar_devolver_kanpaina.Normativa AS Normativa,
      fact_detalles_ssrs_ingresar_devolver_kanpaina.Fase AS Fase,
      fact_detalles_ssrs_ingresar_devolver_kanpaina.Grupo_fiscal AS Grupo_fiscal,
      fact_detalles_ssrs_ingresar_devolver_kanpaina.Regimen_fiscal AS Regimen_fiscal,
      fact_detalles_ssrs_ingresar_devolver_kanpaina.Vigente AS Vigente,
      fact_detalles_ssrs_ingresar_devolver_kanpaina.Tamano AS Tamano,
      fact_detalles_ssrs_ingresar_devolver_kanpaina.Modelo AS Modelo,
      sum(fact_detalles_ssrs_ingresar_devolver_kanpaina.Importe) AS auxcol_11_,
      sum(fact_detalles_ssrs_ingresar_devolver_kanpaina.Num_contribuyentes) AS auxcol_13_
    FROM dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina fact_detalles_ssrs_ingresar_devolver_kanpaina
    WHERE fact_detalles_ssrs_ingresar_devolver_kanpaina.Periodo=@periodo
    GROUP BY
      fact_detalles_ssrs_ingresar_devolver_kanpaina.Agrupacion,
      fact_detalles_ssrs_ingresar_devolver_kanpaina.Resultado,
      fact_detalles_ssrs_ingresar_devolver_kanpaina.Normativa,
      fact_detalles_ssrs_ingresar_devolver_kanpaina.Fase,
      fact_detalles_ssrs_ingresar_devolver_kanpaina.Grupo_fiscal,
      fact_detalles_ssrs_ingresar_devolver_kanpaina.Regimen_fiscal,
      fact_detalles_ssrs_ingresar_devolver_kanpaina.Vigente,
      fact_detalles_ssrs_ingresar_devolver_kanpaina.Tamano,
      fact_detalles_ssrs_ingresar_devolver_kanpaina.Modelo
  ),
  fact_detalles_ssrs_ingresar_devolver_kanpaina2 AS (
    SELECT
      @periodo AS Periodo,
      fact_detalles_ssrs_ingresar_devolver_kanpaina.Agrupacion AS Agrupacion,
      fact_detalles_ssrs_ingresar_devolver_kanpaina.Resultado AS Resultado,
      fact_detalles_ssrs_ingresar_devolver_kanpaina.Normativa AS Normativa,
      fact_detalles_ssrs_ingresar_devolver_kanpaina.Fase AS Fase,
      fact_detalles_ssrs_ingresar_devolver_kanpaina.Grupo_fiscal AS Grupo_fiscal,
      fact_detalles_ssrs_ingresar_devolver_kanpaina.Regimen_fiscal AS Regimen_fiscal,
      fact_detalles_ssrs_ingresar_devolver_kanpaina.Vigente AS Vigente,
      fact_detalles_ssrs_ingresar_devolver_kanpaina.Tamano AS Tamano,
      fact_detalles_ssrs_ingresar_devolver_kanpaina.Modelo AS Modelo,
      sum(fact_detalles_ssrs_ingresar_devolver_kanpaina.Importe) AS auxcol_12_,
      sum(fact_detalles_ssrs_ingresar_devolver_kanpaina.Num_contribuyentes) AS auxcol_14_
    FROM dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_kanpaina fact_detalles_ssrs_ingresar_devolver_kanpaina
    WHERE fact_detalles_ssrs_ingresar_devolver_kanpaina.Periodo=@periodo-1
    GROUP BY
      fact_detalles_ssrs_ingresar_devolver_kanpaina.Agrupacion,
      fact_detalles_ssrs_ingresar_devolver_kanpaina.Resultado,
      fact_detalles_ssrs_ingresar_devolver_kanpaina.Normativa,
      fact_detalles_ssrs_ingresar_devolver_kanpaina.Fase,
      fact_detalles_ssrs_ingresar_devolver_kanpaina.Grupo_fiscal,
      fact_detalles_ssrs_ingresar_devolver_kanpaina.Regimen_fiscal,
      fact_detalles_ssrs_ingresar_devolver_kanpaina.Vigente,
      fact_detalles_ssrs_ingresar_devolver_kanpaina.Tamano,
      fact_detalles_ssrs_ingresar_devolver_kanpaina.Modelo
  )
  SELECT
    coalesce(fact_detalles_ssrs_ingresar_devolver_kanpaina1.Periodo,fact_detalles_ssrs_ingresar_devolver_kanpaina2.Periodo) AS Periodo,
    coalesce(fact_detalles_ssrs_ingresar_devolver_kanpaina1.Agrupacion,fact_detalles_ssrs_ingresar_devolver_kanpaina2.Agrupacion) AS Agrupacion,
    coalesce(fact_detalles_ssrs_ingresar_devolver_kanpaina1.Resultado,fact_detalles_ssrs_ingresar_devolver_kanpaina2.Resultado) AS Resultado,
    coalesce(fact_detalles_ssrs_ingresar_devolver_kanpaina1.Normativa,fact_detalles_ssrs_ingresar_devolver_kanpaina2.Normativa) AS Normativa,
    coalesce(fact_detalles_ssrs_ingresar_devolver_kanpaina1.Fase,fact_detalles_ssrs_ingresar_devolver_kanpaina2.Fase) AS Fase,
    coalesce(fact_detalles_ssrs_ingresar_devolver_kanpaina1.Grupo_fiscal,fact_detalles_ssrs_ingresar_devolver_kanpaina2.Grupo_fiscal) AS Grupo_fiscal,
    coalesce(fact_detalles_ssrs_ingresar_devolver_kanpaina1.Regimen_fiscal,fact_detalles_ssrs_ingresar_devolver_kanpaina2.Regimen_fiscal) AS Regimen_fiscal,
    coalesce(fact_detalles_ssrs_ingresar_devolver_kanpaina1.Vigente,fact_detalles_ssrs_ingresar_devolver_kanpaina2.Vigente) AS Vigente,
    coalesce(fact_detalles_ssrs_ingresar_devolver_kanpaina1.Tamano,fact_detalles_ssrs_ingresar_devolver_kanpaina2.Tamano) AS Tamano,
    coalesce(fact_detalles_ssrs_ingresar_devolver_kanpaina1.Modelo,fact_detalles_ssrs_ingresar_devolver_kanpaina2.Modelo) AS Modelo,
    coalesce(fact_detalles_ssrs_ingresar_devolver_kanpaina1.auxcol_11_,0) AS Importe,
    coalesce(fact_detalles_ssrs_ingresar_devolver_kanpaina2.auxcol_12_,0) AS Importe_anterior,
    coalesce(fact_detalles_ssrs_ingresar_devolver_kanpaina1.auxcol_13_,0) AS Num_contribuyentes,
    coalesce(fact_detalles_ssrs_ingresar_devolver_kanpaina2.auxcol_14_,0) AS Num_contribuyentes_anterior,
    coalesce(coalesce(fact_detalles_ssrs_ingresar_devolver_kanpaina1.auxcol_11_,0),0)-coalesce(coalesce(fact_detalles_ssrs_ingresar_devolver_kanpaina2.auxcol_12_,0),0) AS Diferencia
  FROM fact_detalles_ssrs_ingresar_devolver_kanpaina1
  FULL JOIN fact_detalles_ssrs_ingresar_devolver_kanpaina2 ON (fact_detalles_ssrs_ingresar_devolver_kanpaina2.Periodo=fact_detalles_ssrs_ingresar_devolver_kanpaina1.Periodo AND fact_detalles_ssrs_ingresar_devolver_kanpaina2.Agrupacion=fact_detalles_ssrs_ingresar_devolver_kanpaina1.Agrupacion AND fact_detalles_ssrs_ingresar_devolver_kanpaina2.Resultado=fact_detalles_ssrs_ingresar_devolver_kanpaina1.Resultado AND fact_detalles_ssrs_ingresar_devolver_kanpaina2.Normativa=fact_detalles_ssrs_ingresar_devolver_kanpaina1.Normativa AND fact_detalles_ssrs_ingresar_devolver_kanpaina2.Fase=fact_detalles_ssrs_ingresar_devolver_kanpaina1.Fase AND fact_detalles_ssrs_ingresar_devolver_kanpaina2.Grupo_fiscal=fact_detalles_ssrs_ingresar_devolver_kanpaina1.Grupo_fiscal AND fact_detalles_ssrs_ingresar_devolver_kanpaina2.Regimen_fiscal=fact_detalles_ssrs_ingresar_devolver_kanpaina1.Regimen_fiscal AND fact_detalles_ssrs_ingresar_devolver_kanpaina2.Vigente=fact_detalles_ssrs_ingresar_devolver_kanpaina1.Vigente AND fact_detalles_ssrs_ingresar_devolver_kanpaina2.Tamano=fact_detalles_ssrs_ingresar_devolver_kanpaina1.Tamano AND fact_detalles_ssrs_ingresar_devolver_kanpaina2.Modelo=fact_detalles_ssrs_ingresar_devolver_kanpaina1.Modelo)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif')
CREATE TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif(
  Periodo int NOT NULL,
  Paso varchar(1),
  NIF_maestro varchar(20) NOT NULL,
  Razon_social varchar(200),
  Tipo varchar(30),
  Orden int,
  Agrupacion varchar(50) NOT NULL,
  Tamano varchar(20) NOT NULL,
  Resultado varchar(20) NOT NULL,
  Normativa varchar(20) NOT NULL,
  Grupo_fiscal varchar(20) NOT NULL,
  Regimen_fiscal varchar(60) NOT NULL,
  Supuesto varchar(30) NOT NULL,
  Fase varchar(50) NOT NULL,
  Orden_fase int,
  Vigente varchar(20) NOT NULL,
  Modelo varchar(3) NOT NULL,
  Importe numeric(18,4),
  Num_contribuyentes int,
  Fecha_PK date NOT NULL,
  F_desde_PK date NOT NULL,
  F_hasta_PK date NOT NULL,
  F_presentacion date,
  F_desde date,
  F_hasta date,
  CONSTRAINT PK_tbn1_fact_detalles_ssrs_ingresar_devolver_nif PRIMARY KEY CLUSTERED (Periodo,NIF_maestro,Agrupacion,Tamano,Resultado,Normativa,Grupo_fiscal,Regimen_fiscal,Supuesto,Fase,Vigente,Modelo,Fecha_PK,F_desde_PK,F_hasta_PK),
  CONSTRAINT FK_tbn1_fact_detalles_ssrs_ingresar_devolver_nif_tbn1_dim_fechas FOREIGN KEY (F_presentacion) REFERENCES dbn1_dmr_dhyf_v.dbo.tbn1_dim_fechas(fecha),
  CONSTRAINT FK_tbn1_fact_detalles_ssrs_ingresar_devolver_nif_tbn1_dim_fechas1 FOREIGN KEY (F_desde) REFERENCES dbn1_dmr_dhyf_v.dbo.tbn1_dim_fechas(fecha),
  CONSTRAINT FK_tbn1_fact_detalles_ssrs_ingresar_devolver_nif_tbn1_dim_fechas2 FOREIGN KEY (F_hasta) REFERENCES dbn1_dmr_dhyf_v.dbo.tbn1_dim_fechas(fecha)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='Periodo')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ADD Periodo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='Paso')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ADD Paso varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='NIF_maestro')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ADD NIF_maestro varchar(20)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='Razon_social')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ADD Razon_social varchar(200)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='Tipo')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ADD Tipo varchar(30)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='Orden')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ADD Orden int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='Agrupacion')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ADD Agrupacion varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='Tamano')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ADD Tamano varchar(20)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='Resultado')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ADD Resultado varchar(20)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='Normativa')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ADD Normativa varchar(20)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='Grupo_fiscal')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ADD Grupo_fiscal varchar(20)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='Regimen_fiscal')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ADD Regimen_fiscal varchar(60)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='Supuesto')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ADD Supuesto varchar(30)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='Fase')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ADD Fase varchar(50)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='Orden_fase')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ADD Orden_fase int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='Vigente')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ADD Vigente varchar(20)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='Modelo')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ADD Modelo varchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='Importe')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ADD Importe numeric(18,4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='Num_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ADD Num_contribuyentes int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='Fecha_PK')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ADD Fecha_PK date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='F_desde_PK')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ADD F_desde_PK date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='F_hasta_PK')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ADD F_hasta_PK date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='F_presentacion')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ADD F_presentacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='F_desde')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ADD F_desde date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='F_hasta')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ADD F_hasta date

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='Periodo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ALTER COLUMN Periodo int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='Paso' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ALTER COLUMN Paso varchar(1) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='NIF_maestro' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ALTER COLUMN NIF_maestro varchar(20) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='Razon_social' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ALTER COLUMN Razon_social varchar(200) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='Tipo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ALTER COLUMN Tipo varchar(30) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='Orden' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ALTER COLUMN Orden int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='Agrupacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ALTER COLUMN Agrupacion varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='Tamano' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ALTER COLUMN Tamano varchar(20) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='Resultado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ALTER COLUMN Resultado varchar(20) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='Normativa' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ALTER COLUMN Normativa varchar(20) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='Grupo_fiscal' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ALTER COLUMN Grupo_fiscal varchar(20) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='Regimen_fiscal' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ALTER COLUMN Regimen_fiscal varchar(60) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='Supuesto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ALTER COLUMN Supuesto varchar(30) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='Fase' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ALTER COLUMN Fase varchar(50) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='Orden_fase' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ALTER COLUMN Orden_fase int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='Vigente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ALTER COLUMN Vigente varchar(20) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='Modelo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ALTER COLUMN Modelo varchar(3) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='Importe' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ALTER COLUMN Importe numeric(18,4) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='Num_contribuyentes' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ALTER COLUMN Num_contribuyentes int NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='Fecha_PK' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ALTER COLUMN Fecha_PK date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='F_desde_PK' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ALTER COLUMN F_desde_PK date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='F_hasta_PK' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ALTER COLUMN F_hasta_PK date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='F_presentacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ALTER COLUMN F_presentacion date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='F_desde' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ALTER COLUMN F_desde date NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND COLUMN_NAME='F_hasta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ALTER COLUMN F_hasta date NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND CONSTRAINT_NAME='PK_tbn1_fact_detalles_ssrs_ingresar_devolver_nif')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ADD CONSTRAINT PK_tbn1_fact_detalles_ssrs_ingresar_devolver_nif PRIMARY KEY CLUSTERED (Periodo,NIF_maestro,Agrupacion,Tamano,Resultado,Normativa,Grupo_fiscal,Regimen_fiscal,Supuesto,Fase,Vigente,Modelo,Fecha_PK,F_desde_PK,F_hasta_PK)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND CONSTRAINT_NAME='FK_tbn1_fact_detalles_ssrs_ingresar_devolver_nif_tbn1_dim_fechas')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ADD CONSTRAINT FK_tbn1_fact_detalles_ssrs_ingresar_devolver_nif_tbn1_dim_fechas FOREIGN KEY (F_presentacion) REFERENCES dbn1_dmr_dhyf_v.dbo.tbn1_dim_fechas(fecha)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND CONSTRAINT_NAME='FK_tbn1_fact_detalles_ssrs_ingresar_devolver_nif_tbn1_dim_fechas1')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ADD CONSTRAINT FK_tbn1_fact_detalles_ssrs_ingresar_devolver_nif_tbn1_dim_fechas1 FOREIGN KEY (F_desde) REFERENCES dbn1_dmr_dhyf_v.dbo.tbn1_dim_fechas(fecha)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf_v.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_ssrs_ingresar_devolver_nif' AND CONSTRAINT_NAME='FK_tbn1_fact_detalles_ssrs_ingresar_devolver_nif_tbn1_dim_fechas2')
ALTER TABLE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_nif ADD CONSTRAINT FK_tbn1_fact_detalles_ssrs_ingresar_devolver_nif_tbn1_dim_fechas2 FOREIGN KEY (F_hasta) REFERENCES dbn1_dmr_dhyf_v.dbo.tbn1_dim_fechas(fecha)

GO

USE dbn1_stg_dhyf_v
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf_v.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_fact_detalles_ssrs_ingresar_devolver_NIF_1' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_fact_detalles_ssrs_ingresar_devolver_NIF_1;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_fact_detalles_ssrs_ingresar_devolver_NIF_1(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf_v.dbo.spn1_cargar_dimensional_fact_detalles_ssrs_ingresar_devolver_NIF_1'
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

  ;WITH
  query AS (
    SELECT
      '1' AS Paso,
      cont.nif_maestro AS NIF_maestro,
      cont.nombre AS Razon_social,
      doc.Periodo AS Periodo,
      aux.Tipo AS Tipo,
      aux.Orden AS Orden,
      aux.grupo AS Agrupacion,
      doc.Tamano AS Tamano,
      doc.signo_resultado AS Resultado,
      doc.Normativa AS Normativa,
      doc.grupo_no_grupo AS Grupo_fiscal,
      doc.regimen_fiscal AS Regimen_fiscal,
      doc.fase_supuesto AS Supuesto,
      doc.Fase AS Fase,
      doc.Orden_fase AS Orden_fase,
      doc.es_vigente AS Vigente,
      doc.cod_modelo AS Modelo,
      CASE WHEN doc.fecha_presentacion IS NULL THEN '01/01/1989' ELSE doc.fecha_presentacion END AS Fecha_PK,
      CASE WHEN doc.fecha_desde IS NULL THEN '01/01/1989' ELSE doc.fecha_desde END AS F_desde_PK,
      CASE WHEN doc.fecha_hasta IS NULL THEN '01/01/1989' ELSE doc.fecha_hasta END AS F_hasta_PK,
      doc.fecha_presentacion AS F_presentacion,
      doc.fecha_desde AS F_desde,
      doc.fecha_hasta AS F_hasta,
      sum(det.valor) AS Importe,
      count(DISTINCT det.id_contribuyente) AS Num_contribuyentes
    FROM dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles det
    INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_dim_nemotecnicos nemo ON (det.id_nemotecnico=nemo.id_nemotecnico)
    INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_aux_ingresar_devolver_kanpaina aux ON (aux.nemo=nemo.nemotecnico)
    INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_dim_documentos doc ON (det.id_documento=doc.id_documento)
    INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_dim_contribuyentes cont ON (doc.id_contribuyente=cont.id_contribuyente)
    WHERE
      doc.cod_modelo IN ('200','220')
      AND aux.orden=1
    GROUP BY
      cont.nif_maestro,
      cont.nombre,
      doc.Periodo,
      aux.Tipo,
      aux.Orden,
      aux.grupo,
      doc.Tamano,
      doc.signo_resultado,
      doc.Normativa,
      doc.grupo_no_grupo,
      doc.regimen_fiscal,
      doc.fase_supuesto,
      doc.Fase,
      doc.Orden_fase,
      doc.es_vigente,
      doc.cod_modelo,
      CASE WHEN doc.fecha_presentacion IS NULL THEN '01/01/1989' ELSE doc.fecha_presentacion END,
      CASE WHEN doc.fecha_desde IS NULL THEN '01/01/1989' ELSE doc.fecha_desde END,
      CASE WHEN doc.fecha_hasta IS NULL THEN '01/01/1989' ELSE doc.fecha_hasta END,
      doc.fecha_presentacion,
      doc.fecha_desde,
      doc.fecha_hasta
  )
  MERGE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_NIF AS tbn1_fact_detalles_ssrs_ingresar_devolver_NIF
  USING query ON query.NIF_maestro=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.NIF_maestro 
  AND query.Periodo=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Periodo 
--  AND query.Tipo=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Tipo    --Sobraba la # en el procedimiento
  AND query.Agrupacion=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Agrupacion 
  AND query.Tamano=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Tamano 
  AND query.Resultado=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Resultado 
  AND query.Normativa=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Normativa 
  AND query.Grupo_fiscal=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Grupo_fiscal 
  AND query.Regimen_fiscal=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Regimen_fiscal 
  AND query.supuesto=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.supuesto   --Faltaba la # en el procedimiento
  AND query.Fase=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Fase 
  AND query.Vigente=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Vigente 
  AND query.Modelo=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Modelo 
  AND query.Fecha_PK=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Fecha_PK
  AND query.F_desde_PK=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_desde_PK   --Faltaba la # en el procedimiento
  AND query.F_hasta_PK=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_hasta_PK   --Faltaba la # en el procedimiento
  WHEN MATCHED AND (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Paso='1'
                    AND (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Paso<>query.Paso OR (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Paso IS NULL AND query.Paso IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Paso IS NOT NULL AND query.Paso IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Razon_social<>query.Razon_social OR (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Razon_social IS NULL AND query.Razon_social IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Razon_social IS NOT NULL AND query.Razon_social IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Orden<>query.Orden OR (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Orden IS NULL AND query.Orden IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Orden IS NOT NULL AND query.Orden IS NULL)
--                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Supuesto<>query.Supuesto OR (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Supuesto IS NULL AND query.Supuesto IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Supuesto IS NOT NULL AND query.Supuesto IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Orden_fase<>query.Orden_fase OR (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Orden_fase IS NULL AND query.Orden_fase IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Orden_fase IS NOT NULL AND query.Orden_fase IS NULL)
--                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_desde_PK<>query.F_desde_PK OR (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_desde_PK IS NULL AND query.F_desde_PK IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_desde_PK IS NOT NULL AND query.F_desde_PK IS NULL)
--                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_hasta_PK<>query.F_hasta_PK OR (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_hasta_PK IS NULL AND query.F_hasta_PK IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_hasta_PK IS NOT NULL AND query.F_hasta_PK IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Tipo<>query.Tipo OR (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Tipo IS NULL AND query.Tipo IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Tipo IS NOT NULL AND query.Tipo IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_presentacion<>query.F_presentacion OR (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_presentacion IS NULL AND query.F_presentacion IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_presentacion IS NOT NULL AND query.F_presentacion IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_desde<>query.F_desde OR (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_desde IS NULL AND query.F_desde IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_desde IS NOT NULL AND query.F_desde IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_hasta<>query.F_hasta OR (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_hasta IS NULL AND query.F_hasta IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_hasta IS NOT NULL AND query.F_hasta IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Importe<>query.Importe OR (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Importe IS NULL AND query.Importe IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Importe IS NOT NULL AND query.Importe IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Num_contribuyentes<>query.Num_contribuyentes OR (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Num_contribuyentes IS NULL AND query.Num_contribuyentes IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Num_contribuyentes IS NOT NULL AND query.Num_contribuyentes IS NULL))) THEN
    UPDATE SET
      Paso=query.Paso,
      Razon_social=query.Razon_social,
      Orden=query.Orden,
	  Tipo=query.Tipo,
      -- Supuesto=query.Supuesto,
      Orden_fase=query.Orden_fase,
      -- F_desde_PK=query.F_desde_PK,
      -- F_hasta_PK=query.F_hasta_PK,
      F_presentacion=query.F_presentacion,
      F_desde=query.F_desde,
      F_hasta=query.F_hasta,
      Importe=query.Importe,
      Num_contribuyentes=query.Num_contribuyentes
  WHEN NOT MATCHED THEN
    INSERT (Paso,NIF_maestro,Razon_social,Periodo,Tipo,Orden,Agrupacion,Tamano,Resultado,Normativa,Grupo_fiscal,Regimen_fiscal,Supuesto,Fase,Orden_fase,Vigente,Modelo,Fecha_PK,F_desde_PK,F_hasta_PK,F_presentacion,F_desde,F_hasta,Importe,Num_contribuyentes) VALUES (
      query.Paso,
      query.NIF_maestro,
      query.Razon_social,
      query.Periodo,
      query.Tipo,
      query.Orden,
      query.Agrupacion,
      query.Tamano,
      query.Resultado,
      query.Normativa,
      query.Grupo_fiscal,
      query.Regimen_fiscal,
      query.Supuesto,
      query.Fase,
      query.Orden_fase,
      query.Vigente,
      query.Modelo,
      query.Fecha_PK,
      query.F_desde_PK,
      query.F_hasta_PK,
      query.F_presentacion,
      query.F_desde,
      query.F_hasta,
      query.Importe,
      query.Num_contribuyentes)
  WHEN NOT MATCHED BY SOURCE AND (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Paso='1') THEN
    DELETE;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf_v.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_fact_detalles_ssrs_ingresar_devolver_NIF_2' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_fact_detalles_ssrs_ingresar_devolver_NIF_2;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_fact_detalles_ssrs_ingresar_devolver_NIF_2(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf_v.dbo.spn1_cargar_dimensional_fact_detalles_ssrs_ingresar_devolver_NIF_2'
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

  ;WITH
  query AS (
    SELECT
      '2' AS Paso,
      cont.nif_maestro AS NIF_maestro,
      cont.nombre AS Razon_social,
      doc.Periodo AS Periodo,
      aux.Tipo AS Tipo,
      aux.Orden AS Orden,
      aux.grupo AS Agrupacion,
      doc.Tamano AS Tamano,
      doc.signo_resultado AS Resultado,
      doc.Normativa AS Normativa,
      doc.grupo_no_grupo AS Grupo_fiscal,
      doc.regimen_fiscal AS Regimen_fiscal,
      doc.fase_supuesto AS Supuesto,
      doc.Fase AS Fase,
      doc.Orden_fase AS Orden_fase,
      doc.es_vigente AS Vigente,
      doc.cod_modelo AS Modelo,
      CASE WHEN doc.fecha_presentacion IS NULL THEN '01/01/1989' ELSE doc.fecha_presentacion END AS Fecha_PK,
      CASE WHEN doc.fecha_desde IS NULL THEN '01/01/1989' ELSE doc.fecha_desde END AS F_desde_PK,
      CASE WHEN doc.fecha_hasta IS NULL THEN '01/01/1989' ELSE doc.fecha_hasta END AS F_hasta_PK,
      doc.fecha_presentacion AS F_presentacion,
      doc.fecha_desde AS F_desde,
      doc.fecha_hasta AS F_hasta,
      sum(det.valor) AS Importe,
      count(DISTINCT det.id_contribuyente) AS Num_contribuyentes
    FROM dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles det
    INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_dim_nemotecnicos nemo ON (det.id_nemotecnico=nemo.id_nemotecnico)
    INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_aux_ingresar_devolver_kanpaina aux ON (aux.nemo=nemo.nemotecnico)
    INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_dim_documentos doc ON (det.id_documento=doc.id_documento)
    INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_dim_contribuyentes cont ON (doc.id_contribuyente=cont.id_contribuyente)
    WHERE
      doc.cod_modelo IN ('200')
      AND aux.orden IN (2,3)
      AND doc.grupo_no_grupo='No grupo'
    GROUP BY
      cont.nif_maestro,
      cont.nombre,
      doc.Periodo,
      aux.Tipo,
      aux.Orden,
      aux.grupo,
      doc.Tamano,
      doc.signo_resultado,
      doc.Normativa,
      doc.grupo_no_grupo,
      doc.regimen_fiscal,
      doc.fase_supuesto,
      doc.Fase,
      doc.Orden_fase,
      doc.es_vigente,
      doc.cod_modelo,
      CASE WHEN doc.fecha_presentacion IS NULL THEN '01/01/1989' ELSE doc.fecha_presentacion END,
      CASE WHEN doc.fecha_desde IS NULL THEN '01/01/1989' ELSE doc.fecha_desde END,
      CASE WHEN doc.fecha_hasta IS NULL THEN '01/01/1989' ELSE doc.fecha_hasta END,
      doc.fecha_presentacion,
      doc.fecha_desde,
      doc.fecha_hasta
  )
  MERGE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_NIF AS tbn1_fact_detalles_ssrs_ingresar_devolver_NIF
  USING query ON query.NIF_maestro=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.NIF_maestro 
  AND query.Periodo=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Periodo 
--  AND query.Tipo=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Tipo    --Sobraba la # en el procedimiento
  AND query.Agrupacion=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Agrupacion 
  AND query.Tamano=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Tamano 
  AND query.Resultado=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Resultado 
  AND query.Normativa=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Normativa 
  AND query.Grupo_fiscal=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Grupo_fiscal 
  AND query.Regimen_fiscal=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Regimen_fiscal 
  AND query.supuesto=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.supuesto   --Faltaba la # en el procedimiento
  AND query.Fase=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Fase 
  AND query.Vigente=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Vigente 
  AND query.Modelo=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Modelo 
  AND query.Fecha_PK=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Fecha_PK
  AND query.F_desde_PK=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_desde_PK   --Faltaba la # en el procedimiento
  AND query.F_hasta_PK=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_hasta_PK   
  WHEN MATCHED AND (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Paso='2'
                    AND (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Paso<>query.Paso OR (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Paso IS NULL AND query.Paso IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Paso IS NOT NULL AND query.Paso IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Razon_social<>query.Razon_social OR (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Razon_social IS NULL AND query.Razon_social IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Razon_social IS NOT NULL AND query.Razon_social IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Orden<>query.Orden OR (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Orden IS NULL AND query.Orden IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Orden IS NOT NULL AND query.Orden IS NULL)
--                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Supuesto<>query.Supuesto OR (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Supuesto IS NULL AND query.Supuesto IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Supuesto IS NOT NULL AND query.Supuesto IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Orden_fase<>query.Orden_fase OR (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Orden_fase IS NULL AND query.Orden_fase IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Orden_fase IS NOT NULL AND query.Orden_fase IS NULL)
--                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_desde_PK<>query.F_desde_PK OR (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_desde_PK IS NULL AND query.F_desde_PK IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_desde_PK IS NOT NULL AND query.F_desde_PK IS NULL)
--                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_hasta_PK<>query.F_hasta_PK OR (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_hasta_PK IS NULL AND query.F_hasta_PK IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_hasta_PK IS NOT NULL AND query.F_hasta_PK IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Tipo<>query.Tipo OR (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Tipo IS NULL AND query.Tipo IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Tipo IS NOT NULL AND query.Tipo IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_presentacion<>query.F_presentacion OR (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_presentacion IS NULL AND query.F_presentacion IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_presentacion IS NOT NULL AND query.F_presentacion IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_desde<>query.F_desde OR (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_desde IS NULL AND query.F_desde IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_desde IS NOT NULL AND query.F_desde IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_hasta<>query.F_hasta OR (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_hasta IS NULL AND query.F_hasta IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_hasta IS NOT NULL AND query.F_hasta IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Importe<>query.Importe OR (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Importe IS NULL AND query.Importe IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Importe IS NOT NULL AND query.Importe IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Num_contribuyentes<>query.Num_contribuyentes OR (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Num_contribuyentes IS NULL AND query.Num_contribuyentes IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Num_contribuyentes IS NOT NULL AND query.Num_contribuyentes IS NULL))) THEN
    UPDATE SET
      Paso=query.Paso,
      Razon_social=query.Razon_social,
      Orden=query.Orden,
	  Tipo=query.Tipo,
      -- Supuesto=query.Supuesto,
      Orden_fase=query.Orden_fase,
      -- F_desde_PK=query.F_desde_PK,
      -- F_hasta_PK=query.F_hasta_PK,
      F_presentacion=query.F_presentacion,
      F_desde=query.F_desde,
      F_hasta=query.F_hasta,
      Importe=query.Importe,
      Num_contribuyentes=query.Num_contribuyentes  
  WHEN NOT MATCHED THEN
    INSERT (Paso,NIF_maestro,Razon_social,Periodo,Tipo,Orden,Agrupacion,Tamano,Resultado,Normativa,Grupo_fiscal,Regimen_fiscal,Supuesto,Fase,Orden_fase,Vigente,Modelo,Fecha_PK,F_desde_PK,F_hasta_PK,F_presentacion,F_desde,F_hasta,Importe,Num_contribuyentes) VALUES (
      query.Paso,
      query.NIF_maestro,
      query.Razon_social,
      query.Periodo,
      query.Tipo,
      query.Orden,
      query.Agrupacion,
      query.Tamano,
      query.Resultado,
      query.Normativa,
      query.Grupo_fiscal,
      query.Regimen_fiscal,
      query.Supuesto,
      query.Fase,
      query.Orden_fase,
      query.Vigente,
      query.Modelo,
      query.Fecha_PK,
      query.F_desde_PK,
      query.F_hasta_PK,
      query.F_presentacion,
      query.F_desde,
      query.F_hasta,
      query.Importe,
      query.Num_contribuyentes)
  WHEN NOT MATCHED BY SOURCE AND (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Paso='2') THEN
    DELETE;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf_v.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_fact_detalles_ssrs_ingresar_devolver_NIF_3' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_fact_detalles_ssrs_ingresar_devolver_NIF_3;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_fact_detalles_ssrs_ingresar_devolver_NIF_3(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf_v.dbo.spn1_cargar_dimensional_fact_detalles_ssrs_ingresar_devolver_NIF_3'
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

  ;WITH
  query AS (
    SELECT
      '3' AS Paso,
      cont.nif_maestro AS NIF_maestro,
      cont.nombre AS Razon_social,
      doc.Periodo AS Periodo,
      aux.Tipo AS Tipo,
      aux.Orden AS Orden,
      aux.grupo AS Agrupacion,
      doc.Tamano AS Tamano,
      doc.signo_resultado AS Resultado,
      doc.Normativa AS Normativa,
      doc.grupo_no_grupo AS Grupo_fiscal,
      doc.regimen_fiscal AS Regimen_fiscal,
      doc.fase_supuesto AS Supuesto,
      doc.Fase AS Fase,
      doc.Orden_fase AS Orden_fase,
      doc.es_vigente AS Vigente,
      doc.cod_modelo AS Modelo,
      CASE WHEN doc.fecha_presentacion IS NULL THEN '01/01/1989' ELSE doc.fecha_presentacion END AS Fecha_PK,
      CASE WHEN doc.fecha_desde IS NULL THEN '01/01/1989' ELSE doc.fecha_desde END AS F_desde_PK,
      CASE WHEN doc.fecha_hasta IS NULL THEN '01/01/1989' ELSE doc.fecha_hasta END AS F_hasta_PK,
      doc.fecha_presentacion AS F_presentacion,
      doc.fecha_desde AS F_desde,
      doc.fecha_hasta AS F_hasta,
      sum(det.valor) AS Importe,
      count(DISTINCT det.id_contribuyente) AS Num_contribuyentes
    FROM dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles det
    INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_dim_nemotecnicos nemo ON (det.id_nemotecnico=nemo.id_nemotecnico)
    INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_ssrs_aux_ingresar_devolver_kanpaina aux ON (aux.nemo=nemo.nemotecnico)
    INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_dim_documentos doc ON (det.id_documento=doc.id_documento)
    INNER JOIN dbn1_dmr_dhyf_v.dbo.tbn1_dim_contribuyentes cont ON (doc.id_contribuyente=cont.id_contribuyente)
    WHERE
      doc.cod_modelo IN ('220')
      AND aux.orden IN (2,3)
    GROUP BY
      cont.nif_maestro,
      cont.nombre,
      doc.Periodo,
      aux.Tipo,
      aux.Orden,
      aux.grupo,
      doc.Tamano,
      doc.signo_resultado,
      doc.Normativa,
      doc.grupo_no_grupo,
      doc.regimen_fiscal,
      doc.fase_supuesto,
      doc.Fase,
      doc.Orden_fase,
      doc.es_vigente,
      doc.cod_modelo,
      CASE WHEN doc.fecha_presentacion IS NULL THEN '01/01/1989' ELSE doc.fecha_presentacion END,
      CASE WHEN doc.fecha_desde IS NULL THEN '01/01/1989' ELSE doc.fecha_desde END,
      CASE WHEN doc.fecha_hasta IS NULL THEN '01/01/1989' ELSE doc.fecha_hasta END,
      doc.fecha_presentacion,
      doc.fecha_desde,
      doc.fecha_hasta
  )
  MERGE dbn1_dmr_dhyf_v.dbo.tbn1_fact_detalles_ssrs_ingresar_devolver_NIF AS tbn1_fact_detalles_ssrs_ingresar_devolver_NIF
--  USING query ON query.NIF_maestro=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.NIF_maestro AND query.Periodo=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Periodo AND query.Tipo=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Tipo AND query.Agrupacion=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Agrupacion AND query.Tamano=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Tamano AND query.Resultado=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Resultado AND query.Normativa=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Normativa AND query.Grupo_fiscal=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Grupo_fiscal AND query.Regimen_fiscal=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Regimen_fiscal AND query.Fase=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Fase AND query.Vigente=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Vigente AND query.Modelo=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Modelo AND query.Fecha_PK=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Fecha_PK
  USING query ON query.NIF_maestro=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.NIF_maestro 
  AND query.Periodo=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Periodo 
--  AND query.Tipo=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Tipo    --Sobraba la # en el procedimiento
  AND query.Agrupacion=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Agrupacion 
  AND query.Tamano=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Tamano 
  AND query.Resultado=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Resultado 
  AND query.Normativa=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Normativa 
  AND query.Grupo_fiscal=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Grupo_fiscal 
  AND query.Regimen_fiscal=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Regimen_fiscal 
  AND query.supuesto=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.supuesto   --Faltaba la # en el procedimiento
  AND query.Fase=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Fase 
  AND query.Vigente=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Vigente 
  AND query.Modelo=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Modelo 
  AND query.Fecha_PK=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Fecha_PK
  AND query.F_desde_PK=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_desde_PK   --Faltaba la # en el procedimiento
  AND query.F_hasta_PK=tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_hasta_PK    
  WHEN MATCHED AND (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Paso='3'
                    AND (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Paso<>query.Paso OR (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Paso IS NULL AND query.Paso IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Paso IS NOT NULL AND query.Paso IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Razon_social<>query.Razon_social OR (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Razon_social IS NULL AND query.Razon_social IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Razon_social IS NOT NULL AND query.Razon_social IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Orden<>query.Orden OR (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Orden IS NULL AND query.Orden IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Orden IS NOT NULL AND query.Orden IS NULL)
--                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Supuesto<>query.Supuesto OR (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Supuesto IS NULL AND query.Supuesto IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Supuesto IS NOT NULL AND query.Supuesto IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Orden_fase<>query.Orden_fase OR (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Orden_fase IS NULL AND query.Orden_fase IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Orden_fase IS NOT NULL AND query.Orden_fase IS NULL)
--                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_desde_PK<>query.F_desde_PK OR (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_desde_PK IS NULL AND query.F_desde_PK IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_desde_PK IS NOT NULL AND query.F_desde_PK IS NULL)
--                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_hasta_PK<>query.F_hasta_PK OR (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_hasta_PK IS NULL AND query.F_hasta_PK IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_hasta_PK IS NOT NULL AND query.F_hasta_PK IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Tipo<>query.Tipo OR (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Tipo IS NULL AND query.Tipo IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Tipo IS NOT NULL AND query.Tipo IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_presentacion<>query.F_presentacion OR (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_presentacion IS NULL AND query.F_presentacion IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_presentacion IS NOT NULL AND query.F_presentacion IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_desde<>query.F_desde OR (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_desde IS NULL AND query.F_desde IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_desde IS NOT NULL AND query.F_desde IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_hasta<>query.F_hasta OR (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_hasta IS NULL AND query.F_hasta IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.F_hasta IS NOT NULL AND query.F_hasta IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Importe<>query.Importe OR (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Importe IS NULL AND query.Importe IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Importe IS NOT NULL AND query.Importe IS NULL)
                    OR tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Num_contribuyentes<>query.Num_contribuyentes OR (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Num_contribuyentes IS NULL AND query.Num_contribuyentes IS NOT NULL) OR  (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Num_contribuyentes IS NOT NULL AND query.Num_contribuyentes IS NULL))) THEN
    UPDATE SET
      Paso=query.Paso,
      Razon_social=query.Razon_social,
      Orden=query.Orden,
	  Tipo=query.Tipo,
      -- Supuesto=query.Supuesto,
      Orden_fase=query.Orden_fase,
      -- F_desde_PK=query.F_desde_PK,
      -- F_hasta_PK=query.F_hasta_PK,
      F_presentacion=query.F_presentacion,
      F_desde=query.F_desde,
      F_hasta=query.F_hasta,
      Importe=query.Importe,
      Num_contribuyentes=query.Num_contribuyentes    
  WHEN NOT MATCHED THEN
    INSERT (Paso,NIF_maestro,Razon_social,Periodo,Tipo,Orden,Agrupacion,Tamano,Resultado,Normativa,Grupo_fiscal,Regimen_fiscal,Supuesto,Fase,Orden_fase,Vigente,Modelo,Fecha_PK,F_desde_PK,F_hasta_PK,F_presentacion,F_desde,F_hasta,Importe,Num_contribuyentes) VALUES (
      query.Paso,
      query.NIF_maestro,
      query.Razon_social,
      query.Periodo,
      query.Tipo,
      query.Orden,
      query.Agrupacion,
      query.Tamano,
      query.Resultado,
      query.Normativa,
      query.Grupo_fiscal,
      query.Regimen_fiscal,
      query.Supuesto,
      query.Fase,
      query.Orden_fase,
      query.Vigente,
      query.Modelo,
      query.Fecha_PK,
      query.F_desde_PK,
      query.F_hasta_PK,
      query.F_presentacion,
      query.F_desde,
      query.F_hasta,
      query.Importe,
      query.Num_contribuyentes)
  WHEN NOT MATCHED BY SOURCE AND (tbn1_fact_detalles_ssrs_ingresar_devolver_NIF.Paso='3') THEN
    DELETE;

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

