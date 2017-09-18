CREATE OR ALTER PROCEDURE CLIENTE_MATRIZ (P_CLIENTE_ID INTEGER)
 RETURNS (R_CLIENTE_ID INTEGER, R_NOMBRE VARCHAR(200))
AS declare variable v_consulta varchar(1000);
declare variable path_bd_zeus varchar(1000);
declare variable username varchar(50);
declare variable password varchar(50);
declare variable V_CLIENTE_MATRIZ_ID integer = 0;
declare variable v_nombre varchar(200) ;
BEGIN
	v_consulta = 'select first 1 cc.cliente_id, cc.CLIENTE_MATRIZ_ID from CLIENTES_COMPLEMENTOS cc where cc.cliente_id  = '  ||  :P_CLIENTE_ID ;
                 
    select s."VALUE" from SETTINGS s where s.KEY = 'path_bd_zeus' into :path_bd_zeus ;
    select s."VALUE" from SETTINGS s where s.KEY = 'username' into :username ;
    select s."VALUE" from SETTINGS s where s.KEY = 'password' into :password ;
  EXECUTE STATEMENT v_consulta
  ON EXTERNAL DATA SOURCE path_bd_zeus
   AS USER username
   PASSWORD password
   INTO
     :R_CLIENTE_ID,:V_CLIENTE_MATRIZ_ID;      
     --R_NOMBRE= V_CLIENTE_MATRIZ_ID;
     
     if (:V_CLIENTE_MATRIZ_ID=0) then
     	R_NOMBRE = null;
     else 
        select first 1 c.nombre from clientes c where c.cliente_id = :V_CLIENTE_MATRIZ_ID into :R_NOMBRE ;
     
     suspend;
END

/*
buscar valor de  campo "Cliente Matriz_ID" de tabla "Clientes complementos" de Zeus, el valor de campo 
"cliente Matriz_ID" obtenerlo en campo "Nombre" de tabla "Clientes"*/

