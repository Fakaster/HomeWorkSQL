create table likes(
	id_post int not null COMMENT "ссылка на пост ",
	id_user_like int not null COMMENT "ссылка на пользователя оставившего лайк ",
	primary key (id_post, id_user_like),
	FOREIGN KEY (id_post)  REFERENCES posts(Id),
	FOREIGN KEY (id_user_like)  REFERENCES users(Id)
);

create table comments(
	id int not null auto_increment unique primary key,
	id_posts int not null COMMENT "ссылка на пост ",
	from_user_id int not null COMMENT "ссылка на пользователя оставившего комментарий ",
	comment text COMMENT "комментарий к посту ",
	FOREIGN KEY (id_posts)  REFERENCES posts(Id),
	FOREIGN KEY (from_user_id)  REFERENCES users(Id)
);


create table posts (
	id int not null auto_increment unique primary key,
	from_user_id int not null COMMENT "ссылка на пользователя создавшего пост ",
	id_media int COMMENT "ссылка на медиа файл оставденный в качестве поста ",
	count_like int as (select count(id_user_like) from likes lk where lk.id_post = posts.id)  COMMENT "попытка сделать вычисляемый столбец на основе данных из таблицы likes ",
	created_at DATETIME DEFAULT NOW(),
	FOREIGN KEY (from_user_id)  REFERENCES users(Id),
	FOREIGN KEY (id_media)  REFERENCES media(Id)
	);
