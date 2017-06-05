CREATE OR ALTER PROCEDURE UPDATE_ALL_CLI_COMPLE RETURNS (V_CLIENTE_ID integer)
AS DECLARE lcComando varchar(5000);
DECLARE	V_GIRO_ID INTEGER;
DECLARE	V_CALIFICACION_ID INTEGER;
DECLARE	V_ORIGEN_ID INTEGER;
DECLARE	V_CON_IMPUESTO VARCHAR(1);
DECLARE	V_NOMBRE_COMERCIAL VARCHAR(100);
DECLARE	V_RESPETAR_VENDEDOR VARCHAR(1);
DECLARE	V_FECHA_ULT_ACCION DATE;
DECLARE	V_ULT_ACCION_TAREA_ID INTEGER;
DECLARE	V_CLIENTE_MATRIZ_ID INTEGER;
DECLARE	V_FECHA_CONVERSION DATE;
DECLARE	V_TIPO_ORGANIZACION_ID INTEGER;
DECLARE	V_HABILITAR_POLITICA_PRECIOS_ART CHAR(1);
DECLARE	V_LIGADO_A_ORGANIZACION CHAR(1);
DECLARE	V_CONTACTO_CONTACTO_ULT_ID INTEGER;
DECLARE	V_VENDEDOR_ID INTEGER;
BEGIN
      lcComando = ' select CLIENTE_ID,GIRO_ID,CALIFICACION_ID,ORIGEN_ID,CON_IMPUESTO,NOMBRE_COMERCIAL,RESPETAR_VENDEDOR,FECHA_ULT_ACCION,ULT_ACCION_TAREA_ID,CLIENTE_MATRIZ_ID,FECHA_CONVERSION,TIPO_ORGANIZACION_ID,HABILITAR_POLITICA_PRECIOS_ART,LIGADO_A_ORGANIZACION,CONTACTO_CONTACTO_ULT_ID,VENDEDOR_ID from CLIENTES_COMPLEMENTOS_VENDOR_2';
 FOR EXECUTE STATEMENT lcComando
      
into :V_CLIENTE_ID, :V_GIRO_ID,:V_CALIFICACION_ID,:V_ORIGEN_ID,:V_CON_IMPUESTO ,
	:V_NOMBRE_COMERCIAL ,	:V_RESPETAR_VENDEDOR ,	:V_FECHA_ULT_ACCION ,	:V_ULT_ACCION_TAREA_ID ,
	:V_CLIENTE_MATRIZ_ID ,	:V_FECHA_CONVERSION ,	:V_TIPO_ORGANIZACION_ID ,	:V_HABILITAR_POLITICA_PRECIOS_ART,
	:V_LIGADO_A_ORGANIZACION ,	:V_CONTACTO_CONTACTO_ULT_ID,	:V_VENDEDOR_ID

   DO BEGIN
      update CLIENTES_COMPLEMENTOS c set c.GIRO_ID = :V_GIRO_ID,
      c.CALIFICACION_ID=:V_CALIFICACION_ID,c.ORIGEN_ID=:V_ORIGEN_ID,c.CON_IMPUESTO=:V_CON_IMPUESTO ,
	c.NOMBRE_COMERCIAL=:V_NOMBRE_COMERCIAL ,	c.RESPETAR_VENDEDOR=:V_RESPETAR_VENDEDOR ,	c.FECHA_ULT_ACCION=:V_FECHA_ULT_ACCION ,	c.ULT_ACCION_TAREA_ID=:V_ULT_ACCION_TAREA_ID ,
	c.CLIENTE_MATRIZ_ID=:V_CLIENTE_MATRIZ_ID ,	c.FECHA_CONVERSION=:V_FECHA_CONVERSION ,	c.TIPO_ORGANIZACION_ID=:V_TIPO_ORGANIZACION_ID ,c.HABILITAR_POLITICA_PRECIOS_ART=	:V_HABILITAR_POLITICA_PRECIOS_ART,
	c.LIGADO_A_ORGANIZACION=:V_LIGADO_A_ORGANIZACION ,	c.CONTACTO_CONTACTO_ULT_ID=:V_CONTACTO_CONTACTO_ULT_ID,	c.VENDEDOR_ID=:V_VENDEDOR_ID
	where c.CLIENTE_ID = :V_CLIENTE_ID;
    
    SUSPEND;
   END

 END