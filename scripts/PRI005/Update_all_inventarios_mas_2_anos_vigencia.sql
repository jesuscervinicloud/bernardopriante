--Consulta que modifica la fecha de vigencia a 2 años a todos los registros que tengan año de inicio de vigencia 2017

--select i.VIGENCIA_INICIO, i.VIGENCIA_FIN,  dateadd(2 YEAR to i.VIGENCIA_INICIO)  from inventarios i where extract(year from i.VIGENCIA_INICIO) = 2017;

update INVENTARIOS i set i.VIGENCIA_FIN = dateadd(2 YEAR to i.VIGENCIA_INICIO) where extract(year from i.VIGENCIA_INICIO) = 2017;
select i.VIGENCIA_INICIO, i.VIGENCIA_FIN,  dateadd(2 YEAR to i.VIGENCIA_INICIO)  from inventarios i where extract(year from i.VIGENCIA_INICIO) = 2017;
