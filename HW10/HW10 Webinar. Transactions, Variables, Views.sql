use my_vk;

-- HW10 Webinar. Transactions, variables, views.
-- HW10.1 create index
create index users_first_name_last_name_idx on users(first_name, last_name);
create index media_filename_idx on media(filename);
create index posts_head_idx on posts(head);
create index communities_name_idx on communities(name);


-- HW10.2 window functions
select distinct c.name as name_communiti,
count(cu.user_id) over() /  max(c.id) over() as avg_user,
first_value(concat(u.first_name, ' ' ,u.last_name)) over(order by p.birthday) as young_user,
first_value(concat(u.first_name, ' ' ,u.last_name)) over(order by p.birthday desc) as old_user,
count(cu.user_id) over(partition by c.name) as count_users_in_the_community,
count(u.id) over() as count_all_users,
count(cu.user_id) over(partition by c.name) / count(u.id) over() * 100 as '%%'
from communities c
join communities_users cu on cu.community_id = c.id
join profiles p on p.user_id = cu.user_id
join users u on u.id = p.user_id
;



