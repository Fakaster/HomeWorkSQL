use my_vk;

show tables;

desc users;

select * from users limit 10;

update users set updated_at = now() where updated_at < created_at;

desc profiles;
select * from profiles p limit 10;

create temporary table gender(name varchar(1));
insert into gender values ('m'), ('f');

update profiles set updated_at = now() where updated_at < created_at;

update profiles set gender = (select * from gender order by rand() limit 1) where gender = ''; 

desc messages;
select * from messages m limit 10;

update messages set from_user_id = floor(1 + rand() * 100);
update messages set to_user_id = floor(1 + rand() * 100);

desc media;

select * from media m limit 10;

update media set user_id = floor(1 + rand() * 100);

create temporary table extensions (name varchar(10));

insert into extensions values ('jpeg'), ('mp3'), ('mp4'), ('avi');

select * from extensions;

select name from extensions order by rand() limit 1;

update media set filename = concat( 
	'http://dropbox.net/vk/',
	filename,
	'.',
	(select name from extensions order by rand() limit 1));

update  media set size = floor(10000 + rand() * 100000000) where size  < 10000;


update media set metadata = concat( 
	'{"owner":"',
	(select concat(first_name, ' ', last_name) from users where id = user_id),
	'"}');

select concat(first_name, ' ', last_name) from users u where id = 4;


select * from media_types mt ;

delete from media_types;

truncate media_types;

insert into media_types (name) values
	('photo'),
	('audio'),
	('video');

update  media set
	media_type_id = floor(1 + rand() * 3);

select * from media m;
desc media ;

update media set id = id -50;

alter table media modify column metadata json;

alter table profiles modify column gender enum('m', 'f');

desc profiles ;

select * from profiles p limit 10;

desc friendship ;

alter table friendship drop column requested_at;

select * from friendship f limit 10;

update friendship set confirmed_at = now() where created_at > confirmed_at ;

update friendship set updated_at = now() where updated_at < confirmed_at ;

update friendship set
	user_id  = floor(1 + rand() * 100),
	friend_id  = floor(1 + rand() * 100);

select * from friendship_statuses fs limit 10;

truncate friendship_statuses;

insert into friendship_statuses (name) values
	('Requsted'),
	('Confirmed'),
	('Rejected');

select * from communities c2 ;

update communities set updated_at = now() where updated_at < created_at ;

select * from communities_users cu ;



