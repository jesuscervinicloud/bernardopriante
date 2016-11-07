CREATE OR ALTER PROCEDURE EXISTE_SERIE (P_NO_CONTROL VARCHAR(30))
 RETURNS (EXISTE CHAR(1))
AS declare variable q_insert varchar(1000);
declare variable q_select varchar(1000);
declare variable path_bd_zeus varchar(1000);
declare variable username varchar(50);
declare variable password varchar(50);
declare variable V_INTENVARIO_ID integer ;
BEGIN
EXISTE = 'F'; -- FALSE
q_select = 'SELECT COUNT(I.INVENTARIO_ID) FROM INVENTARIOS I WHERE I.NO_CONTROL = ' ||  '''' ||  P_NO_CONTROL || ''''  ;                
--q_select = 'SELECT COUNT(I.INVENTARIO_ID) FROM INVENTARIOS I ';

    select s."VALUE" from SETTINGS s where s.KEY = 'path_bd_zeus' into :path_bd_zeus ;
    select s."VALUE" from SETTINGS s where s.KEY = 'username' into :username ;
    select s."VALUE" from SETTINGS s where s.KEY = 'password' into :password ;
       
       EXECUTE STATEMENT q_select
       ON EXTERNAL DATA SOURCE path_bd_zeus
       AS USER username
       PASSWORD password 
       WITH COMMON TRANSACTION
       into :V_INTENVARIO_ID;
       IF (V_INTENVARIO_ID >0) THEN BEGIN
         EXISTE = 'T';
       END
       suspend;



END

