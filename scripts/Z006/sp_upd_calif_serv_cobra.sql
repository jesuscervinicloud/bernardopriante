CREATE OR ALTER PROCEDURE UPD_CALIF_SERV_COBRA RETURNS (V_FECHA DATE, V_CONTACTO VARCHAR(100))
AS DECLARE lcComando varchar(5000);
DECLARE VARIABLE V_CONTACTO_ID varchar(100);
declare variable v_descripcion varchar(500);
declare variable v_inventario_id integer;
declare variable v_calificacion varchar(50);
BEGIN
      lcComando = 'select distinct d.FECHA, substring(d.CALIFICACION from 1 for 25), l.CODIGO_CONTACTO, l.INVENTARIO_ID from LIBRES_INVENTARIOS l inner join DATOS_CALIF_SERV_COBRA d on d.CONTACTO_ID=l.CODIGO_CONTACTO  order by l.INVENTARIO_ID desc';
FOR EXECUTE STATEMENT lcComando
      
into :V_FECHA, :v_calificacion, :V_CONTACTO, :v_inventario_id
   DO BEGIN
      update libres_inventarios l set l.CALIFLLAMSERCOBRA = :v_calificacion, l.FECULTSERVCOBRA =  :V_FECHA where l.INVENTARIO_ID = :v_inventario_id;
      select FIRST 1 trim(i.NO_CONTROL) || ' / ' ||  trim(l.MODELO_APARATO)|| ' / ' || l.FECHA_DE_VENTA || ' / ' || l.NUMERO_ULTIMA_POLIZA  
        || ' / ' || trim(coalesce(l.CONTACTO,'')) || ' / ' || trim(coalesce(l.CODIGO_CONTACTO,'')) || ' / ' || coalesce(l.FECHAULTSERVSERIE,'') || ' / ' || coalesce(l.FECHAULTSERVCLIENTE,'')
||
        ' / ' || COALESCE(l.FECULTSERVCOBRA,'') || ' / ' || coalesce(l.CALIFLLAMSERCOBRA,'')
        from inventarios i inner join LIBRES_INVENTARIOS l on i.INVENTARIO_ID = l.INVENTARIO_ID where l.INVENTARIO_ID = :v_inventario_id into :v_descripcion;

       update INVENTARIOS set DESCRIPCION_INTERNA = :v_descripcion where INVENTARIO_ID = :v_inventario_id;
       v_descripcion = '';


    SUSPEND;
   END

 END

