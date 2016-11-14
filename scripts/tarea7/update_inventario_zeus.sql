CREATE OR ALTER PROCEDURE UPDATE_INVENTARIO_ZEUS (P_OLD_NO_CONTROL VARCHAR(30), P_NEW_NO_CONTROL VARCHAR(30), P_VIGENCIA_INICIO DATE)
 RETURNS (UPDATED INTEGER)
AS declare variable v_consulta varchar(1000);
declare variable path_bd_zeus varchar(1000);
declare variable username varchar(50);
declare variable password varchar(50);
declare variable V_INVENTARIO_ID INTEGER = 0;

BEGIN
  UPDATED = 0;
  IF (P_NEW_NO_CONTROL <> '' AND  P_VIGENCIA_INICIO = '2000-01-01') THEN
    v_consulta = 'UPDATE INVENTARIOS SET NO_CONTROL = ' || '''' || P_NEW_NO_CONTROL || '''' || ' WHERE NO_CONTROL = ' || '''' || P_OLD_NO_CONTROL || '''' || ' RETURNING INVENTARIO_ID';                 
  
  
  IF (P_NEW_NO_CONTROL = '' AND P_VIGENCIA_INICIO <> '2000-01-01') THEN
    v_consulta = 'UPDATE INVENTARIOS SET VIGENCIA_INICIO ='    || '''' || P_VIGENCIA_INICIO || '''' || ', VIGENCIA_FIN =' || '''' || DATEADD(-1 DAY TO dateadd(1 YEAR to P_VIGENCIA_INICIO)) || '''' || 'WHERE NO_CONTROL = ' || '''' || P_OLD_NO_CONTROL || '''' || ' RETURNING INVENTARIO_ID';                 
    
    
  
    
    
    
    select s."VALUE" from SETTINGS s where s.KEY = 'path_bd_zeus' into :path_bd_zeus ;
    select s."VALUE" from SETTINGS s where s.KEY = 'username' into :username ;
    select s."VALUE" from SETTINGS s where s.KEY = 'password' into :password ;
  EXECUTE STATEMENT v_consulta
  ON EXTERNAL DATA SOURCE path_bd_zeus
   AS USER username
   PASSWORD password
   INTO
     :V_INVENTARIO_ID;      
     --IF (V_INVENTARIO_ID <> 0) THEN
       --  UPDATED = 'T';
       UPDATED=V_INVENTARIO_ID;
     suspend;
END

