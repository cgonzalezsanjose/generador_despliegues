PRINT 'normalizado_ku_ds_objetos.sql'
GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular')
CREATE TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular(
  id_objeto_titular int IDENTITY(1,1),
  origen varchar(1) NOT NULL,
  numero_fijo varchar(7) NOT NULL,
  letra_fija varchar(1) NOT NULL,
  indicador_desagregacion varchar(2) NOT NULL,
  escalera_planta_mano_puerta varchar(8) NOT NULL,
  id_uso_objeto int NOT NULL,
  id_clase_objeto int NOT NULL,
  id_modalidad_catastro_objeto int NOT NULL,
  orden decimal(3,0) NOT NULL,
  num_cargo_parcela decimal(4,0) NOT NULL,
  posicion_objeto int NOT NULL,
  actividad_dedicada varchar(2) NOT NULL,
  coeficiente_participacion_comunes decimal(9,6) NOT NULL,
  valor_catastral_objeto decimal(12,2) NOT NULL,
  valor_suelo_objeto decimal(12,2) NOT NULL,
  valor_construido_objeto decimal(12,2) NOT NULL,
  superficie_planta decimal(5) NOT NULL,
  superficie_objeto decimal(11,6) NOT NULL,
  id_edificio int NOT NULL,
  cod_municipio varchar(3) NOT NULL,
  cod_calle varchar(5) NOT NULL,
  num_portal varchar(9) NOT NULL,
  id_calle int NOT NULL,
  id_portal int NOT NULL,
  id_uso_edificio int NOT NULL,
  id_clase_edificio int NOT NULL,
  id_modalidad_catastro_edificio int NOT NULL,
  tipo_registro_edificio varchar(3) NOT NULL,
  num_edificio decimal(3,0) NOT NULL,
  posicion_edificio int NOT NULL,
  superficie_sobre_rasante decimal(6,0) NOT NULL,
  superficie_descubierta_urbanizada decimal(6,0) NOT NULL,
  anyo_construccion varchar(4) NOT NULL,
  grado_conservacion varchar(1) NOT NULL,
  es_caserio_rural bit NOT NULL,
  participacion varchar(1) NOT NULL,
  fecha_baja_edificio date NOT NULL,
  fecha_valoracion_edificio date NOT NULL,
  valor_catastral_edificio decimal(12,2) NOT NULL,
  anyo_rehabilitacion varchar(4) NOT NULL,
  num_vvdas_coeficiente_ascensor varchar(2) NULL,
  id_concepto_edificio_ascensor int NOT NULL,
  id_concepto_edificio_calefaccion int NOT NULL,
  id_concepto_edificio_banos int NOT NULL,
  id_concepto_edificio_amplitud int NOT NULL,
  id_concepto_edificio_portero int NOT NULL,
  id_concepto_edificio_cerramiento_viv int NOT NULL,
  id_concepto_edificio_cerramiento_ind int NOT NULL,
  id_concepto_edificio_suelo int NOT NULL,
  id_concepto_edificio_carpinteria int NOT NULL,
  id_concepto_edificio_protegido int NOT NULL,
  id_concepto_edificio_instalaciones int NOT NULL,
  id_concepto_edificio_singular int NOT NULL,
  id_concepto_edificio_turismo int NOT NULL,
  id_concepto_edificio_cerramiento int NOT NULL,
  id_concepto_edificio_historico int NOT NULL,
  id_concepto_edificio_aireacond int NOT NULL,
  id_concepto_edificio_estrellas int NOT NULL,
  id_concepto_edificio_edificacion int NOT NULL,
  id_concepto_edificio_estructura int NOT NULL,
  id_concepto_edificio_luznave int NOT NULL,
  id_concepto_edificio_solera int NOT NULL,
  id_concepto_edificio_forjado int NOT NULL,
  id_concepto_edificio_altura int NOT NULL,
  id_concepto_edificio_elevador int NOT NULL,
  id_concepto_edificio_grua int NOT NULL,
  tiene_cubierta varchar(1) NOT NULL,
  tipo_rehabilitacion varchar(1) NOT NULL,
  valor_suelo_edificio decimal(12,2) NOT NULL,
  valor_construccion_edificio decimal(12,2) NOT NULL,
  categoria_construccion decimal(2,0) NOT NULL,
  fecha_categoria_construccion date NOT NULL,
  modalidad_edificio varchar(1) NOT NULL,
  rustica_grado_reforma varchar(1) NOT NULL,
  [rustica_año_calculo] decimal(4,0) NOT NULL,
  rustica_num_instalaciones varchar(1) NOT NULL,
  rustica_num_cerramientos varchar(1) NOT NULL,
  anyo_reforma decimal(4,0) NOT NULL,
  id_parcela int NOT NULL,
  cod_poligono varchar(3) NOT NULL,
  cod_manzana varchar(2) NOT NULL,
  cod_parcela varchar(3) NOT NULL,
  id_municipio int NOT NULL,
  coordenada_x decimal(4,0) NOT NULL,
  coordenada_y decimal(4,0) NOT NULL,
  numero_plano varchar(7) NOT NULL,
  posicion_parcela int NOT NULL,
  superficie_total decimal(6,0) NOT NULL,
  num_fachadas varchar(1) NOT NULL,
  servicio_urbanistico_agua bit NOT NULL,
  servicio_urbanistico_luz bit NOT NULL,
  servicio_alcantarillado bit NOT NULL,
  servicio_pavimento_calzada bit NOT NULL,
  servicio_encintado_acero bit NOT NULL,
  es_subedificada varchar(2) NOT NULL,
  edificabilidad decimal(5,3) NOT NULL,
  fecha_valoracion_parcela date NOT NULL,
  valor_catastral_parcela decimal(12,2) NOT NULL,
  valor_construccion_parcela decimal(12,2) NOT NULL,
  valor_suelo_parcela decimal(12,2) NOT NULL,
  secuencia_propietario decimal(2,0) NOT NULL,
  fecha_baja_titular date NOT NULL,
  nif varchar(9) NOT NULL,
  id_contribuyente int NOT NULL,
  discriminante_nif varchar(2) NOT NULL,
  tipo_titularidad_bien varchar(1) NOT NULL,
  nombre_apellidos varchar(40) NOT NULL,
  tipo_persona_fisica_juridica varchar(1) NOT NULL,
  tipo_propietario varchar(1) NOT NULL,
  es_identificado varchar(1) NOT NULL,
  fecha_identificacion date NOT NULL,
  coeficiente_participacion_titularidad decimal(5,2) NOT NULL,
  fecha_alta_titular date NOT NULL,
  programa_alta_titular varchar(8) NOT NULL,
  numero_transmision_dominio_titular decimal(2,0) NOT NULL,
  fecha_transmision_dominio date NOT NULL,
  num_relacion varchar(9) NOT NULL,
  id_calle_principal int NOT NULL,
  longitud_fachada_principal decimal(8,2) NOT NULL,
  id_calle_secundaria_1 int NOT NULL,
  longitud_calle_secundaria_1 decimal(8,2) NOT NULL,
  id_calle_secundaria_2 int NOT NULL,
  longitud_calle_secundaria_2 decimal(8,2) NOT NULL,
  longitud_galeria_comercial decimal(8,2) NOT NULL,
  id_calle_zaguera int NOT NULL,
  longitud_zaguera decimal(8,2) NOT NULL,
  tiene_acceso_por_portal bit NOT NULL,
  es_local_interior bit NOT NULL,
  altura_libre_local varchar(1) NOT NULL,
  altura_local_respecto_rasante varchar(1) NOT NULL,
  num_real_parcelas decimal(6,0) NOT NULL,
  fec_alta datetime,
  fec_modificacion datetime,
  fec_baja datetime,
  CONSTRAINT uk_ku_objetos1 UNIQUE (origen,numero_fijo,letra_fija,indicador_desagregacion,secuencia_propietario),
  CONSTRAINT PK_tbn1_ku_ds_objetos_titular PRIMARY KEY CLUSTERED (id_objeto_titular),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_usos FOREIGN KEY (id_uso_objeto) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_usos(id_uso),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_clases FOREIGN KEY (id_clase_objeto) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_clases(id_clase),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_modalidades FOREIGN KEY (id_modalidad_catastro_objeto) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_modalidades(id_modalidad_catastro),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_edificios FOREIGN KEY (id_edificio) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_edificios(id_edificio),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_calles FOREIGN KEY (id_calle) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_calles(id_calle),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_portales FOREIGN KEY (id_portal) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_portales(id_portal),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_usos1 FOREIGN KEY (id_uso_edificio) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_usos(id_uso),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_clases1 FOREIGN KEY (id_clase_edificio) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_clases(id_clase),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_modalidades1 FOREIGN KEY (id_modalidad_catastro_edificio) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_modalidades(id_modalidad_catastro),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios FOREIGN KEY (id_concepto_edificio_ascensor) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios1 FOREIGN KEY (id_concepto_edificio_calefaccion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios2 FOREIGN KEY (id_concepto_edificio_banos) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios3 FOREIGN KEY (id_concepto_edificio_amplitud) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios4 FOREIGN KEY (id_concepto_edificio_portero) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios5 FOREIGN KEY (id_concepto_edificio_cerramiento_viv) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios6 FOREIGN KEY (id_concepto_edificio_cerramiento_ind) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios7 FOREIGN KEY (id_concepto_edificio_suelo) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios8 FOREIGN KEY (id_concepto_edificio_carpinteria) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios9 FOREIGN KEY (id_concepto_edificio_protegido) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios10 FOREIGN KEY (id_concepto_edificio_instalaciones) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios11 FOREIGN KEY (id_concepto_edificio_singular) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios12 FOREIGN KEY (id_concepto_edificio_turismo) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios13 FOREIGN KEY (id_concepto_edificio_cerramiento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios14 FOREIGN KEY (id_concepto_edificio_historico) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios15 FOREIGN KEY (id_concepto_edificio_aireacond) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios16 FOREIGN KEY (id_concepto_edificio_estrellas) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios17 FOREIGN KEY (id_concepto_edificio_edificacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios18 FOREIGN KEY (id_concepto_edificio_estructura) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios19 FOREIGN KEY (id_concepto_edificio_luznave) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios20 FOREIGN KEY (id_concepto_edificio_solera) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios21 FOREIGN KEY (id_concepto_edificio_forjado) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios22 FOREIGN KEY (id_concepto_edificio_altura) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios23 FOREIGN KEY (id_concepto_edificio_elevador) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios24 FOREIGN KEY (id_concepto_edificio_grua) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_parcelas FOREIGN KEY (id_parcela) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_parcelas(id_parcela),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_municipios FOREIGN KEY (id_municipio) REFERENCES dbn1_norm_dhyf.dbo.tbn1_municipios(id_municipio),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_calles1 FOREIGN KEY (id_calle_principal) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_calles(id_calle),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_calles2 FOREIGN KEY (id_calle_secundaria_1) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_calles(id_calle),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_calles3 FOREIGN KEY (id_calle_secundaria_2) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_calles(id_calle),
  CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_calles4 FOREIGN KEY (id_calle_zaguera) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_calles(id_calle)
)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_objeto_titular')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_objeto_titular int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='origen')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD origen varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='numero_fijo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD numero_fijo varchar(7)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='letra_fija')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD letra_fija varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='indicador_desagregacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD indicador_desagregacion varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='escalera_planta_mano_puerta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD escalera_planta_mano_puerta varchar(8)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_uso_objeto')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_uso_objeto int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_clase_objeto')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_clase_objeto int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_modalidad_catastro_objeto')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_modalidad_catastro_objeto int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='orden')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD orden decimal(3,0)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='num_cargo_parcela')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD num_cargo_parcela decimal(4,0)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='posicion_objeto')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD posicion_objeto int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='actividad_dedicada')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD actividad_dedicada varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='coeficiente_participacion_comunes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD coeficiente_participacion_comunes decimal(9,6)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='valor_catastral_objeto')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD valor_catastral_objeto decimal(12,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='valor_suelo_objeto')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD valor_suelo_objeto decimal(12,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='valor_construido_objeto')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD valor_construido_objeto decimal(12,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_edificio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_edificio int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='cod_municipio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD cod_municipio varchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='cod_calle')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD cod_calle varchar(5)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='num_portal')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD num_portal varchar(9)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_calle')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_calle int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_portal')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_portal int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_uso_edificio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_uso_edificio int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_clase_edificio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_clase_edificio int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_modalidad_catastro_edificio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_modalidad_catastro_edificio int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='tipo_registro_edificio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD tipo_registro_edificio varchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='num_edificio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD num_edificio decimal(3,0)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='posicion_edificio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD posicion_edificio int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='superficie_sobre_rasante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD superficie_sobre_rasante decimal(6,0)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='superficie_descubierta_urbanizada')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD superficie_descubierta_urbanizada decimal(6,0)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='anyo_construccion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD anyo_construccion varchar(4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='grado_conservacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD grado_conservacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='es_caserio_rural')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD es_caserio_rural bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='participacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD participacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='fecha_baja_edificio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD fecha_baja_edificio date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='fecha_valoracion_edificio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD fecha_valoracion_edificio date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='valor_catastral_edificio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD valor_catastral_edificio decimal(12,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='anyo_rehabilitacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD anyo_rehabilitacion varchar(4)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='num_vvdas_coeficiente_ascensor')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD num_vvdas_coeficiente_ascensor varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_ascensor')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_concepto_edificio_ascensor int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_calefaccion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_concepto_edificio_calefaccion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_banos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_concepto_edificio_banos int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_amplitud')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_concepto_edificio_amplitud int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_portero')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_concepto_edificio_portero int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_cerramiento_viv')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_concepto_edificio_cerramiento_viv int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_cerramiento_ind')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_concepto_edificio_cerramiento_ind int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_suelo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_concepto_edificio_suelo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_carpinteria')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_concepto_edificio_carpinteria int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_protegido')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_concepto_edificio_protegido int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_instalaciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_concepto_edificio_instalaciones int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_singular')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_concepto_edificio_singular int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_turismo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_concepto_edificio_turismo int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_cerramiento')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_concepto_edificio_cerramiento int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_historico')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_concepto_edificio_historico int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_aireacond')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_concepto_edificio_aireacond int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_estrellas')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_concepto_edificio_estrellas int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_edificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_concepto_edificio_edificacion int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_estructura')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_concepto_edificio_estructura int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_luznave')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_concepto_edificio_luznave int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_solera')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_concepto_edificio_solera int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_forjado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_concepto_edificio_forjado int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_altura')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_concepto_edificio_altura int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_elevador')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_concepto_edificio_elevador int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_grua')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_concepto_edificio_grua int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='tiene_cubierta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD tiene_cubierta varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='tipo_rehabilitacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD tipo_rehabilitacion varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='valor_suelo_edificio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD valor_suelo_edificio decimal(12,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='valor_construccion_edificio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD valor_construccion_edificio decimal(12,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='categoria_construccion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD categoria_construccion decimal(2,0)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='fecha_categoria_construccion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD fecha_categoria_construccion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='modalidad_edificio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD modalidad_edificio varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='rustica_grado_reforma')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD rustica_grado_reforma varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='rustica_año_calculo')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD [rustica_año_calculo] decimal(4,0)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='rustica_num_instalaciones')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD rustica_num_instalaciones varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='rustica_num_cerramientos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD rustica_num_cerramientos varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='anyo_reforma')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD anyo_reforma decimal(4,0)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_parcela')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_parcela int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='cod_poligono')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD cod_poligono varchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='cod_manzana')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD cod_manzana varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='cod_parcela')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD cod_parcela varchar(3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_municipio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_municipio int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='coordenada_x')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD coordenada_x decimal(4,0)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='coordenada_y')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD coordenada_y decimal(4,0)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='numero_plano')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD numero_plano varchar(7)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='posicion_parcela')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD posicion_parcela int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='superficie_total')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD superficie_total decimal(6,0)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='num_fachadas')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD num_fachadas varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='servicio_urbanistico_agua')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD servicio_urbanistico_agua bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='servicio_urbanistico_luz')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD servicio_urbanistico_luz bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='servicio_alcantarillado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD servicio_alcantarillado bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='servicio_pavimento_calzada')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD servicio_pavimento_calzada bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='servicio_encintado_acero')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD servicio_encintado_acero bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='es_subedificada')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD es_subedificada varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='edificabilidad')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD edificabilidad decimal(5,3)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='fecha_valoracion_parcela')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD fecha_valoracion_parcela date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='valor_catastral_parcela')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD valor_catastral_parcela decimal(12,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='valor_construccion_parcela')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD valor_construccion_parcela decimal(12,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='valor_suelo_parcela')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD valor_suelo_parcela decimal(12,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='secuencia_propietario')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD secuencia_propietario decimal(2,0)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='fecha_baja_titular')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD fecha_baja_titular date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='nif')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD nif varchar(9)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_contribuyente')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_contribuyente int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='discriminante_nif')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD discriminante_nif varchar(2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='tipo_titularidad_bien')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD tipo_titularidad_bien varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='nombre_apellidos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD nombre_apellidos varchar(40)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='tipo_persona_fisica_juridica')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD tipo_persona_fisica_juridica varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='tipo_propietario')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD tipo_propietario varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='es_identificado')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD es_identificado varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='fecha_identificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD fecha_identificacion date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='coeficiente_participacion_titularidad')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD coeficiente_participacion_titularidad decimal(5,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='fecha_alta_titular')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD fecha_alta_titular date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='programa_alta_titular')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD programa_alta_titular varchar(8)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='numero_transmision_dominio_titular')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD numero_transmision_dominio_titular decimal(2,0)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='fecha_transmision_dominio')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD fecha_transmision_dominio date

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='num_relacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD num_relacion varchar(9)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_calle_principal')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_calle_principal int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='longitud_fachada_principal')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD longitud_fachada_principal decimal(8,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_calle_secundaria_1')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_calle_secundaria_1 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='longitud_calle_secundaria_1')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD longitud_calle_secundaria_1 decimal(8,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_calle_secundaria_2')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_calle_secundaria_2 int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='longitud_calle_secundaria_2')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD longitud_calle_secundaria_2 decimal(8,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='longitud_galeria_comercial')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD longitud_galeria_comercial decimal(8,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_calle_zaguera')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD id_calle_zaguera int

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='longitud_zaguera')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD longitud_zaguera decimal(8,2)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='tiene_acceso_por_portal')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD tiene_acceso_por_portal bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='es_local_interior')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD es_local_interior bit

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='altura_libre_local')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD altura_libre_local varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='altura_local_respecto_rasante')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD altura_local_respecto_rasante varchar(1)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='num_real_parcelas')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD num_real_parcelas decimal(6,0)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='fec_alta')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD fec_alta datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='fec_modificacion')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD fec_modificacion datetime

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='fec_baja')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD fec_baja datetime

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='es_caserio_rural' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT DF_DBO_TBN1_KU_DS_OBJETOS_TITULAR_ES_CASERIO_RURAL DEFAULT 0 FOR es_caserio_rural

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='servicio_urbanistico_agua' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT DF_DBO_TBN1_KU_DS_OBJETOS_TITULAR_SERVICIO_URBANISTICO_AGUA DEFAULT 0 FOR servicio_urbanistico_agua

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='servicio_urbanistico_luz' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT DF_DBO_TBN1_KU_DS_OBJETOS_TITULAR_SERVICIO_URBANISTICO_LUZ DEFAULT 0 FOR servicio_urbanistico_luz

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='servicio_alcantarillado' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT DF_DBO_TBN1_KU_DS_OBJETOS_TITULAR_SERVICIO_ALCANTARILLADO DEFAULT 0 FOR servicio_alcantarillado

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='servicio_pavimento_calzada' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT DF_DBO_TBN1_KU_DS_OBJETOS_TITULAR_SERVICIO_PAVIMENTO_CALZADA DEFAULT 0 FOR servicio_pavimento_calzada

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='servicio_encintado_acero' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT DF_DBO_TBN1_KU_DS_OBJETOS_TITULAR_SERVICIO_ENCINTADO_ACERO DEFAULT 0 FOR servicio_encintado_acero

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='tiene_acceso_por_portal' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT DF_DBO_TBN1_KU_DS_OBJETOS_TITULAR_TIENE_ACCESO_POR_PORTAL DEFAULT 0 FOR tiene_acceso_por_portal

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='es_local_interior' AND COLUMN_DEFAULT IS NULL)
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT DF_DBO_TBN1_KU_DS_OBJETOS_TITULAR_ES_LOCAL_INTERIOR DEFAULT 0 FOR es_local_interior

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_objeto_titular' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_objeto_titular int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='origen' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN origen varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='numero_fijo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN numero_fijo varchar(7) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='letra_fija' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN letra_fija varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='indicador_desagregacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN indicador_desagregacion varchar(2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='escalera_planta_mano_puerta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN escalera_planta_mano_puerta varchar(8) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_uso_objeto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_uso_objeto int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_clase_objeto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_clase_objeto int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_modalidad_catastro_objeto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_modalidad_catastro_objeto int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='orden' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN orden decimal(3,0) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='num_cargo_parcela' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN num_cargo_parcela decimal(4,0) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='posicion_objeto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN posicion_objeto int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='actividad_dedicada' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN actividad_dedicada varchar(2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='coeficiente_participacion_comunes' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN coeficiente_participacion_comunes decimal(9,6) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='valor_catastral_objeto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN valor_catastral_objeto decimal(12,2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='valor_suelo_objeto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN valor_suelo_objeto decimal(12,2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='valor_construido_objeto' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN valor_construido_objeto decimal(12,2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_edificio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_edificio int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='cod_municipio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN cod_municipio varchar(3) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='cod_calle' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN cod_calle varchar(5) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='num_portal' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN num_portal varchar(9) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_calle' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_calle int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_portal' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_portal int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_uso_edificio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_uso_edificio int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_clase_edificio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_clase_edificio int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_modalidad_catastro_edificio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_modalidad_catastro_edificio int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='tipo_registro_edificio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN tipo_registro_edificio varchar(3) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='num_edificio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN num_edificio decimal(3,0) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='posicion_edificio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN posicion_edificio int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='superficie_sobre_rasante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN superficie_sobre_rasante decimal(6,0) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='superficie_descubierta_urbanizada' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN superficie_descubierta_urbanizada decimal(6,0) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='anyo_construccion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN anyo_construccion varchar(4) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='grado_conservacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN grado_conservacion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='es_caserio_rural' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular SET es_caserio_rural=0 WHERE es_caserio_rural IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN es_caserio_rural bit NOT NULL
END

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='participacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN participacion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='fecha_baja_edificio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN fecha_baja_edificio date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='fecha_valoracion_edificio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN fecha_valoracion_edificio date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='valor_catastral_edificio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN valor_catastral_edificio decimal(12,2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='anyo_rehabilitacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN anyo_rehabilitacion varchar(4) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='num_vvdas_coeficiente_ascensor' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN num_vvdas_coeficiente_ascensor varchar(2) NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_ascensor' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_concepto_edificio_ascensor int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_calefaccion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_concepto_edificio_calefaccion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_banos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_concepto_edificio_banos int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_amplitud' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_concepto_edificio_amplitud int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_portero' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_concepto_edificio_portero int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_cerramiento_viv' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_concepto_edificio_cerramiento_viv int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_cerramiento_ind' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_concepto_edificio_cerramiento_ind int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_suelo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_concepto_edificio_suelo int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_carpinteria' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_concepto_edificio_carpinteria int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_protegido' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_concepto_edificio_protegido int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_instalaciones' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_concepto_edificio_instalaciones int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_singular' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_concepto_edificio_singular int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_turismo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_concepto_edificio_turismo int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_cerramiento' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_concepto_edificio_cerramiento int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_historico' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_concepto_edificio_historico int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_aireacond' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_concepto_edificio_aireacond int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_estrellas' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_concepto_edificio_estrellas int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_edificacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_concepto_edificio_edificacion int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_estructura' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_concepto_edificio_estructura int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_luznave' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_concepto_edificio_luznave int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_solera' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_concepto_edificio_solera int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_forjado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_concepto_edificio_forjado int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_altura' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_concepto_edificio_altura int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_elevador' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_concepto_edificio_elevador int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_concepto_edificio_grua' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_concepto_edificio_grua int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='tiene_cubierta' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN tiene_cubierta varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='tipo_rehabilitacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN tipo_rehabilitacion varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='valor_suelo_edificio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN valor_suelo_edificio decimal(12,2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='valor_construccion_edificio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN valor_construccion_edificio decimal(12,2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='categoria_construccion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN categoria_construccion decimal(2,0) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='fecha_categoria_construccion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN fecha_categoria_construccion date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='modalidad_edificio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN modalidad_edificio varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='rustica_grado_reforma' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN rustica_grado_reforma varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='rustica_año_calculo' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN [rustica_año_calculo] decimal(4,0) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='rustica_num_instalaciones' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN rustica_num_instalaciones varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='rustica_num_cerramientos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN rustica_num_cerramientos varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='anyo_reforma' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN anyo_reforma decimal(4,0) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_parcela' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_parcela int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='cod_poligono' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN cod_poligono varchar(3) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='cod_manzana' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN cod_manzana varchar(2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='cod_parcela' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN cod_parcela varchar(3) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_municipio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_municipio int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='coordenada_x' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN coordenada_x decimal(4,0) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='coordenada_y' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN coordenada_y decimal(4,0) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='numero_plano' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN numero_plano varchar(7) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='posicion_parcela' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN posicion_parcela int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='superficie_total' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN superficie_total decimal(6,0) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='num_fachadas' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN num_fachadas varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='servicio_urbanistico_agua' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular SET servicio_urbanistico_agua=0 WHERE servicio_urbanistico_agua IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN servicio_urbanistico_agua bit NOT NULL
END

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='servicio_urbanistico_luz' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular SET servicio_urbanistico_luz=0 WHERE servicio_urbanistico_luz IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN servicio_urbanistico_luz bit NOT NULL
END

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='servicio_alcantarillado' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular SET servicio_alcantarillado=0 WHERE servicio_alcantarillado IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN servicio_alcantarillado bit NOT NULL
END

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='servicio_pavimento_calzada' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular SET servicio_pavimento_calzada=0 WHERE servicio_pavimento_calzada IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN servicio_pavimento_calzada bit NOT NULL
END

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='servicio_encintado_acero' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular SET servicio_encintado_acero=0 WHERE servicio_encintado_acero IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN servicio_encintado_acero bit NOT NULL
END

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='es_subedificada' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN es_subedificada varchar(2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='edificabilidad' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN edificabilidad decimal(5,3) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='fecha_valoracion_parcela' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN fecha_valoracion_parcela date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='valor_catastral_parcela' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN valor_catastral_parcela decimal(12,2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='valor_construccion_parcela' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN valor_construccion_parcela decimal(12,2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='valor_suelo_parcela' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN valor_suelo_parcela decimal(12,2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='secuencia_propietario' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN secuencia_propietario decimal(2,0) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='fecha_baja_titular' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN fecha_baja_titular date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='nif' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN nif varchar(9) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_contribuyente' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_contribuyente int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='discriminante_nif' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN discriminante_nif varchar(2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='tipo_titularidad_bien' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN tipo_titularidad_bien varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='nombre_apellidos' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN nombre_apellidos varchar(40) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='tipo_persona_fisica_juridica' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN tipo_persona_fisica_juridica varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='tipo_propietario' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN tipo_propietario varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='es_identificado' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN es_identificado varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='fecha_identificacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN fecha_identificacion date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='coeficiente_participacion_titularidad' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN coeficiente_participacion_titularidad decimal(5,2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='fecha_alta_titular' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN fecha_alta_titular date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='programa_alta_titular' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN programa_alta_titular varchar(8) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='numero_transmision_dominio_titular' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN numero_transmision_dominio_titular decimal(2,0) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='fecha_transmision_dominio' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN fecha_transmision_dominio date NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='num_relacion' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN num_relacion varchar(9) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_calle_principal' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_calle_principal int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='longitud_fachada_principal' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN longitud_fachada_principal decimal(8,2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_calle_secundaria_1' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_calle_secundaria_1 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='longitud_calle_secundaria_1' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN longitud_calle_secundaria_1 decimal(8,2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_calle_secundaria_2' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_calle_secundaria_2 int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='longitud_calle_secundaria_2' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN longitud_calle_secundaria_2 decimal(8,2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='longitud_galeria_comercial' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN longitud_galeria_comercial decimal(8,2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='id_calle_zaguera' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN id_calle_zaguera int NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='longitud_zaguera' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN longitud_zaguera decimal(8,2) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='tiene_acceso_por_portal' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular SET tiene_acceso_por_portal=0 WHERE tiene_acceso_por_portal IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN tiene_acceso_por_portal bit NOT NULL
END

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='es_local_interior' AND IS_NULLABLE='YES')
BEGIN
  UPDATE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular SET es_local_interior=0 WHERE es_local_interior IS NULL
  ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN es_local_interior bit NOT NULL
END

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='altura_libre_local' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN altura_libre_local varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='altura_local_respecto_rasante' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN altura_local_respecto_rasante varchar(1) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='num_real_parcelas' AND IS_NULLABLE='YES')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN num_real_parcelas decimal(6,0) NOT NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='fec_alta' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN fec_alta datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='fec_modificacion' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN fec_modificacion datetime NULL

GO

IF EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND COLUMN_NAME='fec_baja' AND IS_NULLABLE='NO')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ALTER COLUMN fec_baja datetime NULL

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='PK_tbn1_ku_ds_objetos_titular')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT PK_tbn1_ku_ds_objetos_titular PRIMARY KEY CLUSTERED (id_objeto_titular)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_ku_usos')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_usos FOREIGN KEY (id_uso_objeto) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_usos(id_uso)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_ku_clases')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_clases FOREIGN KEY (id_clase_objeto) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_clases(id_clase)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_ku_modalidades')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_modalidades FOREIGN KEY (id_modalidad_catastro_objeto) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_modalidades(id_modalidad_catastro)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_ku_edificios')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_edificios FOREIGN KEY (id_edificio) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_edificios(id_edificio)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_ku_calles')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_calles FOREIGN KEY (id_calle) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_calles(id_calle)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_ku_portales')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_portales FOREIGN KEY (id_portal) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_portales(id_portal)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_ku_usos1')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_usos1 FOREIGN KEY (id_uso_edificio) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_usos(id_uso)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_ku_clases1')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_clases1 FOREIGN KEY (id_clase_edificio) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_clases(id_clase)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_ku_modalidades1')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_modalidades1 FOREIGN KEY (id_modalidad_catastro_edificio) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_modalidades(id_modalidad_catastro)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios FOREIGN KEY (id_concepto_edificio_ascensor) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios1')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios1 FOREIGN KEY (id_concepto_edificio_calefaccion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios2')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios2 FOREIGN KEY (id_concepto_edificio_banos) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios3')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios3 FOREIGN KEY (id_concepto_edificio_amplitud) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios4')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios4 FOREIGN KEY (id_concepto_edificio_portero) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios5')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios5 FOREIGN KEY (id_concepto_edificio_cerramiento_viv) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios6')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios6 FOREIGN KEY (id_concepto_edificio_cerramiento_ind) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios7')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios7 FOREIGN KEY (id_concepto_edificio_suelo) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios8')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios8 FOREIGN KEY (id_concepto_edificio_carpinteria) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios9')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios9 FOREIGN KEY (id_concepto_edificio_protegido) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios10')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios10 FOREIGN KEY (id_concepto_edificio_instalaciones) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios11')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios11 FOREIGN KEY (id_concepto_edificio_singular) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios12')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios12 FOREIGN KEY (id_concepto_edificio_turismo) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios13')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios13 FOREIGN KEY (id_concepto_edificio_cerramiento) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios14')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios14 FOREIGN KEY (id_concepto_edificio_historico) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios15')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios15 FOREIGN KEY (id_concepto_edificio_aireacond) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios16')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios16 FOREIGN KEY (id_concepto_edificio_estrellas) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios17')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios17 FOREIGN KEY (id_concepto_edificio_edificacion) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios18')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios18 FOREIGN KEY (id_concepto_edificio_estructura) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios19')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios19 FOREIGN KEY (id_concepto_edificio_luznave) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios20')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios20 FOREIGN KEY (id_concepto_edificio_solera) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios21')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios21 FOREIGN KEY (id_concepto_edificio_forjado) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios22')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios22 FOREIGN KEY (id_concepto_edificio_altura) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios23')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios23 FOREIGN KEY (id_concepto_edificio_elevador) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios24')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_conceptos_edificios24 FOREIGN KEY (id_concepto_edificio_grua) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_conceptos_edificios(id_concepto_edificio)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_ku_parcelas')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_parcelas FOREIGN KEY (id_parcela) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_parcelas(id_parcela)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_municipios')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_municipios FOREIGN KEY (id_municipio) REFERENCES dbn1_norm_dhyf.dbo.tbn1_municipios(id_municipio)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_contribuyentes')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_contribuyentes FOREIGN KEY (id_contribuyente) REFERENCES dbn1_norm_dhyf.dbo.tbn1_contribuyentes(id_contribuyente)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_ku_calles1')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_calles1 FOREIGN KEY (id_calle_principal) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_calles(id_calle)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_ku_calles2')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_calles2 FOREIGN KEY (id_calle_secundaria_1) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_calles(id_calle)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_ku_calles3')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_calles3 FOREIGN KEY (id_calle_secundaria_2) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_calles(id_calle)

GO

IF NOT EXISTS (SELECT 1 FROM dbn1_norm_dhyf.INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tbn1_ku_ds_objetos_titular' AND CONSTRAINT_NAME='FK_tbn1_ku_ds_objetos_titular_tbn1_ku_calles4')
ALTER TABLE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular ADD CONSTRAINT FK_tbn1_ku_ds_objetos_titular_tbn1_ku_calles4 FOREIGN KEY (id_calle_zaguera) REFERENCES dbn1_norm_dhyf.dbo.tbn1_ku_calles(id_calle)

GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_ku_ds_objetos_titular' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_ku_ds_objetos_titular;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_ku_ds_objetos_titular(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_ds_objetos_titular'
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
      obje.tbprefijo AS origen,
      obje.tbnumfij AS numero_fijo,
      obje.tbletfij AS letra_fija,
      obje.tbdesagre AS indicador_desagregacion,
      obje.tbelem AS escalera_planta_mano_puerta,
      moda_obj.id_uso AS id_uso_objeto,
      moda_obj.id_clase AS id_clase_objeto,
      moda_obj.id_modalidad_catastro AS id_modalidad_catastro_objeto,
      obje.tbnorden AS orden,
      obje.tbncargo AS num_cargo_parcela,
      row_number() OVER (PARTITION BY obje.tbprefijo,obje.tbnumfij,obje.tbletfij,obje.tbdesagre ORDER BY obje.tbprefijo,obje.tbnumfij,obje.tbletfij,obje.tbdesagre,titu.tinprop) AS posicion_objeto,
      obje.tbactiv AS actividad_dedicada,
      obje.tbcoefcom AS coeficiente_participacion_comunes,
      CASE
          WHEN row_number() OVER (PARTITION BY obje.tbprefijo,obje.tbnumfij,obje.tbletfij,obje.tbdesagre ORDER BY obje.tbprefijo,obje.tbnumfij,obje.tbletfij,obje.tbdesagre,titu.tinprop)=1 THEN round(obje.tbvalorcat/100,2)
          ELSE 0
      END AS valor_catastral_objeto,
      CASE
          WHEN row_number() OVER (PARTITION BY obje.tbprefijo,obje.tbnumfij,obje.tbletfij,obje.tbdesagre ORDER BY obje.tbprefijo,obje.tbnumfij,obje.tbletfij,obje.tbdesagre,titu.tinprop)=1 THEN round(obje.tbvalorsuelo/100,2)
          ELSE 0
      END AS valor_suelo_objeto,
      CASE
          WHEN row_number() OVER (PARTITION BY obje.tbprefijo,obje.tbnumfij,obje.tbletfij,obje.tbdesagre ORDER BY obje.tbprefijo,obje.tbnumfij,obje.tbletfij,obje.tbdesagre,titu.tinprop)=1 THEN round(obje.tbvalorcons/100,2)
          ELSE 0
      END AS valor_construido_objeto,
      CASE
          WHEN row_number() OVER (PARTITION BY obje.tbprefijo,obje.tbnumfij,obje.tbletfij,obje.tbdesagre ORDER BY obje.tbprefijo,obje.tbnumfij,obje.tbletfij,obje.tbdesagre,titu.tinprop)=1 THEN obje.tbsplanta
          ELSE 0
      END AS superficie_planta,
      CASE
          WHEN row_number() OVER (PARTITION BY obje.tbprefijo,obje.tbnumfij,obje.tbletfij,obje.tbdesagre ORDER BY obje.tbprefijo,obje.tbnumfij,obje.tbletfij,obje.tbdesagre,titu.tinprop)=1 THEN obje.tbsconstr
          ELSE 0
      END AS superficie_objeto,	  
      edif.id_edificio AS id_edificio,
      edif.cod_municipio AS cod_municipio,
      edif.cod_calle AS cod_calle,
      edif.num_portal AS num_portal,
      cal.id_calle AS id_calle,
      por.id_portal AS id_portal,
      edif.id_uso AS id_uso_edificio,
      edif.id_clase AS id_clase_edificio,
      edif.id_modalidad_catastro AS id_modalidad_catastro_edificio,
      coalesce(edif.tipo_registro_edificio,'') AS tipo_registro_edificio,
      coalesce(edif.num_edificio,0) AS num_edificio,
      row_number() OVER (PARTITION BY edif.id_edificio ORDER BY obje.tbprefijo,obje.tbnumfij,obje.tbletfij,obje.tbdesagre,titu.tinprop) AS posicion_edificio,
      CASE
          WHEN row_number() OVER (PARTITION BY edif.id_edificio ORDER BY obje.tbprefijo,obje.tbnumfij,obje.tbletfij,obje.tbdesagre,titu.tinprop)=1 THEN coalesce(edif.superficie_sobre_rasante,0)
          ELSE 0
      END AS superficie_sobre_rasante,
      CASE
          WHEN row_number() OVER (PARTITION BY edif.id_edificio ORDER BY obje.tbprefijo,obje.tbnumfij,obje.tbletfij,obje.tbdesagre,titu.tinprop)=1 THEN coalesce(edif.superficie_descubierta_urbanizada,0)
          ELSE 0
      END AS superficie_descubierta_urbanizada,
      coalesce(edif.anyo_construccion,'') AS anyo_construccion,
      coalesce(edif.grado_conservacion,'') AS grado_conservacion,
      es_caserio_rural,
      coalesce(edif.participacion,'') AS participacion,
      coalesce(edif.fecha_baja,CAST('21000101' AS date)) AS fecha_baja_edificio,
      coalesce(edif.fecha_valoracion,CAST('21000101' AS date)) AS fecha_valoracion_edificio,
      CASE
          WHEN row_number() OVER (PARTITION BY edif.id_edificio ORDER BY obje.tbprefijo,obje.tbnumfij,obje.tbletfij,obje.tbdesagre,titu.tinprop)=1 THEN coalesce(edif.valor_catastral,0)
          ELSE 0
      END AS valor_catastral_edificio,
      coalesce(edif.anyo_rehabilitacion,'') AS anyo_rehabilitacion,
      edif.num_vvdas_asc AS num_vvdas_coeficiente_ascensor,
      id_concepto_edificio_ascensor,
      id_concepto_edificio_calefaccion,
      id_concepto_edificio_banos,
      id_concepto_edificio_amplitud,
      id_concepto_edificio_portero,
      id_concepto_edificio_cerramiento_viv,
      id_concepto_edificio_cerramiento_ind,
      id_concepto_edificio_suelo,
      id_concepto_edificio_carpinteria,
      id_concepto_edificio_protegido,
      id_concepto_edificio_instalaciones,
      id_concepto_edificio_singular,
      id_concepto_edificio_turismo,
      id_concepto_edificio_cerramiento,
      id_concepto_edificio_historico,
      id_concepto_edificio_aireacond,
      id_concepto_edificio_estrellas,
      id_concepto_edificio_edificacion,
      id_concepto_edificio_estructura,
      id_concepto_edificio_luznave,
      id_concepto_edificio_solera,
      id_concepto_edificio_forjado,
      id_concepto_edificio_altura,
      id_concepto_edificio_elevador,
      id_concepto_edificio_grua,
      coalesce(edif.tiene_cubierta,'') AS tiene_cubierta,
      coalesce(edif.tipo_rehabilitacion,'') AS tipo_rehabilitacion,
      CASE
          WHEN row_number() OVER (PARTITION BY edif.id_edificio ORDER BY obje.tbprefijo,obje.tbnumfij,obje.tbletfij,obje.tbdesagre,titu.tinprop)=1 THEN coalesce(edif.valor_suelo,0)
          ELSE 0
      END AS valor_suelo_edificio,
      CASE
          WHEN row_number() OVER (PARTITION BY edif.id_edificio ORDER BY obje.tbprefijo,obje.tbnumfij,obje.tbletfij,obje.tbdesagre,titu.tinprop)=1 THEN coalesce(edif.valor_construccion,0)
          ELSE 0
      END AS valor_construccion_edificio,
      coalesce(edif.categoria_construccion,0) AS categoria_construccion,
      coalesce(fecha_categoria_construccion,CAST('21000101' AS date)) AS fecha_categoria_construccion,
      coalesce(edif.modalidad_edificio,'') AS modalidad_edificio,
      coalesce(edif.rustica_grado_reforma,'') AS rustica_grado_reforma,
      coalesce(edif.[rustica_año_calculo],0) AS [rustica_año_calculo],
      coalesce(edif.rustica_num_instalaciones,'') AS rustica_num_instalaciones,
      coalesce(edif.rustica_num_cerramientos,'') AS rustica_num_cerramientos,
      coalesce(edif.anyo_reforma,0) AS anyo_reforma,
      parc.id_parcela AS id_parcela,
      parc.cod_poligono AS cod_poligono,
      parc.cod_manzana AS cod_manzana,
      parc.cod_parcela AS cod_parcela,
      parc.id_municipio AS id_municipio,
      coalesce(parc.coordenada_x,0) AS coordenada_x,
      coalesce(parc.coordenada_y,0) AS coordenada_y,
      coalesce(parc.numero_plano,'') AS numero_plano,
      row_number() OVER (PARTITION BY parc.id_parcela ORDER BY obje.tbprefijo,obje.tbnumfij,obje.tbletfij,obje.tbdesagre,titu.tinprop) AS posicion_parcela,
      CASE
          WHEN row_number() OVER (PARTITION BY parc.id_parcela ORDER BY obje.tbprefijo,obje.tbnumfij,obje.tbletfij,obje.tbdesagre,titu.tinprop)=1 THEN coalesce(parc.superficie_total,0)
          ELSE 0
      END AS superficie_total,
      coalesce(parc.num_fachadas,'') AS num_fachadas,
      CASE WHEN parc.servicio_urbanistico_agua='1' THEN 1 ELSE 0 END AS servicio_urbanistico_agua,
      CASE WHEN parc.servicio_urbanistico_luz='1' THEN 1 ELSE 0 END AS servicio_urbanistico_luz,
      CASE WHEN parc.servicio_alcantarillado='1' THEN 1 ELSE 0 END AS servicio_alcantarillado,
      CASE WHEN parc.servicio_pavimento_calzada='1' THEN 1 ELSE 0 END AS servicio_pavimento_calzada,
      CASE WHEN parc.servicio_encintado_acero='1' THEN 1 ELSE 0 END AS servicio_encintado_acero,
      coalesce(parc.es_subedificada,'') AS es_subedificada,
      CASE
          WHEN row_number() OVER (PARTITION BY parc.id_parcela ORDER BY obje.tbprefijo,obje.tbnumfij,obje.tbletfij,obje.tbdesagre,titu.tinprop)=1 THEN coalesce(parc.edificabilidad,0)
          ELSE 0
      END AS edificabilidad,
      CASE WHEN parc.fecha_valoracion<>'0001-01-01' THEN parc.fecha_valoracion ELSE CAST('21000101' AS date) END AS fecha_valoracion_parcela,
      CASE
          WHEN row_number() OVER (PARTITION BY parc.id_parcela ORDER BY obje.tbprefijo,obje.tbnumfij,obje.tbletfij,obje.tbdesagre,titu.tinprop)=1 THEN coalesce(parc.valor_catastral,0)
          ELSE 0
      END AS valor_catastral_parcela,
      CASE
          WHEN row_number() OVER (PARTITION BY parc.id_parcela ORDER BY obje.tbprefijo,obje.tbnumfij,obje.tbletfij,obje.tbdesagre,titu.tinprop)=1 THEN coalesce(parc.valor_construccion,0)
          ELSE 0
      END AS valor_construccion_parcela,
      CASE
          WHEN row_number() OVER (PARTITION BY parc.id_parcela ORDER BY obje.tbprefijo,obje.tbnumfij,obje.tbletfij,obje.tbdesagre,titu.tinprop)=1 THEN coalesce(parc.valor_suelo,0)
          ELSE 0
      END AS valor_suelo_parcela,
      titu.tinprop AS secuencia_propietario,
      CAST('21000101' AS date) AS fecha_baja_titular,
      titu.tinif AS nif,
      coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente,
      titu.tidis AS discriminante_nif,
      titu.titipo AS tipo_titularidad_bien,
      titu.tiapell AS nombre_apellidos,
      titu.tifj AS tipo_persona_fisica_juridica,
      titu.titipotit AS tipo_propietario,
      titu.tiident AS es_identificado,
      titu.tifiden AS fecha_identificacion,
      titu.ticoef AS coeficiente_participacion_titularidad,
      titu.tifalta AS fecha_alta_titular,
      titu.tipalta AS programa_alta_titular,
      titu.tintrans AS numero_transmision_dominio_titular,
      titu.tiftrans AS fecha_transmision_dominio,
      coalesce(right('00000000'+CAST(rela.karelc_num_rela AS varchar),9),'') AS num_relacion,
      coalesce(cal_pal.id_calle,indefinidos.id_calle) AS id_calle_principal,
      coalesce(com.kavalc_long_fp,0) AS longitud_fachada_principal,
      coalesce(cal_se1.id_calle,indefinidos.id_calle) AS id_calle_secundaria_1,
      coalesce(com.kavalc_long_oc1,0) AS longitud_calle_secundaria_1,
      coalesce(cal_se2.id_calle,indefinidos.id_calle) AS id_calle_secundaria_2,
      coalesce(com.kavalc_long_oc2,0) AS longitud_calle_secundaria_2,
      coalesce(com.kavalc_long_gc,0) AS longitud_galeria_comercial,
      coalesce(cal_se2.id_calle,indefinidos.id_calle) AS id_calle_zaguera,
      coalesce(com.kavalc_long_zg,0) AS longitud_zaguera,
      CASE WHEN com.kavalc_acceso_port='S' THEN 1 ELSE 0 END AS tiene_acceso_por_portal,
      CASE WHEN com.KAVALC_INTERIOR='S' THEN 1 ELSE 0 END AS es_local_interior,
      coalesce(com.kavalc_alt_libre,'') AS altura_libre_local,
      coalesce(com.kavalc_alt_rasante,'') AS altura_local_respecto_rasante,
      CASE
          WHEN row_number() OVER (PARTITION BY obje.tbprefijo,obje.tbnumfij,obje.tbletfij,obje.tbdesagre ORDER BY obje.tbprefijo,obje.tbnumfij,obje.tbletfij,obje.tbdesagre,titu.tinprop)=1 THEN coalesce(kavalg_nro_real_pa,0)
          ELSE 0
      END AS num_real_parcelas
    FROM (SELECT * FROM dbn1_stg_dhyf.dbo.tbn1titu_cu WHERE tifbaja='0001-01-01') titu
    INNER JOIN dbn1_stg_dhyf.dbo.tbn1obje_cu obje ON (obje.tbprefijo=titu.tiprefijo AND obje.tbnumfij=titu.tinumfij AND obje.tbletfij=titu.tiletfij AND obje.tbdesagre=titu.tidesagre)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (c.nif_maestro=titu.tinif+titu.tidis AND c.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_ku_usos uso_obj ON (uso_obj.cod_uso=obje.tbuso)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_ku_clases cla_obj ON (cla_obj.id_uso=uso_obj.id_uso AND cla_obj.cod_clase=obje.tbclase)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_ku_modalidades moda_obj ON (moda_obj.id_uso=cla_obj.id_uso AND moda_obj.id_clase=cla_obj.id_clase AND moda_obj.cod_modalidad=obje.tbmodal)
    LEFT JOIN (SELECT * FROM dbn1_stg_dhyf.dbo.tbn1relc_ka WHERE karelc_fec8_finefe='0001-01-01') rela ON rela.karelc_tbcodmun=obje.tbcodmun AND rela.karelc_tbprefijo=obje.tbprefijo AND rela.karelc_tbnumfij=obje.tbnumfij AND rela.karelc_tbletfij=obje.tbletfij AND rela.karelc_tbdesagre=obje.tbdesagre
    LEFT JOIN (SELECT * FROM dbn1_stg_dhyf.dbo.tbn1valc_ka WHERE kavalc_fec8_finefe='0001-01-01') com ON com.kavalc_tbprefijo=obje.tbprefijo AND com.kavalc_tbnumfij=obje.tbnumfij AND com.kavalc_tbletfij=obje.tbletfij AND com.kavalc_tbdesagre=obje.tbdesagre
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_ku_calles cal_pal ON (cal_pal.cod_municipio=obje.tbcodmun AND cal_pal.cod_calle=com.kavalc_codcal_fp)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_ku_calles cal_se1 ON (cal_se1.cod_municipio=obje.tbcodmun AND cal_se1.cod_calle=com.kavalc_codcal_oc1)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_ku_calles cal_se2 ON (cal_se2.cod_municipio=obje.tbcodmun AND cal_se2.cod_calle=com.kavalc_codcal_oc2)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_ku_calles cal_zag ON (cal_zag.cod_municipio=obje.tbcodmun AND cal_zag.cod_calle=com.kavalc_codcal_zg)
    LEFT JOIN dbn1_stg_dhyf.dbo.tbn1valg_ka gar ON (gar.kavalg_prefijo=obje.tbprefijo AND gar.kavalg_numfij=obje.tbnumfij AND gar.kavalg_letfij=obje.tbletfij)
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_ku_edificios edif ON (edif.cod_municipio=obje.tbcodmun AND edif.cod_calle=obje.tbcodcal AND edif.num_portal=obje.tbnumero)
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_ku_parcelas parc ON (parc.id_parcela=edif.id_parcela)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_municipios muni ON (muni.id_municipio=parc.id_municipio)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_ku_calles cal ON (cal.id_calle=edif.id_calle)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_ku_portales por ON (por.id_calle=edif.id_calle and por.numero = obje.tbnumero)
    CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
    WHERE
      gar.kavalg_fec_efecto IS NULL
      OR gar.kavalg_fec_efecto=(SELECT max(kavalg_fec_efecto) AS expr1
      FROM dbn1_stg_dhyf.dbo.tbn1valg_ka
      WHERE
        kavalg_prefijo=obje.tbprefijo
        AND kavalg_numfij=obje.tbnumfij
        AND kavalg_letfij=obje.tbletfij
      )
  )
  MERGE dbn1_norm_dhyf.dbo.tbn1_ku_ds_objetos_titular AS tbn1_ku_ds_objetos_titular
  USING query ON query.origen=tbn1_ku_ds_objetos_titular.origen AND query.numero_fijo=tbn1_ku_ds_objetos_titular.numero_fijo AND query.letra_fija=tbn1_ku_ds_objetos_titular.letra_fija AND query.indicador_desagregacion=tbn1_ku_ds_objetos_titular.indicador_desagregacion AND query.secuencia_propietario=tbn1_ku_ds_objetos_titular.secuencia_propietario
  WHEN MATCHED AND ((tbn1_ku_ds_objetos_titular.escalera_planta_mano_puerta<>query.escalera_planta_mano_puerta OR (tbn1_ku_ds_objetos_titular.escalera_planta_mano_puerta IS NULL AND query.escalera_planta_mano_puerta IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.escalera_planta_mano_puerta IS NOT NULL AND query.escalera_planta_mano_puerta IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_uso_objeto<>query.id_uso_objeto OR (tbn1_ku_ds_objetos_titular.id_uso_objeto IS NULL AND query.id_uso_objeto IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_uso_objeto IS NOT NULL AND query.id_uso_objeto IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_clase_objeto<>query.id_clase_objeto OR (tbn1_ku_ds_objetos_titular.id_clase_objeto IS NULL AND query.id_clase_objeto IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_clase_objeto IS NOT NULL AND query.id_clase_objeto IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_modalidad_catastro_objeto<>query.id_modalidad_catastro_objeto OR (tbn1_ku_ds_objetos_titular.id_modalidad_catastro_objeto IS NULL AND query.id_modalidad_catastro_objeto IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_modalidad_catastro_objeto IS NOT NULL AND query.id_modalidad_catastro_objeto IS NULL)
                    OR tbn1_ku_ds_objetos_titular.orden<>query.orden OR (tbn1_ku_ds_objetos_titular.orden IS NULL AND query.orden IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.orden IS NOT NULL AND query.orden IS NULL)
                    OR tbn1_ku_ds_objetos_titular.num_cargo_parcela<>query.num_cargo_parcela OR (tbn1_ku_ds_objetos_titular.num_cargo_parcela IS NULL AND query.num_cargo_parcela IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.num_cargo_parcela IS NOT NULL AND query.num_cargo_parcela IS NULL)
                    OR tbn1_ku_ds_objetos_titular.posicion_objeto<>query.posicion_objeto OR (tbn1_ku_ds_objetos_titular.posicion_objeto IS NULL AND query.posicion_objeto IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.posicion_objeto IS NOT NULL AND query.posicion_objeto IS NULL)
                    OR tbn1_ku_ds_objetos_titular.actividad_dedicada<>query.actividad_dedicada OR (tbn1_ku_ds_objetos_titular.actividad_dedicada IS NULL AND query.actividad_dedicada IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.actividad_dedicada IS NOT NULL AND query.actividad_dedicada IS NULL)
                    OR tbn1_ku_ds_objetos_titular.coeficiente_participacion_comunes<>query.coeficiente_participacion_comunes OR (tbn1_ku_ds_objetos_titular.coeficiente_participacion_comunes IS NULL AND query.coeficiente_participacion_comunes IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.coeficiente_participacion_comunes IS NOT NULL AND query.coeficiente_participacion_comunes IS NULL)
                    OR tbn1_ku_ds_objetos_titular.valor_catastral_objeto<>query.valor_catastral_objeto OR (tbn1_ku_ds_objetos_titular.valor_catastral_objeto IS NULL AND query.valor_catastral_objeto IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.valor_catastral_objeto IS NOT NULL AND query.valor_catastral_objeto IS NULL)
                    OR tbn1_ku_ds_objetos_titular.valor_suelo_objeto<>query.valor_suelo_objeto OR (tbn1_ku_ds_objetos_titular.valor_suelo_objeto IS NULL AND query.valor_suelo_objeto IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.valor_suelo_objeto IS NOT NULL AND query.valor_suelo_objeto IS NULL)
                    OR tbn1_ku_ds_objetos_titular.valor_construido_objeto<>query.valor_construido_objeto OR (tbn1_ku_ds_objetos_titular.valor_construido_objeto IS NULL AND query.valor_construido_objeto IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.valor_construido_objeto IS NOT NULL AND query.valor_construido_objeto IS NULL)
                    OR tbn1_ku_ds_objetos_titular.superficie_planta<>query.superficie_planta OR (tbn1_ku_ds_objetos_titular.superficie_planta IS NULL AND query.superficie_planta IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.superficie_planta IS NOT NULL AND query.superficie_planta IS NULL)
					OR tbn1_ku_ds_objetos_titular.superficie_objeto<>query.superficie_objeto OR (tbn1_ku_ds_objetos_titular.superficie_objeto IS NULL AND query.superficie_objeto IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.superficie_objeto IS NOT NULL AND query.superficie_objeto IS NULL)			
                    OR tbn1_ku_ds_objetos_titular.id_edificio<>query.id_edificio OR (tbn1_ku_ds_objetos_titular.id_edificio IS NULL AND query.id_edificio IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_edificio IS NOT NULL AND query.id_edificio IS NULL)
                    OR tbn1_ku_ds_objetos_titular.cod_municipio<>query.cod_municipio OR (tbn1_ku_ds_objetos_titular.cod_municipio IS NULL AND query.cod_municipio IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.cod_municipio IS NOT NULL AND query.cod_municipio IS NULL)
                    OR tbn1_ku_ds_objetos_titular.cod_calle<>query.cod_calle OR (tbn1_ku_ds_objetos_titular.cod_calle IS NULL AND query.cod_calle IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.cod_calle IS NOT NULL AND query.cod_calle IS NULL)
                    OR tbn1_ku_ds_objetos_titular.num_portal<>query.num_portal OR (tbn1_ku_ds_objetos_titular.num_portal IS NULL AND query.num_portal IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.num_portal IS NOT NULL AND query.num_portal IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_calle<>query.id_calle OR (tbn1_ku_ds_objetos_titular.id_calle IS NULL AND query.id_calle IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_calle IS NOT NULL AND query.id_calle IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_portal<>query.id_portal OR (tbn1_ku_ds_objetos_titular.id_portal IS NULL AND query.id_portal IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_portal IS NOT NULL AND query.id_portal IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_uso_edificio<>query.id_uso_edificio OR (tbn1_ku_ds_objetos_titular.id_uso_edificio IS NULL AND query.id_uso_edificio IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_uso_edificio IS NOT NULL AND query.id_uso_edificio IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_clase_edificio<>query.id_clase_edificio OR (tbn1_ku_ds_objetos_titular.id_clase_edificio IS NULL AND query.id_clase_edificio IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_clase_edificio IS NOT NULL AND query.id_clase_edificio IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_modalidad_catastro_edificio<>query.id_modalidad_catastro_edificio OR (tbn1_ku_ds_objetos_titular.id_modalidad_catastro_edificio IS NULL AND query.id_modalidad_catastro_edificio IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_modalidad_catastro_edificio IS NOT NULL AND query.id_modalidad_catastro_edificio IS NULL)
                    OR tbn1_ku_ds_objetos_titular.tipo_registro_edificio<>query.tipo_registro_edificio OR (tbn1_ku_ds_objetos_titular.tipo_registro_edificio IS NULL AND query.tipo_registro_edificio IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.tipo_registro_edificio IS NOT NULL AND query.tipo_registro_edificio IS NULL)
                    OR tbn1_ku_ds_objetos_titular.num_edificio<>query.num_edificio OR (tbn1_ku_ds_objetos_titular.num_edificio IS NULL AND query.num_edificio IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.num_edificio IS NOT NULL AND query.num_edificio IS NULL)
                    OR tbn1_ku_ds_objetos_titular.posicion_edificio<>query.posicion_edificio OR (tbn1_ku_ds_objetos_titular.posicion_edificio IS NULL AND query.posicion_edificio IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.posicion_edificio IS NOT NULL AND query.posicion_edificio IS NULL)
                    OR tbn1_ku_ds_objetos_titular.superficie_sobre_rasante<>query.superficie_sobre_rasante OR (tbn1_ku_ds_objetos_titular.superficie_sobre_rasante IS NULL AND query.superficie_sobre_rasante IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.superficie_sobre_rasante IS NOT NULL AND query.superficie_sobre_rasante IS NULL)
                    OR tbn1_ku_ds_objetos_titular.superficie_descubierta_urbanizada<>query.superficie_descubierta_urbanizada OR (tbn1_ku_ds_objetos_titular.superficie_descubierta_urbanizada IS NULL AND query.superficie_descubierta_urbanizada IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.superficie_descubierta_urbanizada IS NOT NULL AND query.superficie_descubierta_urbanizada IS NULL)
                    OR tbn1_ku_ds_objetos_titular.anyo_construccion<>query.anyo_construccion OR (tbn1_ku_ds_objetos_titular.anyo_construccion IS NULL AND query.anyo_construccion IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.anyo_construccion IS NOT NULL AND query.anyo_construccion IS NULL)
                    OR tbn1_ku_ds_objetos_titular.grado_conservacion<>query.grado_conservacion OR (tbn1_ku_ds_objetos_titular.grado_conservacion IS NULL AND query.grado_conservacion IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.grado_conservacion IS NOT NULL AND query.grado_conservacion IS NULL)
                    OR tbn1_ku_ds_objetos_titular.es_caserio_rural<>query.es_caserio_rural OR (tbn1_ku_ds_objetos_titular.es_caserio_rural IS NULL AND query.es_caserio_rural IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.es_caserio_rural IS NOT NULL AND query.es_caserio_rural IS NULL)
                    OR tbn1_ku_ds_objetos_titular.participacion<>query.participacion OR (tbn1_ku_ds_objetos_titular.participacion IS NULL AND query.participacion IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.participacion IS NOT NULL AND query.participacion IS NULL)
                    OR tbn1_ku_ds_objetos_titular.fecha_baja_edificio<>query.fecha_baja_edificio OR (tbn1_ku_ds_objetos_titular.fecha_baja_edificio IS NULL AND query.fecha_baja_edificio IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.fecha_baja_edificio IS NOT NULL AND query.fecha_baja_edificio IS NULL)
                    OR tbn1_ku_ds_objetos_titular.fecha_valoracion_edificio<>query.fecha_valoracion_edificio OR (tbn1_ku_ds_objetos_titular.fecha_valoracion_edificio IS NULL AND query.fecha_valoracion_edificio IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.fecha_valoracion_edificio IS NOT NULL AND query.fecha_valoracion_edificio IS NULL)
                    OR tbn1_ku_ds_objetos_titular.valor_catastral_edificio<>query.valor_catastral_edificio OR (tbn1_ku_ds_objetos_titular.valor_catastral_edificio IS NULL AND query.valor_catastral_edificio IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.valor_catastral_edificio IS NOT NULL AND query.valor_catastral_edificio IS NULL)
                    OR tbn1_ku_ds_objetos_titular.anyo_rehabilitacion<>query.anyo_rehabilitacion OR (tbn1_ku_ds_objetos_titular.anyo_rehabilitacion IS NULL AND query.anyo_rehabilitacion IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.anyo_rehabilitacion IS NOT NULL AND query.anyo_rehabilitacion IS NULL)
                    OR tbn1_ku_ds_objetos_titular.num_vvdas_coeficiente_ascensor<>query.num_vvdas_coeficiente_ascensor OR (tbn1_ku_ds_objetos_titular.num_vvdas_coeficiente_ascensor IS NULL AND query.num_vvdas_coeficiente_ascensor IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.num_vvdas_coeficiente_ascensor IS NOT NULL AND query.num_vvdas_coeficiente_ascensor IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_concepto_edificio_ascensor<>query.id_concepto_edificio_ascensor OR (tbn1_ku_ds_objetos_titular.id_concepto_edificio_ascensor IS NULL AND query.id_concepto_edificio_ascensor IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_concepto_edificio_ascensor IS NOT NULL AND query.id_concepto_edificio_ascensor IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_concepto_edificio_calefaccion<>query.id_concepto_edificio_calefaccion OR (tbn1_ku_ds_objetos_titular.id_concepto_edificio_calefaccion IS NULL AND query.id_concepto_edificio_calefaccion IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_concepto_edificio_calefaccion IS NOT NULL AND query.id_concepto_edificio_calefaccion IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_concepto_edificio_banos<>query.id_concepto_edificio_banos OR (tbn1_ku_ds_objetos_titular.id_concepto_edificio_banos IS NULL AND query.id_concepto_edificio_banos IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_concepto_edificio_banos IS NOT NULL AND query.id_concepto_edificio_banos IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_concepto_edificio_amplitud<>query.id_concepto_edificio_amplitud OR (tbn1_ku_ds_objetos_titular.id_concepto_edificio_amplitud IS NULL AND query.id_concepto_edificio_amplitud IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_concepto_edificio_amplitud IS NOT NULL AND query.id_concepto_edificio_amplitud IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_concepto_edificio_portero<>query.id_concepto_edificio_portero OR (tbn1_ku_ds_objetos_titular.id_concepto_edificio_portero IS NULL AND query.id_concepto_edificio_portero IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_concepto_edificio_portero IS NOT NULL AND query.id_concepto_edificio_portero IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_concepto_edificio_cerramiento_viv<>query.id_concepto_edificio_cerramiento_viv OR (tbn1_ku_ds_objetos_titular.id_concepto_edificio_cerramiento_viv IS NULL AND query.id_concepto_edificio_cerramiento_viv IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_concepto_edificio_cerramiento_viv IS NOT NULL AND query.id_concepto_edificio_cerramiento_viv IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_concepto_edificio_cerramiento_ind<>query.id_concepto_edificio_cerramiento_ind OR (tbn1_ku_ds_objetos_titular.id_concepto_edificio_cerramiento_ind IS NULL AND query.id_concepto_edificio_cerramiento_ind IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_concepto_edificio_cerramiento_ind IS NOT NULL AND query.id_concepto_edificio_cerramiento_ind IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_concepto_edificio_suelo<>query.id_concepto_edificio_suelo OR (tbn1_ku_ds_objetos_titular.id_concepto_edificio_suelo IS NULL AND query.id_concepto_edificio_suelo IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_concepto_edificio_suelo IS NOT NULL AND query.id_concepto_edificio_suelo IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_concepto_edificio_carpinteria<>query.id_concepto_edificio_carpinteria OR (tbn1_ku_ds_objetos_titular.id_concepto_edificio_carpinteria IS NULL AND query.id_concepto_edificio_carpinteria IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_concepto_edificio_carpinteria IS NOT NULL AND query.id_concepto_edificio_carpinteria IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_concepto_edificio_protegido<>query.id_concepto_edificio_protegido OR (tbn1_ku_ds_objetos_titular.id_concepto_edificio_protegido IS NULL AND query.id_concepto_edificio_protegido IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_concepto_edificio_protegido IS NOT NULL AND query.id_concepto_edificio_protegido IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_concepto_edificio_instalaciones<>query.id_concepto_edificio_instalaciones OR (tbn1_ku_ds_objetos_titular.id_concepto_edificio_instalaciones IS NULL AND query.id_concepto_edificio_instalaciones IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_concepto_edificio_instalaciones IS NOT NULL AND query.id_concepto_edificio_instalaciones IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_concepto_edificio_singular<>query.id_concepto_edificio_singular OR (tbn1_ku_ds_objetos_titular.id_concepto_edificio_singular IS NULL AND query.id_concepto_edificio_singular IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_concepto_edificio_singular IS NOT NULL AND query.id_concepto_edificio_singular IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_concepto_edificio_turismo<>query.id_concepto_edificio_turismo OR (tbn1_ku_ds_objetos_titular.id_concepto_edificio_turismo IS NULL AND query.id_concepto_edificio_turismo IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_concepto_edificio_turismo IS NOT NULL AND query.id_concepto_edificio_turismo IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_concepto_edificio_cerramiento<>query.id_concepto_edificio_cerramiento OR (tbn1_ku_ds_objetos_titular.id_concepto_edificio_cerramiento IS NULL AND query.id_concepto_edificio_cerramiento IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_concepto_edificio_cerramiento IS NOT NULL AND query.id_concepto_edificio_cerramiento IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_concepto_edificio_historico<>query.id_concepto_edificio_historico OR (tbn1_ku_ds_objetos_titular.id_concepto_edificio_historico IS NULL AND query.id_concepto_edificio_historico IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_concepto_edificio_historico IS NOT NULL AND query.id_concepto_edificio_historico IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_concepto_edificio_aireacond<>query.id_concepto_edificio_aireacond OR (tbn1_ku_ds_objetos_titular.id_concepto_edificio_aireacond IS NULL AND query.id_concepto_edificio_aireacond IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_concepto_edificio_aireacond IS NOT NULL AND query.id_concepto_edificio_aireacond IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_concepto_edificio_estrellas<>query.id_concepto_edificio_estrellas OR (tbn1_ku_ds_objetos_titular.id_concepto_edificio_estrellas IS NULL AND query.id_concepto_edificio_estrellas IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_concepto_edificio_estrellas IS NOT NULL AND query.id_concepto_edificio_estrellas IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_concepto_edificio_edificacion<>query.id_concepto_edificio_edificacion OR (tbn1_ku_ds_objetos_titular.id_concepto_edificio_edificacion IS NULL AND query.id_concepto_edificio_edificacion IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_concepto_edificio_edificacion IS NOT NULL AND query.id_concepto_edificio_edificacion IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_concepto_edificio_estructura<>query.id_concepto_edificio_estructura OR (tbn1_ku_ds_objetos_titular.id_concepto_edificio_estructura IS NULL AND query.id_concepto_edificio_estructura IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_concepto_edificio_estructura IS NOT NULL AND query.id_concepto_edificio_estructura IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_concepto_edificio_luznave<>query.id_concepto_edificio_luznave OR (tbn1_ku_ds_objetos_titular.id_concepto_edificio_luznave IS NULL AND query.id_concepto_edificio_luznave IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_concepto_edificio_luznave IS NOT NULL AND query.id_concepto_edificio_luznave IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_concepto_edificio_solera<>query.id_concepto_edificio_solera OR (tbn1_ku_ds_objetos_titular.id_concepto_edificio_solera IS NULL AND query.id_concepto_edificio_solera IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_concepto_edificio_solera IS NOT NULL AND query.id_concepto_edificio_solera IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_concepto_edificio_forjado<>query.id_concepto_edificio_forjado OR (tbn1_ku_ds_objetos_titular.id_concepto_edificio_forjado IS NULL AND query.id_concepto_edificio_forjado IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_concepto_edificio_forjado IS NOT NULL AND query.id_concepto_edificio_forjado IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_concepto_edificio_altura<>query.id_concepto_edificio_altura OR (tbn1_ku_ds_objetos_titular.id_concepto_edificio_altura IS NULL AND query.id_concepto_edificio_altura IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_concepto_edificio_altura IS NOT NULL AND query.id_concepto_edificio_altura IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_concepto_edificio_elevador<>query.id_concepto_edificio_elevador OR (tbn1_ku_ds_objetos_titular.id_concepto_edificio_elevador IS NULL AND query.id_concepto_edificio_elevador IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_concepto_edificio_elevador IS NOT NULL AND query.id_concepto_edificio_elevador IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_concepto_edificio_grua<>query.id_concepto_edificio_grua OR (tbn1_ku_ds_objetos_titular.id_concepto_edificio_grua IS NULL AND query.id_concepto_edificio_grua IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_concepto_edificio_grua IS NOT NULL AND query.id_concepto_edificio_grua IS NULL)
                    OR tbn1_ku_ds_objetos_titular.tiene_cubierta<>query.tiene_cubierta OR (tbn1_ku_ds_objetos_titular.tiene_cubierta IS NULL AND query.tiene_cubierta IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.tiene_cubierta IS NOT NULL AND query.tiene_cubierta IS NULL)
                    OR tbn1_ku_ds_objetos_titular.tipo_rehabilitacion<>query.tipo_rehabilitacion OR (tbn1_ku_ds_objetos_titular.tipo_rehabilitacion IS NULL AND query.tipo_rehabilitacion IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.tipo_rehabilitacion IS NOT NULL AND query.tipo_rehabilitacion IS NULL)
                    OR tbn1_ku_ds_objetos_titular.valor_suelo_edificio<>query.valor_suelo_edificio OR (tbn1_ku_ds_objetos_titular.valor_suelo_edificio IS NULL AND query.valor_suelo_edificio IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.valor_suelo_edificio IS NOT NULL AND query.valor_suelo_edificio IS NULL)
                    OR tbn1_ku_ds_objetos_titular.valor_construccion_edificio<>query.valor_construccion_edificio OR (tbn1_ku_ds_objetos_titular.valor_construccion_edificio IS NULL AND query.valor_construccion_edificio IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.valor_construccion_edificio IS NOT NULL AND query.valor_construccion_edificio IS NULL)
                    OR tbn1_ku_ds_objetos_titular.categoria_construccion<>query.categoria_construccion OR (tbn1_ku_ds_objetos_titular.categoria_construccion IS NULL AND query.categoria_construccion IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.categoria_construccion IS NOT NULL AND query.categoria_construccion IS NULL)
                    OR tbn1_ku_ds_objetos_titular.fecha_categoria_construccion<>query.fecha_categoria_construccion OR (tbn1_ku_ds_objetos_titular.fecha_categoria_construccion IS NULL AND query.fecha_categoria_construccion IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.fecha_categoria_construccion IS NOT NULL AND query.fecha_categoria_construccion IS NULL)
                    OR tbn1_ku_ds_objetos_titular.modalidad_edificio<>query.modalidad_edificio OR (tbn1_ku_ds_objetos_titular.modalidad_edificio IS NULL AND query.modalidad_edificio IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.modalidad_edificio IS NOT NULL AND query.modalidad_edificio IS NULL)
                    OR tbn1_ku_ds_objetos_titular.rustica_grado_reforma<>query.rustica_grado_reforma OR (tbn1_ku_ds_objetos_titular.rustica_grado_reforma IS NULL AND query.rustica_grado_reforma IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.rustica_grado_reforma IS NOT NULL AND query.rustica_grado_reforma IS NULL)
                    OR tbn1_ku_ds_objetos_titular.rustica_año_calculo<>query.rustica_año_calculo OR (tbn1_ku_ds_objetos_titular.rustica_año_calculo IS NULL AND query.rustica_año_calculo IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.rustica_año_calculo IS NOT NULL AND query.rustica_año_calculo IS NULL)
                    OR tbn1_ku_ds_objetos_titular.rustica_num_instalaciones<>query.rustica_num_instalaciones OR (tbn1_ku_ds_objetos_titular.rustica_num_instalaciones IS NULL AND query.rustica_num_instalaciones IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.rustica_num_instalaciones IS NOT NULL AND query.rustica_num_instalaciones IS NULL)
                    OR tbn1_ku_ds_objetos_titular.rustica_num_cerramientos<>query.rustica_num_cerramientos OR (tbn1_ku_ds_objetos_titular.rustica_num_cerramientos IS NULL AND query.rustica_num_cerramientos IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.rustica_num_cerramientos IS NOT NULL AND query.rustica_num_cerramientos IS NULL)
                    OR tbn1_ku_ds_objetos_titular.anyo_reforma<>query.anyo_reforma OR (tbn1_ku_ds_objetos_titular.anyo_reforma IS NULL AND query.anyo_reforma IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.anyo_reforma IS NOT NULL AND query.anyo_reforma IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_parcela<>query.id_parcela OR (tbn1_ku_ds_objetos_titular.id_parcela IS NULL AND query.id_parcela IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_parcela IS NOT NULL AND query.id_parcela IS NULL)
                    OR tbn1_ku_ds_objetos_titular.cod_poligono<>query.cod_poligono OR (tbn1_ku_ds_objetos_titular.cod_poligono IS NULL AND query.cod_poligono IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.cod_poligono IS NOT NULL AND query.cod_poligono IS NULL)
                    OR tbn1_ku_ds_objetos_titular.cod_manzana<>query.cod_manzana OR (tbn1_ku_ds_objetos_titular.cod_manzana IS NULL AND query.cod_manzana IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.cod_manzana IS NOT NULL AND query.cod_manzana IS NULL)
                    OR tbn1_ku_ds_objetos_titular.cod_parcela<>query.cod_parcela OR (tbn1_ku_ds_objetos_titular.cod_parcela IS NULL AND query.cod_parcela IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.cod_parcela IS NOT NULL AND query.cod_parcela IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_municipio<>query.id_municipio OR (tbn1_ku_ds_objetos_titular.id_municipio IS NULL AND query.id_municipio IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_municipio IS NOT NULL AND query.id_municipio IS NULL)
                    OR tbn1_ku_ds_objetos_titular.coordenada_x<>query.coordenada_x OR (tbn1_ku_ds_objetos_titular.coordenada_x IS NULL AND query.coordenada_x IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.coordenada_x IS NOT NULL AND query.coordenada_x IS NULL)
                    OR tbn1_ku_ds_objetos_titular.coordenada_y<>query.coordenada_y OR (tbn1_ku_ds_objetos_titular.coordenada_y IS NULL AND query.coordenada_y IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.coordenada_y IS NOT NULL AND query.coordenada_y IS NULL)
                    OR tbn1_ku_ds_objetos_titular.numero_plano<>query.numero_plano OR (tbn1_ku_ds_objetos_titular.numero_plano IS NULL AND query.numero_plano IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.numero_plano IS NOT NULL AND query.numero_plano IS NULL)
                    OR tbn1_ku_ds_objetos_titular.posicion_parcela<>query.posicion_parcela OR (tbn1_ku_ds_objetos_titular.posicion_parcela IS NULL AND query.posicion_parcela IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.posicion_parcela IS NOT NULL AND query.posicion_parcela IS NULL)
                    OR tbn1_ku_ds_objetos_titular.superficie_total<>query.superficie_total OR (tbn1_ku_ds_objetos_titular.superficie_total IS NULL AND query.superficie_total IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.superficie_total IS NOT NULL AND query.superficie_total IS NULL)
                    OR tbn1_ku_ds_objetos_titular.num_fachadas<>query.num_fachadas OR (tbn1_ku_ds_objetos_titular.num_fachadas IS NULL AND query.num_fachadas IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.num_fachadas IS NOT NULL AND query.num_fachadas IS NULL)
                    OR tbn1_ku_ds_objetos_titular.servicio_urbanistico_agua<>query.servicio_urbanistico_agua OR (tbn1_ku_ds_objetos_titular.servicio_urbanistico_agua IS NULL AND query.servicio_urbanistico_agua IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.servicio_urbanistico_agua IS NOT NULL AND query.servicio_urbanistico_agua IS NULL)
                    OR tbn1_ku_ds_objetos_titular.servicio_urbanistico_luz<>query.servicio_urbanistico_luz OR (tbn1_ku_ds_objetos_titular.servicio_urbanistico_luz IS NULL AND query.servicio_urbanistico_luz IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.servicio_urbanistico_luz IS NOT NULL AND query.servicio_urbanistico_luz IS NULL)
                    OR tbn1_ku_ds_objetos_titular.servicio_alcantarillado<>query.servicio_alcantarillado OR (tbn1_ku_ds_objetos_titular.servicio_alcantarillado IS NULL AND query.servicio_alcantarillado IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.servicio_alcantarillado IS NOT NULL AND query.servicio_alcantarillado IS NULL)
                    OR tbn1_ku_ds_objetos_titular.servicio_pavimento_calzada<>query.servicio_pavimento_calzada OR (tbn1_ku_ds_objetos_titular.servicio_pavimento_calzada IS NULL AND query.servicio_pavimento_calzada IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.servicio_pavimento_calzada IS NOT NULL AND query.servicio_pavimento_calzada IS NULL)
                    OR tbn1_ku_ds_objetos_titular.servicio_encintado_acero<>query.servicio_encintado_acero OR (tbn1_ku_ds_objetos_titular.servicio_encintado_acero IS NULL AND query.servicio_encintado_acero IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.servicio_encintado_acero IS NOT NULL AND query.servicio_encintado_acero IS NULL)
                    OR tbn1_ku_ds_objetos_titular.es_subedificada<>query.es_subedificada OR (tbn1_ku_ds_objetos_titular.es_subedificada IS NULL AND query.es_subedificada IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.es_subedificada IS NOT NULL AND query.es_subedificada IS NULL)
                    OR tbn1_ku_ds_objetos_titular.edificabilidad<>query.edificabilidad OR (tbn1_ku_ds_objetos_titular.edificabilidad IS NULL AND query.edificabilidad IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.edificabilidad IS NOT NULL AND query.edificabilidad IS NULL)
                    OR tbn1_ku_ds_objetos_titular.fecha_valoracion_parcela<>query.fecha_valoracion_parcela OR (tbn1_ku_ds_objetos_titular.fecha_valoracion_parcela IS NULL AND query.fecha_valoracion_parcela IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.fecha_valoracion_parcela IS NOT NULL AND query.fecha_valoracion_parcela IS NULL)
                    OR tbn1_ku_ds_objetos_titular.valor_catastral_parcela<>query.valor_catastral_parcela OR (tbn1_ku_ds_objetos_titular.valor_catastral_parcela IS NULL AND query.valor_catastral_parcela IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.valor_catastral_parcela IS NOT NULL AND query.valor_catastral_parcela IS NULL)
                    OR tbn1_ku_ds_objetos_titular.valor_construccion_parcela<>query.valor_construccion_parcela OR (tbn1_ku_ds_objetos_titular.valor_construccion_parcela IS NULL AND query.valor_construccion_parcela IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.valor_construccion_parcela IS NOT NULL AND query.valor_construccion_parcela IS NULL)
                    OR tbn1_ku_ds_objetos_titular.valor_suelo_parcela<>query.valor_suelo_parcela OR (tbn1_ku_ds_objetos_titular.valor_suelo_parcela IS NULL AND query.valor_suelo_parcela IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.valor_suelo_parcela IS NOT NULL AND query.valor_suelo_parcela IS NULL)
                    OR tbn1_ku_ds_objetos_titular.fecha_baja_titular<>query.fecha_baja_titular OR (tbn1_ku_ds_objetos_titular.fecha_baja_titular IS NULL AND query.fecha_baja_titular IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.fecha_baja_titular IS NOT NULL AND query.fecha_baja_titular IS NULL)
                    OR tbn1_ku_ds_objetos_titular.nif<>query.nif OR (tbn1_ku_ds_objetos_titular.nif IS NULL AND query.nif IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.nif IS NOT NULL AND query.nif IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_contribuyente<>query.id_contribuyente OR (tbn1_ku_ds_objetos_titular.id_contribuyente IS NULL AND query.id_contribuyente IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_contribuyente IS NOT NULL AND query.id_contribuyente IS NULL)
                    OR tbn1_ku_ds_objetos_titular.discriminante_nif<>query.discriminante_nif OR (tbn1_ku_ds_objetos_titular.discriminante_nif IS NULL AND query.discriminante_nif IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.discriminante_nif IS NOT NULL AND query.discriminante_nif IS NULL)
                    OR tbn1_ku_ds_objetos_titular.tipo_titularidad_bien<>query.tipo_titularidad_bien OR (tbn1_ku_ds_objetos_titular.tipo_titularidad_bien IS NULL AND query.tipo_titularidad_bien IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.tipo_titularidad_bien IS NOT NULL AND query.tipo_titularidad_bien IS NULL)
                    OR tbn1_ku_ds_objetos_titular.nombre_apellidos<>query.nombre_apellidos OR (tbn1_ku_ds_objetos_titular.nombre_apellidos IS NULL AND query.nombre_apellidos IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.nombre_apellidos IS NOT NULL AND query.nombre_apellidos IS NULL)
                    OR tbn1_ku_ds_objetos_titular.tipo_persona_fisica_juridica<>query.tipo_persona_fisica_juridica OR (tbn1_ku_ds_objetos_titular.tipo_persona_fisica_juridica IS NULL AND query.tipo_persona_fisica_juridica IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.tipo_persona_fisica_juridica IS NOT NULL AND query.tipo_persona_fisica_juridica IS NULL)
                    OR tbn1_ku_ds_objetos_titular.tipo_propietario<>query.tipo_propietario OR (tbn1_ku_ds_objetos_titular.tipo_propietario IS NULL AND query.tipo_propietario IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.tipo_propietario IS NOT NULL AND query.tipo_propietario IS NULL)
                    OR tbn1_ku_ds_objetos_titular.es_identificado<>query.es_identificado OR (tbn1_ku_ds_objetos_titular.es_identificado IS NULL AND query.es_identificado IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.es_identificado IS NOT NULL AND query.es_identificado IS NULL)
                    OR tbn1_ku_ds_objetos_titular.fecha_identificacion<>query.fecha_identificacion OR (tbn1_ku_ds_objetos_titular.fecha_identificacion IS NULL AND query.fecha_identificacion IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.fecha_identificacion IS NOT NULL AND query.fecha_identificacion IS NULL)
                    OR tbn1_ku_ds_objetos_titular.coeficiente_participacion_titularidad<>query.coeficiente_participacion_titularidad OR (tbn1_ku_ds_objetos_titular.coeficiente_participacion_titularidad IS NULL AND query.coeficiente_participacion_titularidad IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.coeficiente_participacion_titularidad IS NOT NULL AND query.coeficiente_participacion_titularidad IS NULL)
                    OR tbn1_ku_ds_objetos_titular.fecha_alta_titular<>query.fecha_alta_titular OR (tbn1_ku_ds_objetos_titular.fecha_alta_titular IS NULL AND query.fecha_alta_titular IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.fecha_alta_titular IS NOT NULL AND query.fecha_alta_titular IS NULL)
                    OR tbn1_ku_ds_objetos_titular.programa_alta_titular<>query.programa_alta_titular OR (tbn1_ku_ds_objetos_titular.programa_alta_titular IS NULL AND query.programa_alta_titular IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.programa_alta_titular IS NOT NULL AND query.programa_alta_titular IS NULL)
                    OR tbn1_ku_ds_objetos_titular.numero_transmision_dominio_titular<>query.numero_transmision_dominio_titular OR (tbn1_ku_ds_objetos_titular.numero_transmision_dominio_titular IS NULL AND query.numero_transmision_dominio_titular IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.numero_transmision_dominio_titular IS NOT NULL AND query.numero_transmision_dominio_titular IS NULL)
                    OR tbn1_ku_ds_objetos_titular.fecha_transmision_dominio<>query.fecha_transmision_dominio OR (tbn1_ku_ds_objetos_titular.fecha_transmision_dominio IS NULL AND query.fecha_transmision_dominio IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.fecha_transmision_dominio IS NOT NULL AND query.fecha_transmision_dominio IS NULL)
                    OR tbn1_ku_ds_objetos_titular.num_relacion<>query.num_relacion OR (tbn1_ku_ds_objetos_titular.num_relacion IS NULL AND query.num_relacion IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.num_relacion IS NOT NULL AND query.num_relacion IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_calle_principal<>query.id_calle_principal OR (tbn1_ku_ds_objetos_titular.id_calle_principal IS NULL AND query.id_calle_principal IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_calle_principal IS NOT NULL AND query.id_calle_principal IS NULL)
                    OR tbn1_ku_ds_objetos_titular.longitud_fachada_principal<>query.longitud_fachada_principal OR (tbn1_ku_ds_objetos_titular.longitud_fachada_principal IS NULL AND query.longitud_fachada_principal IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.longitud_fachada_principal IS NOT NULL AND query.longitud_fachada_principal IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_calle_secundaria_1<>query.id_calle_secundaria_1 OR (tbn1_ku_ds_objetos_titular.id_calle_secundaria_1 IS NULL AND query.id_calle_secundaria_1 IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_calle_secundaria_1 IS NOT NULL AND query.id_calle_secundaria_1 IS NULL)
                    OR tbn1_ku_ds_objetos_titular.longitud_calle_secundaria_1<>query.longitud_calle_secundaria_1 OR (tbn1_ku_ds_objetos_titular.longitud_calle_secundaria_1 IS NULL AND query.longitud_calle_secundaria_1 IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.longitud_calle_secundaria_1 IS NOT NULL AND query.longitud_calle_secundaria_1 IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_calle_secundaria_2<>query.id_calle_secundaria_2 OR (tbn1_ku_ds_objetos_titular.id_calle_secundaria_2 IS NULL AND query.id_calle_secundaria_2 IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_calle_secundaria_2 IS NOT NULL AND query.id_calle_secundaria_2 IS NULL)
                    OR tbn1_ku_ds_objetos_titular.longitud_calle_secundaria_2<>query.longitud_calle_secundaria_2 OR (tbn1_ku_ds_objetos_titular.longitud_calle_secundaria_2 IS NULL AND query.longitud_calle_secundaria_2 IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.longitud_calle_secundaria_2 IS NOT NULL AND query.longitud_calle_secundaria_2 IS NULL)
                    OR tbn1_ku_ds_objetos_titular.longitud_galeria_comercial<>query.longitud_galeria_comercial OR (tbn1_ku_ds_objetos_titular.longitud_galeria_comercial IS NULL AND query.longitud_galeria_comercial IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.longitud_galeria_comercial IS NOT NULL AND query.longitud_galeria_comercial IS NULL)
                    OR tbn1_ku_ds_objetos_titular.id_calle_zaguera<>query.id_calle_zaguera OR (tbn1_ku_ds_objetos_titular.id_calle_zaguera IS NULL AND query.id_calle_zaguera IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.id_calle_zaguera IS NOT NULL AND query.id_calle_zaguera IS NULL)
                    OR tbn1_ku_ds_objetos_titular.longitud_zaguera<>query.longitud_zaguera OR (tbn1_ku_ds_objetos_titular.longitud_zaguera IS NULL AND query.longitud_zaguera IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.longitud_zaguera IS NOT NULL AND query.longitud_zaguera IS NULL)
                    OR tbn1_ku_ds_objetos_titular.tiene_acceso_por_portal<>query.tiene_acceso_por_portal OR (tbn1_ku_ds_objetos_titular.tiene_acceso_por_portal IS NULL AND query.tiene_acceso_por_portal IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.tiene_acceso_por_portal IS NOT NULL AND query.tiene_acceso_por_portal IS NULL)
                    OR tbn1_ku_ds_objetos_titular.es_local_interior<>query.es_local_interior OR (tbn1_ku_ds_objetos_titular.es_local_interior IS NULL AND query.es_local_interior IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.es_local_interior IS NOT NULL AND query.es_local_interior IS NULL)
                    OR tbn1_ku_ds_objetos_titular.altura_libre_local<>query.altura_libre_local OR (tbn1_ku_ds_objetos_titular.altura_libre_local IS NULL AND query.altura_libre_local IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.altura_libre_local IS NOT NULL AND query.altura_libre_local IS NULL)
                    OR tbn1_ku_ds_objetos_titular.altura_local_respecto_rasante<>query.altura_local_respecto_rasante OR (tbn1_ku_ds_objetos_titular.altura_local_respecto_rasante IS NULL AND query.altura_local_respecto_rasante IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.altura_local_respecto_rasante IS NOT NULL AND query.altura_local_respecto_rasante IS NULL)
                    OR tbn1_ku_ds_objetos_titular.num_real_parcelas<>query.num_real_parcelas OR (tbn1_ku_ds_objetos_titular.num_real_parcelas IS NULL AND query.num_real_parcelas IS NOT NULL) OR  (tbn1_ku_ds_objetos_titular.num_real_parcelas IS NOT NULL AND query.num_real_parcelas IS NULL)
                    OR (fec_baja IS NOT NULL))) THEN
    UPDATE SET
      escalera_planta_mano_puerta=query.escalera_planta_mano_puerta,
      id_uso_objeto=query.id_uso_objeto,
      id_clase_objeto=query.id_clase_objeto,
      id_modalidad_catastro_objeto=query.id_modalidad_catastro_objeto,
      orden=query.orden,
      num_cargo_parcela=query.num_cargo_parcela,
      posicion_objeto=query.posicion_objeto,
      actividad_dedicada=query.actividad_dedicada,
      coeficiente_participacion_comunes=query.coeficiente_participacion_comunes,
      valor_catastral_objeto=query.valor_catastral_objeto,
      valor_suelo_objeto=query.valor_suelo_objeto,
      valor_construido_objeto=query.valor_construido_objeto,
	  superficie_planta=query.superficie_planta,
	  superficie_objeto=query.superficie_objeto,
      id_edificio=query.id_edificio,
      cod_municipio=query.cod_municipio,
      cod_calle=query.cod_calle,
      num_portal=query.num_portal,
      id_calle=query.id_calle,
      id_portal=query.id_portal,
      id_uso_edificio=query.id_uso_edificio,
      id_clase_edificio=query.id_clase_edificio,
      id_modalidad_catastro_edificio=query.id_modalidad_catastro_edificio,
      tipo_registro_edificio=query.tipo_registro_edificio,
      num_edificio=query.num_edificio,
      posicion_edificio=query.posicion_edificio,
      superficie_sobre_rasante=query.superficie_sobre_rasante,
      superficie_descubierta_urbanizada=query.superficie_descubierta_urbanizada,
      anyo_construccion=query.anyo_construccion,
      grado_conservacion=query.grado_conservacion,
      es_caserio_rural=query.es_caserio_rural,
      participacion=query.participacion,
      fecha_baja_edificio=query.fecha_baja_edificio,
      fecha_valoracion_edificio=query.fecha_valoracion_edificio,
      valor_catastral_edificio=query.valor_catastral_edificio,
      anyo_rehabilitacion=query.anyo_rehabilitacion,
      num_vvdas_coeficiente_ascensor=query.num_vvdas_coeficiente_ascensor,
      id_concepto_edificio_ascensor=query.id_concepto_edificio_ascensor,
      id_concepto_edificio_calefaccion=query.id_concepto_edificio_calefaccion,
      id_concepto_edificio_banos=query.id_concepto_edificio_banos,
      id_concepto_edificio_amplitud=query.id_concepto_edificio_amplitud,
      id_concepto_edificio_portero=query.id_concepto_edificio_portero,
      id_concepto_edificio_cerramiento_viv=query.id_concepto_edificio_cerramiento_viv,
      id_concepto_edificio_cerramiento_ind=query.id_concepto_edificio_cerramiento_ind,
      id_concepto_edificio_suelo=query.id_concepto_edificio_suelo,
      id_concepto_edificio_carpinteria=query.id_concepto_edificio_carpinteria,
      id_concepto_edificio_protegido=query.id_concepto_edificio_protegido,
      id_concepto_edificio_instalaciones=query.id_concepto_edificio_instalaciones,
      id_concepto_edificio_singular=query.id_concepto_edificio_singular,
      id_concepto_edificio_turismo=query.id_concepto_edificio_turismo,
      id_concepto_edificio_cerramiento=query.id_concepto_edificio_cerramiento,
      id_concepto_edificio_historico=query.id_concepto_edificio_historico,
      id_concepto_edificio_aireacond=query.id_concepto_edificio_aireacond,
      id_concepto_edificio_estrellas=query.id_concepto_edificio_estrellas,
      id_concepto_edificio_edificacion=query.id_concepto_edificio_edificacion,
      id_concepto_edificio_estructura=query.id_concepto_edificio_estructura,
      id_concepto_edificio_luznave=query.id_concepto_edificio_luznave,
      id_concepto_edificio_solera=query.id_concepto_edificio_solera,
      id_concepto_edificio_forjado=query.id_concepto_edificio_forjado,
      id_concepto_edificio_altura=query.id_concepto_edificio_altura,
      id_concepto_edificio_elevador=query.id_concepto_edificio_elevador,
      id_concepto_edificio_grua=query.id_concepto_edificio_grua,
      tiene_cubierta=query.tiene_cubierta,
      tipo_rehabilitacion=query.tipo_rehabilitacion,
      valor_suelo_edificio=query.valor_suelo_edificio,
      valor_construccion_edificio=query.valor_construccion_edificio,
      categoria_construccion=query.categoria_construccion,
      fecha_categoria_construccion=query.fecha_categoria_construccion,
      modalidad_edificio=query.modalidad_edificio,
      rustica_grado_reforma=query.rustica_grado_reforma,
      rustica_año_calculo=query.rustica_año_calculo,
      rustica_num_instalaciones=query.rustica_num_instalaciones,
      rustica_num_cerramientos=query.rustica_num_cerramientos,
      anyo_reforma=query.anyo_reforma,
      id_parcela=query.id_parcela,
      cod_poligono=query.cod_poligono,
      cod_manzana=query.cod_manzana,
      cod_parcela=query.cod_parcela,
      id_municipio=query.id_municipio,
      coordenada_x=query.coordenada_x,
      coordenada_y=query.coordenada_y,
      numero_plano=query.numero_plano,
      posicion_parcela=query.posicion_parcela,
      superficie_total=query.superficie_total,
      num_fachadas=query.num_fachadas,
      servicio_urbanistico_agua=query.servicio_urbanistico_agua,
      servicio_urbanistico_luz=query.servicio_urbanistico_luz,
      servicio_alcantarillado=query.servicio_alcantarillado,
      servicio_pavimento_calzada=query.servicio_pavimento_calzada,
      servicio_encintado_acero=query.servicio_encintado_acero,
      es_subedificada=query.es_subedificada,
      edificabilidad=query.edificabilidad,
      fecha_valoracion_parcela=query.fecha_valoracion_parcela,
      valor_catastral_parcela=query.valor_catastral_parcela,
      valor_construccion_parcela=query.valor_construccion_parcela,
      valor_suelo_parcela=query.valor_suelo_parcela,
      fecha_baja_titular=query.fecha_baja_titular,
      nif=query.nif,
      id_contribuyente=query.id_contribuyente,
      discriminante_nif=query.discriminante_nif,
      tipo_titularidad_bien=query.tipo_titularidad_bien,
      nombre_apellidos=query.nombre_apellidos,
      tipo_persona_fisica_juridica=query.tipo_persona_fisica_juridica,
      tipo_propietario=query.tipo_propietario,
      es_identificado=query.es_identificado,
      fecha_identificacion=query.fecha_identificacion,
      coeficiente_participacion_titularidad=query.coeficiente_participacion_titularidad,
      fecha_alta_titular=query.fecha_alta_titular,
      programa_alta_titular=query.programa_alta_titular,
      numero_transmision_dominio_titular=query.numero_transmision_dominio_titular,
      fecha_transmision_dominio=query.fecha_transmision_dominio,
      num_relacion=query.num_relacion,
      id_calle_principal=query.id_calle_principal,
      longitud_fachada_principal=query.longitud_fachada_principal,
      id_calle_secundaria_1=query.id_calle_secundaria_1,
      longitud_calle_secundaria_1=query.longitud_calle_secundaria_1,
      id_calle_secundaria_2=query.id_calle_secundaria_2,
      longitud_calle_secundaria_2=query.longitud_calle_secundaria_2,
      longitud_galeria_comercial=query.longitud_galeria_comercial,
      id_calle_zaguera=query.id_calle_zaguera,
      longitud_zaguera=query.longitud_zaguera,
      tiene_acceso_por_portal=query.tiene_acceso_por_portal,
      es_local_interior=query.es_local_interior,
      altura_libre_local=query.altura_libre_local,
      altura_local_respecto_rasante=query.altura_local_respecto_rasante,
      num_real_parcelas=query.num_real_parcelas,
      fec_modificacion=getdate(),
      fec_baja=null
  WHEN NOT MATCHED THEN
    INSERT (origen,numero_fijo,letra_fija,indicador_desagregacion,escalera_planta_mano_puerta,id_uso_objeto,id_clase_objeto,id_modalidad_catastro_objeto,orden,num_cargo_parcela,posicion_objeto,actividad_dedicada,coeficiente_participacion_comunes,valor_catastral_objeto,valor_suelo_objeto,valor_construido_objeto,superficie_planta,superficie_objeto,id_edificio,cod_municipio,cod_calle,num_portal,id_calle,id_portal,id_uso_edificio,id_clase_edificio,id_modalidad_catastro_edificio,tipo_registro_edificio,num_edificio,posicion_edificio,superficie_sobre_rasante,superficie_descubierta_urbanizada,anyo_construccion,grado_conservacion,es_caserio_rural,participacion,fecha_baja_edificio,fecha_valoracion_edificio,valor_catastral_edificio,anyo_rehabilitacion,num_vvdas_coeficiente_ascensor,id_concepto_edificio_ascensor,id_concepto_edificio_calefaccion,id_concepto_edificio_banos,id_concepto_edificio_amplitud,id_concepto_edificio_portero,id_concepto_edificio_cerramiento_viv,id_concepto_edificio_cerramiento_ind,id_concepto_edificio_suelo,id_concepto_edificio_carpinteria,id_concepto_edificio_protegido,id_concepto_edificio_instalaciones,id_concepto_edificio_singular,id_concepto_edificio_turismo,id_concepto_edificio_cerramiento,id_concepto_edificio_historico,id_concepto_edificio_aireacond,id_concepto_edificio_estrellas,id_concepto_edificio_edificacion,id_concepto_edificio_estructura,id_concepto_edificio_luznave,id_concepto_edificio_solera,id_concepto_edificio_forjado,id_concepto_edificio_altura,id_concepto_edificio_elevador,id_concepto_edificio_grua,tiene_cubierta,tipo_rehabilitacion,valor_suelo_edificio,valor_construccion_edificio,categoria_construccion,fecha_categoria_construccion,modalidad_edificio,rustica_grado_reforma,rustica_año_calculo,rustica_num_instalaciones,rustica_num_cerramientos,anyo_reforma,id_parcela,cod_poligono,cod_manzana,cod_parcela,id_municipio,coordenada_x,coordenada_y,numero_plano,posicion_parcela,superficie_total,num_fachadas,servicio_urbanistico_agua,servicio_urbanistico_luz,servicio_alcantarillado,servicio_pavimento_calzada,servicio_encintado_acero,es_subedificada,edificabilidad,fecha_valoracion_parcela,valor_catastral_parcela,valor_construccion_parcela,valor_suelo_parcela,secuencia_propietario,fecha_baja_titular,nif,id_contribuyente,discriminante_nif,tipo_titularidad_bien,nombre_apellidos,tipo_persona_fisica_juridica,tipo_propietario,es_identificado,fecha_identificacion,coeficiente_participacion_titularidad,fecha_alta_titular,programa_alta_titular,numero_transmision_dominio_titular,fecha_transmision_dominio,num_relacion,id_calle_principal,longitud_fachada_principal,id_calle_secundaria_1,longitud_calle_secundaria_1,id_calle_secundaria_2,longitud_calle_secundaria_2,longitud_galeria_comercial,id_calle_zaguera,longitud_zaguera,tiene_acceso_por_portal,es_local_interior,altura_libre_local,altura_local_respecto_rasante,num_real_parcelas,fec_alta,fec_modificacion) VALUES (
      query.origen,
      query.numero_fijo,
      query.letra_fija,
      query.indicador_desagregacion,
      query.escalera_planta_mano_puerta,
      query.id_uso_objeto,
      query.id_clase_objeto,
      query.id_modalidad_catastro_objeto,
      query.orden,
      query.num_cargo_parcela,
      query.posicion_objeto,
      query.actividad_dedicada,
      query.coeficiente_participacion_comunes,
      query.valor_catastral_objeto,
      query.valor_suelo_objeto,
      query.valor_construido_objeto,
	  query.superficie_planta,
	  query.superficie_objeto,
      query.id_edificio,
      query.cod_municipio,
      query.cod_calle,
      query.num_portal,
      query.id_calle,
      query.id_portal,
      query.id_uso_edificio,
      query.id_clase_edificio,
      query.id_modalidad_catastro_edificio,
      query.tipo_registro_edificio,
      query.num_edificio,
      query.posicion_edificio,
      query.superficie_sobre_rasante,
      query.superficie_descubierta_urbanizada,
      query.anyo_construccion,
      query.grado_conservacion,
      query.es_caserio_rural,
      query.participacion,
      query.fecha_baja_edificio,
      query.fecha_valoracion_edificio,
      query.valor_catastral_edificio,
      query.anyo_rehabilitacion,
      query.num_vvdas_coeficiente_ascensor,
      query.id_concepto_edificio_ascensor,
      query.id_concepto_edificio_calefaccion,
      query.id_concepto_edificio_banos,
      query.id_concepto_edificio_amplitud,
      query.id_concepto_edificio_portero,
      query.id_concepto_edificio_cerramiento_viv,
      query.id_concepto_edificio_cerramiento_ind,
      query.id_concepto_edificio_suelo,
      query.id_concepto_edificio_carpinteria,
      query.id_concepto_edificio_protegido,
      query.id_concepto_edificio_instalaciones,
      query.id_concepto_edificio_singular,
      query.id_concepto_edificio_turismo,
      query.id_concepto_edificio_cerramiento,
      query.id_concepto_edificio_historico,
      query.id_concepto_edificio_aireacond,
      query.id_concepto_edificio_estrellas,
      query.id_concepto_edificio_edificacion,
      query.id_concepto_edificio_estructura,
      query.id_concepto_edificio_luznave,
      query.id_concepto_edificio_solera,
      query.id_concepto_edificio_forjado,
      query.id_concepto_edificio_altura,
      query.id_concepto_edificio_elevador,
      query.id_concepto_edificio_grua,
      query.tiene_cubierta,
      query.tipo_rehabilitacion,
      query.valor_suelo_edificio,
      query.valor_construccion_edificio,
      query.categoria_construccion,
      query.fecha_categoria_construccion,
      query.modalidad_edificio,
      query.rustica_grado_reforma,
      query.rustica_año_calculo,
      query.rustica_num_instalaciones,
      query.rustica_num_cerramientos,
      query.anyo_reforma,
      query.id_parcela,
      query.cod_poligono,
      query.cod_manzana,
      query.cod_parcela,
      query.id_municipio,
      query.coordenada_x,
      query.coordenada_y,
      query.numero_plano,
      query.posicion_parcela,
      query.superficie_total,
      query.num_fachadas,
      query.servicio_urbanistico_agua,
      query.servicio_urbanistico_luz,
      query.servicio_alcantarillado,
      query.servicio_pavimento_calzada,
      query.servicio_encintado_acero,
      query.es_subedificada,
      query.edificabilidad,
      query.fecha_valoracion_parcela,
      query.valor_catastral_parcela,
      query.valor_construccion_parcela,
      query.valor_suelo_parcela,
      query.secuencia_propietario,
      query.fecha_baja_titular,
      query.nif,
      query.id_contribuyente,
      query.discriminante_nif,
      query.tipo_titularidad_bien,
      query.nombre_apellidos,
      query.tipo_persona_fisica_juridica,
      query.tipo_propietario,
      query.es_identificado,
      query.fecha_identificacion,
      query.coeficiente_participacion_titularidad,
      query.fecha_alta_titular,
      query.programa_alta_titular,
      query.numero_transmision_dominio_titular,
      query.fecha_transmision_dominio,
      query.num_relacion,
      query.id_calle_principal,
      query.longitud_fachada_principal,
      query.id_calle_secundaria_1,
      query.longitud_calle_secundaria_1,
      query.id_calle_secundaria_2,
      query.longitud_calle_secundaria_2,
      query.longitud_galeria_comercial,
      query.id_calle_zaguera,
      query.longitud_zaguera,
      query.tiene_acceso_por_portal,
      query.es_local_interior,
      query.altura_libre_local,
      query.altura_local_respecto_rasante,
      query.num_real_parcelas,
      getdate(),
      getdate())
  WHEN NOT MATCHED BY SOURCE AND (fec_baja IS NULL) THEN
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

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_ku_ds' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_ku_ds;
GO

CREATE PROCEDURE dbo.spn1_cargar_ku_ds(@logpadre int) AS
BEGIN

  DECLARE @procedure_name varchar(100)='dbn1_stg_dhyf.dbo.spn1_cargar_ku_ds'
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

  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_ku_maestros @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_parcelas @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_parcelas_integridad_edificios @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_edificios @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_edificios_integridad_plantas @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_ds_objetos_titular @log;
--  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_ku_ds_plantas @log;

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

