CREATE GENERATOR GEN_SERIES_TO_UPDATE_ID;

SET TERM !! ;
CREATE TRIGGER SERIES_TO_UPDATE_BI FOR SERIES_TO_UPDATE
ACTIVE BEFORE INSERT POSITION 0
AS
DECLARE VARIABLE tmp DECIMAL(18,0);
BEGIN
  IF (NEW.ID IS NULL) THEN
    NEW.ID = GEN_ID(GEN_SERIES_TO_UPDATE_ID, 1);
  ELSE
  BEGIN
    tmp = GEN_ID(GEN_SERIES_TO_UPDATE_ID, 0);
    if (tmp < new.ID) then
      tmp = GEN_ID(GEN_SERIES_TO_UPDATE_ID, new.ID-tmp);
  END
END!!
SET TERM ; !!
