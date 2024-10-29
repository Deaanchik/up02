CREATE DATABASE obshepit;

create table obshepit.menu
(
    id_dish int primary key not null auto_increment,
    name_dish varchar(40) not null,
    cost_dish decimal(6.2),
    stoplist varchar(40) not null
);

create table obshepit.zakaz
(
    id_zakaz int primary key not null auto_increment,
    id_pokupatel int not null,
    name_pokupatel varchar(40) not null,
    id_dish int not null,
    data_time_zakaz datetime
);

create table obshepit.dostavka
(
    id_dostavka int primary key not null auto_increment,
    data_time_dostavka datetime,
    id_dish int not null,
    cost_dostavka decimal(6.2) not null
);

create table obshepit.povar
(
    id_povar int primary key not null auto_increment,
    fio_povar varchar(100) not null,
    id_dish int not null,
    zarplata decimal(6.2) not null,
    id_ingredient int not null
);

create table obshepit.ingredient
(
    id_ingredient int primary key not null auto_increment,
    name_ingredient varchar(40) not null,
    cost_ingredient decimal(6.2) not null,
    nalichie varchar(40) not null
);

create table obshepit.postavki
(
    id_postavshik int primary key not null auto_increment,
    name_postavshik varchar(40) not null,
    data_time_postavka datetime,
    id_ingredient int not null
);

create table obshepit.zakaz_has_menu
(
    id int primary key not null auto_increment,
    id_dish int not null,
    id_zakaz int not null
);

alter table obshepit.zakaz_has_menu add foreign key (`id_dish`) references obshepit.menu(`id_dish`) on delete restrict on update restrict;
alter table obshepit.zakaz_has_menu add foreign key (`id_zakaz`) references obshepit.zakaz(`id_zakaz`) on delete restrict on update restrict;

create table obshepit.menu_has_dostavka
(
    id int primary key not null auto_increment,
    id_dish int not null,
    id_dostavka int not null
);

alter table obshepit.menu_has_dostavka add foreign key (`id_dish`) references obshepit.menu(`id_dish`) on delete restrict on update restrict;
alter table obshepit.menu_has_dostavka add foreign key (`id_dostavka`) references obshepit.dostavka(`id_dostavka`) on delete restrict on update restrict;

create table obshepit.povar_has_ingredient
(
    id int primary key not null auto_increment,
    id_povar int not null,
    id_ingredient int not null
);

alter table obshepit.povar_has_ingredient add foreign key (`id_povar`) references obshepit.povar(`id_povar`) on delete restrict on update restrict;
alter table obshepit.povar_has_ingredient add foreign key (`id_ingredient`) references obshepit.ingredient(`id_ingredient`) on delete restrict on update restrict;

create table obshepit.ingredient_has_postavki
(
    id int primary key not null auto_increment,
    id_ingredient int not null,
    id_postavshik int not null
);

alter table obshepit.ingredient_has_postavki add foreign key (`id_ingredient`) references obshepit.ingredient(`id_ingredient`) on delete restrict on update restrict;
alter table obshepit.ingredient_has_postavki add foreign key (`id_postavshik`) references obshepit.postavki(`id_postavshik`) on delete restrict on update restrict;

insert into obshepit.menu values
(1, 'Хачапури по Аджарски', 40.05, 'Yes'),
(2, 'Сосиска в тесте', 45.98, 'No'),
(3, 'Шаурма со свининой', 170.07, 'Yes'),
(4, 'Шаурма с говядиной', 200.07, 'No'),
(5, 'Шаурма с курицей', 180.07, 'No');

insert into obshepit.dostavka values
(1, '2011-12-26 06:08:54', 20, 40),
(2, '2012-03-14 22:35:44', 3, 20),
(3, '2000-06-13 09:45:40', 17, 100),
(4, '2003-03-22 14:27:28', 5, 30),
(5, '2013-05-02 23:29:11', 1, 25);