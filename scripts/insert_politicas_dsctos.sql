insert into POLITICAS_DSCTOS
select 'INV' tipo_objeto, i.INVENTARIO_ID objeto_id,  s.TIPO_OBJETO_DSCTO, cast(replace(s.OBJETO_DSCTO_ID, ',','.') as integer), cast(replace(s.POSICION, ',','.') as integer), 
cast(replace(replace(dscto, '0,', ''), ',','.') as numeric(9,6)) *100
from  series_aparatos s inner join INVENTARIOS i on i.NO_CONTROL = s.SERI
;



insert into POLITICAS_DSCTOS
select 'INV' tipo_objeto, i.INVENTARIO_ID objeto_id,  s.TIPO_OBJETO_DSCTO2, cast(replace(s.OBJETO_DSCTO_ID2, ',','.') as integer), 
cast(replace(s.POSICION2, ',','.') as integer), cast(replace(replace(s.DSCTO2, '0,', ''), ',','.') as numeric(9,6)) * 100
from  series_aparatos s inner join INVENTARIOS i on i.NO_CONTROL = s.SERI
;

insert into POLITICAS_DSCTOS
select 'INV' tipo_objeto, i.INVENTARIO_ID objeto_id,  s.TIPO_OBJETO_DSCTO3, cast(replace(s.OBJETO_DSCTO_ID3, ',','.') as integer), 
cast(replace(s.POSICION3, ',','.') as integer), cast(replace(replace(s.DSCTO3, '0,', ''), ',','.') as numeric(9,6))
from  series_aparatos s inner join INVENTARIOS i on i.NO_CONTROL = s.SERI
;