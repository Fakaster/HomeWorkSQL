-- HW9 Transactions, Variables, Views
-- HW9.1 move record
start transaction;

insert into sample.users
select u.id, u.name from shop.users u where u.id = 1;

delete from shop.users
where id = 1;

-- rollback;
commit;


-- HW9.2 create view 
create view my_product as select  p.name as product_name, c.name as catalog_name
from products p
join catalogs c on p.catalog_id = c.id;

