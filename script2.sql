set sqlformat ansiconsole

create view my_customers_vw
as 
select * 
from demo.demo_customers
/

-- Due to a "bug" in ORDS (otherwise the pattern /:id will not work)
alter view my_customers_vw
add constraint cust_pk primary key( customer_id ) rely disable novalidate
/

begin
  ords.enable_object 
  ( p_object              => 'MY_CUSTOMERS_VW'
  , p_object_type         => 'VIEW'      
  , p_object_alias        => 'customers'
  );
  commit;
end;
/

--
PROMPT select * from user_ords_enabled_objects
PROMPT -------------------------------
--
select * from user_ords_enabled_objects
/

exit

select * from user_ords_services
/


http://<machine:port>/ords/api/metadata-catalog/
http://<machine:port>/ords/api/metadata-catalog/customers/
http://<machine:port>/ords/api/customers/

By Key
http://<machine:port>/ords/api/customers/1

Filtering
http://<machine:port>/ords/api/customers/?q={ "CUST_STATE" :"VA"}

Sorting
http://<machine:port>/ords/api/customers/?q={"$orderby":{"CUST_CITY":"ASC"}}


http://<machine:port>/ords/api/customers/?offset=2&limit=2


http://<machine:port>/ords/api/open-api-catalog/customers/ >> https://editor.swagger.io
