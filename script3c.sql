set sqlformat ansiconsole

create or replace procedure woo_proc3 
( p_result  out sys_refcursor
)
is
begin
 open p_result for
   select * from my_customers_vw;
end;
/

create or replace function woo_func3 
return sys_refcursor
is
  p_result  sys_refcursor;
begin
 open p_result for
   select * from my_customers_vw;
 return p_result;  
end;
/

begin
  ords.enable_object 
  ( p_object              => 'WOO_PROC3'
  , p_object_type         => 'PROCEDURE'  
  , p_object_alias        => 'proc3'
  );
  commit;
end;
/

begin
  ords.enable_object 
  ( p_object              => 'WOO_FUNC3'
  , p_object_type         => 'FUNCTION'  
  , p_object_alias        => 'func3'
  );
  commit;
end;
/

select parsing_object, object_alias, type 
from user_ords_enabled_objects
/

select method, base_path, pattern, name
from user_ords_services
/

exit;
 