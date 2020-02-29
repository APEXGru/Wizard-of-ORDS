set sqlformat ansiconsole

create or replace procedure woo_proc2 
( p_number1 number
, p_number2 number
, p_result out number
, the_answer_is out number
)
is
begin
  p_result := p_number1 + p_number2;
  the_answer_is := 42;
end;
/

create or replace function woo_func2 
( p_number1 number
, p_number2 number
) return number
is
begin
  return p_number1 + p_number2;
end;
/

begin
  ords.enable_object 
  ( p_object              => 'WOO_PROC2'
  , p_object_type         => 'PROCEDURE'  
  , p_object_alias        => 'proc2'
  );
  commit;
end;
/

begin
  ords.enable_object 
  ( p_object              => 'WOO_FUNC2'
  , p_object_type         => 'FUNCTION'  
  , p_object_alias        => 'func2'
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
 