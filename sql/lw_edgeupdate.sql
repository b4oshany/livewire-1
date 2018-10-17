CREATE FUNCTION lw_edgeupdate()  RETURNS trigger AS 

$lw_edgeupdate$

  BEGIN
    RAISE NOTICE '%', format('%I.%I',TG_TABLE_SCHEMA, TG_TABLE_NAME); 
    RAISE NOTICE '-------------------------------------------------';
    RAISE NOTICE '%', row_to_json((NEW.*)); 
    RAISE NOTICE '%', row_to_json((OLD.*)); 
    RETURN NEW;

  END;
$lw_edgeupdate$ LANGUAGE plpgsql;

COMMENT ON FUNCTION lw_edgeupdate IS
  'Trigger function to fire for an update on any edge particpant';
