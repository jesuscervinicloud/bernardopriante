CREATE OR ALTER PROCEDURE INSERT_INV_CLIENTES_ZEUS (P_CONTACTO_ID INTEGER, P_INVENTARIO_ID INTEGER)
 RETURNS (INV_ID INTEGER)
AS declare variable v_consulta varchar(500);
declare variable v_consulta2 varchar(500);
declare variable v_consulta3 varchar(500);
declare variable path_bd_zeus varchar(1000);
declare variable username varchar(50);
declare variable password varchar(50);

BEGIN

    select s."VALUE" from SETTINGS s where s.KEY = 'path_bd_zeus' into :path_bd_zeus ;
    select s."VALUE" from SETTINGS s where s.KEY = 'username' into :username ;
    select s."VALUE" from SETTINGS s where s.KEY = 'password' into :password ;

    v_consulta = 'INSERT INTO INVENTARIOS_CLIENTES VALUES (' || P_CONTACTO_ID || ',' ||  P_INVENTARIO_ID  || ') RETURNING INVENTARIO_ID ';



       EXECUTE STATEMENT v_consulta
       ON EXTERNAL DATA SOURCE path_bd_zeus
       AS USER username
       PASSWORD password 
       WITH COMMON TRANSACTION
       into INV_ID;
       
              
       suspend;
END