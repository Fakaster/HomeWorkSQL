create table likes(
	id_post int not null COMMENT "������ �� ���� ",
	id_user_like int not null COMMENT "������ �� ������������ ����������� ���� ",
	primary key (id_post, id_user_like),
	FOREIGN KEY (id_post)  REFERENCES posts(Id),
	FOREIGN KEY (id_user_like)  REFERENCES users(Id)
);

create table comments(
	id int not null auto_increment unique primary key,
	id_posts int not null COMMENT "������ �� ���� ",
	from_user_id int not null COMMENT "������ �� ������������ ����������� ����������� ",
	comment text COMMENT "����������� � ����� ",
	FOREIGN KEY (id_posts)  REFERENCES posts(Id),
	FOREIGN KEY (from_user_id)  REFERENCES users(Id)
);


create table posts (
	id int not null auto_increment unique primary key,
	from_user_id int not null COMMENT "������ �� ������������ ���������� ���� ",
	id_media int COMMENT "������ �� ����� ���� ����������� � �������� ����� ",
	count_like int as (select count(id_user_like) from likes lk where lk.id_post = posts.id)  COMMENT "������� ������� ����������� ������� �� ������ ������ �� ������� likes ",
	created_at DATETIME DEFAULT NOW(),
	FOREIGN KEY (from_user_id)  REFERENCES users(Id),
	FOREIGN KEY (id_media)  REFERENCES media(Id)
	);
