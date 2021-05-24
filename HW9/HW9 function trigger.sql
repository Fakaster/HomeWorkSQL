use my_vk;

-- HW9 Stored procedures and functions, triggers
-- HW9.1 create function HELLO
drop function if exists hello_on_time;
delimiter //
create function hello_on_time (my_time datetime)
returns varchar(255) deterministic
begin
	DECLARE hours INT;
	set hours = date_format(my_time,"%H");
	if hours < 6 then
	return 'Доброй ночи';
	elseif hours < 12 then 
	return 'Доброе утро';
	elseif hours < 18  then
	return 'Добрый день';
	elseif hours < 24 then
	return 'Добрый вечер';
	end if;
end//

-- select hello_on_time(Now());


use shop;

-- HW9 Stored procedures and functions, triggers
-- HW9.2 create triger not null 
delimiter //
create trigger check_product_name before insert on products
for each row
begin 
	if new.name is null and new.description is null
		then SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ошибка вставки данных';
	end if;
end//
delimiter ;




