
CREATE GENERATOR gen_error_log;
SET GENERATOR gen_error_log TO 0;


CREATE TRIGGER error_log_bi_seq FOR error_log
before insert POSITION 0
AS -- insert trigger body here
begin 
  if (NEW.ID is NULL) then NEW.ID = GEN_ID(gen_error_log, 1);
end

