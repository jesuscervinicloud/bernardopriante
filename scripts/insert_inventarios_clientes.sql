insert into INVENTARIOS_CLIENTES (contacto_id, inventario_id)
select i.CONTACTO_CREADOR_ID, i.INVENTARIO_ID from INVENTARIOS i where i.INVENTARIO_ID not in (select ic.INVENTARIO_ID from INVENTARIOS_CLIENTES ic)
; 