SET TERM ^ ;
ALTER PROCEDURE INSERT_CONTACTOS
RETURNS (
    V_CLIENTE_ID integer,
    V_NOMBRE varchar(100) )
AS
DECLARE VARIABLE lcComando VARCHAR(128);
BEGIN
      lcComando = 'SELECT CLIENTE_ID, NOMBRE FROM CLIENTES';
FOR EXECUTE STATEMENT lcComando
   ON EXTERNAL DATA SOURCE '/var/lib/firebird/2.5/data/AUDIMED.FDB'
   AS USER 'SYSDBA'
   PASSWORD 'new_root'
   INTO
      :v_cliente_id,
      :v_nombre
      
   DO BEGIN
      if (not exists(select * from CONTACTO_CONTACTOS c where 
        c.NOMBRE = :v_nombre and c.CONTACTO_ID = :v_cliente_id and c.TIPO_CONTACTO_CONTACTO_ID = 4748))
      then insert into CONTACTO_CONTACTOS 
          (contacto_contacto_id, contacto_id, nombre, titulo, puesto, telefono, comentarios, cumple_mes, cumple_dia, 
          celular, tipo_contacto_contacto_id) values 
          ((select max(c.CONTACTO_CONTACTO_ID)+1 from CONTACTO_CONTACTOS c) ,:v_cliente_id, :v_nombre, null, null, null, null, null, null,
          null, 4748);
      SUSPEND;
   END
 END^
SET TERM ; ^


GRANT EXECUTE
 ON PROCEDURE INSERT_CONTACTOS TO  SYSDBA;


