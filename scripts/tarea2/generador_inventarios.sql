CREATE GENERATOR GEN_INVENTARIOS_ID;

SET TERM !! ;
CREATE TRIGGER INVENTARIOS_BI FOR INVENTARIOS
ACTIVE BEFORE INSERT POSITION 0
AS
DECLARE VARIABLE tmp DECIMAL(18,0);
BEGIN
  IF (NEW.INVENTARIO_ID IS NULL) THEN
    NEW.INVENTARIO_ID = GEN_ID(GEN_INVENTARIOS_ID, 1);
  ELSE
  BEGIN
    tmp = GEN_ID(GEN_INVENTARIOS_ID, 0);
    if (tmp < new.INVENTARIO_ID) then
      tmp = GEN_ID(GEN_INVENTARIOS_ID, new.INVENTARIO_ID-tmp);
  END
END!!
SET TERM ; !!