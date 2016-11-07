CREATE OR ALTER PROCEDURE UPDATE_FECHAS_SERIES_CLIENTES RETURNS (V_CLIENTE_ID INTEGER, V_FECHA_SERIE DATE)
AS DECLARE lcComando varchar(500);
DECLARE VARIABLE V_FECHA_CLIENTE DATE;
DECLARE VARIABLE V_NO_CONTROL VARCHAR(30);
BEGIN
      
      lcComando = 'SELECT TRIM(F.NO_CONTROL), F.FECHA_SERIE, F.FECHA_CLIENTE, F.CLIENTE_ID FROM FECHAS_SERIE_CLIENTE F ORDER BY F.CLIENTE_ID';
FOR EXECUTE STATEMENT lcComando
      
into :V_NO_CONTROL, :V_FECHA_SERIE, :V_FECHA_CLIENTE,  :V_CLIENTE_ID
   DO BEGIN
    UPDATE LIBRES_INVENTARIOS SET FECHAULTSERVCLIENTE= :V_FECHA_CLIENTE, FECHAULTSERVSERIE = :V_FECHA_SERIE
    WHERE INVENTARIO_ID = (SELECT I.INVENTARIO_ID FROM INVENTARIOS I WHERE I.NO_CONTROL = :V_NO_CONTROL );
    
    SUSPEND;
   END

 END

