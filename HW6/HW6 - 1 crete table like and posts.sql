use my_vk;

create table likes (
	id int unsigned not null auto_increment primary key,
	user_id int unsigned not null,
	target_id int unsigned not null,
	target_tupe enum('messages', 'users', 'posts', 'media') not null,
	created_at datetime default current_timestamp
);

create temporary table target_types(
	name varchar(100) not null unique
);

insert into target_types values
('messages'),
  ('users'),
  ('media'),
  ('posts');
  
insert into likes
	select 
		id,
		floor(1 + rand()*100),
		floor(1 + rand()*100),
		(select name from target_types order by rand() limit 1),
		current_timestamp()
	from messages;

select * from likes limit 10;

create  table posts(
	id int unsigned not null auto_increment primary key,
	user_id int unsigned not null,
	community_id int unsigned,
	head varchar(255),
	body text not null,
	media_id int unsigned,
	is_public boolean default true,
	is_archived boolean default false,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

select  * from posts;
select  * from media m ;
select  * from likes ;


update posts
set user_id = (1 + floor(rand()* 100));

update posts
set media_id = (1 + floor(rand()* 45));
