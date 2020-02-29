PROMPT Run as DBA

PROMPT This script assumes you have a DEMO schema holding ORDERS etc.

drop user ords_api cascade
/

create user ords_api identified by supersecretpassword
default tablespace data
temporary tablespace temp
/

alter user ords_api quota unlimited on data
/

grant connect, resource to ords_api
/

grant create view to ords_api
/

grant select, insert, update, delete on demo.demo_customers to ords_api
/

grant select on demo.demo_orders to ords_api
/

grant select on demo.demo_order_items to ords_api
/

grant select on demo.demo_product_info to ords_api
/

create synonym ords_api.demo_orders for demo.demo_orders
/

create synonym ords_api.demo_order_items for demo.demo_order_items
/

create synonym ords_api.demo_product_info for demo.demo_product_info
/

