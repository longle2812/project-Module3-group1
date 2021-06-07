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
    description varchar(3000) NOT NULL,
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
    userId int,
    shelfId int,
    bookId int,
    foreign key (userId) references user(id),
    foreign key (shelfId) references shelf(id),
    foreign key (bookId) references book(id),
    primary key (shelfId, bookId)
);

insert into category(name)
values ('Fiction'),
       ('Spirituality'),
       ('Young adult'),
       ('Fantasy'),
       ('Magical Realism'),
       ('Novel'),
       ('Cultural'),
       ('Self help'),
       ('Non fiction');
drop table category;

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
        'NXB Văn Học'),
       ('Con Chim Xanh Biếc Bay Về','Không giống như những tác phẩm trước đây lấy bối cảnh vùng quê miền Trung đầy ắp những hoài niệm tuổi thơ dung dị, trong trẻo với các nhân vật ở độ tuổi dậy thì, trong quyển sách mới lần này nhà văn Nguyễn Nhật Ánh lấy bối cảnh chính là Sài Gòn – Thành phố Hồ Chí Minh nơi tác giả sinh sống (như là một sự đền đáp ân tình với mảnh đất miền Nam). Các nhân vật chính trong truyện cũng “lớn” hơn, với những câu chuyện mưu sinh lập nghiệp lắm gian nan thử thách của các sinh viên trẻ đầy hoài bão. Tất nhiên không thể thiếu những câu chuyện tình cảm động, kịch tính và bất ngờ khiến bạn đọc ngẩn ngơ, cười ra nước mắt. Và như trong mọi tác phẩm Nguyễn Nhật Ánh, sự tử tế và tinh thần hướng thượng vẫn là điểm nhấn quan trọng trong quyển sách mới này.','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1604549957l/55849445._SY475_.jpg','Old',6,'NXB Trẻ'),
       ('Làm phàm nhân sống giữa đời bình thường','Trong cuốn Làm phàm nhân sống giữa đời bình thường, tác giả cũng đang đứng trước ngưỡng tuổi giao mùa, cũng nặng lòng băn khoăn nhiều điều về cuộc sống, tình yêu, công việc và gia đình. Cuốn sách giống như bàn tay vỗ về, dạy ta biết trân trọng chính sự bình phàm của bản thân. Tôi bình thường, bạn cũng vậy, chúng ta đều là những “phàm nhân”, những kẻ trần tục như bao nhiêu người khác, những con sứa nhỏ nhoi giữa đại dương mênh mông của vũ trụ. Dù vậy, chúng ta vẫn có thể tìm được niềm vui bình dị trong cuộc sống thường ngày, vẫn có thể hướng tới một tương lai tốt đẹp giàu ý nghĩa hơn, dù cho bạn có đang ở lứa tuổi nào đi chăng nữa.Hãy thử lật giở từng trang sách, để tìm thấy chính mình trong những tâm tư chân thành của tác giả.','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1585321735l/52741602._SX318_.jpg','New',9,'Nhã Nam'),
       ('A New Earth: Awakening to Your Life''s Purpose','In "A New Earth," Tolle expands on these powerful ideas to show how transcending our ego-based state of consciousness is not only essential to personal happiness, but also the key to ending conflict and suffering throughout the world. Tolle describes how our attachment to the ego creates the dysfunction that leads to anger, jealousy, and unhappiness, and shows readers how to awaken to a new state of consciousness and follow the path to a truly fulfilling existence. "The Power of Now" was a question-and-answer handbook. "A New Earth" has been written as a traditional narrative, offering anecdotes and philosophies in a way that is accessible to all. Illuminating, enlightening, and uplifting','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1388206232l/76334.jpg','New',2,'Plume'),
       ('Rừng Na Uy','Sau này, Toru đã nhận được một lá thư báo rằng Naoko đã tự kết liễu cuộc đời mình. Kết cục của điều đó là việc Toru đi lang thang phiêu bạt khắp nước Nhật mà chẳng có mục đích nào cả, trong lòng luôn nhớ đến những kỷ niệm xưa giữa hai người, trong khi đó Midori không nhận được liên hệ nào với anh và không hiểu chuyện gì đã xảy ra. Một thời gian sau, khi đã nhận ra rằng, cái chết không phải là sự đối nghịch mà nó chính là một phần của sự sống, anh quay trở lại Tokyo, và khi đó Reiko tới thăm anh. Trước đây, sau cái chết của Naoko, Reiko đã viết rất nhiều bức thư nói với anh rằng cái chết đó không phải do lỗi của Toru, không phải lỗi của ai cả, cũng giống như trời mưa không phải do ai. Với sự ủng hộ của chị, anh đã nhận ra rằng, giờ đây Midori là người quan trọng nhất trong cuộc đời anh. Toru đã nói chuyện tình cảm của mình với Midori. Chuyện gì đã xảy ra tiếp theo tác phẩm không đề cập tới mà đã để một cái kết mở cho người đọc.','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1425560345l/12134351.jpg','New',1,'Nhã Nam & NXB Hội Nhà Văn '),
       ('Gấm Hoa Giữa Đời','Có những quyển sách ta phải đọc nhiều lần mới có thể nhập tâm, để rồi khiến ta nhớ mãi, bởi những câu chữ trong quyển sách ấy cứ hiển hiện trong ta, thôi thúc ta nhớ lại những khoảnh khắc đẹp nhất của cuộc sống, khơi gợi những ước mơ đẹp nhất từ sâu thẳm tâm hồn. “Gấm hoa giữa đời” khiến chúng ta nhớ lại thời tuổi trẻ lông bông, đuổi hoa bắt bướm, nhớ về quê hương với ruộng đồng bát ngát, hương cỏ cây nồng nàn, hoa khoe sắc thắm, mái tranh vách đất chốn quê nhà đong đầy kỉ niệm, nhớ về ông bà một đời tần tảo sớm hôm, về tình yêu thương của cha và mẹ… Từng câu từng chữ trong sách đẹp đẽ mà giản dị, tỉ mỉ sâu sắc như tỏa hương thơm khiến chúng ta đắm chìm trong đó… Sau những hồi ức về quãng thời gian ngày xưa ấy, là những tâm tư tình cảm, là những đúc kết từ trải nghiệm thực tế trong cuộc sống, có buồn thương, có khắc khoải, có hy vọng và ước mơ… Chúng ta như bước vào thế giới của riêng mình qua mỗi trang sách, ngẫm nghĩ, chiêm nghiệm… thảng thốt nhận ra mình đã lướt qua từng khoảnh khắc gấm hoa giữa đời…','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1522129108l/39650173.jpg','New',7,'Pavicobooks '),
       ('Tôi Thích Bản Thân Nỗ Lực Hơn','Cha mẹ không thể cho bạn tất cả, nhưng bạn có thể cho mình mọi thứ mình muốn. Giống như một cơn gió, ảnh hưởng đến một cơn gió khác; Một đợt sóng, ảnh hưởng đến một đợt sóng khác; Một người chán ghét chính mình, tất nhiên sẽ chứa đầy bất mãn với thế giới nhưng nếu bạn chọn sống một cuộc đời “thú vị” thì hãy nỗ lực hơn bạn của ngày hôm qua!Cuốn sách là lời nhắn gửi của một tác giả Chu Xung đến các bạn trẻ đang loay hoay trên đường đời rằng: Đằng nào cũng “mất công sống một lần”, hãy sống sao cho xứng đáng với tuổi trẻ của chính mình! ','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1537534625l/41958260._SY475_.jpg','New',7,'Mintbooks'),
       ('13.67','Bốn tháng trước, chẳng ai ngờ thành phố này lại gặp biến chuyển kinh hãi đến thế!Một tranh chấp nhỏ lan rộng thành bạo động, Hồng Kông chìm trong hỗn loạn, khủng hoảng đe dọa bùng phát bất cứ lúc nào.','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1590360055l/43545682._SY475_.jpg','New',1,'NXB Hồng Đức, IPM'),
       ('Hiểu về trái tim','"Hiểu về trái tim là cuốn sách thứ 180 của Tủ sách Hạt giống tâm hồn mà First News đã xuất bản, nhưng đây là cuốn sách của một tác giả Việt Nam đã để lại trong tôi những cảm xúc đặc biệt nhất. Với những trải nghiệm sâu sắc và tâm huyết mà tác giả đã viết trong 8 năm chắc chắn sẽ mang đến cho bạn đọc những khám phá mới mẻ và thú vị. Một cánh cửa rộng mở đang chờ đón bạn”. (Nguyễn Văn Phước, Giám đốcc First News-Trí Việt)','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1473045794l/13640125._SY475_.jpg','Old',8,'First News'),
       ('Muôn Kiếp Nhân Sinh: Many Lives Many Times','Cuốn sách lần này là thuật lại chuyện của doanh nhân giấu tên nào đó, người có các trải nghiệm về các kiếp sống của mình, lúc thì ở châu Atlantic, lúc thì là Pharaoh, còn hiện tại là doanh nhân thành đạt, mỗi kiếp là mỗi lần học những bài học để phát triển tình thương, hướng về cái toàn thiện. Nghe thì có vẻ ra gì, nhưng mấy bài học xưa cũ, kể đi kể lại mãi cũng nhàm. Châu Atlantic được tác giả kéo từ Hành trình về phương Đông qua đây, hầu như ông nào cũng từng thác sinh tại đó vậy. Rồi nói về nguồn gốc của mỗi thuyết, mỗi giáo ở khắp lên trên thế giới, từ Ấn Độ, Tây Tạng, Trung Hoa… nhưng kể đi kể lại cũng chẳng thấy kể thêm gì về các vùng khác cả, chỉ nhắc nhiều tới Ấn Độ. Trung Hoa thì gọi tên cho có chứ chẳng dẫn chứng gì. ','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1590721540l/53599866._SX318_.jpg','Old',2,'First News'),
       ('Chiến Binh Cầu Vồng','Trong ngày khai giảng, nhờ sự xuất hiện vào phút chót của cậu bé thiểu năng trí tuệ Harun, trường Muhammadiyah may mắn thoát khỏi nguy cơ đóng cửa. Nhưng ước mơ dạy và học trong ngôi trường Hồi giáo ấy liệu sẽ đi về đâu, khi ngôi trường xập xệ dường như sẵn sàng sụp xuống bất cứ lúc nào, khi lời đe dọa đóng cửa từ viên thanh tra giáo dục luôn lơ lửng trên đầu, khi những cỗ máy xúc hung dữ đang chực chờ xới tung ngôi trường để dò mạch thiếc…? Và liệu niềm đam mê học tập của những Chiến binh Cầu vồng đó có đủ sức chinh phục quãng đường ngày ngày đạp xe bốn mươi cây số, rồi đầm cá sấu lúc nhúc bọn ăn thịt người, chưa kể sự mê hoặc từ những chuyến phiêu lưu chết người theo tiếng gọi của ngài pháp sư bí ẩn trên đảo Hải Tặc, cùng sức cám dỗ khôn cưỡng từ những đồng tiền còm kiếm được nhờ công việc cu li toàn thời gian ..','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1481535180l/14761611._SX318_.jpg','New',6,'NXB Hội Nhà Văn '),
       ('Giữa chốn phồn hoa gặp được người ','Hàn Đình từng nói: “Trong cuộc sống của anh, tình yêu không phải là tất cả. Một tình yêu mãnh liệt có thể hy sinh vì em, chết vì em, anh không cho em được. Nhưng tình yêu bình dị, cùng em sống hết cuộc đời, annh có thể làm được.”Kỷ Tinh hiểu tình yêu mà hai người họ tìm kiếm khác nhau, và khát vọng trái tim họ theo đuổi vĩnh viễn không có điểm chung. Nhưng cô muốn đứng bên anh trên đỉnh cao; cùng anh đối mặt với khó khăn, phiền muộn, đau khổ; cùng anh nhìn ngắm thành phố lung linh này. Họ, mỗi người trong trái tim của đối phương, giống như cảnh đêm Bắc Kinh lần đầu tiên họ cùng nhau ngắm nhìn ấy – yên tĩnh, tráng lệ và đẹp đến nao lòng.','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1578319479l/50315726._SX318_.jpg','New',6,'Nanubooks - Bách Việt'),
       ('Không Tự Khinh Bỉ, Không Tự Phí Hoài','“Bạn thử nói xem, trên thế giới này, điều gì có thể huỷ hoại cuộc đời bạn được chứ?Một mối tình thất bại?Một gã trai lỡ lầm?Hay tuổi tác ngày một nhiều thêm?Thực ra không một điều gì hay không một ai có thể huỷ hoại bạn được, trừ khi chính bạn muốn huỷ hoại bản thân. Nếu trái tim bạn mạnh mẽ, chịu được muôn nẻo phong ba đường đời thì những ngăn trở và thử thách đó chỉ làm bạn mạnh mẽ hơn mà thôi. Nếu bạn có thể vượt qua những khó khăn mà người khác chưa từng vượt qua thì bạn sẽ có được cuộc sống mà người khác khó lòng với tới.Riêng về điều này, trời xanh luôn rất công bằng.','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1562160498l/52122251._SX318_SY475_.jpg','New',8,'NXB Thế Giới'),
       ('Tôi có câu chuyện, bạn có rượu không?','Tôi có câu chuyện, bạn có rượu không?" là một cuốn sách bạn có thể giở ra trong một quán cafe vào một buổi chiều nào đó, hoặc trong một đêm mất ngủ sau khi tan làm về. Hai mươi mốt câu chuyện bên trong sách là 21 xúc cảm hoàn toàn khác biệt nhau: chúng có thể khiến cho bạn hạnh phúc, có thể khiến bạn buồn bã, đau thương, hoặc cũng có thể khiến bạn nảy sinh sự hối tiếc… Chúng đều là những ngôi sao đang phiêu lãng trong biển người bất tận, những đều “tình cờ” gặp gỡ bạn, mới có thể tỏa sáng lung linh. Những con người trong những câu chuyện ấy có thể khóc, có thể cười vui, có thể đau thương, có thể là đang rơi lệ. Thế nhưng đến cuối con đường, chắc chắn rằng họ sẽ hạnh phúc, giống như bạn đã nhận được hạnh phúc.','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1581588442l/51222917._SX318_.jpg','New',9,'VanVietBooks, NVB Thanh Niên'),
       ('Tôi Có Một Chén Rượu , Có Thể Xoa Dịu Hồng Trần','Mỗi người sống trên thế gian này, thật ra trong lòng đều cất giữ những câu chuyện khác nhau, có thể là về những người ấm áp, cũng có thể là về những điều nuối tiếc. Chuyện đời thay đổi luôn khiến người ta thấy thương cảm, nhưng hồi ức là bằng chứng duy nhất về sự gặp gỡ giữa người với người, hễ đem hồi ức ra là sẽ thành câu chuyện.','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1578898383l/49607433._SY475_.jpg','New',9,'NXB Hồng Đức, VanVietBooks'),
       ('Trại Hoa Vàng','Hẳn bạn đọc ở lứa tuổi học trò đã từng quen thuộc với tác giả Nguyễn Nhật Anh với những truyện ngắn và truyện dài đậm chất học trò như: Trại hoa vàng, Chú bé rắc rối, Phòng trọ ba người, Bồ câu không đưa thư, Những chàng trai xấu tính, Cô gái đến từ hôm qua, Trước vòng chung kết, Hạ đỏ, Hoa hồng xứ khác, Buổi chiều Windows, Ut Quyên và tôi... Với lối viết dung dị và cách chọn đề tài gần gũi với lứa tuổi học trò, như quan hệ thầy trò, trường lớp, bạn bè, gia đình... nên những truyện của ông chiếm được cảm tình của rất nhiều bạn đọc nhỏ tuổi. Họ hào hứng và nóng lóng đón đọc các trang viết của ông. Chúng tôi sẽ lần lượt giới thiệu với bạn đọc các tác phẩm của ông','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1333433032l/12966230.jpg','Old',1,'NXB Trẻ'),
       ('Dấu Chân Trên Cát','Tương truyền, Sinuhe là một người Ai Cập nhưng đã đến Hy Lạp mở trường dạy học. Sinuhe có rất đông học trò. Sau khi ông qua đời, học trò của ông đã góp phần xây dựng Hy Lạp trở thành một quốc gia văn minh, hùng cường mà các thế hệ sau này gọi là “thời buổi hoàng kim của các triết gia”. Học trò của ông là Plato, Aristotle, Socrates, Epictetus…Vậy Sinuhe là ai và làm thế nào mà một giáo sĩ ngoại quốc có thể đến Hy Lạp có thể mở trường dạy học và để lại những kho tàng tri thức quý báu đến vậy?','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1502161598l/35960122._SY475_.jpg','New',1,'Nhà Xuất Bản Tổng Hợp');

