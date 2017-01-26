/*Consultas para actualizar el campo CLAVESISTEMAANTERIOR porque 
el valor contiene un caracter especial y esto ocasiona que no se 
pueda manejar adecuadamente como string o como entero
*/

update LIBRES_CONTACTOS c set c.CLAVESISTEMAANTERIOR = substring(c.CLAVESISTEMAANTERIOR from 1 for char_length(c.CLAVESISTEMAANTERIOR)-2 )
where c.CLAVESISTEMAANTERIOR <> '' and char_length(c.CLAVESISTEMAANTERIOR)=10 ;


update LIBRES_CONTACTOS c set c.CLAVESISTEMAANTERIOR = substring(c.CLAVESISTEMAANTERIOR from 1 for char_length(c.CLAVESISTEMAANTERIOR)-2 )
where c.CLAVESISTEMAANTERIOR <> '' and char_length(c.CLAVESISTEMAANTERIOR) in (6,7) and   substring(c.CLAVESISTEMAANTERIOR from 1 for 2) = 'OB';

update LIBRES_CONTACTOS c set c.CLAVESISTEMAANTERIOR = substring(c.CLAVESISTEMAANTERIOR from 1 for char_length(c.CLAVESISTEMAANTERIOR)-2 )
where c.CLAVESISTEMAANTERIOR <> ''  and    substring(c.CLAVESISTEMAANTERIOR from 1 for char_length(c.CLAVESISTEMAANTERIOR)-2 ) = 'OB9';



select  char_length(c.CLAVESISTEMAANTERIOR), c.CLAVESISTEMAANTERIOR from LIBRES_CONTACTOS c where c.CLAVESISTEMAANTERIOR <> '' group by char_length(c.CLAVESISTEMAANTERIOR), c.CLAVESISTEMAANTERIOR;