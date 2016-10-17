CREATE OR ALTER PROCEDURE BUSCA_CONTACTO_ZEUS (P_FOLIO VARCHAR(20), P_TIPO_DOCTO CHAR(1))
 RETURNS (R_CONTACTO_CREADOR INTEGER, R_CONTACTO VARCHAR(50))
AS declare variable v_consulta varchar(1000);
declare variable path_bd_zeus varchar(1000);
declare variable username varchar(50);
declare variable password varchar(50);
declare variable v_contacto_id integer = 0;
declare variable v_nombre varchar(70) = 'NO SE ENCONTRO FOLIO COTIZACION';
BEGIN
	v_consulta = 'select first 1 c.CONTACTO_CONTACTO_ID, c.NOMBRE  from DCDOCTOS_PDV dc inner join CONTACTO_CONTACTOS c on c.CONTACTO_CONTACTO_ID = dc.CONTACTO_CONTACTO_ID' ||
                 ' where dc.MICROSIP_FOLIO = ' || '''' ||  p_folio || '''' || ' and dc.MICROSIP_TIPO_DOCTO = ' || ''''|| p_tipo_docto ||'''' ;
                 
    select s."VALUE" from SETTINGS s where s.KEY = 'path_bd_zeus' into :path_bd_zeus ;
    select s."VALUE" from SETTINGS s where s.KEY = 'username' into :username ;
    select s."VALUE" from SETTINGS s where s.KEY = 'password' into :password ;
  EXECUTE STATEMENT v_consulta
  ON EXTERNAL DATA SOURCE path_bd_zeus
   AS USER username
   PASSWORD password
   INTO
     :R_CONTACTO_CREADOR, :R_CONTACTO;      
     suspend;
END