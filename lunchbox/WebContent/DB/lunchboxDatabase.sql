------------------------------------------ MEMBER SQL
SELECT * FROM LUNCHBOX_MEMBER;
DROP TABLE LUNCHBOX_MEMBER;

CREATE TABLE LUNCHBOX_MEMBER(
	MEMBER_ID VARCHAR2(20) PRIMARY KEY,
	MEMBER_PWD VARCHAR2(20),
	MEMBER_NAME VARCHAR2(20),
	MEMBER_EMAIL VARCHAR2(20)
);
------------------------------------------ BOARD SQL
SELECT * FROM LUNCHBOX_BOARD;
DROP TABLE LUNCHBOX_BOARD;

CREATE TABLE LUNCHBOX_BOARD (
	BOARD_NUM NUMBER PRIMARY KEY,
	BOARD_TITLE VARCHAR2(20),
	BOARD_ID VARCHAR2(20),
	BOARD_CONTENT VARCHAR2(2024),
	BOARD_PRESENT NUMBER, --현황
	BOARD_DATE DATE
);
------------------------------------------ COMMENT SQL
SELECT * FROM LUNCHBOX_COMMENT;
DROP TABLE LUNCHBOX_COMMENT;

CREATE TABLE LUNCHBOX_COMMENT (
	COMMENT_NUMBER NUMBER PRIMARY KEY,
	COMMENT_BOARD_NUMBER VARCHAR2(20), --게시글 번호 외래키
	COMMENT_NAME VARCHAR2(20), --작성자 이름
	COMMENT_CONTENT VARCHAR2(2024)
);
------------------------------------------ RESTO SQL
SELECT * FROM LUNCHBOX_RESTO;
DROP TABLE LUNCHBOX_RESTO;

CREATE TABLE LUNCHBOX_RESTO (
	RESTO_NUMBER NUMBER PRIMARY KEY,
	RESTO_TITLE VARCHAR2(20),
	RESTO_CONTENT VARCHAR2(20), 
	RESTO_IMAGES_LINK VARCHAR2(2024),
	RESTO_CATEGORY VARCHAR2(20)
);

-------------------------------------------- MEMBER dummy
insert into lunchbox_member values (
	'sangju', '1234', '현상주', 'sangju@test.com'
	);

insert into lunchbox_member values (
	'soyoung', '1234', '이소영', 'soyoung@test.com'
	);	

insert into lunchbox_member values (
	'ahs', '1234', '안희수', 'ahs@test.com'
	);	

insert into lunchbox_member values (
	'magic', '1234', '이태성', 'magic@test.com'
	);		
	
insert into lunchbox_member values (
	'jjm', '1234', '정준모', 'jjm@test.com'
	);	
commit;
select * from lunchbox_member;
