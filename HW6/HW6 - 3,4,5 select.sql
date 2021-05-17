use my_vk;

-- HW6 - 3 count likes by gender
select  p.gender, count(l.user_id) from profiles p
join likes l on l.user_id  = p.user_id 
group by p.gender;

-- HW6 - 4 count likes by young users
select p.user_id, 
timestampdiff(year, birthday, now()) as age,
(select count(l.target_id) from likes l
where l.user_id = p.user_id and l.target_tupe like 'u%') as count_like
from profiles p
order by age asc
limit 10;

-- HW6 - 5 not activity users 
select
u.id,
((select count(m.from_user_id) from messages m where m.from_user_id = u.id) +
(select count(l.user_id) from likes l where l.user_id = u.id) +
(select count(p.user_id) from posts p where p.user_id = u.id)) as activity
from users u
group by u.id
order by activity asc
limit 10;







select  * from likes l ;

