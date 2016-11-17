CREATE OR ALTER PROCEDURE UPDATE_INVENTARIO_ZEUS (P_OLD_NO_CONTROL VARCHAR(30), P_NEW_NO_CONTROL VARCHAR(30), P_VIGENCIA_INICIO DATE)
AS DECLARE VARIABLE S varchar(100);
  declare variable N integer =1;
  declare variable path_bd_zeus varchar(1000);
  declare variable username varchar(50);	
  declare variable password varchar(50);
  declare variable v_consulta varchar(1000);
BEGIN
 
select s."VALUE" from SETTINGS s where s.KEY = 'path_bd_zeus' into :path_bd_zeus ;
    select s."VALUE" from SETTINGS s where s.KEY = 'username' into :username ;
    select s."VALUE" from SETTINGS s where s.KEY = 'password' into :password ;

--S = 'UPDATE INVENTARIOS SET NO_CONTROL = ' || '''' || P_NEW_NO_CONTROL || '''' || ' WHERE NO_CONTROL = ' || '''' || P_OLD_NO_CONTROL || '''' || '';                 


  IF (P_NEW_NO_CONTROL <> '' AND  P_VIGENCIA_INICIO = '2000-01-01') THEN
    v_consulta = 'UPDATE INVENTARIOS SET NO_CONTROL = ' || '''' || P_NEW_NO_CONTROL || '''' || ' WHERE NO_CONTROL = ' || '''' || P_OLD_NO_CONTROL || '''' || '';                 
  
  
  IF (P_NEW_NO_CONTROL = '' AND P_VIGENCIA_INICIO <> '2000-01-01') THEN
    v_consulta = 'UPDATE INVENTARIOS SET VIGENCIA_INICIO ='    || '''' || P_VIGENCIA_INICIO || '''' || ', VIGENCIA_FIN =' || '''' || DATEADD(-1 DAY TO dateadd(1 YEAR to P_VIGENCIA_INICIO)) || '''' || 'WHERE NO_CONTROL = ' || '''' || P_OLD_NO_CONTROL || '''' || ' ';                 
  
  
  

  --WHILE (N > 0) DO
  --BEGIN
    EXECUTE STATEMENT (:v_consulta) 
    ON EXTERNAL DATA SOURCE path_bd_zeus
   AS USER username
   PASSWORD password;
    
    --N = N - 1;
  --END
 
END

