SET TERM ^ ;
ALTER PROCEDURE INSERT_CONSIGNATARIOS
RETURNS (
    V_CLIENTE_ID integer,
    V_NOMBRE_CONSIG varchar(100),
    V_TELEFONO1 varchar(100),
    V_TELEFONO2 varchar(100) )
AS
declare variable lccomando varchar(128);
BEGIN
      lcComando = 'SELECT CLIENTE_ID, NOMBRE_CONSIG, TELEFONO1, TELEFONO2 FROM DIRS_CLIENTES WHERE CLIENTE_ID IN (166102, 166159, 151966, 165793)';
FOR EXECUTE STATEMENT lcComando
   ON EXTERNAL DATA SOURCE '/var/lib/firebird/2.5/data/AUDIMED.FDB'
   AS USER 'SYSDBA'
   PASSWORD 'new_root'
   INTO
      :v_cliente_id,
      :v_nombre_consig,
      :v_telefono1,
      :v_telefono2
      
   DO BEGIN
      if (not exists(select * from CONTACTO_CONTACTOS c where 
        c.NOMBRE = :v_nombre_consig and c.CONTACTO_ID = :v_cliente_id and c.TIPO_CONTACTO_CONTACTO_ID = 4748))
      then insert into CONTACTO_CONTACTOS 
          (contacto_contacto_id, contacto_id, nombre, titulo, puesto, telefono, comentarios, cumple_mes, cumple_dia, 
          celular, tipo_contacto_contacto_id) values 
          ((select max(c.CONTACTO_CONTACTO_ID)+1 from CONTACTO_CONTACTOS c) ,:v_cliente_id, :v_nombre_consig, null, null, :v_telefono1, null, null, null,
          :v_telefono2, 4748);
      SUSPEND;
   END
 ENd^
SET TERM ; ^


GRANT EXECUTE
 ON PROCEDURE INSERT_CONSIGNATARIOS TO  SYSDBA;


