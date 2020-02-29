begin
  oauth.delete_client
  ( p_name => 'woo client'
  );
  commit;
end;
/

begin
  ords.delete_privilege_mapping
  ( p_privilege_name => 'woo_secret_priv'
  , p_pattern => '/secret/'
  );     
  commit;
end;
/
  
begin
  ords.delete_privilege 
  ( p_name => 'woo_secret_priv'
  );
  commit;
end;
/

begin
  ords.delete_role
  ( p_role_name => 'woo_secret_role'
  );
  commit;
end;
/

begin
  ords.drop_rest_for_schema
  ( p_schema              => 'ORDS_API' 
  );
  commit;
end;
/
  
drop view my_customers_vw
/

exit
