insert into INVENTARIOS (no_control, contacto_creador_id, descripcion_interna, vigencia_inicio, vigencia_fin) 
select  trim(s.SERI), s.ID_CLIENTE, s.CONTACTO,  
cast( '20'|| substring(s.FECHA_DESDE from 7 for 2 )|| '-' || substring(s.FECHA_DESDE from 4 for 2 )|| '-'||  substring(s.FECHA_DESDE from 1 for 2 ) as date ),
cast( '20'|| substring(s.FECHA_HASTA from 7 for 2 )|| '-' || substring(s.FECHA_HASTA from 4 for 2 )|| '-'||  substring(s.FECHA_HASTA from 1 for 2 ) as date )
from SERIES_APARATOS s where s.FECHA_DESDE <>'';


insert into INVENTARIOS (no_control, contacto_creador_id, descripcion_interna, vigencia_inicio, vigencia_fin) 
select  trim(s.SERI), s.ID_CLIENTE, s.CONTACTO,  
null,null
from SERIES_APARATOS s where s.FECHA_DESDE ='';

