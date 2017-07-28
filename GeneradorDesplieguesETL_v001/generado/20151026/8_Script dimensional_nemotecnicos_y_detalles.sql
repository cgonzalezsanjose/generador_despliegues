PRINT 'dimensional_nemotecnicos_y_detalles.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_nemotecnicos')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos(
  id_nemotecnico int NOT NULL,
  nemotecnico varchar(25),
  nemotecnico_corto varchar(25),
  descripcion varchar(100) NULL,
  descripcion_larga varchar(200),
  bloque varchar(200),
  num_pagina varchar(25) NULL,
  descripcion_pagina varchar(500) NULL,
  tipo varchar(40),
  caracteristica varchar(200),
  descripcion_detallada varchar(500),
  cod_pagina varchar(3) NULL,
  pagina varchar(100) NULL,
  num_casilla_foral_actual varchar(5),
  cod_modelo varchar(3),
  orden int NULL,
  CONSTRAINT PK_tbn1_dim_nemotecnicos PRIMARY KEY CLUSTERED (id_nemotecnico)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_nemotecnicos' AND COLUMN_NAME='id_nemotecnico')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos ADD id_nemotecnico int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_nemotecnicos' AND COLUMN_NAME='nemotecnico')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos ADD nemotecnico varchar(25)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_nemotecnicos' AND COLUMN_NAME='nemotecnico_corto')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos ADD nemotecnico_corto varchar(25)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_nemotecnicos' AND COLUMN_NAME='descripcion')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos ADD descripcion varchar(100)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_nemotecnicos' AND COLUMN_NAME='descripcion_larga')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos ADD descripcion_larga varchar(200)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_nemotecnicos' AND COLUMN_NAME='bloque')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos ADD bloque varchar(200)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_nemotecnicos' AND COLUMN_NAME='num_pagina')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos ADD num_pagina varchar(25)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_nemotecnicos' AND COLUMN_NAME='descripcion_pagina')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos ADD descripcion_pagina varchar(500)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_nemotecnicos' AND COLUMN_NAME='tipo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos ADD tipo varchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_nemotecnicos' AND COLUMN_NAME='caracteristica')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos ADD caracteristica varchar(200)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_nemotecnicos' AND COLUMN_NAME='descripcion_detallada')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos ADD descripcion_detallada varchar(500)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_nemotecnicos' AND COLUMN_NAME='cod_pagina')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos ADD cod_pagina varchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_nemotecnicos' AND COLUMN_NAME='pagina')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos ADD pagina varchar(100)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_nemotecnicos' AND COLUMN_NAME='num_casilla_foral_actual')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos ADD num_casilla_foral_actual varchar(5)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_nemotecnicos' AND COLUMN_NAME='cod_modelo')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos ADD cod_modelo varchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_nemotecnicos' AND COLUMN_NAME='orden')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos ADD orden int

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_nemotecnicos' AND COLUMN_NAME='id_nemotecnico' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos ALTER COLUMN id_nemotecnico int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_nemotecnicos' AND COLUMN_NAME='nemotecnico' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos ALTER COLUMN nemotecnico varchar(25) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_nemotecnicos' AND COLUMN_NAME='nemotecnico_corto' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos ALTER COLUMN nemotecnico_corto varchar(25) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_nemotecnicos' AND COLUMN_NAME='descripcion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos ALTER COLUMN descripcion varchar(100) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_nemotecnicos' AND COLUMN_NAME='descripcion_larga' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos ALTER COLUMN descripcion_larga varchar(200) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_nemotecnicos' AND COLUMN_NAME='bloque' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos ALTER COLUMN bloque varchar(200) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_nemotecnicos' AND COLUMN_NAME='num_pagina' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos ALTER COLUMN num_pagina varchar(25) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_nemotecnicos' AND COLUMN_NAME='descripcion_pagina' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos ALTER COLUMN descripcion_pagina varchar(500) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_nemotecnicos' AND COLUMN_NAME='tipo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos ALTER COLUMN tipo varchar(40) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_nemotecnicos' AND COLUMN_NAME='caracteristica' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos ALTER COLUMN caracteristica varchar(200) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_nemotecnicos' AND COLUMN_NAME='descripcion_detallada' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos ALTER COLUMN descripcion_detallada varchar(500) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_nemotecnicos' AND COLUMN_NAME='cod_pagina' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos ALTER COLUMN cod_pagina varchar(3) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_nemotecnicos' AND COLUMN_NAME='pagina' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos ALTER COLUMN pagina varchar(100) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_nemotecnicos' AND COLUMN_NAME='num_casilla_foral_actual' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos ALTER COLUMN num_casilla_foral_actual varchar(5) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_nemotecnicos' AND COLUMN_NAME='cod_modelo' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos ALTER COLUMN cod_modelo varchar(3) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_nemotecnicos' AND COLUMN_NAME='orden' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos ALTER COLUMN orden int NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_dim_nemotecnicos' AND CONSTRAINT_NAME='PK_tbn1_dim_nemotecnicos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos ADD CONSTRAINT PK_tbn1_dim_nemotecnicos PRIMARY KEY CLUSTERED (id_nemotecnico)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles(
  id_detalle int IDENTITY(1,1),
  id_nemotecnico int NOT NULL,
  id_documento int NOT NULL,
  id_contribuyente int NOT NULL,
  fec_documento date NOT NULL,
  paso_carga tinyint NOT NULL,
  valor numeric(18,4),
  CONSTRAINT uk_fact_detalles UNIQUE (id_nemotecnico,id_documento),
  CONSTRAINT PK_tbn1_fact_detalles PRIMARY KEY CLUSTERED (id_detalle),
  CONSTRAINT FK_tbn1_fact_detalles_tbn1_dim_nemotecnicos FOREIGN KEY (id_nemotecnico) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos(id_nemotecnico),
  CONSTRAINT FK_tbn1_fact_detalles_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento),
  CONSTRAINT FK_tbn1_fact_detalles_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente),
  CONSTRAINT FK_tbn1_fact_detalles_tbn1_dim_fechas FOREIGN KEY (fec_documento) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_fechas(fecha)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles' AND COLUMN_NAME='id_detalle')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles ADD id_detalle int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles' AND COLUMN_NAME='id_nemotecnico')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles ADD id_nemotecnico int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles' AND COLUMN_NAME='fec_documento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles ADD fec_documento date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles' AND COLUMN_NAME='paso_carga')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles ADD paso_carga tinyint

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles' AND COLUMN_NAME='valor')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles ADD valor numeric(18,4)

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles' AND COLUMN_NAME='id_detalle' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles ALTER COLUMN id_detalle int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles' AND COLUMN_NAME='id_nemotecnico' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles ALTER COLUMN id_nemotecnico int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles ALTER COLUMN id_contribuyente int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles' AND COLUMN_NAME='fec_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles ALTER COLUMN fec_documento date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles' AND COLUMN_NAME='paso_carga' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles ALTER COLUMN paso_carga tinyint NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles' AND COLUMN_NAME='valor' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles ALTER COLUMN valor numeric(18,4) NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles' AND CONSTRAINT_NAME='PK_tbn1_fact_detalles')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles ADD CONSTRAINT PK_tbn1_fact_detalles PRIMARY KEY CLUSTERED (id_detalle)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles' AND CONSTRAINT_NAME='FK_tbn1_fact_detalles_tbn1_dim_nemotecnicos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles ADD CONSTRAINT FK_tbn1_fact_detalles_tbn1_dim_nemotecnicos FOREIGN KEY (id_nemotecnico) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos(id_nemotecnico)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles' AND CONSTRAINT_NAME='FK_tbn1_fact_detalles_tbn1_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles ADD CONSTRAINT FK_tbn1_fact_detalles_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles' AND CONSTRAINT_NAME='FK_tbn1_fact_detalles_tbn1_dim_contribuyentes')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles ADD CONSTRAINT FK_tbn1_fact_detalles_tbn1_dim_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_contribuyentes(id_contribuyente)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles' AND CONSTRAINT_NAME='FK_tbn1_fact_detalles_tbn1_dim_fechas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles ADD CONSTRAINT FK_tbn1_fact_detalles_tbn1_dim_fechas FOREIGN KEY (fec_documento) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_fechas(fecha)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_sociedad')
CREATE TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_sociedad(
  id_detalle_sociedad int NOT NULL,
  id_nemotecnico int NOT NULL,
  id_documento int NOT NULL,
  sociedad varchar(11),
  fec_documento date NOT NULL,
  valor numeric(18,2),
  CONSTRAINT PK_tbn1_fact_detalles_sociedad PRIMARY KEY CLUSTERED (id_detalle_sociedad),
  CONSTRAINT FK_tbn1_fact_detalles_sociedad_tbn1_dim_nemotecnicos FOREIGN KEY (id_nemotecnico) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos(id_nemotecnico),
  CONSTRAINT FK_tbn1_fact_detalles_sociedad_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento),
  CONSTRAINT FK_tbn1_fact_detalles_sociedad_tbn1_dim_fechas FOREIGN KEY (fec_documento) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_fechas(fecha)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_sociedad' AND COLUMN_NAME='id_detalle_sociedad')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_sociedad ADD id_detalle_sociedad int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_sociedad' AND COLUMN_NAME='id_nemotecnico')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_sociedad ADD id_nemotecnico int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_sociedad' AND COLUMN_NAME='id_documento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_sociedad ADD id_documento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_sociedad' AND COLUMN_NAME='sociedad')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_sociedad ADD sociedad varchar(11)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_sociedad' AND COLUMN_NAME='fec_documento')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_sociedad ADD fec_documento date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_sociedad' AND COLUMN_NAME='valor')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_sociedad ADD valor numeric(18,2)

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_sociedad' AND COLUMN_NAME='id_detalle_sociedad' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_sociedad ALTER COLUMN id_detalle_sociedad int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_sociedad' AND COLUMN_NAME='id_nemotecnico' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_sociedad ALTER COLUMN id_nemotecnico int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_sociedad' AND COLUMN_NAME='id_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_sociedad ALTER COLUMN id_documento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_sociedad' AND COLUMN_NAME='sociedad' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_sociedad ALTER COLUMN sociedad varchar(11) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_sociedad' AND COLUMN_NAME='fec_documento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_sociedad ALTER COLUMN fec_documento date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_sociedad' AND COLUMN_NAME='valor' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_sociedad ALTER COLUMN valor numeric(18,2) NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_sociedad' AND CONSTRAINT_NAME='PK_tbn1_fact_detalles_sociedad')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_sociedad ADD CONSTRAINT PK_tbn1_fact_detalles_sociedad PRIMARY KEY CLUSTERED (id_detalle_sociedad)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_sociedad' AND CONSTRAINT_NAME='FK_tbn1_fact_detalles_sociedad_tbn1_dim_nemotecnicos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_sociedad ADD CONSTRAINT FK_tbn1_fact_detalles_sociedad_tbn1_dim_nemotecnicos FOREIGN KEY (id_nemotecnico) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos(id_nemotecnico)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_sociedad' AND CONSTRAINT_NAME='FK_tbn1_fact_detalles_sociedad_tbn1_dim_documentos')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_sociedad ADD CONSTRAINT FK_tbn1_fact_detalles_sociedad_tbn1_dim_documentos FOREIGN KEY (id_documento) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_documentos(id_documento)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_dmr_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_fact_detalles_sociedad' AND CONSTRAINT_NAME='FK_tbn1_fact_detalles_sociedad_tbn1_dim_fechas')
ALTER TABLE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_sociedad ADD CONSTRAINT FK_tbn1_fact_detalles_sociedad_tbn1_dim_fechas FOREIGN KEY (fec_documento) REFERENCES dbn1_dmr_dhyf.dbo.tbn1_dim_fechas(fecha)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_dim_nemotecnicos' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_dim_nemotecnicos;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_dim_nemotecnicos(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_dim_nemotecnicos'
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
      id_nemotecnico,
      nemotecnico,
      nemotecnico_corto,
      descripcion,
      descripcion_larga,
      bloque,
      num_pagina,
      descripcion_pagina,
      tipo,
      caracteristica,
      descripcion_detallada,
      cod_pagina,
      pagina,
      num_casilla_foral_actual,
      cod_modelo,
      orden
    FROM dbn1_norm_dhyf.dbo.tbn1_nemotecnicos
    WHERE fec_baja IS NULL
  )
  MERGE dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos AS tbn1_dim_nemotecnicos
  USING query ON query.id_nemotecnico=tbn1_dim_nemotecnicos.id_nemotecnico
  WHEN MATCHED AND ((tbn1_dim_nemotecnicos.nemotecnico<>query.nemotecnico OR (tbn1_dim_nemotecnicos.nemotecnico IS NULL AND query.nemotecnico IS NOT NULL) OR  (tbn1_dim_nemotecnicos.nemotecnico IS NOT NULL AND query.nemotecnico IS NULL)
                    OR tbn1_dim_nemotecnicos.nemotecnico_corto<>query.nemotecnico_corto OR (tbn1_dim_nemotecnicos.nemotecnico_corto IS NULL AND query.nemotecnico_corto IS NOT NULL) OR  (tbn1_dim_nemotecnicos.nemotecnico_corto IS NOT NULL AND query.nemotecnico_corto IS NULL)
                    OR tbn1_dim_nemotecnicos.descripcion<>query.descripcion OR (tbn1_dim_nemotecnicos.descripcion IS NULL AND query.descripcion IS NOT NULL) OR  (tbn1_dim_nemotecnicos.descripcion IS NOT NULL AND query.descripcion IS NULL)
                    OR tbn1_dim_nemotecnicos.descripcion_larga<>query.descripcion_larga OR (tbn1_dim_nemotecnicos.descripcion_larga IS NULL AND query.descripcion_larga IS NOT NULL) OR  (tbn1_dim_nemotecnicos.descripcion_larga IS NOT NULL AND query.descripcion_larga IS NULL)
                    OR tbn1_dim_nemotecnicos.bloque<>query.bloque OR (tbn1_dim_nemotecnicos.bloque IS NULL AND query.bloque IS NOT NULL) OR  (tbn1_dim_nemotecnicos.bloque IS NOT NULL AND query.bloque IS NULL)
                    OR tbn1_dim_nemotecnicos.num_pagina<>query.num_pagina OR (tbn1_dim_nemotecnicos.num_pagina IS NULL AND query.num_pagina IS NOT NULL) OR  (tbn1_dim_nemotecnicos.num_pagina IS NOT NULL AND query.num_pagina IS NULL)
                    OR tbn1_dim_nemotecnicos.descripcion_pagina<>query.descripcion_pagina OR (tbn1_dim_nemotecnicos.descripcion_pagina IS NULL AND query.descripcion_pagina IS NOT NULL) OR  (tbn1_dim_nemotecnicos.descripcion_pagina IS NOT NULL AND query.descripcion_pagina IS NULL)
                    OR tbn1_dim_nemotecnicos.tipo<>query.tipo OR (tbn1_dim_nemotecnicos.tipo IS NULL AND query.tipo IS NOT NULL) OR  (tbn1_dim_nemotecnicos.tipo IS NOT NULL AND query.tipo IS NULL)
                    OR tbn1_dim_nemotecnicos.caracteristica<>query.caracteristica OR (tbn1_dim_nemotecnicos.caracteristica IS NULL AND query.caracteristica IS NOT NULL) OR  (tbn1_dim_nemotecnicos.caracteristica IS NOT NULL AND query.caracteristica IS NULL)
                    OR tbn1_dim_nemotecnicos.descripcion_detallada<>query.descripcion_detallada OR (tbn1_dim_nemotecnicos.descripcion_detallada IS NULL AND query.descripcion_detallada IS NOT NULL) OR  (tbn1_dim_nemotecnicos.descripcion_detallada IS NOT NULL AND query.descripcion_detallada IS NULL)
                    OR tbn1_dim_nemotecnicos.cod_pagina<>query.cod_pagina OR (tbn1_dim_nemotecnicos.cod_pagina IS NULL AND query.cod_pagina IS NOT NULL) OR  (tbn1_dim_nemotecnicos.cod_pagina IS NOT NULL AND query.cod_pagina IS NULL)
                    OR tbn1_dim_nemotecnicos.pagina<>query.pagina OR (tbn1_dim_nemotecnicos.pagina IS NULL AND query.pagina IS NOT NULL) OR  (tbn1_dim_nemotecnicos.pagina IS NOT NULL AND query.pagina IS NULL)
                    OR tbn1_dim_nemotecnicos.num_casilla_foral_actual<>query.num_casilla_foral_actual OR (tbn1_dim_nemotecnicos.num_casilla_foral_actual IS NULL AND query.num_casilla_foral_actual IS NOT NULL) OR  (tbn1_dim_nemotecnicos.num_casilla_foral_actual IS NOT NULL AND query.num_casilla_foral_actual IS NULL)
                    OR tbn1_dim_nemotecnicos.cod_modelo<>query.cod_modelo OR (tbn1_dim_nemotecnicos.cod_modelo IS NULL AND query.cod_modelo IS NOT NULL) OR  (tbn1_dim_nemotecnicos.cod_modelo IS NOT NULL AND query.cod_modelo IS NULL)
                    OR tbn1_dim_nemotecnicos.orden<>query.orden OR (tbn1_dim_nemotecnicos.orden IS NULL AND query.orden IS NOT NULL) OR  (tbn1_dim_nemotecnicos.orden IS NOT NULL AND query.orden IS NULL))) THEN
    UPDATE SET
      nemotecnico=query.nemotecnico,
      nemotecnico_corto=query.nemotecnico_corto,
      descripcion=query.descripcion,
      descripcion_larga=query.descripcion_larga,
      bloque=query.bloque,
      num_pagina=query.num_pagina,
      descripcion_pagina=query.descripcion_pagina,
      tipo=query.tipo,
      caracteristica=query.caracteristica,
      descripcion_detallada=query.descripcion_detallada,
      cod_pagina=query.cod_pagina,
      pagina=query.pagina,
      num_casilla_foral_actual=query.num_casilla_foral_actual,
      cod_modelo=query.cod_modelo,
      orden=query.orden
  WHEN NOT MATCHED THEN
    INSERT (id_nemotecnico,nemotecnico,nemotecnico_corto,descripcion,descripcion_larga,bloque,num_pagina,descripcion_pagina,tipo,caracteristica,descripcion_detallada,cod_pagina,pagina,num_casilla_foral_actual,cod_modelo,orden) VALUES (
      query.id_nemotecnico,
      query.nemotecnico,
      query.nemotecnico_corto,
      query.descripcion,
      query.descripcion_larga,
      query.bloque,
      query.num_pagina,
      query.descripcion_pagina,
      query.tipo,
      query.caracteristica,
      query.descripcion_detallada,
      query.cod_pagina,
      query.pagina,
      query.num_casilla_foral_actual,
      query.cod_modelo,
      query.orden)
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_fact_detalles_paso1' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_fact_detalles_paso1;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_fact_detalles_paso1(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_fact_detalles_paso1'
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
      doc.fec_documento AS fec_documento,
      doc.id_contribuyente AS id_contribuyente,
      det.id_nemotecnico AS id_nemotecnico,
      det.id_documento AS id_documento,
      det.valor AS valor,
      1 AS paso_carga
    FROM dbn1_norm_dhyf.dbo.tbn1_detalles det
    INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_documentos doc ON (doc.id_documento=det.id_documento)
    INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos p ON (det.id_nemotecnico=p.id_nemotecnico)
    INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_fechas f ON (f.fecha=doc.fec_documento)
    WHERE
      doc.fase<>'Indefinido'
      AND doc.cod_modelo IN ('200','20X','220','390','303','330','331','320','300','322','353','310','391','308','309','341')
      AND det.fec_baja IS NULL
  )
  MERGE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles AS tbn1_fact_detalles
  USING query ON query.id_nemotecnico=tbn1_fact_detalles.id_nemotecnico AND query.id_documento=tbn1_fact_detalles.id_documento
  WHEN MATCHED AND (tbn1_fact_detalles.paso_carga=1
                    AND (tbn1_fact_detalles.fec_documento<>query.fec_documento OR (tbn1_fact_detalles.fec_documento IS NULL AND query.fec_documento IS NOT NULL) OR  (tbn1_fact_detalles.fec_documento IS NOT NULL AND query.fec_documento IS NULL)
                    OR tbn1_fact_detalles.id_contribuyente<>query.id_contribuyente OR (tbn1_fact_detalles.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_fact_detalles.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_fact_detalles.valor<>query.valor OR (tbn1_fact_detalles.valor IS NULL AND query.valor IS NOT NULL) OR  (tbn1_fact_detalles.valor IS NOT NULL AND query.valor IS NULL)
                    OR tbn1_fact_detalles.paso_carga<>query.paso_carga OR (tbn1_fact_detalles.paso_carga IS NULL AND query.paso_carga IS NOT NULL) OR  (tbn1_fact_detalles.paso_carga IS NOT NULL AND query.paso_carga IS NULL))) THEN
    UPDATE SET
      fec_documento=query.fec_documento,
      id_contribuyente=query.id_contribuyente,
      valor=query.valor,
      paso_carga=query.paso_carga
  WHEN NOT MATCHED THEN
    INSERT (fec_documento,id_contribuyente,id_nemotecnico,id_documento,valor,paso_carga) VALUES (
      query.fec_documento,
      query.id_contribuyente,
      query.id_nemotecnico,
      query.id_documento,
      query.valor,
      query.paso_carga)
  WHEN NOT MATCHED BY SOURCE AND (tbn1_fact_detalles.paso_carga=1) THEN
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_fact_detalles_paso2' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_fact_detalles_paso2;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_fact_detalles_paso2(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_fact_detalles_paso2'
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
      det.fec_documento AS fec_documento,
      det.id_contribuyente AS id_contribuyente,
      det.id_nemotecnico AS id_nemotecnico,
      doc2.id_documento AS id_documento,
      det.valor AS valor,
      2 AS paso_carga
    FROM dbn1_dmr_dhyf.dbo.tbn1_fact_detalles det
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_nemotecnicos nemo ON (nemo.id_nemotecnico=det.id_nemotecnico)
    INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_documentos doc ON (doc.id_documento=det.id_documento)
    INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_documentos doc2 ON (doc.id_expediente=doc2.id_expediente)
    INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_fechas f ON (f.fecha=doc.fec_documento)
    WHERE
      doc.cod_fase_liquidacion='AUTO'
      AND doc2.cod_fase_liquidacion<>'AUTO'
      AND ((doc.cod_modelo IN ('200') AND nemo.cod_pagina NOT IN ('130','150','160','9CC')) OR (doc.cod_modelo IN ('220') AND nemo.cod_pagina NOT IN ('120','150','160','9CC')))
  )
  MERGE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles AS tbn1_fact_detalles
  USING query ON query.id_nemotecnico=tbn1_fact_detalles.id_nemotecnico AND query.id_documento=tbn1_fact_detalles.id_documento
  WHEN MATCHED AND (tbn1_fact_detalles.paso_carga=2
                    AND (tbn1_fact_detalles.fec_documento<>query.fec_documento OR (tbn1_fact_detalles.fec_documento IS NULL AND query.fec_documento IS NOT NULL) OR  (tbn1_fact_detalles.fec_documento IS NOT NULL AND query.fec_documento IS NULL)
                    OR tbn1_fact_detalles.id_contribuyente<>query.id_contribuyente OR (tbn1_fact_detalles.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_fact_detalles.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_fact_detalles.valor<>query.valor OR (tbn1_fact_detalles.valor IS NULL AND query.valor IS NOT NULL) OR  (tbn1_fact_detalles.valor IS NOT NULL AND query.valor IS NULL)
                    OR tbn1_fact_detalles.paso_carga<>query.paso_carga OR (tbn1_fact_detalles.paso_carga IS NULL AND query.paso_carga IS NOT NULL) OR  (tbn1_fact_detalles.paso_carga IS NOT NULL AND query.paso_carga IS NULL))) THEN
    UPDATE SET
      fec_documento=query.fec_documento,
      id_contribuyente=query.id_contribuyente,
      valor=query.valor,
      paso_carga=query.paso_carga
  WHEN NOT MATCHED THEN
    INSERT (fec_documento,id_contribuyente,id_nemotecnico,id_documento,valor,paso_carga) VALUES (
      query.fec_documento,
      query.id_contribuyente,
      query.id_nemotecnico,
      query.id_documento,
      query.valor,
      query.paso_carga)
  WHEN NOT MATCHED BY SOURCE AND (tbn1_fact_detalles.paso_carga=2) THEN
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_fact_detalles' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_fact_detalles;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_fact_detalles(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_fact_detalles'
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

  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_fact_detalles_paso1 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_fact_detalles_paso2 @log;

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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_dimensional_fact_detalles_sociedad' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_dimensional_fact_detalles_sociedad;
GO

CREATE PROCEDURE dbo.spn1_cargar_dimensional_fact_detalles_sociedad(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_dimensional_fact_detalles_sociedad'
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
      id_detalle_sociedad,
      doc.fec_documento AS fec_documento,
      det.id_nemotecnico AS id_nemotecnico,
      det.id_documento AS id_documento,
      det.sociedad AS sociedad,
      det.valor AS valor
    FROM dbn1_norm_dhyf.dbo.tbn1_det_220_detalles_por_sociedad det
    INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_documentos doc ON (doc.id_documento=det.id_documento)
    INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_nemotecnicos p ON (det.id_nemotecnico=p.id_nemotecnico)
    WHERE
      doc.fase<>'Indefinido'
      AND doc.cod_modelo='220'
  )
  MERGE dbn1_dmr_dhyf.dbo.tbn1_fact_detalles_sociedad AS tbn1_fact_detalles_sociedad
  USING query ON query.id_detalle_sociedad=tbn1_fact_detalles_sociedad.id_detalle_sociedad
  WHEN MATCHED AND ((tbn1_fact_detalles_sociedad.fec_documento<>query.fec_documento OR (tbn1_fact_detalles_sociedad.fec_documento IS NULL AND query.fec_documento IS NOT NULL) OR  (tbn1_fact_detalles_sociedad.fec_documento IS NOT NULL AND query.fec_documento IS NULL)
                    OR tbn1_fact_detalles_sociedad.id_nemotecnico<>query.id_nemotecnico OR (tbn1_fact_detalles_sociedad.id_nemotecnico IS NULL AND query.id_nemotecnico IS NOT NULL) OR  (tbn1_fact_detalles_sociedad.id_nemotecnico IS NOT NULL AND query.id_nemotecnico IS NULL)
                    OR tbn1_fact_detalles_sociedad.id_documento<>query.id_documento OR (tbn1_fact_detalles_sociedad.id_documento IS NULL AND query.id_documento IS NOT NULL) OR  (tbn1_fact_detalles_sociedad.id_documento IS NOT NULL AND query.id_documento IS NULL)
                    OR tbn1_fact_detalles_sociedad.sociedad<>query.sociedad OR (tbn1_fact_detalles_sociedad.sociedad IS NULL AND query.sociedad IS NOT NULL) OR  (tbn1_fact_detalles_sociedad.sociedad IS NOT NULL AND query.sociedad IS NULL)
                    OR tbn1_fact_detalles_sociedad.valor<>query.valor OR (tbn1_fact_detalles_sociedad.valor IS NULL AND query.valor IS NOT NULL) OR  (tbn1_fact_detalles_sociedad.valor IS NOT NULL AND query.valor IS NULL))) THEN
    UPDATE SET
      fec_documento=query.fec_documento,
      id_nemotecnico=query.id_nemotecnico,
      id_documento=query.id_documento,
      sociedad=query.sociedad,
      valor=query.valor
  WHEN NOT MATCHED THEN
    INSERT (id_detalle_sociedad,fec_documento,id_nemotecnico,id_documento,sociedad,valor) VALUES (
      query.id_detalle_sociedad,
      query.fec_documento,
      query.id_nemotecnico,
      query.id_documento,
      query.sociedad,
      query.valor)
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

