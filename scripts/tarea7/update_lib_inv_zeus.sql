CREATE OR ALTER PROCEDURE UPDATE_LIB_INV_ZEUS (P_INVENTARIO_ID INTEGER, P_FECHA_VENTA DATE)
 RETURNS (UPDATED VARCHAR(1))
AS declare variable v_consulta varchar(1000);
declare variable path_bd_zeus varchar(1000);
declare variable username varchar(50);
declare variable password varchar(50);
declare variable V_INVENTARIO_ID INTEGER = 0;

BEGIN
  UPDATED = 'F';
    v_consulta = 'UPDATE LIBRES_INVENTARIOS SET FECHA_DE_VENTA = ' || '''' || P_FECHA_VENTA || '''' || ' WHERE INVENTARIO_ID = ' ||  P_INVENTARIO_ID || ' RETURNING INVENTARIO_ID';                 
    
    select s."VALUE" from SETTINGS s where s.KEY = 'path_bd_zeus' into :path_bd_zeus ;
    select s."VALUE" from SETTINGS s where s.KEY = 'username' into :username ;
    select s."VALUE" from SETTINGS s where s.KEY = 'password' into :password ;


  EXECUTE STATEMENT v_consulta
  ON EXTERNAL DATA SOURCE path_bd_zeus
   AS USER username
   PASSWORD password
   INTO
     :V_INVENTARIO_ID;      
     IF (V_INVENTARIO_ID <> 0) THEN
         UPDATED = 'T';
     suspend;

END

