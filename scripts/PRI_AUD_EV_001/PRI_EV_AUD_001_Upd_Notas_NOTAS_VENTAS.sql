
--Consulta que actualiza el campo Notas Ventas de la tabla articulos, y campo imprimir notas ventas


select a.ARTICULO_ID, a.LINEA_ARTICULO_ID, a.NOMBRE, a.IMPRIMIR_NOTAS_VENTAS, a.NOTAS_VENTAS 
from ARTICULOS a where a.LINEA_ARTICULO_ID not in (333, 334, 335, 336, 337, 338, 19244, 19245 , 294229) order by a.LINEA_ARTICULO_ID;


update ARTICULOS set NOTAS_VENTAS = coalesce(NOTAS_VENTAS, '') || ' - ' || NOMBRE, IMPRIMIR_NOTAS_VENTAS='S'
where LINEA_ARTICULO_ID not in (333, 334, 335, 336, 337, 338, 19244, 19245 , 294229) ;

