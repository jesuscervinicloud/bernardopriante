CREATE OR ALTER PROCEDURE UPDATE_FECHAULTSERVSERIE RETURNS (V_SERIE VARCHAR(100), V_FOLIO VARCHAR(100))
AS DECLARE lcComando varchar(6000);
declare variable v_inventario_id integer;
declare variable v_descripcion varchar(2000);
declare variable v_cliente_publico char(1);
declare variable v_fecha_inicio date;
declare variable v_inv_id integer;
declare variable v_cliente_id integer;
BEGIN
--Procedimiento que actualiza las fechas de los libres inventarios FECHAULTSERVSERIE y las descripcion internas de los mismos
--en produccion se debe quitar el where condition de tarea_id in...



--      lcComando = 'select max(t.FOLIO), i.NO_CONTROL from TAREAS t inner join LIBRES_INVENTARIOS l on l.INVENTARIO_ID = t.INVENTARIO_ID inner join INVENTARIOS i on i.INVENTARIO_ID=l.INVENTARIO_ID where  t.TIPO_ID = 4243 and t.ESTATUS_ID = 4245 and i.NO_CONTROL in  (select distinct(i.NO_CONTROL)   from  TAREAS t inner join LIBRES_INVENTARIOS l on l.INVENTARIO_ID = t.INVENTARIO_ID inner join INVENTARIOS i  on i.INVENTARIO_ID=l.INVENTARIO_ID where  t.TIPO_ID = 4243 and t.ESTATUS_ID = 4245 and t.TAREA_ID in (26695, 27961) ) group by i.NO_CONTROL order by i.NO_CONTROL';
      lcComando = 'select max(t.FOLIO), trim(i.NO_CONTROL) from TAREAS t inner join LIBRES_INVENTARIOS l on l.INVENTARIO_ID = t.INVENTARIO_ID inner join INVENTARIOS i on i.INVENTARIO_ID=l.INVENTARIO_ID where  t.TIPO_ID = 4243 and t.ESTATUS_ID = 4245 and l.FECHAULTSERVSERIE is null and i.NO_CONTROL in  (select distinct(i.NO_CONTROL)   from  TAREAS t inner join LIBRES_INVENTARIOS l on l.INVENTARIO_ID = t.INVENTARIO_ID inner join INVENTARIOS i  on i.INVENTARIO_ID=l.INVENTARIO_ID where  t.TIPO_ID = 4243 and t.ESTATUS_ID = 4245  ) group by i.NO_CONTROL order by i.NO_CONTROL';
FOR EXECUTE STATEMENT lcComando
  into :v_folio, :v_serie
   DO BEGIN


   select  t.CLIENTE_ID from TAREAS t where t.FOLIO = :v_folio into :v_cliente_id;
   select * from ES_CLIENTE_PUBLICO(:v_cliente_id) into :v_cliente_publico;
   select  t.FECHA_INICIO from TAREAS t where t.FOLIO = :v_folio into :v_fecha_inicio;
   select t.INVENTARIO_ID from TAREAS t where t.FOLIO = :v_folio into :v_inv_id;


   --Actualiza libres inventarios FECHAULTSERVSERIE
    update libres_inventarios set FECHAULTSERVSERIE = :v_fecha_inicio
    where INVENTARIO_ID = :v_inv_id;

   --Actualiza libres inventarios FECHAULTSERVCLIENTE  
   if(v_cliente_publico = 'T') then
     update LIBRES_INVENTARIOS set FECHAULTSERVCLIENTE = :v_fecha_inicio
     where INVENTARIO_ID in (select i.INVENTARIO_ID from INVENTARIOS_CLIENTES i where i.CONTACTO_ID = :v_cliente_id  );    
   
   if(v_cliente_publico = 'F') then
     UPDATE LIBRES_INVENTARIOS L SET L.FECHAULTSERVCLIENTE = :v_fecha_inicio WHERE L.CODIGO_CONTACTO in 
     (select L.CODIGO_CONTACTO from LIBRES_INVENTARIOS L where L.INVENTARIO_ID =  :v_inv_id);
   
   
    --Armamos descripcion interna
       select FIRST 1 trim(i.NO_CONTROL) || ' / ' ||  trim(l.MODELO_APARATO)|| ' / ' || l.FECHA_DE_VENTA || ' / ' || l.NUMERO_ULTIMA_POLIZA  
   || ' / ' || trim(coalesce(l.CONTACTO,'')) || ' / ' || trim(coalesce(l.CODIGO_CONTACTO,'')) || ' / ' || coalesce(l.FECHAULTSERVSERIE,'') || ' / ' || coalesce(l.FECHAULTSERVCLIENTE,'')
||
   ' / ' || COALESCE(l.FECULTSERVCOBRA,'') || ' / ' || coalesce(l.CALIFLLAMSERCOBRA,'')
   from inventarios i inner join LIBRES_INVENTARIOS l on i.INVENTARIO_ID = l.INVENTARIO_ID where l.INVENTARIO_ID = :v_inv_id into :v_descripcion;
  
   --Actualizamos la descripcion interna
   update INVENTARIOS set DESCRIPCION_INTERNA = :v_descripcion where INVENTARIO_ID =  :v_inv_id;
   v_descripcion = '';
   
   --Actualizamos desc interna para todos los inventarios del contacto.
   FOR EXECUTE STATEMENT 'select i.INVENTARIO_ID from INVENTARIOS_CLIENTES i where i.CONTACTO_ID =' || v_cliente_id
      into :v_inventario_id
      DO BEGIN
        select FIRST 1 trim(i.NO_CONTROL) || ' / ' ||  trim(l.MODELO_APARATO)|| ' / ' || l.FECHA_DE_VENTA || ' / ' || l.NUMERO_ULTIMA_POLIZA  
        || ' / ' || trim(coalesce(l.CONTACTO,'')) || ' / ' || trim(coalesce(l.CODIGO_CONTACTO,'')) || ' / ' || coalesce(l.FECHAULTSERVSERIE,'') || ' / ' || coalesce(l.FECHAULTSERVCLIENTE,'')
||
        ' / ' || COALESCE(l.FECULTSERVCOBRA,'') || ' / ' || coalesce(l.CALIFLLAMSERCOBRA,'')
        from inventarios i inner join LIBRES_INVENTARIOS l on i.INVENTARIO_ID = l.INVENTARIO_ID where l.INVENTARIO_ID =:v_inventario_id into :v_descripcion;

       update INVENTARIOS set DESCRIPCION_INTERNA = :v_descripcion where INVENTARIO_ID = :v_inventario_id;
       v_descripcion = '';
      END
      
   
      
    SUSPEND;
   END

 END

