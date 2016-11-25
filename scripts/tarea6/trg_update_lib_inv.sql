/*
Highlight and execute the following statement to drop the trigger
before executing the create statement.

DROP TRIGGER UPDATE_LIB_INV_AFTUPD_0;

*/
DROP TRIGGER UPDATE_LIB_INV_AFTUPD_0;
CREATE TRIGGER UPDATE_LIB_INV_AFTUPD_0 FOR TAREAS
AFTER UPDATE
AS -- trigger que actualiza la tabla de libres inventtarios campos FECHAULTSERVSERIE y FECHAULTSERVCLIENTE
declare variable v_cliente_publico char(1);
declare variable v_estatus_terminado varchar(10);
declare variable v_orden_servicio varchar(10);
declare variable v_descripcion varchar(500);
declare variable v_inventario_id integer;
begin
  select * from ES_CLIENTE_PUBLICO(NEW.CLIENTE_ID) into :v_cliente_publico;
  select s."VALUE" from SETTINGS s where s.KEY = 'ESTATUS_TERMINADO' into :v_estatus_terminado ;
  select s."VALUE" from SETTINGS s where s.KEY = 'ORDEN_SERVICIO' into :v_orden_servicio ;
           
  
            
 if (OLD.fecha_concluida <> NEW.fecha_concluida and  NEW.TIPO_ID=v_orden_servicio and NEW.ESTATUS_ID=v_estatus_terminado) then begin
   --armamos descripcion interna para inventarios
   select trim(i.NO_CONTROL) || ' / ' ||  trim(l.MODELO_APARATO)|| ' / ' || l.FECHA_DE_VENTA || ' / ' || l.NUMERO_ULTIMA_POLIZA  
   || ' / ' || trim(coalesce(l.CONTACTO,'')) || ' / ' || trim(coalesce(l.CODIGO_CONTACTO,'')) || ' / ' || coalesce(l.FECHAULTSERVSERIE,'') || ' / ' || coalesce(l.FECHAULTSERVCLIENTE,'')||
   ' / ' || COALESCE(l.FECULTSERVCOBRA,'') || ' / ' || coalesce(l.CALIFLLAMSERCOBRA,'')
   from inventarios i inner join LIBRES_INVENTARIOS l on i.INVENTARIO_ID = l.INVENTARIO_ID where l.INVENTARIO_ID =NEW.INVENTARIO_ID into :v_descripcion;
  
   -- entonces actualizar tabla libres_inventarios
   update libres_inventarios set FECHAULTSERVSERIE = NEW.FECHA_INICIO where INVENTARIO_ID = NEW.INVENTARIO_ID;
   update INVENTARIOS set DESCRIPCION_INTERNA = :v_descripcion where INVENTARIO_ID = NEW.INVENTARIO_ID;
   v_descripcion = '';
   
   if(v_cliente_publico = 'T') then begin
     update LIBRES_INVENTARIOS set FECHAULTSERVCLIENTE = NEW.FECHA_INICIO where INVENTARIO_ID in (select i.INVENTARIO_ID from INVENTARIOS_CLIENTES i where i.CONTACTO_ID = NEW.CLIENTE_ID );
     

     FOR EXECUTE STATEMENT 'select i.INVENTARIO_ID from INVENTARIOS_CLIENTES i where i.CONTACTO_ID =' || NEW.CLIENTE_ID
      into :v_inventario_id
      DO BEGIN
        select trim(i.NO_CONTROL) || ' / ' ||  trim(l.MODELO_APARATO)|| ' / ' || l.FECHA_DE_VENTA || ' / ' || l.NUMERO_ULTIMA_POLIZA  
        || ' / ' || trim(coalesce(l.CONTACTO,'')) || ' / ' || trim(coalesce(l.CODIGO_CONTACTO,'')) || ' / ' || coalesce(l.FECHAULTSERVSERIE,'') || ' / ' || coalesce(l.FECHAULTSERVCLIENTE,'')||
        ' / ' || COALESCE(l.FECULTSERVCOBRA,'') || ' / ' || coalesce(l.CALIFLLAMSERCOBRA,'')
        from inventarios i inner join LIBRES_INVENTARIOS l on i.INVENTARIO_ID = l.INVENTARIO_ID where l.INVENTARIO_ID =:v_inventario_id into :v_descripcion;

       update INVENTARIOS set DESCRIPCION_INTERNA = :v_descripcion where INVENTARIO_ID = :v_inventario_id;
       v_descripcion = '';
      END
      
   end
 
 end
 
end

