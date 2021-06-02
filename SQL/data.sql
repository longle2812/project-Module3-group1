create database caseStudyModule3;

use caseStudyModule3;

create table User
(
    id          int primary key auto_increment,
    email       varchar(250),
    password    varchar(250),
    name        varchar(250),
    dob         varchar(250),
    phoneNumber varchar(13),
    avatarURL   varchar(250)
);
