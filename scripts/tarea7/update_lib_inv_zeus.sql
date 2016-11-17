CREATE OR ALTER PROCEDURE UPDATE_LIB_INV_ZEUS (P_NO_CONTROL VARCHAR(30), P_FECHA_VENTA DATE)
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

    v_consulta = 'UPDATE LIBRES_INVENTARIOS SET FECHA_DE_VENTA = ' || '''' || P_FECHA_VENTA || '''' || ' WHERE INVENTARIO_ID  in (select i.INVENTARIO_ID from INVENTARIOS i where i.NO_CONTROL = ' || '''' || P_NO_CONTROL || '''' || ')';  
    --ftcDocumentoExiste=v_consulta;
    EXECUTE STATEMENT (:v_consulta) 
  ON EXTERNAL DATA SOURCE path_bd_zeus
   AS USER username
   PASSWORD password;
  
END

