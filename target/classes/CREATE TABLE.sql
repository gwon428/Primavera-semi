DROP TABLE list;
DROP TABLE progress;
DROP TABLE review;
DROP TABLE notice;
DROP TABLE qna_answer;
DROP TABLE qna;
DROP TABLE customer;
DROP TABLE collect;

CREATE TABLE customer(
    id VARCHAR(20) NOT NULL UNIQUE,
    password VARCHAR(20) NOT NULL,
	name VARCHAR(20) NOT NULL,
	phone VARCHAR(13) NOT NULL,
	post_code INT NOT NULL,
	road_address VARCHAR(30) NOT NULL,
	detail_address VARCHAR(30) NOT NULL,
	email VARCHAR(50) NOT NULL,
	bank_name VARCHAR(20) NOT NULL,
	account VARCHAR(20) NOT NULL,
    auth VARCHAR(10) DEFAULT '회원'
);

INSERT INTO customer VALUES("user01", "pass01", "name01", "01012345678", "11111", "도로명주소", "상세주소", "abc@gmail.com", "신한", "12341234");
INSERT INTO customer VALUES("user02", "pass02", "name02", "01012345678", "11111", "도로명주소", "상세주소", "abc@gmail.com", "신한", "12341234");

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
request TEXT
);

CREATE TABLE review (
review_num INT PRIMARY KEY AUTO_INCREMENT,
id VARCHAR(20) NOT NULL UNIQUE,		
title VARCHAR(30) NOT NULL,
content TEXT NOT NULL,	
order_num INT NOT NULL,
write_date DATE DEFAULT (current_date),
star_point INT NOT NULL
);

CREATE TABLE qna (
qna_num INT PRIMARY KEY AUTO_INCREMENT,
id VARCHAR(20) NOT NULL UNIQUE,
title VARCHAR(30) NOT NULL,
content TEXT NOT NULL,
order_num INT NOT NULL,
write_date DATE DEFAULT (current_date),
status CHAR(1) CHECK(status IN('Y','N'))
);

CREATE TABLE qna_answer(
qna_num INT NOT NULL,
manager VARCHAR(20) NOT NULL,
content TEXT NOT NULL,
answer_date DATE DEFAULT (current_date)
);

CREATE TABLE notice(
notice_num INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(30) NOT NULL,
content TEXT NOT NULL,
manager VARCHAR(20) NOT NULL,
write_date DATE DEFAULT (current_date)
);

CREATE TABLE progress (
order_num INT NOT NULL,
collect_req CHAR(1) check (collect_req IN ('Y', 'N')),
collect_complete CHAR(1) check (collect_complete IN ('Y', 'N')),
collect_check CHAR(1) check (collect_check IN ('Y', 'N')),
deposit_ing CHAR(1) check (deposit_ing IN ('Y', 'N')),
deposit_complete CHAR(1) check (deposit_complete IN ('Y', 'N'))
);

CREATE TABLE list(
id VARCHAR(30) NOT NULL,
order_num INT NOT NULL,
collection_date DATE,
kg INT NOT NULL,
price INT NOT NULL
);

ALTER TABLE review ADD CONSTRAINT revi_cust_id
	FOREIGN KEY (id) REFERENCES customer(id) ON DELETE CASCADE;
ALTER TABLE qna ADD CONSTRAINT qna_cust_id
	FOREIGN KEY (id) REFERENCES customer(id) ON DELETE CASCADE;
ALTER TABLE list ADD CONSTRAINT li_id_cust
	FOREIGN KEY (id) REFERENCES customer(id) ON DELETE CASCADE;

ALTER TABLE review ADD CONSTRAINT rev_order_num
	FOREIGN KEY (order_num) REFERENCES collect(order_num) ON DELETE CASCADE;
ALTER TABLE qna ADD CONSTRAINT qna_order_num
	FOREIGN KEY (order_num) REFERENCES collect(order_num) ON DELETE CASCADE;
ALTER TABLE progress ADD CONSTRAINT prog_order_num
	FOREIGN KEY (order_num) REFERENCES collect(order_num) ON DELETE CASCADE;
    
ALTER TABLE qna_answer ADD CONSTRAINT qna_num
	FOREIGN KEY (qna_num) REFERENCES qna(qna_num) ON DELETE CASCADE;
ALTER TABLE list ADD CONSTRAINT li_on_coll
	FOREIGN KEY (order_num) REFERENCES collect(order_num) ON DELETE CASCADE;
    