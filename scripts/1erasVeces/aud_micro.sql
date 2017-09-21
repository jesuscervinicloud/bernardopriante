select * from ARTICULOS a where a.ARTICULO_ID in (
1843,
1858,
1915,
1924,
3456,
3683,
3752,
27919
);

select  la.* from LINEAS_ARTICULOS la where la.LINEA_ARTICULO_ID in (
325,
351,
362,
364,
19245);

select gl.* from GRUPOS_LINEAS gl where gl.GRUPO_LINEA_ID in ( 
315,
316,
318,
324
);

select gl.* from GRUPOS_LINEAS gl where gl.GRUPO_LINEA_ID in (
select  la.GRUPO_LINEA_ID from LINEAS_ARTICULOS la where la.LINEA_ARTICULO_ID in (select a.LINEA_ARTICULO_ID from ARTICULOS a where a.ARTICULO_ID = 1843)
) and gl.NOMBRE = 'APARATO' ;


select m.FECHA, m.FOLIO from DOCTOS_VE m where m.CLIENTE_ID=184078 and m.TIPO_DOCTO = 'P' order by m.FECHA desc;
--select * from FECHA_PRIMER_PEDIDO(166533);
select gl.NOMBRE from GRUPOS_LINEAS gl where gl.NOMBRE = 'APARATO' and
		 gl.GRUPO_LINEA_ID = (select first 1 la.GRUPO_LINEA_ID from LINEAS_ARTICULOS la where la.LINEA_ARTICULO_ID in 
		(select first 1 a.LINEA_ARTICULO_ID from ARTICULOS a where a.ARTICULO_ID = :v_articulo_id));
		
select d.ARTICULO_ID from DOCTOS_VE m inner join DOCTOS_VE_DET d on m.DOCTO_VE_ID=d.DOCTO_VE_ID where m.CLIENTE_ID =184078 and m.FOLIO='LAB001822';

select  first 1 gl.NOMBRE from DOCTOS_VE m inner join DOCTOS_VE_DET d on m.DOCTO_VE_ID=d.DOCTO_VE_ID inner join ARTICULOS a on a.ARTICULO_ID=d.ARTICULO_ID inner join LINEAS_ARTICULOS la on la.LINEA_ARTICULO_ID=a.LINEA_ARTICULO_ID inner join GRUPOS_LINEAS gl on gl.GRUPO_LINEA_ID=la.GRUPO_LINEA_ID where gl.NOMBRE = 'APARATO' and m.FOLIO = 'ESP000004' and m.CLIENTE_ID =  166288 ;

select * from es_familia_aparato('ESP000003' , 166288,1) ;

select m.FOLIO, m.fecha from DOCTOS_VE m where m.CLIENTE_ID= 166288 and m.TIPO_DOCTO='P' and m.ESTATUS not in ('C', 'D') order by m.FECHA;
