insert into INVENTARIOS (no_control, contacto_creador_id, descripcion_interna, vigencia_inicio, vigencia_fin) 
select  trim(s.NO_SERIE), trim(s.CLIENTE_ID_MICROSIP),   
trim(s.NO_SERIE)|| ' / ' ||replace(TRIM(s.MODELO),'Ê','')|| ' / ' ||  s.FECHA_VENTA || ' / Garantía /' ||
replace(replace(replace(REPLACE(TRIM(s.NOMBRE_CLIENTE),'„','Ñ'),'’','í'),'‡','á'),'—','ó')|| ' / ' 
,cast(s.FECHA_DESDE as date ),
cast(s.FECHA_HASTA as date )
from SERIES_VENDIDOS_PRI_TODOS s;

