CREATE OR ALTER PROCEDURE FECHA_PRIMER_REMISION (P_CLIENTE_ID INTEGER)
 RETURNS (FECHA DATE, FOLIO VARCHAR(15), TIENE_REMISION INTEGER, vendedor varchar(50))
AS declare variable v_consulta varchar(1000);
declare variable path_bd_zeus varchar(1000);
declare variable username varchar(50);
declare variable password varchar(50);
DECLARE VARIABLE v_linea_articulo_id integer;	
-- integer;	
declare variable es_familia_aparato varchar(1); 
BEGIN
    v_consulta = 'select m.FOLIO, m.fecha, v.nombre from DOCTOS_VE m inner join vendedores v on v.vendedor_id=m.vendedor_id where m.CLIENTE_ID=' || :P_CLIENTE_ID || ' and m.TIPO_DOCTO =' || '''' || 'R' || '''' || 'and m.ESTATUS not in (' || '''' || 'C' || '''' || ',' || '''' || 'D' || '''' || ')  order by m.FECHA ';
for EXECUTE STATEMENT v_consulta
  --ON EXTERNAL DATA SOURCE path_bd_zeus
   --AS USER username
   --PASSWORD password
   INTO :folio, :fecha , :vendedor
   do begin      
	 es_familia_aparato = 'F';
     select resultado from ES_FAMILIA_APARATO(:folio, :P_CLIENTE_ID,1) into :es_familia_aparato;
     if (es_familia_aparato='T')then begin
	    TIENE_REMISION = 1;
        --select v.NOMBRE from VENDEDORES v where v.VENDEDOR_ID=:v_vendedor_id into :vendedor;
		suspend;
		leave;
     end
   end
END

