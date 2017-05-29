CREATE OR ALTER PROCEDURE UPDATE_ID_MICROSIP RETURNS (V_ID INTEGER, V_NOMBRE VARCHAR(100))
AS DECLARE lcComando varchar(5000);
BEGIN
      lcComando = 'select c.CLIENTE_ID, c.NOMBRE from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE in (select trim(replace(replace(replace(replace(replace(replace(s.NOMBRE_CLIENTE,' || '''' ||  '┴' || '''' || ',' || '''' || 'A' || '''' || '),' || '''' || '╔' || '''' || ',' || '''' || 'E' || '''' || '),' || '''' || '═' || '''' || ',' || '''' || 'I' || '''' || '),' ||'''' ||'Ð'|| '''' || ',' || ''''||  'Ñ' ||'''' || '),'||''''|| 'Ë'||''''|| ',' || '''' ||'O'||''''||'),'||''''|| '┌' ||''''||', '||''''||'U'||''''|| '))  from SERIES_VENDIDOS_PRI_TODOS s where s.CLIENTE_ID_MICROSIP is null) order by c.NOMBRE;';
      --trim(replace(replace(replace(replace(replace(replace(s.NOMBRE_CLIENTE,  '┴', 'A'), '╔', 'E'),'═','I'),'Ð','Ñ'), 'Ë','O'), '┌', 'U'))
FOR EXECUTE STATEMENT lcComando
      
into :V_ID, :V_NOMBRE
   DO BEGIN
      --insert into SETTINGS values ( (select max(t.ID)+1  from SETTINGS t ), :V_ID, :V_NOMBRE );
      update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = :V_ID where trim(replace(replace(replace(replace(replace(replace(s.NOMBRE_CLIENTE,  '┴', 'A'), '╔', 'E'),'═','I'),'Ð','Ñ'), 'Ë','O'), '┌', 'U')) = :V_NOMBRE;
    
    SUSPEND;
   END

 END

