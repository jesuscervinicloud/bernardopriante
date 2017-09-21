CREATE OR ALTER PROCEDURE ES_FAMILIA_APARATO (P_FOLIO VARCHAR(15), P_CLIENTE_ID INTEGER, PEDIDO_COTIZACION_REMISION INTEGER)
 RETURNS (RESULTADO CHAR(1))
AS declare variable v_consulta varchar(1000);
declare variable path_bd_zeus varchar(1000);
declare variable username varchar(50);
declare variable password varchar(50);
DECLARE VARIABLE V_NOMBRE varchar(50);	
DECLARE VARIABLE v_articulo_id integer;	
DECLARE VARIABLE FOLIO VARCHAR(15);	

BEGIN
/*
PEDIDO=1
COTIZACION=2
REMISION=1
*/
	resultado = 'F';
	v_consulta = case
            when PEDIDO_COTIZACION_REMISION = 1 then 'select first 1 gl.NOMBRE from DOCTOS_VE m inner join DOCTOS_VE_DET d on m.DOCTO_VE_ID=d.DOCTO_VE_ID inner join ARTICULOS a on a.ARTICULO_ID=d.ARTICULO_ID inner join LINEAS_ARTICULOS la on la.LINEA_ARTICULO_ID=a.LINEA_ARTICULO_ID inner join GRUPOS_LINEAS gl on gl.GRUPO_LINEA_ID=la.GRUPO_LINEA_ID where gl.NOMBRE =' || ''''|| 'APARATO' || '''' || ' and m.FOLIO =' || '''' || :P_FOLIO || ''''|| ' and m.CLIENTE_ID =' ||  P_CLIENTE_ID
            when PEDIDO_COTIZACION_REMISION = 2 then 'select distinct d.ARTICULO_ID from DCDOCTOS_PDV m inner join DCDOCTOS_PDV_DET d on m.DOCTO_PV_ID=d.DOCTO_PV_ID where m.TIPO_DOCTO =' || ''''|| 'C' || '''' || ' and m.ESTATUS not in (' || '''' ||  'C' || '''' || ' ) and  m.CLIENTE_ID = '  ||  :P_CLIENTE_ID || ' and m.FOLIO= ' || '''' || P_FOLIO || ''''
            --when PEDIDO_COTIZACION_REMISION = 3 then 'select first 1 gl.NOMBRE from DOCTOS_VE m inner join DOCTOS_VE_DET d on m.DOCTO_VE_ID=d.DOCTO_VE_ID inner join ARTICULOS a on a.ARTICULO_ID=d.ARTICULO_ID inner join LINEAS_ARTICULOS la on la.LINEA_ARTICULO_ID=a.LINEA_ARTICULO_ID inner join GRUPOS_LINEAS gl on gl.GRUPO_LINEA_ID=la.GRUPO_LINEA_ID where gl.NOMBRE =' || ''''|| 'APARATO' || '''' || ' and m.FOLIO =' || '''' || :P_FOLIO || ''''|| ' and m.CLIENTE_ID =' ||  P_CLIENTE_ID
            
          end;
          
          
    if (PEDIDO_COTIZACION_REMISION = 1) then begin
		for EXECUTE STATEMENT v_consulta
		   INTO :V_NOMBRE
		   do begin      
		   		if (:V_NOMBRE = 'APARATO') then
					resultado= 'T';
				
		   end
		   suspend;    
    end
  	if (PEDIDO_COTIZACION_REMISION = 2) then begin
	
    	select s."VALUE" from SETTINGS s where s.KEY = 'path_bd_zeus' into :path_bd_zeus ;
	    select s."VALUE" from SETTINGS s where s.KEY = 'username' into :username ;
	    select s."VALUE" from SETTINGS s where s.KEY = 'password' into :password ;
		for EXECUTE STATEMENT v_consulta
		  ON EXTERNAL DATA SOURCE path_bd_zeus
		   AS USER username
		   PASSWORD password
		   INTO :v_articulo_id
		   do begin      
				select gl.NOMBRE from GRUPOS_LINEAS gl where gl.NOMBRE = 'APARATO' and
				 gl.GRUPO_LINEA_ID = (select first 1 la.GRUPO_LINEA_ID from LINEAS_ARTICULOS la where la.LINEA_ARTICULO_ID in 
				(select first 1 a.LINEA_ARTICULO_ID from ARTICULOS a where a.ARTICULO_ID = :v_articulo_id)) into :V_NOMBRE ;    
				if (:V_NOMBRE = 'APARATO') then
					resultado= 'T';
				
		   end
		   suspend;
	end
	if (PEDIDO_COTIZACION_REMISION = 3) then begin
	end
END