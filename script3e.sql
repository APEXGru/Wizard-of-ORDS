begin
  ords.define_service
  ( p_module_name    => 'customers'
  , p_base_path      => 'sales'
  , p_pattern        => 'customers/:custid'
  , p_source         => 'select * from my_customers_vw where customer_id = :custid'
  );
  commit;
end;
/

select method, base_path, pattern, name
from user_ords_services 
/

exit;
