use vk_test;

-- јгрегаци€ данных
-- 1. ѕодсчитайте средний возраст пользователей.
select avg((TIMESTAMPDIFF(year, birthday, now()))) as avg_age from profiles p ;

-- 2. ѕодсчитайте количество дней рождени€, которые приход€тс€ на каждый из дней недели. 
select dayofweek(concat(year (now()), '-', date_format(birthday, '%m-%d'))) as days, count(*) from profiles p2 
group by days 
order by days is null, days asc;
