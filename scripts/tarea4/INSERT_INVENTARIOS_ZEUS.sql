CREATE OR ALTER PROCEDURE INSERT_INVENTARIOS_ZEUS (P_NO_CONTROL VARCHAR(30), P_CONTACTO_CREADOR INTEGER, P_DESCRIPCION VARCHAR(500), P_VIGENCIA_INICIO DATE, P_VIGENCIA_FIN DATE)
 RETURNS (P_INTENVARIO_ID VARCHAR(500))
AS declare variable v_consulta varchar(1000);
declare variable path_bd_zeus varchar(1000);
declare variable username varchar(50);
declare variable password varchar(50);
declare variable N integer =1;
BEGIN

v_consulta = 'insert into INVENTARIOS ' ||
'values ((select max(i.INVENTARIO_ID) + 1 from INVENTARIOS i ),' || '''' ||  P_NO_CONTROL || '''' || ',' || P_CONTACTO_CREADOR || ','|| ''''|| P_DESCRIPCION || '''' || ',' || '''' ||  P_VIGENCIA_INICIO || ''''||  ',' || '''' || P_VIGENCIA_FIN || '''' ||  ') returning INVENTARIO_ID'
;                
    select s."VALUE" from SETTINGS s where s.KEY = 'path_bd_zeus' into :path_bd_zeus ;
    select s."VALUE" from SETTINGS s where s.KEY = 'username' into :username ;
    select s."VALUE" from SETTINGS s where s.KEY = 'password' into :password ;
--suspend;
       EXECUTE STATEMENT v_consulta
       ON EXTERNAL DATA SOURCE path_bd_zeus
       AS USER username
       PASSWORD password 
       WITH COMMON TRANSACTION
       into P_INTENVARIO_ID;
       suspend;
END