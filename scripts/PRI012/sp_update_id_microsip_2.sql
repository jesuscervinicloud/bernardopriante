CREATE OR ALTER PROCEDURE UPDATE_ID_MICROSIP_2 RETURNS (V_ID INTEGER, V_NOMBRE VARCHAR(100))
AS DECLARE lcComando varchar(5000);

BEGIN
      lcComando = 'select distinct trim(replace(replace(replace(replace(replace(replace(s.NOMBRE_CLIENTE,' || '''' ||  '┴' || '''' || ',' || '''' || 'A' || '''' || '),' || '''' || '╔' || '''' || ',' || '''' || 'E' || '''' || '),' || '''' || '═' || '''' || ',' || '''' || 'I' || '''' || '),' ||'''' ||'Ð'|| '''' || ',' || ''''||  'Ñ' ||'''' || '),'||''''|| 'Ë'||''''|| ',' || '''' ||'O'||''''||'),'||''''|| '┌' ||''''||', '||''''||'U'||''''|| '))  from SERIES_VENDIDOS_PRI_TODOS s where s.CLIENTE_ID_MICROSIP is null order by s.NOMBRE_CLIENTE;';
      
FOR EXECUTE STATEMENT lcComando
      
into :V_NOMBRE
   DO BEGIN
      V_ID = null;
      select first 1 c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%' || :V_NOMBRE || '%' into :V_ID; 
      update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = :V_ID where trim(replace(replace(replace(replace(replace(replace(s.NOMBRE_CLIENTE,  '┴', 'A'), '╔', 'E'),'═','I'),'Ð','Ñ'), 'Ë','O'), '┌', 'U')) = :V_NOMBRE;
    
    SUSPEND;
   END

 END

