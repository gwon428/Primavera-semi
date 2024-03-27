UPDATE user SET auth = 'ADMIN' WHERE id='manager01';

DROP TABLE review;
DROP TABLE notice;
DROP TABLE qna_answer;
DROP TABLE qna;
DROP TABLE collect;
DROP TABLE user;

CREATE SCHEMA primavera;

CREATE TABLE user(
    id VARCHAR(20) NOT NULL UNIQUE,
    password VARCHAR(200),
	name VARCHAR(20) NOT NULL,
	phone VARCHAR(13) UNIQUE,
	post_code INT,
	road_address VARCHAR(30),
	detail_address VARCHAR(30),
	email VARCHAR(50)  UNIQUE,
	bank_name VARCHAR(20),
	account VARCHAR(20),
    auth VARCHAR(10) DEFAULT 'MEMBER',
    kakao CHAR(1) CHECK(kakao IN('Y', 'N')) DEFAULT 'N'
);



CREATE TABLE collect(
order_num INT PRIMARY KEY AUTO_INCREMENT,
id VARCHAR(20),
name VARCHAR(20) NOT NULL,
phone VARCHAR(13) NOT NULL,
post_code INT NOT NULL,
road_address VARCHAR(30) NOT NULL,
detail_address VARCHAR(30) NOT NULL,
collection_date DATE NOT NULL,
door_pwd  VARCHAR(30),           
request TEXT,
prog VARCHAR(30) DEFAULT('신청완료'),
kg INT NOT NULL
);


CREATE TABLE review (
no INT PRIMARY KEY AUTO_INCREMENT,
id VARCHAR(20) NOT NULL,		
title VARCHAR(30) NOT NULL,
content TEXT NOT NULL,	
date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
url VARCHAR(200),
rating INT
);


   
CREATE TABLE qna (
qna_num INT PRIMARY KEY AUTO_INCREMENT,
id VARCHAR(20) NOT NULL,
title VARCHAR(30) NOT NULL,
content TEXT NOT NULL,
write_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
url VARCHAR(200),
status CHAR(1) CHECK(status IN('Y','N')) DEFAULT 'N',
secret CHAR(1) CHECK(secret IN('Y', 'N')) DEFAULT 'N'
);



CREATE TABLE qna_answer(
qna_num INT NOT NULL,
id VARCHAR(20) NOT NULL,
content TEXT NOT NULL,
url VARCHAR(200),
answer_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE notice(
notice_num INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(30) NOT NULL,
content TEXT NOT NULL,
id VARCHAR(30),
url VARCHAR(200),
write_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);



ALTER TABLE review ADD CONSTRAINT rev_user
	FOREIGN KEY (id) REFERENCES user(id) ON DELETE CASCADE;
    
ALTER TABLE qna ADD CONSTRAINT qua_user
	FOREIGN KEY (id) REFERENCES user(id) ON DELETE CASCADE;
    
ALTER TABLE qna_answer ADD CONSTRAINT answer_user
	FOREIGN KEY (id) REFERENCES user(id) ON DELETE CASCADE;
    
ALTER TABLE notice ADD CONSTRAINT notice_user
	FOREIGN KEY (id) REFERENCES user(id) ON DELETE CASCADE;
    
ALTER TABLE collect ADD CONSTRAINT collect_user
	FOREIGN KEY (id) REFERENCES user(id) ON DELETE CASCADE;
    
ALTER TABLE qna_answer ADD CONSTRAINT qna_qnaanswer
	FOREIGN KEY (qna_num) REFERENCES qna(qna_num) ON DELETE CASCADE;
    
    
INSERT INTO user(id, password, name, phone, post_code, road_address, detail_address, email, bank_name, account) VALUES ('user03', 'pass03', '사용자', '01033333333', '33333', '33333', '33333', 'user03@gmail.com', 'NH', '3333333333333');
INSERT INTO user(id, password, name, phone, post_code, road_address, detail_address, email, bank_name, account) VALUES ('user04', 'pass04', '유져어', '01044444444', '44444', '44444', '44444', 'user04@gmail.com', 'NH', '4444444444444');
INSERT INTO user(id, password, name, phone, post_code, road_address, detail_address, email, bank_name, account) VALUES ('user05', 'pass05', '김유저', '01055555555', '55555', '55555', '55555', 'user05@gmail.com', 'NH', '5555555555555');
INSERT INTO user(id, password, name, phone, post_code, road_address, detail_address, email, bank_name, account) VALUES ('user06', 'pass06', '이유저', '01066666666', '66666', '66666', '66666', 'user06@gmail.com', 'NH', '6666666666666');
INSERT INTO user(id, password, name, phone, post_code, road_address, detail_address, email, bank_name, account) VALUES ('user07', 'pass07', '김멤버', '01077777777', '77777', '77777', '77777', 'user07@gmail.com', 'NH', '7777777777777');
INSERT INTO user(id, password, name, phone, post_code, road_address, detail_address, email, bank_name, account) VALUES ('user08', 'pass08', '정멤버', '01088888888', '88888', '88888', '88888', 'user08@gmail.com', 'NH', '8888888888888');
INSERT INTO user(id, password, name, phone, post_code, road_address, detail_address, email, bank_name, account) VALUES ('user09', 'pass09', '손멤버', '01099999999', '99999', '99999', '99999', 'user09@gmail.com', 'NH', '9999999999999');
INSERT INTO user(id, password, name, phone, post_code, road_address, detail_address, email, bank_name, account) VALUES ('user10', 'pass10', '권멤버', '01010101010', '10101', '10101', '10101', 'user10@gmail.com', 'NH', '1010101010101');
INSERT INTO user(id, password, name, phone, post_code, road_address, detail_address, email, bank_name, account) VALUES ('user11', 'pass11', '이멤버', '01001101101', '11111', '11111', '11111', 'user11@gmail.com', 'NH', '1111111111111');
INSERT INTO user(id, password, name, phone, post_code, road_address, detail_address, email, bank_name, account) VALUES ('user12', 'pass12', '멤버어', '01001201201', '12121', '12121', '12121', 'user12@gmail.com', 'NH', '1212121212121');
INSERT INTO user(id, password, name, phone, post_code, road_address, detail_address, email, bank_name, account) VALUES ('user13', 'pass13', '유져엉', '01001301301', '13131', '13131', '13131', 'user13@gmail.com', 'NH', '1313131313131');

INSERT INTO collect(id, name, phone, post_code, road_address, detail_address, collection_date, kg) VALUES ('user03', '사용자', '01033333333', '33333', '33333', '33333', '2024-04-01', 15);
INSERT INTO collect(id, name, phone, post_code, road_address, detail_address, collection_date, kg) VALUES ('user04', '유져어', '01044444444', '44444', '44444', '44444', '2024-04-08', 7);
INSERT INTO collect(id, name, phone, post_code, road_address, detail_address, collection_date, kg) VALUES ('user03', '사용자', '01033333333', '33333', '33333', '33333', '2024-04-11', 11);
INSERT INTO collect(id, name, phone, post_code, road_address, detail_address, collection_date, kg) VALUES ('user07', '김멤버', '01077777777', '77777', '77777', '77777', '2024-04-05', 5);
INSERT INTO collect(id, name, phone, post_code, road_address, detail_address, collection_date, kg) VALUES ('user08', '정멤버', '01088888888', '88888', '88888', '88888', '2024-03-28', 18);
INSERT INTO collect(id, name, phone, post_code, road_address, detail_address, collection_date, kg) VALUES ('user10', '권멤버', '01010101010', '10101', '10101', '10101', '2024-04-17', 8);
INSERT INTO collect(id, name, phone, post_code, road_address, detail_address, collection_date, kg) VALUES ('user11', '이멤버', '01001101101', '11111', '11111', '11111', '2024-03-26', 14);
INSERT INTO collect(id, name, phone, post_code, road_address, detail_address, collection_date, kg) VALUES ('user09', '손멤버', '01099999999', '99999', '99999', '99999', '2024-03-24', 19);
INSERT INTO collect(id, name, phone, post_code, road_address, detail_address, collection_date, kg) VALUES ('user04', '유져어', '01044444444', '44444', '44444', '44444', '2024-04-01', 20);
INSERT INTO collect(id, name, phone, post_code, road_address, detail_address, collection_date, kg) VALUES ('user06', '이유저', '01066666666', '66666', '66666', '66666', '2024-04-12', 12);
INSERT INTO collect(id, name, phone, post_code, road_address, detail_address, collection_date, kg) VALUES ('user07', '김멤버', '01077777777', '77777', '77777', '77777', '2024-04-17', 17);
INSERT INTO collect(id, name, phone, post_code, road_address, detail_address, collection_date, kg) VALUES ('user08', '정멤버', '01088888888', '88888', '88888', '88888', '2024-03-30', 20);

INSERT INTO review(id, title, content, rating) VALUES ('user03', 'title03', '33333', 5);
INSERT INTO review(id, title, content, rating) VALUES ('user04', '안녕하세요', '33333', 4);
INSERT INTO review(id, title, content, rating) VALUES ('user03', '3조입니당', '33333', 5);
INSERT INTO review(id, title, content, rating) VALUES ('user08', '3월 27일', '33333', 5);
INSERT INTO review(id, title, content, rating) VALUES ('user04', '세미프로젝트', '33333', 5);
INSERT INTO review(id, title, content, rating) VALUES ('user05', '끝나는 날', '33333', 3);
INSERT INTO review(id, title, content, rating) VALUES ('user07', '이네요', '33333', 3);
INSERT INTO review(id, title, content, rating) VALUES ('user11', '시간 진짜', '33333', 4);
INSERT INTO review(id, title, content, rating) VALUES ('user12', '빠르당..', '33333', 5);
INSERT INTO review(id, title, content, rating) VALUES ('user09', '벌써 봄이네요', '33333', 2);

INSERT INTO qna(id, title, content) VALUES ('user03', '가나다라', '꺄르르르르륵');
INSERT INTO qna(id, title, content) VALUES ('user10', '마바사', '벌써');
INSERT INTO qna(id, title, content) VALUES ('user08', '아자차카', '9시라니');
INSERT INTO qna(id, title, content) VALUES ('user09', '타파하', '마지막 날');
INSERT INTO qna(id, title, content) VALUES ('user11', '비밀글아니지롱', '9시 . .');
INSERT INTO qna(id, title, content) VALUES ('user07', '비밀글아닙니다', '대충');
INSERT INTO qna(id, title, content) VALUES ('user06', '벌써끝이라고', '내용이니까');
INSERT INTO qna(id, title, content) VALUES ('user12', '끝내', '없애버려요');
INSERT INTO qna(id, title, content) VALUES ('user04', '안녕', '우힛');
INSERT INTO qna(qna_num, id, title, content) VALUES (12, 'user04', '안녕', '우힛');
INSERT INTO qna VALUES (13, 'user04', '안녕', '우힛', '2024-03-26', null, 'Y', 'N');



INSERT INTO notice(title, content, id) VALUES ('공지를', '넣어볼게여', 'manager01');
INSERT INTO notice(title, content, id) VALUES ('넣어볼게요', '넣어볼게여', 'manager01');
INSERT INTO notice(title, content, id) VALUES ('사실', '넣어볼게여', 'manager01');
INSERT INTO notice(title, content, id) VALUES ('뭘 써야할지', '넣어볼게여', 'manager01');
INSERT INTO notice(title, content, id) VALUES ('하나두', '넣어볼게여', 'manager01');
INSERT INTO notice(title, content, id) VALUES ('모르겟음..', '넣어볼게여', 'manager01');
INSERT INTO notice(title, content, id) VALUES ('멀쓸까요', '넣어볼게여', 'manager01');
INSERT INTO notice(title, content, id) VALUES ('하하', '넣어볼게여', 'manager01');
INSERT INTO notice(title, content, id) VALUES ('게시판', '넣어볼게여', 'manager01');
INSERT INTO notice(title, content, id) VALUES ('입니당', '넣어볼게여', 'manager01');
INSERT INTO notice(title, content, id) VALUES ('매니저만', '넣어볼게여', 'manager01');
INSERT INTO notice(title, content, id) VALUES ('쓸 수 잇는', '넣어볼게여', 'manager01');
INSERT INTO notice(title, content, id) VALUES ('ㅎㅅㅎ', '넣어볼게여', 'manager01');