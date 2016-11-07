/*
Highlight and execute the following statement to drop the trigger
before executing the create statement.

DROP TRIGGER UPDATE_LIB_INV_AFTUPD_0;

*/

CREATE TRIGGER UPDATE_LIB_INV_AFTUPD_0 FOR TAREAS
AFTER UPDATE
AS -- trigger que actualiza la tabla de libres inventtarios campos FECHAULTSERVSERIE y FECHAULTSERVCLIENTE
declare variable v_cliente_publico char(1);
begin
  select * from ES_CLIENTE_PUBLICO(NEW.CLIENTE_ID) into :v_cliente_publico;
  
 if (OLD.fecha_concluida <> NEW.fecha_concluida and  NEW.TIPO_ID=4243 and NEW.ESTATUS_ID=4245) then begin
   -- entonces actualizar tabla libres_inventarios
   update libres_inventarios set FECHAULTSERVSERIE = NEW.FECHA_INICIO where INVENTARIO_ID = NEW.INVENTARIO_ID;
   if(v_cliente_publico = 'T') then 
     update LIBRES_INVENTARIOS set FECHAULTSERVCLIENTE = NEW.FECHA_INICIO where INVENTARIO_ID in (select i.INVENTARIO_ID from INVENTARIOS_CLIENTES i where i.CONTACTO_ID = NEW.CLIENTE_ID );
 end
 
end

