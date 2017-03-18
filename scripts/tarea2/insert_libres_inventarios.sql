INSERT INTO LIBRES_INVENTARIOS (INVENTARIO_ID, MODELO_APARATO, CONTACTO, NUMERO_ULTIMA_POLIZA, CODIGO_CONTACTO, FECHA_DE_VENTA)
SELECT I.INVENTARIO_ID, replace(TRIM(S.MODELO),'Ê',''), 
replace(replace(replace(REPLACE(TRIM(S.CONTACTO),'„','Ñ'),'’','í'),'‡','á'),'—','ó'), 
replace(S.GARANTIA_POLIZA, 'Garant’a','Garantía'), S.CONTACTO_ID,
 cast( s.fecha_venta as date )
FROM INVENTARIOS I inner join SERIES_APARATOS S ON S.SERI=I.NO_CONTROL
;

select * from libres_inventarios;