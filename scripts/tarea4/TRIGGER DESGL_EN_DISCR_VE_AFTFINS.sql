CREATE or alter TRIGGER DESGL_EN_DISCR_VE_AFTFINS_0 FOR DESGLOSE_EN_DISCRETOS_VE
AFTER INSERT
AS -- insert trigger body here
DECLARE VARIABLE v_no_control varchar(30);
declare variable v_cliente_id integer;
declare variable v_modelo varchar(50);
declare variable v_fecha_venta date;
declare variable v_contacto_creador integer =0;
declare variable v_contacto varchar(50) = '';
declare variable v_tipo_docto char(1);
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
BEGIN
	select 
	coalesce(ad.CLAVE,'null')
	,c.CLIENTE_ID
	,TRIM(REPLACE(replace(a.NOMBRE,'APARATO','' ),'AUDITIVO','')) modelo
	,m.FECHA fecha_venta
	,coalesce((case c.ZONA_CLIENTE_ID
	   when 9904 then c.CLIENTE_ID
	   when 9932 then 0
	  end
	),0)
	,(case c.ZONA_CLIENTE_ID
	   when 9904 then c.NOMBRE
	   when 9932 then 'buscar'
	  end
	) contacto, m.TIPO_DOCTO, m.FOLIO
	from DESGLOSE_EN_DISCRETOS_VE dd inner join ARTICULOS_DISCRETOS ad on ad.ART_DISCRETO_ID = dd.ART_DISCRETO_ID
	inner join DOCTOS_VE_DET d on d.DOCTO_VE_DET_ID = dd.DOCTO_VE_DET_ID inner join DOCTOS_VE m on m.DOCTO_VE_ID = d.DOCTO_VE_ID
	inner join CLIENTES c on c.CLIENTE_ID = m.CLIENTE_ID inner join ARTICULOS a on a.ARTICULO_ID = ad.ARTICULO_ID
	where dd.DESGLOSE_DISCRETO_VE_ID = NEW.DESGLOSE_DISCRETO_VE_ID into :v_no_control,:v_cliente_id,:v_modelo,:v_fecha_venta, :v_contacto_creador, :v_contacto, :v_tipo_docto, :v_folio;


	if (v_tipo_docto='R') then begin

    	if (v_no_control <>'null' and CHAR_LENGTH(trim(v_no_control)) > 0 ) then begin
			if (v_contacto_creador=0) then	
	          select coalesce(R_CONTACTO,'NO SE ENCONTRO FOLIO COTIZACION' ), coalesce(R_CONTACTO_CREADOR,0 ) from busca_contacto_zeus(:v_folio, :v_tipo_docto) into :v_contacto_creador, :v_contacto;
	
	       
	       v_descripcion = v_no_control || ' / ' || v_modelo || ' / ' || v_fecha_venta  || ' / ' || 'Garantía'  || ' / ' || v_contacto  || ' / ' || v_contacto_creador;

	       select s."VALUE" from SETTINGS s where s.KEY = 'años_garantia' into :v_anios_garantia ;

	       select p_intenvario_id from INSERT_INVENTARIOS_ZEUS (:v_no_control, :v_contacto_creador, :v_descripcion, :v_fecha_venta, dateadd(-1 day to dateadd(:v_anios_garantia year to :v_fecha_venta) )) into :v_inventario_id;
	       select P_INVOUT_ID from INSERT_LIB_INVENTARIOS_ZEUS (:v_inventario_id, :v_modelo, :v_contacto, 'Garantía',  :v_contacto_creador, :v_fecha_venta) into :v_lib_inventario_id;
	       select * from INSERT_POLITICAS_DSCTOS_ZEUS (:v_inventario_id) into :v_politicas_dsctos_id1, :v_politicas_dsctos_id2, :v_politicas_dsctos_id3;
	       select * from INSERT_INV_CLIENTES_ZEUS (:v_contacto_creador, :v_inventario_id) into :v_inventario_cliente_id;
       end
	end

END

