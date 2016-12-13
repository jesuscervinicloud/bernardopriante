CREATE TRIGGER DESGL_EN_DISCR_VE_BF_DEL_0 FOR DESGLOSE_EN_DISCRETOS_VE  ACTIVE
BEFORE DELETE POSITION 0
AS -- insert trigger body here
begin
insert into settings values ((select max(id)+1 from settings), current_timestamp, current_timestamp );
end
