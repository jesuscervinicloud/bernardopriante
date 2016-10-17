CREATE OR ALTER PROCEDURE INSERT_POLITICAS_DSCTOS_ZEUS (P_INVENTARIO_ID INTEGER)
 RETURNS (P_OBJETO_ID1 INTEGER, P_OBJETO_ID2 INTEGER, P_OBJETO_ID3 INTEGER)
AS declare variable v_consulta varchar(500);
declare variable v_consulta2 varchar(500);
declare variable v_consulta3 varchar(500);
declare variable path_bd_zeus varchar(1000);
declare variable username varchar(50);
declare variable password varchar(50);
declare variable OBJETO_DSCTO_ID integer;
declare variable OBJETO_DSCTO_ID2 integer;
declare variable OBJETO_DSCTO_ID3 integer;
BEGIN

    select s."VALUE" from SETTINGS s where s.KEY = 'path_bd_zeus' into :path_bd_zeus ;
    select s."VALUE" from SETTINGS s where s.KEY = 'username' into :username ;
    select s."VALUE" from SETTINGS s where s.KEY = 'password' into :password ;
    select s."VALUE" from SETTINGS s where s.KEY = 'OBJETO_DSCTO_ID' into :OBJETO_DSCTO_ID ;
    select s."VALUE" from SETTINGS s where s.KEY = 'OBJETO_DSCTO_ID2' into :OBJETO_DSCTO_ID2 ;
    select s."VALUE" from SETTINGS s where s.KEY = 'OBJETO_DSCTO_ID3' into :OBJETO_DSCTO_ID3 ;

    v_consulta = 'INSERT INTO POLITICAS_DSCTOS VALUES (' || '''' ||  'INV' || '''' || ',' ||  P_INVENTARIO_ID ||
 ',' || '''' || 'G' || '''' || ',' || OBJETO_DSCTO_ID || ' , 1, 100) RETURNING OBJETO_ID ';

    v_consulta2 = 'INSERT INTO POLITICAS_DSCTOS VALUES (' || '''' ||  'INV' || '''' || ',' ||  P_INVENTARIO_ID ||
 ',' || '''' || 'L' || '''' || ',' || OBJETO_DSCTO_ID2 || ' , 1, 100) RETURNING OBJETO_ID ';

    v_consulta3 = 'INSERT INTO POLITICAS_DSCTOS VALUES (' || '''' ||  'INV' || '''' || ',' ||  P_INVENTARIO_ID ||
 ',' || '''' || 'L' || '''' || ',' || OBJETO_DSCTO_ID3 || ' , 2, 100) RETURNING OBJETO_ID ';


       EXECUTE STATEMENT v_consulta
       ON EXTERNAL DATA SOURCE path_bd_zeus
       AS USER username
       PASSWORD password 
       WITH COMMON TRANSACTION
       into P_OBJETO_ID1;
       
              
       EXECUTE STATEMENT v_consulta2
       ON EXTERNAL DATA SOURCE path_bd_zeus
       AS USER username
       PASSWORD password 
       WITH COMMON TRANSACTION
       into P_OBJETO_ID2;
              
       
       EXECUTE STATEMENT v_consulta3
       ON EXTERNAL DATA SOURCE path_bd_zeus
       AS USER username
       PASSWORD password 
       WITH COMMON TRANSACTION
       into P_OBJETO_ID3;
       
       
       
       suspend;
END