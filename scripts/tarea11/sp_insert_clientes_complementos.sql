CREATE OR ALTER PROCEDURE INSERT_CLIENTES_COMPLEMENTOS RETURNS (V_CLIENTE VARCHAR(20))
AS DECLARE lcComando varchar(5000);
DECLARE VARIABLE V_CLIENTE_ID varchar(20);
DECLARE VARIABLE V_CONTACTO_ID integer;
declare variable V_NOMBRE varchar(500);
declare variable v_inventario_id integer;
declare variable V_VENDEDOR_ID integer;
BEGIN
      lcComando = 'select coalesce(c.CLIENTE_ID,' || '''' || 'VACIO' || '''' || '),  t.CONTACTO_ID, t.NOMBRE from CLIENTES_COMPLEMENTOS c right outer join CONTACTO_CONTACTOS t on c.CLIENTE_ID=t.CONTACTO_ID  order by c.CLIENTE_ID';
--      lcComando = 'select coalesce(c.CLIENTE_ID,' || '''' || 'VACIO' || '''' || '),  t.CONTACTO_ID, t.NOMBRE from CLIENTES_COMPLEMENTOS c right outer join CONTACTO_CONTACTOS t on c.CLIENTE_ID=t.CONTACTO_ID where t.contacto_id =146647  order by c.CLIENTE_ID';
      
FOR EXECUTE STATEMENT lcComando
      
into :V_CLIENTE_ID, :V_CONTACTO_ID, :V_NOMBRE
   DO BEGIN

        if (V_CLIENTE_ID = 'VACIO') then 
          IF (EXISTS(SELECT * from CLIENTES_COMPLEMENTOS c where c.NOMBRE_COMERCIAL = :V_NOMBRE )) THEN
            insert into SETTINGS values ((select max(s.ID) + 1 from SETTINGS s), :V_CONTACTO_ID, :V_NOMBRE);
          ELSE
            INSERT INTO CLIENTES_COMPLEMENTOS (CLIENTE_ID, GIRO_ID, CALIFICACION_ID, ORIGEN_ID, CON_IMPUESTO, NOMBRE_COMERCIAL, RESPETAR_VENDEDOR, FECHA_ULT_ACCION, ULT_ACCION_TAREA_ID, CLIENTE_MATRIZ_ID, FECHA_CONVERSION, TIPO_ORGANIZACION_ID, 	HABILITAR_POLITICA_PRECIOS_ART, LIGADO_A_ORGANIZACION, CONTACTO_CONTACTO_ULT_ID, VENDEDOR_ID)
            VALUES (:V_CONTACTO_ID,null ,null ,null , 'N',  :V_NOMBRE  , 'N', NULL,NULL ,NULL , NULL,1 , NULL, 'N',NULL ,(select first 1 v.VENDEDOR_ID from CLIENTES_COMPLEMENTOS_VENDOR v where v.CONTACTO_ID =:V_CONTACTO_ID) );
    
      
    V_CLIENTE=V_CONTACTO_ID;
    SUSPEND;
   END

END

