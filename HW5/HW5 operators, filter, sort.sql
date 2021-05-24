use vk_test;

-- Операторы, фильтрация, сортировка и ограниченин
-- 1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем
update users set created_at = now(), updated_at = now(); 

-- 2. Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения
update users set created_at = str_to_date(created_at, '%d.%m.%Y %k:%i');
update users set updated_at = str_to_date(updated_at, '%d.%m.%Y %k:%i');

alter table users modify  created_at datetime;
alter table users modify  updated_at datetime;

-- 3. Отсортировать записи по возрастанию, но нулевые запасы должны выводиться в конце
select  * from storehouses_products
order by value = 0 asc, value asc;

-- 4. извлечь пользователей, родившихся в августе и мае.
select  * from profiles p
where date_format(birthday, '%M') in ('may', 'august')
;

