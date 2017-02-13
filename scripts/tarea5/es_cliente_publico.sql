CREATE OR ALTER PROCEDURE ES_CLIENTE_PUBLICO (P_CLIENTE_ID INTEGER)
 RETURNS (PUBLICO CHAR(1))
AS declare variable q_insert varchar(1000);
declare variable q_select varchar(1000);
declare variable path_bd_micro varchar(1000);
declare variable username varchar(50);
declare variable password varchar(50);
declare variable V_ZONA_CLIENTE integer ;
BEGIN
PUBLICO = 'F'; -- FALSE
q_select = 'select case c.ZONA_CLIENTE_ID when 9904 then '||  '''' ||  'T' || '''' || ' when 9932 then '||  '''' ||  'F' || '''' || ' else ' || '''' || 'X' || '''' || ' end from CLIENTES c where c.CLIENTE_ID = ' ||  '''' ||  P_CLIENTE_ID || ''''  ;                


    select s."VALUE" from SETTINGS s where s.KEY = 'path_bd_microsip' into :path_bd_micro ;
    select s."VALUE" from SETTINGS s where s.KEY = 'username' into :username ;
    select s."VALUE" from SETTINGS s where s.KEY = 'password' into :password ;
       EXECUTE STATEMENT q_select
       ON EXTERNAL DATA SOURCE path_bd_micro
       AS USER username
       PASSWORD password 
       WITH COMMON TRANSACTION
       into :PUBLICO;



       suspend;



END

