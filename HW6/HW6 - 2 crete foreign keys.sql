alter table likes 
	add constraint likes_user_id_fk
		foreign key (user_id) references users(id)
			on delete cascade;
			
alter table communities_users 
	add constraint communities_user_id_fk
		foreign key (user_id) references users(id)
			on delete cascade,
	add constraint community_id_fk
		foreign key (community_id) references communities(id)
			on delete cascade;

alter table friendship 
	add constraint friendship_user_id_fk
		foreign key (user_id) references users(id)
			on delete cascade, 
	add constraint friendship_friend_id_fk
		foreign key (friend_id) references users(id)
			on delete cascade;

alter table messages
	add constraint messages_from_user_id_fk
		foreign key (from_user_id) references users(id)
			on delete cascade,
	add constraint messages_to_user_id_fk
		foreign key (to_user_id) references users(id)
			on delete cascade;

			
alter table media
	add constraint media_user_id_fk
		foreign key (user_id) references users(id)
			on delete cascade,
	add constraint media_type_id_fk
		foreign key (media_type_id) references media_types(id)
			on delete cascade;

alter table profiles 
	add constraint profiles_user_id_fk
		foreign key (user_id) references users(id)
			on delete cascade;

alter table posts 
	add constraint posts_user_id_fk
		foreign key (user_id) references users(id)
			on delete cascade,
	add constraint posts_media_id_fk
		foreign key (media_id) references media(id)
			on delete cascade,
	add constraint posts_community_id_fk
		foreign key (community_id) references communities(id)
			on delete cascade;
