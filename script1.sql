PROMPT Run this as ORDS_API user

set sqlformat ansiconsole

begin
  ords.enable_schema
  ( p_url_mapping_pattern => 'api'       -- Obfuscate your real schema name (security!)
  );
  commit;
end; 
/


PROMPT select * from user_ords_schemas
PROMPT -------------------------------

select * from user_ords_schemas
/

exit  

http://<machine:port>/ords/api/metadata-catalog/
