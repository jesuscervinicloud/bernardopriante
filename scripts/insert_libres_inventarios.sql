INSERT INTO LIBRES_INVENTARIOS (INVENTARIO_ID, MODELO_APARATO, CONTACTO, NUMERO_ULTIMA_POLIZA, CODIGO_CONTACTO, FECHA_DE_VENTA)
SELECT I.INVENTARIO_ID, replace(TRIM(S.MODELO),'�',''), 
replace(replace(replace(REPLACE(TRIM(S.CONTACTO),'�','�'),'�','�'),'�','�'),'�','�'), 
replace(S.GARANTIA_POLIZA, 'Garant�a','Garant�a'), S.CONTACTO_ID,
 cast( '20'|| substring(s.FECHA_VENTA from 7 for 2 )|| '-' || substring(s.FECHA_VENTA from 4 for 2 )|| '-'||  substring(s.FECHA_VENTA from 1 for 2 ) as date )
FROM INVENTARIOS I inner join SERIES_APARATOS S ON S.SERI=I.NO_CONTROL
;
