/*
Highlight and execute the following statement to drop the trigger
before executing the create statement.

DROP TRIGGER DOCTOS_VE_FECHA_AFT_UPD_1;

*/

CREATE or alter TRIGGER DOCTOS_VE_FECHA_AFT_UPD_1 FOR DOCTOS_VE
AFTER UPDATE
AS 
/* TRIGGER QUE ACTUALIZA LOS CAMPOS DE VIGENCIAS DE INVENTARIOS Y FECHA VENTA DE LIBRES INVENTARIOS DE ZEUS
*/
DECLARE VARIABLE v_inventario_id integer;
DECLARE VARIABLE UPDATED_LI varchar(1);
declare variable lcComando varchar(5000);
declare variable v_no_control varchar(30);
BEGIN 
  IF (OLD.FECHA <> NEW.FECHA) THEN BEGIN
  -- obtenemos todos los #de serie que se van a afectar porque esta tabla es maestra y tiene detellas
    lcComando= 'SELECT ad.clave FROM DESGLOSE_EN_DISCRETOS_VE dd inner join ARTICULOS_DISCRETOS ad on ad.ART_DISCRETO_ID = dd.ART_DISCRETO_ID '||
	' inner join DOCTOS_VE_DET d on d.DOCTO_VE_DET_ID = dd.DOCTO_VE_DET_ID inner join DOCTOS_VE m on m.DOCTO_VE_ID = d.DOCTO_VE_ID ' ||
	' inner join CLIENTES c on c.CLIENTE_ID = m.CLIENTE_ID inner join ARTICULOS a on a.ARTICULO_ID = ad.ARTICULO_ID WHERE m.DOCTO_VE_ID = ' || NEW.DOCTO_VE_ID;
	
	FOR EXECUTE STATEMENT lcComando
    INTO
      :v_no_control      
    DO BEGIN
      --ACTUALIZAR INVENTARIOS.VIGENCIA_INICIO Y FIN
      SELECT * FROM UPDATE_INVENTARIO_ZEUS(:v_no_control, '', NEW.FECHA) INTO :v_inventario_id;
    
      --ahora actualizamos las fechas de libres_inventarios
      if (v_inventario_id <> 0) then
        select * from UPDATE_LIB_INV_ZEUS(:v_inventario_id, NEW.FECHA) into :UPDATED_LI;
      --select * from UPDATE_LIB_INV_ZEUS(19405, NEW.FECHA) into :UPDATED_LI;
      

    END
	
	
	
	
	
	
	
  
    
    
  END
END

