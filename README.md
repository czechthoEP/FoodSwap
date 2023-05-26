# TJAY
Hackaburg23 App to share food between users



start angular app
cd FoodShare
ng serve
open in browser localhost:4200


docker exec -ti mysql_database mysql -u root -p

enter: root_pw
enter: show databases;
enter: use food_swap_db;
enter: show tables;
test/debug/run your sql query

insert into category (id, name) VALUES (01, 'vegetables');
insert into category (id, name) VALUES (02, 'dairy products');
insert into category (id, name) VALUES (03, 'baked goods');
insert into category (id, name) VALUES (04, 'fruits');

insert into user (id, name, password, email) values (01,'Simon','1234','simon@gmail.com');
insert into user (id, name, password, email) values (02, 'Max', '0000','max@gmail.com');
insert into user (id, name, password, email) values (03,'Sarah','9876','sarah@freenet.de');
insert into user (id, name, password, email) values (04,'Kim','4567','kim3@web.de');

alter table offer add column unit VARCHAR(5);
alter table offer modify column unit VARCHAR(5) AFTER amount;
alter table food add column amount float;
alter table food modify column amount float after description;
alter table food add column unit varchar(5);
alter table food modify column unit varchar(5) after amount;
alter table offer add column description varchar(50);
alter table offer modify column description varchar(50) after id;
alter table offer drop foreign key offer_to_food, drop column foodId;

insert into offer (id, description, amount, unit, categoryId) values (01,'tomato',5,'pcs',01);
insert into offer (id, description, amount, unit, categoryId) values (02,'almond milk',500,'ml',02);
insert into food (id, description, amount, unit, categoryId, userId, offerId) values (01, 'tomato',5, 'pcs',01,01,01);
insert into food (id, description, amount, unit, categoryId, userId, offerId) values (02, 'almond milk',500, 'ml',02,02,02);

alter table request add column unit VARCHAR(5);
alter table request add column userId int;
alter table request add constraint request_to_user foreign key (userId) references user(id);
insert into request (id, foodId,amount,unit,userId) values (01,01,3,'pcs',03);
insert into request (id, foodId,amount,unit,userId) values (02,02,250,'ml',04);