
CREATE SEQUENCE ptclass_idx_seq;
CREATE SEQUENCE notice_idx_seq;
drop sequence notice_idx_seq;


DROP table notice;
SELECT * FROM notice;
CREATE TABLE notice(
	idx NUMBER PRIMARY KEY,
	subject varchar2(100) NOT NULL,
	content varchar2(3000) NOT NULL,
	regDate timestamp DEFAULT SYSDATE,
	clickCount number(20) DEFAULT 0
);
INSERT INTO notice
VALUES(notice_idx_seq.nextval,'안녕', '안녕하세요', SYSDATE, 0);
INSERT INTO notice
VALUES(notice_idx_seq.nextval,'안녕', '안녕하세요', SYSDATE, 0);

CREATE TABLE ptclass(
   idx number PRIMARY key,  
   id varchar2(30) NOT NULL,
   pttime DATE,
   CONSTRAINT fk_id_MEMBERS FOREIGN key(id) REFERENCES MEMBERS(id),
   r_check char(1) check(r_check IN('T','F')) NOT null
);
SELECT * FROM ptclass;
DROP TABLE ptclass;

CREATE TABLE MEMBERS(
	id varchar2(30) PRIMARY KEY,
	password varchar2(30) NOT NULL,
	name varchar2(30) NOT NULL,
	postcode varchar2(10) NOT NULL,
	addr1 varchar2(100) NOT NULL,
	addr2 varchar2(100) NOT NULL,
	email varchar2(50) NOT NULL,
	gender char(1) CHECK(gender IN('M','F')),
	pt number(3),
	startday date,
	endday date,
	lev number(2),
	myTrainer varchar2(30) NOT NULL
);
DROP TABLE MEMBERS;
SELECT * FROM MEMBERS;

INSERT INTO MEMBERS VALUES 
('root','1234','최고관리자',' ',' ',' ','ithuman202204@gmail.com','M',0,'2022-05-30','2023-05-30',3,'sys');
INSERT INTO MEMBERS VALUES 
('admin','1234','최고관리자',' ',' ',' ','ithuman202204@gmail.com','M',0,'2022-05-30','2023-05-30',3,'sys');
INSERT INTO MEMBERS VALUES 
('user01','1234','한사람',' ',' ',' ','ithuman202204@gmail.com','F',0,'2022-05-30','2023-05-30',1,'root');
INSERT INTO MEMBERS VALUES 
('user10','1234','human1',' ',' ',' ','ithuman202204@gmail.com','M',0,'2022-05-30','2023-05-30',1,'root');
INSERT INTO MEMBERS VALUES 
('user09','1234','두번째사람',' ',' ',' ','ithuman202204@gmail.com','F',0,'2022-05-30','2023-05-30',1,'admin');

SELECT * FROM members;
SELECT * FROM PTCLASS;

INSERT INTO PTCLASS values(ptclass_idx_seq.nextval, 'hyun95',SYSDATE,  0);

DROP table RESERVATION;

SELECT * FROM tab;
COMMIT;

CREATE TABLE reservation(
	id varchar2(30),
	idx number(30)
);

ALTER TABLE reservation ADD FOREIGN KEY(id) REFERENCES members(id);
ALTER TABLE reservation ADD FOREIGN KEY(idx) REFERENCES ptclass(idx);

