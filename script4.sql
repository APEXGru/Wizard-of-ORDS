create or replace procedure woo_secret
( result out varchar2
)
is
begin
  result := 'You have unlocked a secret!';
end;
/

begin
  ords.enable_object 
  ( p_object              => 'WOO_SECRET'
  , p_object_type         => 'PROCEDURE'  
  , p_object_alias        => 'secret'
  , p_auto_rest_auth      => true 
  );
  commit;
end;
/

column updated_by format a10
column created_by format a10
column  name format a60
select * from user_ords_roles
/

begin
  oauth.create_client
  ( p_name            => 'woo client'
  , p_grant_type      => 'client_credentials'
  , p_owner           => 'Wizardry Ltd.'
  , p_description     => 'A client for woo'
  , p_support_email   => 'roelhartman@gmail.com'
  , p_privilege_names => 'oracle.dbtools.autorest.privilege.ORDS_API.WOO_SECRET'
  );
  commit;
end;
/

begin
  oauth.grant_client_role
  ( p_client_name => 'woo client'
  , p_role_name   => 'oracle.dbtools.role.autorest.ORDS_API.WOO_SECRET'
  );
  commit;
end;
/

select name, client_id, client_secret
from   user_ords_clients
/

exit

curl -i -k --user <client_id>:<client_secret> \
--data "grant_type=client_credentials" \
https://<machine:port>/ords/api/oauth/token


curl --request POST -i -k -H"Authorization: Bearer <token>" https://<machine:port>/ords/api/secret


