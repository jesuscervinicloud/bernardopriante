CREATE OR ALTER PROCEDURE UPDATE_FECHAS_INVENTARIO RETURNS (V_FECHA_INICIO VARCHAR(30), V_FECHA_FIN VARCHAR(30), V_SERIE VARCHAR(30))
AS DECLARE VARIABLE lcComando VARCHAR(500);
BEGIN
      
      lcComando = 'select trim(s.FECHA_DESDE), trim(s.FECHA_HASTA), substring(trim(S.SERI) from 1 for 30) from SERIES_APARATOS s where char_length(s.FECHA_DESDE)>0 order by s.SERI ';
FOR EXECUTE STATEMENT lcComando
      
   ON EXTERNAL DATA SOURCE 'C:\Users\jesus\Documents\bernardo\db\ZeusAudimed.fdb'
   AS USER 'SYSDBA'
   PASSWORD 'masterkey'
   INTO
      :V_FECHA_INICIO,
      :V_FECHA_FIN, :V_SERIE
      
   DO BEGIN
     UPDATE INVENTARIOS SET 
     VIGENCIA_INICIO = cast( '20'|| substring(:V_FECHA_INICIO from 7 for 2 )|| '-' || substring(:V_FECHA_INICIO from 4 for 2 )|| '-'||  substring(:V_FECHA_INICIO from 1 for 2 ) as date ), 
     VIGENCIA_FIN = cast( '20'|| substring(:V_FECHA_FIN from 7 for 2 )|| '-' || substring(:V_FECHA_FIN from 4 for 2 )|| '-'||  substring(:V_FECHA_FIN from 1 for 2 ) as date ) 
     WHERE trim(NO_CONTROL) = trim(:V_SERIE);
      SUSPEND;
   END
 END

