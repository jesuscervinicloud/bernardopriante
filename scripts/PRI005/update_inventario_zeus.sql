CREATE OR ALTER PROCEDURE UPDATE_INVENTARIO_ZEUS (P_OLD_NO_CONTROL VARCHAR(30), P_NEW_NO_CONTROL VARCHAR(30), P_VIGENCIA_INICIO DATE)
AS declare variable path_bd_zeus varchar(1000);
  declare variable username varchar(50);	
  declare variable password varchar(50);
  declare variable v_consulta varchar(5000);
BEGIN
 
select s."VALUE" from SETTINGS s where s.KEY = 'path_bd_zeus' into :path_bd_zeus ;
    select s."VALUE" from SETTINGS s where s.KEY = 'username' into :username ;
    select s."VALUE" from SETTINGS s where s.KEY = 'password' into :password ;

--update INVENTARIOS set DESCRIPCION_INTERNA = (select trim(i.NO_CONTROL) || ' / ' ||  trim(l.MODELO_APARATO)|| ' / ' || l.FECHA_DE_VENTA || ' / ' || l.NUMERO_ULTIMA_POLIZA  || ' / ' || trim(coalesce(l.CONTACTO,'')) || ' / ' || trim(coalesce(l.CODIGO_CONTACTO,'')) || ' / ' || coalesce(l.FECHAULTSERVSERIE,'') || ' / ' || coalesce(l.FECHAULTSERVCLIENTE,'') || ' / ' || COALESCE(l.FECULTSERVCOBRA,'') || ' / ' || coalesce(l.CALIFLLAMSERCOBRA,'') from inventarios i inner join LIBRES_INVENTARIOS l on i.INVENTARIO_ID = l.INVENTARIO_ID where l.INVENTARIO_ID = (select first 1 i.INVENTARIO_ID from INVENTARIOS i where i.NO_CONTROL = 'R-312219' ) ) where INVENTARIO_ID = (select first 1 i.INVENTARIO_ID from INVENTARIOS i where i.NO_CONTROL = 'R-312219' );


  IF (P_NEW_NO_CONTROL <> '' AND  P_VIGENCIA_INICIO = '2000-01-01') THEN
--    v_consulta = 'UPDATE INVENTARIOS SET NO_CONTROL = ' || '''' || P_NEW_NO_CONTROL || '''' || ' WHERE NO_CONTROL = ' || '''' || P_OLD_NO_CONTROL || '''' || '';                 
    v_consulta = 'UPDATE INVENTARIOS SET NO_CONTROL = ' || '''' || P_NEW_NO_CONTROL || '''' || 
    ', DESCRIPCION_INTERNA = (select ' || '''' || P_NEW_NO_CONTROL || '''' || ' || ' || '''' || ' / ' || '''' || ' ||' ||  ' trim(l.MODELO_APARATO)|| ' || '''' || ' / ' || '''' || ' ||' || '''' || P_VIGENCIA_INICIO || '''' || ' ||' || '''' || ' / ' || '''' || ' ||' || ' l.NUMERO_ULTIMA_POLIZA ||' || '''' || ' / ' || '''' || ' ||' ||  'trim(coalesce(l.CONTACTO,' || '''' || '' || '''' || ')) ||' || '''' || ' / ' || '''' || ' ||' || 'trim(coalesce(l.CODIGO_CONTACTO,' || '''' || '' || '''' || ')) ||' || '''' || ' / ' || '''' || ' ||' ||
    'coalesce(l.FECHAULTSERVSERIE,' || '''' || '' || '''' || ') ||' || '''' || ' / ' || '''' || ' ||' ||  'coalesce(l.FECHAULTSERVCLIENTE,' || '''' || '' || '''' || ') ||' || '''' || ' / ' || '''' || ' ||' ||  'coalesce(l.FECULTSERVCOBRA,' || '''' || '' || '''' || ') ||' || '''' || ' / ' || '''' || ' ||' ||     'coalesce(l.CALIFLLAMSERCOBRA,' || '''' || '' || '''' || ')' || 
    ' from inventarios i inner join LIBRES_INVENTARIOS l on i.INVENTARIO_ID = l.INVENTARIO_ID where l.INVENTARIO_ID = (select first 1 i.INVENTARIO_ID from INVENTARIOS i where i.NO_CONTROL = ' || '''' || P_OLD_NO_CONTROL || '''' || ' ) )' ||
    ' where INVENTARIO_ID = (select first 1 i.INVENTARIO_ID from INVENTARIOS i where i.NO_CONTROL  = ' || '''' || P_OLD_NO_CONTROL || ''''  || ')';
  
  
  IF (P_NEW_NO_CONTROL = '' AND P_VIGENCIA_INICIO <> '2000-01-01') THEN
    --v_consulta = 'UPDATE INVENTARIOS SET VIGENCIA_INICIO ='    || '''' || P_VIGENCIA_INICIO || '''' || ', VIGENCIA_FIN =' || '''' || DATEADD(-1 DAY TO dateadd(1 YEAR to P_VIGENCIA_INICIO)) || '''' || 'WHERE NO_CONTROL = ' || '''' || P_OLD_NO_CONTROL || '''' || ' ';                 
      v_consulta = 'UPDATE INVENTARIOS SET VIGENCIA_INICIO ='    || '''' || P_VIGENCIA_INICIO || '''' || ', VIGENCIA_FIN =' || '''' || DATEADD(-1 DAY TO dateadd(2 YEAR to P_VIGENCIA_INICIO)) || '''' ||
    ', DESCRIPCION_INTERNA = (select ' || '''' || P_OLD_NO_CONTROL || '''' || ' || ' || '''' || ' / ' || '''' || ' ||' ||  ' trim(l.MODELO_APARATO)|| ' || '''' || ' / ' || '''' || ' ||' || '''' || P_VIGENCIA_INICIO || '''' ||     ' ||' || '''' || ' / ' || '''' || ' ||' || ' l.NUMERO_ULTIMA_POLIZA ||' || '''' || ' / ' || '''' || ' ||' ||  'trim(coalesce(l.CONTACTO,' || '''' || '' || '''' || ')) ||' || '''' || ' / ' || '''' || ' ||' || 'trim(coalesce(l.CODIGO_CONTACTO,' || '''' || '' || '''' || ')) ||' || '''' || ' / ' || '''' || ' ||' ||
    'coalesce(l.FECHAULTSERVSERIE,' || '''' || '' || '''' || ') ||' || '''' || ' / ' || '''' || ' ||' ||  'coalesce(l.FECHAULTSERVCLIENTE,' || '''' || '' || '''' || ') ||' || '''' || ' / ' || '''' || ' ||' ||  'coalesce(l.FECULTSERVCOBRA,' || '''' || '' || '''' || ') ||' || '''' || ' / ' || '''' || ' ||' ||     'coalesce(l.CALIFLLAMSERCOBRA,' || '''' || '' || '''' || ')' || 
    ' from inventarios i inner join LIBRES_INVENTARIOS l on i.INVENTARIO_ID = l.INVENTARIO_ID where l.INVENTARIO_ID = (select first 1 i.INVENTARIO_ID from INVENTARIOS i where i.NO_CONTROL = ' || '''' || P_OLD_NO_CONTROL || '''' || ' ) )' ||
    ' where INVENTARIO_ID = (select first 1 i.INVENTARIO_ID from INVENTARIOS i where i.NO_CONTROL  = ' || '''' || P_OLD_NO_CONTROL || ''''  || ')';
  
  

    EXECUTE STATEMENT (:v_consulta) 
    ON EXTERNAL DATA SOURCE path_bd_zeus
   AS USER username
   PASSWORD password;

END

