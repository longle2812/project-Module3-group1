create database book_management;
use book_management;

create table category
(
    id   int primary key auto_increment,
    name varchar(100)
);

create table book
(
    id          int primary key auto_increment,
    name        varchar(100)  NOT NULL,
    description varchar(1000) NOT NULL,
    imgURL      varchar(500)  NOT NULL,
    status      varchar(20)   NOT NULL,
    category_id int           NOT NULL,
    publisher   varchar(50)   NOT NULL,
    foreign key (category_id) references category (id)
);

create table user
(
    id          int primary key auto_increment,
    name        varchar(20)        NOT NULL,
    email       varchar(30) unique NOT NULL,
    password    varchar(20)        NOT NULL,
    dOB         varchar(20)        NOT NULL,
    phoneNumber varchar(25)        NOT NULL,
    avatarURL   varchar(20)
);

create table shelf
(
    id          int auto_increment primary key,
    name        varchar(200) NOT NULL,
    description varchar(200) NOT NULL,
    inUse       int          default 0,
    capacity    int          NOT NULL,
    userId int,
    foreign key (userId) references user(id)
);

create table changelog(
    id int auto_increment primary key ,
    userId int,
    shelfId int,
    bookId int,
    foreign key (userId) references user(id),
    foreign key (shelfId) references shelf(id),
    foreign key (bookId) references book(id)
);

insert into category(name)
values ('Fiction'),
       ('Spirituality'),
       ('Young adult'),
       ('Fantasy'),
       ('Magical Realism');
insert into book (name, description, imgURL, status, category_id, publisher)
values ('The Midnight Library',
        'Between life and death there is a library, and within that library, the shelves go on forever. Every book provides a chance to try another life you could have lived. To see how things would be if you had made other choices . . . Would you have done anything different, if you had the chance to undo your regrets?',
        'http://www.matthaig.com/wp-content/uploads/2020/10/81J6APjwxlL._AC_UY436_QL65_-213x300.jpg', 'new', 1,
        'Viking'),
       ('Hành Trình Về Phương Đông',
        'Bộ sách thuật lại những cuộc hành trình vào năm 1894 đến Ấn độ và các nước lân cận của một phái đoàn nghiên cứu gồm 11 nhà khoa học. Trong chuyến đi, họ xác nhận đã có những cuộc tiếp xúc với ''Những bậc Chân Sư cao cả trên dãy Himalaya'', những người đã thắng đoạt tử thần. Phái đoàn đã cùng sống, nghiên cứu với những bậc Chân Sư và đã gặt hái được sự hiểu biết sâu sắc về cuộc sống và thế giới tâm linh. Nhờ sự tiếp xúc gần gũi đó, phái đoàn đã chứng kiến rất nhiều vị Chân Sư hiển lộ những quyền năng tinh thần trong cuộc sống hàng ngày, những điều mà đối với người bình thường là phép lạ. Trong số những phép lạ đó có đi trên mặt nước, hay hóa bánh mì ra nhiều giúp cả một đoàn người qua cơn đói.',
        'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1387638658l/7132852.jpg', 'old', 2,
        'NXB Thế giới'),
       ('Hai Số Phận',
        'Hai số phận (có tên gốc tiếng Anh là: Kane and Abel) là một cuốn tiểu thuyết được sáng tác vào năm 1979 bởi nhà văn người Anh Jeffrey Archer. Tựa đề Kane and Abel dựa theo câu chuyện của anh em: Cain và Abel trong Kinh Thánh Cựu Ước.',
        'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1392709920l/20838203.jpg', 'old', 1,
        'NXB Văn Học'),
       ('The Perks of Being a Wallflower',
        'The Perks of Being a Wallflower is a story about what it’s like to travel that strange course through the uncharted territory of high school. The world of first dates, family dramas, and new friends. Of sex, drugs, and The Rocky Horror Picture Show. Of those wild and poignant roller-coaster days known as growing up.',
        'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1407137888l/13573503.jpg', 'new', 3,
        'MTV Books'),
       ('Tuổi Thơ Dữ Dội',
        '"Tuổi thơ dữ dội" là một tác phẩm truyện dài bảy phần của nhà văn Phùng Quán. Truyện được khởi thảo bên bờ Hồ Tây năm 1968 và hoàn thành trong lều cỏ giữa hồ Tịnh Tâm năm 1986. Cuốn truyện xoay quanh cuộc sống chiến đấu và sự hy sinh của những thiếu niên 13, 14 tuổi trong hàng ngũ Đội thiếu niên trinh sát của trung đoàn Trần Cao Vân.',
        'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1310364874l/2334960.jpg', 'old', 1,
        'NXB Văn Học');

