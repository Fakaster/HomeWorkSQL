use my_vk;

-- HW8 1 count likes by gender
select p.gender, count(l.user_id) from likes l
join profiles p on l.user_id  = p.user_id
group by p.gender;

-- HW8 2 count likes by young users
select p.user_id , count(l.target_id), p.birthday from profiles p 
join likes l  on p.user_id = l.target_id and l.target_tupe like 'u%'
group by p.user_id 
order by p.birthday desc limit 10;

-- HW8 3 not activity users
select  u.id, count(m.from_user_id) + count(p.user_id) + count(l.user_id) as activity from users u 
left join messages m ON u.id = m.from_user_id 
left join posts p on u.id = p.user_id 
left join likes l on u.id = l.user_id
group by u.id
order by activity asc limit 10;

