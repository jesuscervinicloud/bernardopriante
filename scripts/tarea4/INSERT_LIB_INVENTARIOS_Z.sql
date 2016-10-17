CREATE OR ALTER PROCEDURE INSERT_LIB_INVENTARIOS_ZEUS (P_INVENTARIO_ID INTEGER, P_MODELO VARCHAR(30), P_CONTACTO VARCHAR(70), P_ULT_POLIZA VARCHAR(30), P_CODIGO_CONTACTO INTEGER, P_FECHA_VENTA DATE)
 RETURNS (P_INVOUT_ID INTEGER)
AS declare variable v_consulta varchar(1000);
declare variable path_bd_zeus varchar(1000);
declare variable username varchar(50);
declare variable password varchar(50);
BEGIN

v_consulta = 'insert into LIBRES_INVENTARIOS ' ||
'values (' || P_INVENTARIO_ID ||' ,' || '''' ||  P_MODELO || '''' || ',' || '''' || P_CONTACTO || '''' || ','|| ''''|| P_ULT_POLIZA || '''' || ','  ||  P_CODIGO_CONTACTO ||  ',' || '''' || P_FECHA_VENTA || '''' ||  ') returning INVENTARIO_ID';                

               


    select s."VALUE" from SETTINGS s where s.KEY = 'path_bd_zeus' into :path_bd_zeus ;
    select s."VALUE" from SETTINGS s where s.KEY = 'username' into :username ;
    select s."VALUE" from SETTINGS s where s.KEY = 'password' into :password ;

       EXECUTE STATEMENT v_consulta
       ON EXTERNAL DATA SOURCE path_bd_zeus
       AS USER username
       PASSWORD password 
       WITH COMMON TRANSACTION
       into P_INVOUT_ID;
       suspend;
END