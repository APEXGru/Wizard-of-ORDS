set sqlformat ansiconsole

create or replace procedure woo_proc1 is
begin
  null;
end;
/

create or replace function woo_func1 
return varchar2 is
begin
  return null;
end;
/

create or replace package woo_pkg as
  procedure proc;
  function func return varchar2;
end;
/

create or replace package body woo_pkg as
  procedure proc is begin null; end;
  function func return varchar2 is begin return null; end;
end;
/

begin
  ords.enable_object 
  ( p_object              => 'WOO_PROC1'
  , p_object_type         => 'PROCEDURE'  
  , p_object_alias        => 'proc1'
  );
  commit;
end;
/

begin
  ords.enable_object 
  ( p_object              => 'WOO_FUNC1'
  , p_object_type         => 'FUNCTION'  
  , p_object_alias        => 'func1'
  );
  commit;
end;
/

begin
  ords.enable_object 
  ( p_object              => 'WOO_PKG'
  , p_object_type         => 'PACKAGE'   
  , p_object_alias        => 'pkg'
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