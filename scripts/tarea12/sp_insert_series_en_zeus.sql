CREATE OR ALTER PROCEDURE INSERT_SERIES_EN_ZEUS RETURNS (V_SERIE VARCHAR(30))
AS DECLARE lcComando varchar(5000);
DECLARE VARIABLE v_no_control varchar(30);
declare variable v_cliente_id integer;
declare variable v_modelo varchar(50);
declare variable v_fecha_venta date;
declare variable v_contacto_creador integer =0;
declare variable v_contacto varchar(100) = '';
declare variable v_tipo_docto char(1);
declare variable v_tipo_docto_buscar char(1);
declare variable v_folio varchar(20);
declare variable v_inventario_id integer;
declare variable v_lib_inventario_id integer;
declare variable v_politicas_dsctos_id1 integer;
declare variable v_politicas_dsctos_id2 integer;
declare variable v_politicas_dsctos_id3 integer;
declare variable v_inventario_cliente_id integer;
declare variable v_descripcion varchar(500);
declare variable v_descripcion_error varchar(500);
declare variable v_anios_garantia integer = 1;
declare variable v_docto_ve_id integer ;
declare variable existe_serie char(1)='T';

BEGIN
      lcComando = 'select ad.CLAVE,c.CLIENTE_ID ,TRIM(REPLACE(replace(a.NOMBRE,' || '''' || 'APARATO'  || '''' || ',' || '''' ||  '' ||'''' || ' ),' || '''' || 'AUDITIVO' || '''' || ',' || '''' ||  '' || '''' || ')) ,m.FECHA, coalesce((case c.ZONA_CLIENTE_ID when 9904 then c.CLIENTE_ID when 9932 then 0 end ),0) ' ||
	',(case c.ZONA_CLIENTE_ID when 9904 then c.NOMBRE when 9932 then ' || '''' || 'buscar' || '''' || ' end), m.TIPO_DOCTO, m.DOCTO_VE_ID ' || 
	' from DESGLOSE_EN_DISCRETOS_VE dd inner join ARTICULOS_DISCRETOS ad on ad.ART_DISCRETO_ID = dd.ART_DISCRETO_ID ' ||
	' inner join DOCTOS_VE_DET d on d.DOCTO_VE_DET_ID = dd.DOCTO_VE_DET_ID inner join DOCTOS_VE m on m.DOCTO_VE_ID = d.DOCTO_VE_ID ' ||
	' inner join CLIENTES c on c.CLIENTE_ID = m.CLIENTE_ID inner join ARTICULOS a on a.ARTICULO_ID = ad.ARTICULO_ID where m.TIPO_DOCTO=' || '''' || 'R' || '''' || 'and ad.CLAVE <> ' || '''' || 'SIN SERIE' || '''' ;
	
	  --  V_SERIE=lcComando;
      
FOR EXECUTE STATEMENT lcComando
      
	into :v_no_control,:v_cliente_id,:v_modelo,:v_fecha_venta, :v_contacto_creador, :v_contacto, :v_tipo_docto, :v_docto_ve_id
   DO BEGIN




select * from EXISTE_SERIE(:v_no_control) into :existe_serie;
   if (existe_serie ='F') then begin
		if (v_tipo_docto='R') then begin


	    	if (v_no_control <>'null' and CHAR_LENGTH(trim(v_no_control)) > 0 and v_no_control <> 'SIN SERIE'  ) then begin
				if (v_contacto_creador=0) then BEGIN	
		          SELECT M.FOLIO, M.TIPO_DOCTO FROM DOCTOS_VE M WHERE M.DOCTO_VE_ID = (SELECT L.DOCTO_VE_FTE_ID FROM  DOCTOS_VE_LIGAS L WHERE L.DOCTO_VE_DEST_ID = :v_docto_ve_id) into :v_folio, :v_tipo_docto_buscar;
	          
		          --v_folio = 'ESP000013';
		          --v_tipo_docto_buscar='P';
		          select coalesce(R_CONTACTO,'NO SE ENCONTRO FOLIO COTIZACION' ), coalesce(R_CONTACTO_CREADOR,0 ) from busca_contacto_zeus(:v_folio, :v_tipo_docto_buscar) into :v_contacto, :v_contacto_creador;
	
		        END
		        
--no_control + / + modelo + / + fecha_venta + / + garantia_no_poliza + / + nombre + / + codigo_contacto + / + fechaultservserie + / + fechaultservcliente + / + FECULTSERVCOBRA + / + CALIFLLAMSERVCOBRA
		       v_descripcion = v_no_control || ' / ' || v_modelo || ' / ' || v_fecha_venta  || ' / ' || 'Garantia'  || ' / ' || v_contacto  || ' / ' || v_contacto_creador  || ' /  /  /  /  '        ;
	           select s."VALUE" from SETTINGS s where s.KEY = 'anios_garantia' into :v_anios_garantia ;
	           --SIEMPRE DEBE INSERTAR EL ID CLIENTE SEA O NO SEA INSTITUCIONAL
	           select p_intenvario_id from INSERT_INVENTARIOS_ZEUS (:v_no_control, :v_cliente_id, :v_descripcion, :v_fecha_venta, dateadd(-1 day to dateadd(:v_anios_garantia year to :v_fecha_venta) )) into :v_inventario_id;
		       select P_INVOUT_ID from INSERT_LIB_INVENTARIOS_ZEUS (:v_inventario_id, :v_modelo, :v_contacto, 'Garantia',  :v_contacto_creador, :v_fecha_venta) into :v_lib_inventario_id;
		       select * from INSERT_POLITICAS_DSCTOS_ZEUS (:v_inventario_id) into :v_politicas_dsctos_id1, :v_politicas_dsctos_id2, :v_politicas_dsctos_id3;
		       --SIEMPRE DEBE INSERTAR EL ID CLIENTE SEA O NO SEA INSTITUCIONAL
	           select * from INSERT_INV_CLIENTES_ZEUS (:v_cliente_id, :v_inventario_id) into :v_inventario_cliente_id;
   		           INSERT INTO SERIES_TO_UPDATE (SERIE) VALUES ('SP_' || :v_no_control);
     V_SERIE=:v_no_control;

		    end
		end
   end
   

    SUSPEND;
   END

END