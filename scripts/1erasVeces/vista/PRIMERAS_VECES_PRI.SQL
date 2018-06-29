SET AUTODDL ON;

DROP VIEW VIEW_PRIMERAS_VECES;

/**************** DROPPING COMPLETE ***************/

CREATE VIEW VIEW_PRIMERAS_VECES ("1v1_CLIENTE_ID", "1v2_NOMBRE", "1v3_COMO_SUPO", "1v4_NOMBRE_DOCTOR", "1v5_TIENE_CITA_1A_VEZ", "1v6_FECHA_CITA_1A_VEZ", "1v7_RESPONSABLE_CITA_1A_VEZ", "1v8_FECHA_ALTA", "1v9_ANIO_MES_ALTA", "1v10_FECHA_1ER_COTIZACION", "1v11_FOLIO_1ER_COTIZACION", "1v12_VENDEDOR_1ER_COTIZACION", "1v13_TIENE_COTIZACION", "1v14_CITA_1A_VEZ_O_CON_COT", "1v14_1_VENDEDOR_COTIZ_O_1A_VEZ", "1v15_FECHA_1ER_PEDIDO", "1v16_FOLIO_1ER_PEDIDO", "1v17_TIENE_PEDIDO", "1v18_FECHA_REMISION", "1v19_FOLIO_REMISION", "1v20_VENDEDOR_1ER_REMISION", "1v21_TIENE_REMISION", "1v22_1ERA_REMISION_BINAURAL", "1v23_PRIM_2_REM_MENOS_90_DIAS", "1v24_ES_BINAURAL", "1v25_ALTA", "1v26_LETR_SUC_RESP_1A_VEZ", "1v27_LETRAS_COTIZACION", "1v28_LETRAS_REMISION", "1v29_SUCURSAL", "1v30_TOT_VENTA_REM_SIN_IVA", "1v31_TOT_VENTA_REM_2_SIN_IVA", "1v32_TOT_VENTA_SIN_IVA", "1v33_PRECIO_LIST_AP_1", "1v34_PRECIO_LIST_AP_2", "1v35_PRECIO_LIST_AP_REM2", "1v36_SUMA_PRECIO_LIST_AP_1_2", "1v37_PORCENTAJE_DESC", "1v38_EMPRESA", "1v39_EMPRESA_SUCURSAL", "1v40_FOLIO_SEG_REMISION", "1v41_FECHA_RECETA_DOCTOR")
AS                         

select
c.CLIENTE_ID 
 , c.NOMBRE 
 ,tc.NOMBRE 
 ,CLIENTE_MATRIZ.R_NOMBRE
,CITA_PRIMERA_VEZ.R_PRIMERA_VEZ  as "1v5_TIENE_CITA_1A_VEZ"
, CITA_PRIMERA_VEZ.R_FECHA_INICIAL
,CITA_PRIMERA_VEZ.R_USUARIO_RESPONSABLE
, c.FECHA_HORA_CREACION 
,('M' || extract(year from c.FECHA_HORA_CREACION) || substring(100+extract(month from c.FECHA_HORA_CREACION) from 2 for 2)) as "10"
, FECHA_PRIMERA_COTIZACION.FECHA  "1v10_FECHA_1ER_COTIZACION"
, FECHA_PRIMERA_COTIZACION.FOLIO 
, FECHA_PRIMERA_COTIZACION.VENDEDOR 
,FECHA_PRIMERA_COTIZACION.TIENE_COTIZACION  
,(case
            when CITA_PRIMERA_VEZ.R_PRIMERA_VEZ = 1 or FECHA_PRIMERA_COTIZACION.TIENE_COTIZACION =  1 then 1
            else null
          end)
,(case
            when FECHA_PRIMERA_COTIZACION.VENDEDOR is null then (case
              when CITA_PRIMERA_VEZ.R_USUARIO_RESPONSABLE is null then null
              else (select first 1 v.NOMBRE from VENDEDORES v where v.VENDEDOR_ID = cita_primera_vez.vendedor_id)
              end)
            else FECHA_PRIMERA_COTIZACION.VENDEDOR
          end) as "1v14_1_VENDEDOR_COTIZ_O_1A_VEZ"



, FECHA_PRIMER_PEDIDO.FECHA 
, FECHA_PRIMER_PEDIDO.FOLIO 
,FECHA_PRIMER_PEDIDO.TIENE_PEDIDO 
, FECHA_PRIMER_REMISION.FECHA
, FECHA_PRIMER_REMISION.FOLIO as "1v19_FOLIO_REMISION"
,FECHA_PRIMER_REMISION.VENDEDOR 
,FECHA_PRIMER_REMISION.TIENE_REMISION 
, FECHA_PRIMER_REMISION.DOS_PARTIDAS 
,REMISIONES_NOVENTA_DIAS.resultado 
, ( case
            when (coalesce(FECHA_PRIMER_REMISION.DOS_PARTIDAS,-1) = 1 or coalesce(REMISIONES_NOVENTA_DIAS.resultado,-1)=1) then 1
            when (coalesce(FECHA_PRIMER_REMISION.DOS_PARTIDAS,-1) = 0 and coalesce(REMISIONES_NOVENTA_DIAS.resultado,-1)=0) then 0
            when (coalesce(FECHA_PRIMER_REMISION.DOS_PARTIDAS,-1) = 0 and coalesce(REMISIONES_NOVENTA_DIAS.resultado,-1)=-1) then null
            when (coalesce(FECHA_PRIMER_REMISION.DOS_PARTIDAS,-1) = -1 and coalesce(REMISIONES_NOVENTA_DIAS.resultado,-1)=0) then null
            else null
          end) as "1v24_ES_BINAURAL"

,(case c.FECHA_HORA_CREACION when  null then null else 1 end  ) 
, (select s.CLAVE_SISTEMA from SUCURSALES s where s.SUCURSAL_ID = (select v.NOTAS from VENDEDORES v where v.VENDEDOR_ID =cita_primera_vez.vendedor_id)) 
, (case substring(FECHA_PRIMERA_COTIZACION.FOLIO from 2 for 2) when 'SP' then 'OB' else substring(FECHA_PRIMERA_COTIZACION.FOLIO from 2 for 2) end )
, (case substring(FECHA_PRIMER_REMISION.FOLIO from 2 for 2) when 'SP' then 'OB' else substring(FECHA_PRIMER_REMISION.FOLIO from 2 for 2) end )  as "1v28"
,(case coalesce((case substring(FECHA_PRIMERA_COTIZACION.FOLIO from 2 for 2) when 'SP' then 'OB' else substring(FECHA_PRIMERA_COTIZACION.FOLIO from 2 for 2) end ),'NULO') when 'NULO' then (select s.CLAVE_SISTEMA from SUCURSALES s where s.SUCURSAL_ID = (select v.NOTAS from VENDEDORES v where v.VENDEDOR_ID =cita_primera_vez.vendedor_id)) else (case substring(FECHA_PRIMERA_COTIZACION.FOLIO from 2 for 2) when 'SP' then 'OB' else substring(FECHA_PRIMERA_COTIZACION.FOLIO from 2 for 2) end ) end ) as "1v29_SUCURSAL"
, FECHA_PRIMER_REMISION.IMPORTE_NETO
, (case REMISIONES_NOVENTA_DIAS.RESULTADO WHEN 1 THEN REMISIONES_NOVENTA_DIAS.IMPORTE_SEGUNDA_REMISION END) 


,(CASE
   WHEN (coalesce(FECHA_PRIMER_REMISION.IMPORTE_NETO,0) <=0 ) and  (coalesce((case REMISIONES_NOVENTA_DIAS.RESULTADO WHEN 1 THEN REMISIONES_NOVENTA_DIAS.IMPORTE_SEGUNDA_REMISION END),0) <=0)THEN NULL
   ELSE coalesce(FECHA_PRIMER_REMISION.IMPORTE_NETO,0) + coalesce((case REMISIONES_NOVENTA_DIAS.RESULTADO WHEN 1 THEN REMISIONES_NOVENTA_DIAS.IMPORTE_SEGUNDA_REMISION END),0) 
END ) as "1v32_TOT_VENTA_SIN_IVA"



, fecha_primer_remision.precio_primer_aparato
, fecha_primer_remision.precio_segundo_aparato as "1v34_PRECIO_LIST_AP_2"
, REMISIONES_NOVENTA_DIAS.IMPORTE_SEGUNDA_REMISION

,(case 
    when (coalesce(fecha_primer_remision.precio_primer_aparato,0) <=0 and coalesce(fecha_primer_remision.precio_segundo_aparato,0) <=0 and coalesce(REMISIONES_NOVENTA_DIAS.PRECIO_PRIMER_APARATO,0) <=0 ) then null 
    else (coalesce(fecha_primer_remision.precio_primer_aparato,0) + coalesce(fecha_primer_remision.precio_segundo_aparato,0) + coalesce(REMISIONES_NOVENTA_DIAS.IMPORTE_SEGUNDA_REMISION,0) )
end) as "1v36_SUMA_PRECIO_LIST_AP_1_2"

,(CASE ( (case 
    when (coalesce(fecha_primer_remision.precio_primer_aparato,0) <=0 and coalesce(fecha_primer_remision.precio_segundo_aparato,0) <=0 and coalesce(REMISIONES_NOVENTA_DIAS.PRECIO_PRIMER_APARATO,0) <=0 ) then null 
    else (coalesce(fecha_primer_remision.precio_primer_aparato,0) + coalesce(fecha_primer_remision.precio_segundo_aparato,0) + coalesce(REMISIONES_NOVENTA_DIAS.IMPORTE_SEGUNDA_REMISION,0) )
end))
   
   WHEN 0 THEN null
   ELSE 
   
   cast((cast(1 as numeric(16,8)) - cast( (CASE
   WHEN (coalesce(FECHA_PRIMER_REMISION.IMPORTE_NETO,0) <=0 ) and  (coalesce((case REMISIONES_NOVENTA_DIAS.RESULTADO WHEN 1 THEN REMISIONES_NOVENTA_DIAS.IMPORTE_SEGUNDA_REMISION END),0) <=0)THEN NULL
   ELSE coalesce(FECHA_PRIMER_REMISION.IMPORTE_NETO,0) + coalesce((case REMISIONES_NOVENTA_DIAS.RESULTADO WHEN 1 THEN REMISIONES_NOVENTA_DIAS.IMPORTE_SEGUNDA_REMISION END),0) 
END )/(case 
    when (coalesce(fecha_primer_remision.precio_primer_aparato,0) <=0 and coalesce(fecha_primer_remision.precio_segundo_aparato,0) <=0 and coalesce(REMISIONES_NOVENTA_DIAS.PRECIO_PRIMER_APARATO,0) <=0 ) then null 
    else (coalesce(fecha_primer_remision.precio_primer_aparato,0) + coalesce(fecha_primer_remision.precio_segundo_aparato,0) + coalesce(REMISIONES_NOVENTA_DIAS.IMPORTE_SEGUNDA_REMISION,0) )
end) as numeric(16,8))
) as numeric(16,16))
END)as "1v37_PORCENTAJE_DESC"

,'PRI' 
, 'PRI' || '-' || (case coalesce((case substring(FECHA_PRIMERA_COTIZACION.FOLIO from 2 for 2) when 'SP' then 'OB' else substring(FECHA_PRIMERA_COTIZACION.FOLIO from 2 for 2) end ),'NULO') when 'NULO' then (select s.CLAVE_SISTEMA from SUCURSALES s where s.SUCURSAL_ID = (select v.NOTAS from VENDEDORES v where v.VENDEDOR_ID =cita_primera_vez.vendedor_id)) else (case substring(FECHA_PRIMERA_COTIZACION.FOLIO from 2 for 2) when 'SP' then 'OB' else substring(FECHA_PRIMERA_COTIZACION.FOLIO from 2 for 2) end ) end )  as "1v39_EMPRESA_SUCURSAL"

, REMISIONES_NOVENTA_DIAS.FOLIO_SEG_REMISION
,  FECHA_RECETA_DOCTOR.FECHA_RECETA_DOCTOR AS  "1V41_FECHARECETADOCTOR"

from CLIENTES c
inner join TIPOS_CLIENTES tc on tc.TIPO_CLIENTE_ID = c.TIPO_CLIENTE_ID
left join FECHA_PRIMER_PEDIDO(c.CLIENTE_ID) on 1=1
left join REMISIONES_NOVENTA_DIAS(c.CLIENTE_ID) on 1=1
left join FECHA_PRIMER_REMISION(c.CLIENTE_ID) on 1=1

left join CLIENTE_MATRIZ(c.CLIENTE_ID) on 1=1 
left join FECHA_PRIMERA_COTIZACION(c.CLIENTE_ID) on 1=1
left join CITA_PRIMERA_VEZ(c.CLIENTE_ID) on 1=1

left join FECHA_RECETA_DOCTOR(c.CLIENTE_ID) on 1=1
;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE
 ON VIEW_PRIMERAS_VECES TO  SYSDBA WITH GRANT OPTION;
