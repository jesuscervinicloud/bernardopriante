CREATE or alter TRIGGER DEL_FECHA_LLAMADA_COBRAR FOR acciones_tareas  ACTIVE AFTER DELETE POSITION 0
as
declare v_contacto integer;
declare es_publico char(1);
declare variable v_descripcion varchar(500);
declare variable v_inventario_id integer;
declare V_CLAVESISTEMAANTERIOR varchar(20);
declare V_CONTACTO_ID varchar(20);
declare v_prev_tarea_id integer;
declare v_prev_fecha date;
begin

  --1o buscamos el registro de tareas previo
  select coalesce(max(a.ACCION_TAREA_ID),0)  from ACCIONES_TAREAS a where a.TIPO_ACCION_ID = 
  (select s."VALUE" from SETTINGS s where s.KEY='TIPO_ACCION_ID') and a.CONTACTO_ID = OLD.contacto_id and a.ACCION_TAREA_ID <> OLD.accion_tarea_id into :v_prev_tarea_id;
  insert into settings values ((select max(s.id)+1 from settings s ), :v_prev_tarea_id, 'PREV_TAREA_ID');
  
  if (OLD.tipo_accion_id=(select s."VALUE" from SETTINGS s where s.KEY='TIPO_ACCION_ID') and  :v_prev_tarea_id <> 0)then begin
    select * from es_cliente_publico(OLD.contacto_id) into :es_publico;
    if (es_publico='T') then begin
    insert into settings values ((select max(s.id)+1 from settings s ), (select a.FECHA from ACCIONES_TAREAS a where a.TAREA_ID = :v_prev_tarea_id), 'es publico');
    
    
      update LIBRES_INVENTARIOS l set l.FECULTSERVCOBRA = (select a.FECHA from ACCIONES_TAREAS a where a.ACCION_TAREA_ID  = :v_prev_tarea_id), l.CALIFLLAMSERCOBRA = 
      (select first 1 c.NOMBRE from CALIFICACION_ACCIONES c where c.CALIFICACION_ACCION_ID=(select a.calificacion_accion_id from ACCIONES_TAREAS a where a.ACCION_TAREA_ID = :v_prev_tarea_id)) 
      where l.INVENTARIO_ID in (select distinct i.INVENTARIO_ID from INVENTARIOS_CLIENTES i where i.CONTACTO_ID = OLD.CONTACTO_ID );
      -- obteniendo la descripcion interna
      FOR EXECUTE STATEMENT 'select i.INVENTARIO_ID from INVENTARIOS_CLIENTES i where i.CONTACTO_ID =' || (select a.CONTACTO_ID from ACCIONES_TAREAS a where a.ACCION_TAREA_ID = :v_prev_tarea_id)
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
      
    end
    else begin
      select FIRST 1 coalesce(CLAVESISTEMAANTERIOR, (select a.CONTACTO_CONTACTO_ID from ACCIONES_TAREAS a where a.ACCION_TAREA_ID = :v_prev_tarea_id))  from LIBRES_CONTACTOS c where c.CONTACTO_CONTACTO_ID = (select a.CONTACTO_CONTACTO_ID from ACCIONES_TAREAS a where a.ACCION_TAREA_ID = :v_prev_tarea_id)  into :V_CONTACTO_ID;
      update LIBRES_INVENTARIOS l set l.FECULTSERVCOBRA = (select a.FECHA from ACCIONES_TAREAS a where a.ACCION_TAREA_ID = :v_prev_tarea_id), l.CALIFLLAMSERCOBRA = (select first 1 c.NOMBRE from CALIFICACION_ACCIONES c where c.CALIFICACION_ACCION_ID=(select a.CALIFICACION_ACCION_ID from ACCIONES_TAREAS a where a.ACCION_TAREA_ID = :v_prev_tarea_id)) where l.INVENTARIO_ID in (select distinct i.INVENTARIO_ID from INVENTARIOS_CLIENTES i where i.CONTACTO_ID = :V_CONTACTO_ID );
    
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

