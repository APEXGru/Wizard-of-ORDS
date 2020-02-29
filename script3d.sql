set sqlformat ansiconsole

create or replace procedure woo_proc4 
( sales out sys_refcursor
)
is
begin
 open sales for
   select cust.customer_id
   ,      cust.cust_first_name
   ,      cust.cust_last_name
   ,      cursor( select ord.order_id
            ,      ord.order_total 
            ,      cursor
                   ( select itm.order_item_id
                     ,      itm.unit_price
                     ,      itm.quantity
                     ,      prod.product_name
                     from   demo_order_items itm
                            join demo_product_info prod on itm.product_id = prod.product_id
                   ) orderlines 
            from   demo_orders ord
            where  customer_id = cust.customer_id
          ) orders  
   from   my_customers_vw cust;
end;
/

begin
  ords.enable_object 
  ( p_object              => 'WOO_PROC4'
  , p_object_type         => 'PROCEDURE'  
  , p_object_alias        => 'proc4'
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
 
