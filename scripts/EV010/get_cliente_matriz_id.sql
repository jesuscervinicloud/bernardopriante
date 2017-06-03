CREATE OR ALTER PROCEDURE GET_CLIENTE_MATRIZ_ID (P_CLIENTE_ID INTEGER)
 RETURNS (P_CLIENTE_MATRIZ_ID INTEGER)
AS declare variable q_select varchar(1000);
declare variable path_bd_zeus varchar(1000);
declare variable username varchar(50);
declare variable password varchar(50);

BEGIN
--select c.CLIENTE_ID, c.CLIENTE_MATRIZ_ID from CLIENTES_COMPLEMENTOS c;
q_select = 'select c.CLIENTE_MATRIZ_ID FROM CLIENTES_COMPLEMENTOS c where c.CLIENTE_ID = ' ||   P_CLIENTE_ID   ;                
    
    select s."VALUE" from SETTINGS s where s.KEY = 'path_bd_zeus' into :path_bd_zeus ;
    select s."VALUE" from SETTINGS s where s.KEY = 'username' into :username ;
    select s."VALUE" from SETTINGS s where s.KEY = 'password' into :password ;
       
       EXECUTE STATEMENT q_select
       ON EXTERNAL DATA SOURCE path_bd_zeus
       AS USER username
       PASSWORD password 
       WITH COMMON TRANSACTION
       into :P_CLIENTE_MATRIZ_ID;
       suspend;
END