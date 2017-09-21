CREATE OR ALTER PROCEDURE FECHA_PRIMER_PEDIDO (P_CLIENTE_ID INTEGER)
 RETURNS (FECHA DATE, FOLIO VARCHAR(15), TIENE_PEDIDO INTEGER)
AS declare variable v_consulta varchar(1000);
declare variable path_bd_zeus varchar(1000);
declare variable username varchar(50);
declare variable password varchar(50);
DECLARE VARIABLE v_linea_articulo_id integer;	
DECLARE VARIABLE v_vendedor_id integer;	
declare variable es_familia_aparato varchar(1); 
BEGIN
    v_consulta = 'select m.FOLIO, m.fecha from DOCTOS_VE m where m.CLIENTE_ID=' || :P_CLIENTE_ID || ' and m.TIPO_DOCTO =' || '''' || 'P' || '''' || 'and m.ESTATUS not in (' || '''' || 'C' || '''' || ',' || '''' || 'D' || '''' || ')  order by m.FECHA ';
    --select s."VALUE" from SETTINGS s where s.KEY = 'path_bd_zeus' into :path_bd_zeus ;
    --select s."VALUE" from SETTINGS s where s.KEY = 'username' into :username ;
    --select s."VALUE" from SETTINGS s where s.KEY = 'password' into :password ;
for EXECUTE STATEMENT v_consulta
  --ON EXTERNAL DATA SOURCE path_bd_zeus
   --AS USER username
   --PASSWORD password
   INTO :folio, :fecha
   do begin      
	 es_familia_aparato = 'F';
     select resultado from ES_FAMILIA_APARATO(:folio, :P_CLIENTE_ID,1) into :es_familia_aparato;
     if (es_familia_aparato='T')then begin
	    TIENE_PEDIDO = 1;
        --select v.NOMBRE from VENDEDORES v where v.VENDEDOR_ID=:v_vendedor_id into :vendedor;
		suspend;
		leave;
     end
   end
END

