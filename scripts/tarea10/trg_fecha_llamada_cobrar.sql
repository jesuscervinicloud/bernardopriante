CREATE or alter TRIGGER FECHA_LLAMADA_COBRAR FOR acciones_tareas
ACTIVE
AFTER
INSERT OR UPDATE 
POSITION 0
AS
declare v_contacto integer;
declare es_publico char(1);
declare variable v_descripcion varchar(500);
declare variable v_inventario_id integer;
declare V_CLAVESISTEMAANTERIOR varchar(10);
declare V_CONTACTO_ID integer;

begin
  if (NEW.tipo_accion_id=(select s."VALUE" from SETTINGS s where s.KEY='TIPO_ACCION_ID'))then begin
    select * from es_cliente_publico(new.contacto_id) into :es_publico;
    if (es_publico='T') then begin
      update LIBRES_INVENTARIOS l set l.FECULTSERVCOBRA = NEW.FECHA, l.CALIFLLAMSERCOBRA = (select first 1 c.NOMBRE from CALIFICACION_ACCIONES c where c.CALIFICACION_ACCION_ID=NEW.calificacion_accion_id) where l.INVENTARIO_ID in (select distinct i.INVENTARIO_ID from INVENTARIOS_CLIENTES i where i.CONTACTO_ID = NEW.contacto_id );
      -- obteniendo la descripcion interna
      FOR EXECUTE STATEMENT 'select i.INVENTARIO_ID from INVENTARIOS_CLIENTES i where i.CONTACTO_ID =' || new.contacto_id
       into :v_inventario_id
      DO BEGIN
        select trim(i.NO_CONTROL) || ' / ' ||  trim(l.MODELO_APARATO)|| ' / ' || l.FECHA_DE_VENTA || ' / ' || l.NUMERO_ULTIMA_POLIZA  
        || ' / ' || trim(coalesce(l.CONTACTO,'')) || ' / ' || trim(coalesce(l.CODIGO_CONTACTO,'')) || ' / ' || coalesce(l.FECHAULTSERVSERIE,'') || ' / ' || coalesce(l.FECHAULTSERVCLIENTE,'')
||
        ' / ' || COALESCE(l.FECULTSERVCOBRA,'') || ' / ' || coalesce(l.CALIFLLAMSERCOBRA,'')
        from inventarios i inner join LIBRES_INVENTARIOS l on i.INVENTARIO_ID = l.INVENTARIO_ID where l.INVENTARIO_ID =:v_inventario_id into :v_descripcion;

       update INVENTARIOS set DESCRIPCION_INTERNA = :v_descripcion where INVENTARIO_ID = :v_inventario_id;
       v_descripcion = '';
      END
      
      --update INVENTARIOS i set i.DESCRIPCION_INTERNA ='nueva' where i.INVENTARIO_ID in (select distinct i.INVENTARIO_ID from INVENTARIOS_CLIENTES i where i.CONTACTO_ID = NEW.contacto_id );
    end
    else begin
      select FIRST 1 coalesce(CLAVESISTEMAANTERIOR,C.CONTACTO_CONTACTO_ID) from LIBRES_CONTACTOS c where c.CONTACTO_CONTACTO_ID = NEW.contacto_id into :V_CONTACTO_ID;
      
      update LIBRES_INVENTARIOS l set l.FECULTSERVCOBRA = NEW.FECHA, l.CALIFLLAMSERCOBRA = (select first 1 c.NOMBRE from CALIFICACION_ACCIONES c where c.CALIFICACION_ACCION_ID=NEW.calificacion_accion_id) where l.INVENTARIO_ID in (select distinct i.INVENTARIO_ID from INVENTARIOS_CLIENTES i where i.CONTACTO_ID = :V_CONTACTO_ID );
    
      	FOR EXECUTE STATEMENT 'select i.INVENTARIO_ID from INVENTARIOS_CLIENTES i where i.CONTACTO_ID =' || :V_CONTACTO_ID
	       into :v_inventario_id
	      DO BEGIN
	        select first 1 trim(i.NO_CONTROL) || ' / ' ||  trim(l.MODELO_APARATO)|| ' / ' || l.FECHA_DE_VENTA || ' / ' || l.NUMERO_ULTIMA_POLIZA  
	        || ' / ' || trim(coalesce(l.CONTACTO,'')) || ' / ' || trim(coalesce(l.CODIGO_CONTACTO,'')) || ' / ' || coalesce(l.FECHAULTSERVSERIE,'') || ' / ' || coalesce(l.FECHAULTSERVCLIENTE,'')
	||
	        ' / ' || COALESCE(l.FECULTSERVCOBRA,'') || ' / ' || coalesce(l.CALIFLLAMSERCOBRA,'')
	        from inventarios i inner join LIBRES_INVENTARIOS l on i.INVENTARIO_ID = l.INVENTARIO_ID where l.INVENTARIO_ID =:v_inventario_id into :v_descripcion;
	
	       update INVENTARIOS set DESCRIPCION_INTERNA = :v_descripcion where INVENTARIO_ID = :v_inventario_id;
	       v_descripcion = '';
	      END  
        
        
    end
    
  end

end

