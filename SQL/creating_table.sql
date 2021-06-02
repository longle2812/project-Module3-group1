CREATE DATABASE book_managment;
use book_management;
create table user(
    id          int primary key auto_increment,
    name        varchar(20)        NOT NULL,
    email       varchar(30) unique NOT NULL,
    password    varchar(20)        NOT NULL,
    dOB         varchar(20)        NOT NULL,
    phoneNumber varchar(25)        NOT NULL,
    avatarURL   varchar(20)        NOT NULL
);
create table positions(
    id          int auto_increment primary key,
    name        varchar(20)  NOT NULL,
    description varchar(200) NOT NULL,
    available   int          NOT NULL,
    `using`     int          NOT NULL
);

create table book(
    id          int primary key auto_increment,
    name        varchar(20)        NOT NULL,
    description varchar(30) unique NOT NULL,
    imgURL      varchar(200)       NOT NULL,
    status      varchar(20)        NOT NULL,
    type        varchar(25)        NOT NULL,
    publisher   varchar(50)        NOT NULL,
    position_id int,
    foreign key (position_id) references positions (id)
);