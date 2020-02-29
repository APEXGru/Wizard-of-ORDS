drop table woo_tab;

create table woo_tab
( col1 varchar2(3) constraint woo_tab_pk primary key
, col2 number
);

insert into woo_tab values ( 'ABC', 1);
insert into woo_tab values ( 'DEF', 2);
insert into woo_tab values ( 'GHI', 3);

commit;

select * from woo_tab;

begin
  ords.enable_object 
  ( p_object              => 'WOO_TAB'
  , p_object_type         => 'TABLE'     
  , p_object_alias        => 'woot'
  );
  commit;
end;
/

select 'http://<machine:port>/ords/api/woot' as link from dual
/   