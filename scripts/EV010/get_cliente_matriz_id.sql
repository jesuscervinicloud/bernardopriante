CREATE OR ALTER PROCEDURE UPDATE_NOTAS_CLIENTES RETURNS (V_CLIENTE_ID INTEGER, V_NOMBRE VARCHAR(100))
AS DECLARE lcComando varchar(5000);

BEGIN
      lcComando = 'select c.cliente_id from CLIENTES c';
      
FOR EXECUTE STATEMENT lcComando
      
into :V_CLIENTE_ID
   DO BEGIN
   V_NOMBRE = null;
   select d.NOMBRE from CLIENTES d where d.CLIENTE_ID = (select first 1 P_CLIENTE_MATRIZ_ID from GET_CLIENTE_MATRIZ_ID(:V_CLIENTE_ID)) into :V_NOMBRE;
--   if (:V_NOMBRE is not null) then 
      --V_NOMBRE = 'not nulo';
      update CLIENTES c set c.NOTAS = coalesce(:V_NOMBRE, 'nulo' )  || ' ' || coalesce(c.NOTAS, '' ) where c.CLIENTE_ID = :V_CLIENTE_ID;
     
   SUSPEND;
   END

 END

