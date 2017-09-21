CREATE OR ALTER PROCEDURE CITA_PRIMERA_VEZ (P_CLIENTE_ID INTEGER)
 RETURNS (R_CLIENTE_ID INTEGER, R_PRIMERA_VEZ INTEGER, R_FECHA_INICIAL DATE, R_USUARIO_RESPONSABLE VARCHAR(200), VENDEDOR_ID INTEGER)
AS declare variable v_consulta varchar(1000);
declare variable path_bd_zeus varchar(1000);
declare variable username varchar(50);
declare variable password varchar(50);
BEGIN
	v_consulta = 'select first 1 a.CONTACTO_ID as CLIENTE_ID, (case a.ACTIVIDAD_TAREA_ID when null then null else 1 end), a.FECHA_INICIAL, a.USUARIO_RESPONSABLE, u.VENDEDOR_ID from ACTIVIDADES_TAREAS a inner join CONTACTO_CONTACTOS c on c.CONTACTO_CONTACTO_ID = a.CONTACTO_CONTACTO_ID inner join USUARIOS u on u.NOMBRE=a.USUARIO_RESPONSABLE where a.TIPO_ACTIVIDAD_ID in (4401,4403,4358,4364,4395,25849) AND a.CONTACTO_ID = '  ||  :P_CLIENTE_ID || ' order by a.FECHA_INICIAL desc' ;
                 
    select s."VALUE" from SETTINGS s where s.KEY = 'path_bd_zeus' into :path_bd_zeus ;
    select s."VALUE" from SETTINGS s where s.KEY = 'username' into :username ;
    select s."VALUE" from SETTINGS s where s.KEY = 'password' into :password ;
  EXECUTE STATEMENT v_consulta
  ON EXTERNAL DATA SOURCE path_bd_zeus
   AS USER username
   PASSWORD password
   INTO
     :R_CLIENTE_ID, :R_PRIMERA_VEZ, :R_FECHA_INICIAL, :R_USUARIO_RESPONSABLE, :vendedor_id;
        
     suspend;
END

