CREATE OR ALTER PROCEDURE UPDATE_FECHAULTSERVSERIE RETURNS (V_FECHA_CONCLUIDA DATE, V_TAREA_ID INTEGER)
AS DECLARE lcComando varchar(5000);
--DECLARE VARIABLE V_FECHA_CONCLUIDA DATE;
--declare variable v_tarea_id integer;
BEGIN
      lcComando = 'select t.TAREA_ID, t.FECHA_CONCLUIDA from TAREAS t where t.TIPO_ID = 4243 and t.ESTATUS_ID = 4245 and t.TAREA_ID=16301';
--      lcComando = 'select t.TAREA_ID, t.FECHA_CONCLUIDA from TAREAS t inner join LIBRES_INVENTARIOS l on t.INVENTARIO_ID=l.INVENTARIO_ID where t.TIPO_ID = 4243 and t.ESTATUS_ID = 4245 and l.FECHAULTSERVSERIE is null';
FOR EXECUTE STATEMENT lcComando
  into :v_tarea_id, :V_FECHA_CONCLUIDA
   DO BEGIN
    update TAREAS t set t.FECHA_CONCLUIDA = null where t.TAREA_ID = :v_tarea_id;
    update TAREAS t set t.FECHA_CONCLUIDA = :V_FECHA_CONCLUIDA where t.TAREA_ID = :v_tarea_id;
      
    SUSPEND;
   END

 END

