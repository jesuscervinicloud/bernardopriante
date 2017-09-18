CREATE OR ALTER PROCEDURE FECHA_PRIMERA_COTIZACION (P_CLIENTE_ID INTEGER)
 RETURNS (FECHA DATE, FOLIO VARCHAR(15), VENDEDOR VARCHAR(50), TIENE_COTIZACION INTEGER)
AS declare variable v_consulta varchar(1000);
declare variable path_bd_zeus varchar(1000);
declare variable username varchar(50);
declare variable password varchar(50);
DECLARE VARIABLE v_linea_articulo_id integer;	
DECLARE VARIABLE v_vendedor_id integer;	
declare variable es_familia_aparato varchar(1); 
BEGIN
	--v_consulta = 'select list (distinct' || '  '''''''' || ' || ' d.ARTICULO_ID'  || ' || ''''''''  ' || ' ) from DCDOCTOS_PDV m inner join DCDOCTOS_PDV_DET d on m.DOCTO_PV_ID=d.DOCTO_PV_ID where m.TIPO_DOCTO =' || ''''|| 'C' || '''' || ' and m.ESTATUS not in (' || '''' ||  'C' || '''' || ' ) and  m.CLIENTE_ID = '  ||  :P_CLIENTE_ID ;
      v_consulta = 'select distinct m.FOLIO, m.FECHA, m.vendedor_id from DCDOCTOS_PDV m inner join DCDOCTOS_PDV_DET d on m.DOCTO_PV_ID=d.DOCTO_PV_ID where m.TIPO_DOCTO =' || ''''|| 'C' || '''' || ' and m.ESTATUS not in (' || '''' ||  'C' || '''' || ' ) and  m.CLIENTE_ID = '  ||  :P_CLIENTE_ID || ' order by m.fecha desc' ;

  --  x=  '1843' || ',' || '1858' || ',' || '1915'||',' ||'1924'||',' ||'27919'||',' ||'3456'||',' ||'3683'||',' ||'3752';                         

    select s."VALUE" from SETTINGS s where s.KEY = 'path_bd_zeus' into :path_bd_zeus ;
    select s."VALUE" from SETTINGS s where s.KEY = 'username' into :username ;
    select s."VALUE" from SETTINGS s where s.KEY = 'password' into :password ;
for EXECUTE STATEMENT v_consulta
  ON EXTERNAL DATA SOURCE path_bd_zeus
   AS USER username
   PASSWORD password
   INTO :folio, :fecha, :v_vendedor_id
   do begin      
	 es_familia_aparato = 'F';
     select resultado from ES_FAMILIA_APARATO(:folio, :P_CLIENTE_ID) into :es_familia_aparato;
     if (es_familia_aparato='T')then begin
	    tiene_cotizacion = 1;
        select v.NOMBRE from VENDEDORES v where v.VENDEDOR_ID=:v_vendedor_id into :vendedor;
		suspend;
		leave;
     end
   end
END

