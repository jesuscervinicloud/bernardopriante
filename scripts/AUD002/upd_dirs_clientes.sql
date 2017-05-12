CREATE OR ALTER PROCEDURE UPD_DIRS_CLIENTES_INST RETURNS (updated CHAR(1), DIR_CONSIG_ID integer, contacto_creador varchar(50) )
AS DECLARE lcComando varchar(6000);
declare variable V_DOCTO_VE_ID integer;
declare variable v_folio varchar(20);  
declare variable v_tipo_docto_buscar char(1);
declare variable v_contacto varchar(100) = '';
BEGIN
--Procedimiento que actualiza el campo GNL de la tabla dirs_clientes para todos los clientes institucionales
   


lcComando = 'select distinct	m.DOCTO_VE_ID, m.DIR_CONSIG_ID from DOCTOS_VE m inner join DOCTOS_VE_DET d on d.DOCTO_VE_ID = m.DOCTO_VE_ID inner join CLIENTES c on c.CLIENTE_ID = m.CLIENTE_ID  where m.TIPO_DOCTO = ' || '''' || 'R' || '''' || ' and c.ZONA_CLIENTE_ID = 9932';

FOR EXECUTE STATEMENT lcComando
  into :V_DOCTO_VE_ID, :DIR_CONSIG_ID
   DO BEGIN
      SELECT M.FOLIO, M.TIPO_DOCTO FROM DOCTOS_VE M WHERE M.DOCTO_VE_ID = (SELECT L.DOCTO_VE_FTE_ID FROM  DOCTOS_VE_LIGAS L WHERE L.DOCTO_VE_DEST_ID = :V_DOCTO_VE_ID) into :v_folio, :v_tipo_docto_buscar;
	  select coalesce(R_CONTACTO,'NO SE ENCONTRO FOLIO COTIZACION' ), coalesce(R_CONTACTO_CREADOR,0 ) from busca_contacto_zeus(:v_folio, :v_tipo_docto_buscar) into :v_contacto, :contacto_creador;
	  --actualizamos dirs_clientes
	  select * from  UPD_DIRS_CLIENTES(:DIR_CONSIG_ID,:contacto_creador) into :updated;
      
    SUSPEND;
   END

 END