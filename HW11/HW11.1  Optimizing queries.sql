use shop;

# HW11 Optimizing queries
# HW11.1
create table if not exists Logs (
    id int unsigned not null auto_increment primary key,
    created_at datetime default now(),
    table_name varchar(250) not null,
    row_id int unsigned not null,
    row_name varchar(255)
) ENGINE = Archive;


delimiter //


create trigger products_insert after insert ON products
for each row
BEGIN
    insert into Logs values (null, default, "products", NEW.id, NEW.name);
end//

create trigger users_insert after insert ON users
for each row
BEGIN
    insert into Logs values (null, default, "users", NEW.id, NEW.name);
end//

create trigger catalogs_insert after insert ON catalogs
for each row
BEGIN
    insert into Logs values (null, default, "catalogs", NEW.id, NEW.name);
end//

delimiter ;