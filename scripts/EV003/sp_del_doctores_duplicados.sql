CREATE OR ALTER PROCEDURE DEL_DOCTORES_DUPLICADOS RETURNS (V_CONTACTO_ID INTEGER)
AS DECLARE lcComando varchar(5000);
DECLARE VARIABLE V_FECHAULTSERVCLIENTE DATE;
declare variable v_descripcion varchar(500);
declare variable v_inventario_id integer;
BEGIN
      -- NOTA: 1o hacer una prueba con los contactos 257068, 257328,257043, revisar y luego ya con todos
      --lcComando = 'select  max(l.FECHAULTSERVCLIENTE), c.CONTACTO_id from INVENTARIOS i inner join LIBRES_INVENTARIOS l on i.INVENTARIO_ID = l.INVENTARIO_ID inner join INVENTARIOS_CLIENTES t on t.INVENTARIO_ID = i.INVENTARIO_ID inner join CONTACTO_CONTACTOS c on c.CONTACTO_ID = t.CONTACTO_ID where l.FECHAULTSERVCLIENTE is not null and c.CONTACTO_ID in (159145) group by c.CONTACTO_ID';
      lcComando = 'select c.CONTACTO_ID from CONTACTO_CONTACTOS c where c.NOMBRE like ' || '''' || '%DR.%' || '''' || ' or c.NOMBRE like ' || '''' || '%DRA.%' || '''' || ' order by c.CONTACTO_CONTACTO_ID desc';

FOR EXECUTE STATEMENT lcComando
      
into  :V_CONTACTO_ID
   DO BEGIN
    delete from CONTACTO_CONTACTOS c where c.CONTACTO_ID = :V_CONTACTO_ID and c.TIPO_CONTACTO_CONTACTO_ID <> 5493 ;
    SUSPEND;
   END

 END

