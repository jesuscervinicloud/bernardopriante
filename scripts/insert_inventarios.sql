
insert into INVENTARIOS (no_control, contacto_creador_id, descripcion_interna, vigencia_inicio, vigencia_fin) 
select  trim(s.SERI), s.ID_CLIENTE
,(trim(s.SERI)|| ' / ' ||replace(TRIM(S.MODELO),'Ê','')|| ' / ' ||  s.FECHA_VENTA || ' / ' || replace(S.GARANTIA_POLIZA, 'Garant’a','Garantía') || ' / ' || 
replace(replace(replace(REPLACE(TRIM(S.CONTACTO),'„','Ñ'),'’','í'),'‡','á'),'—','ó')|| ' / ' || s.CONTACTO_ID )  

,cast(s.FECHA_DESDE as date ),
cast(s.FECHA_HASTA  as date )
from SERIES_APARATOS s ;
select * from 