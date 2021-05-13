-- HW7 Hard select)))
-- HW7 - 1
select u.name from users u
join orders o on u.id = o.user_id 
group by u.name;


-- HW7 - 2
select p.name, c.name from products p
join catalogs c on c.id = p.catalog_id ;


-- HW7 - 3
select f.id,
c.name as `from`,
(select c2.name from flights f2
join cities c2 on f2.`to` = c2.label
where f2.id = f.id) as `to`
from flights f
join cities c on f.`from` = c.label
order by f.id;