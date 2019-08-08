﻿select * from LUNCHBOX_RESTO;
DROP TABLE LUNCHBOX_RESTO;
CREATE TABLE LUNCHBOX_RESTO (
   RESTO_NUMBER NUMBER PRIMARY KEY,
   RESTO_TITLE VARCHAR2(100),
   RESTO_MENU VARCHAR2(100), 
   RESTO_PRICE NUMBER,
   RESTO_CONTENT VARCHAR2(2024)
);

insert into LUNCHBOX_RESTO ( RESTO_NUMBER, RESTO_TITLE, RESTO_MENU, RESTO_PRICE, RESTO_CONTENT)
values (1,'교대이층집','제육볶음',7000,'제육볶음2인분');
insert into LUNCHBOX_RESTO ( RESTO_NUMBER, RESTO_TITLE, RESTO_MENU, RESTO_PRICE, RESTO_CONTENT)
values (2,'교동짬뽕',	'짬뽕',7000,'가격이 준수한 영풍문고 옆 중국집');
insert into LUNCHBOX_RESTO ( RESTO_NUMBER, RESTO_TITLE, RESTO_MENU, RESTO_PRICE, RESTO_CONTENT)
values (3,'굿모닝구내식당','백반',6000,	'항상 달라지는 메뉴');
insert into LUNCHBOX_RESTO ( RESTO_NUMBER, RESTO_TITLE, RESTO_MENU, RESTO_PRICE, RESTO_CONTENT)
values (4,'다담정식',	'백반',7500,	'5찬 고등어구이빼고 무한리필');
insert into LUNCHBOX_RESTO ( RESTO_NUMBER, RESTO_TITLE, RESTO_MENU, RESTO_PRICE, RESTO_CONTENT)
values (5,'담소사골순대국','돈사골순대국',7000,'맛있다 든든하다');
insert into LUNCHBOX_RESTO ( RESTO_NUMBER, RESTO_TITLE, RESTO_MENU, RESTO_PRICE, RESTO_CONTENT)
values (6,'도미노피자',	'콰트로치즈',7000,'쿠폰을 사용하면 인당7천원');
insert into LUNCHBOX_RESTO ( RESTO_NUMBER, RESTO_TITLE, RESTO_MENU, RESTO_PRICE, RESTO_CONTENT)
values (7,'돈천동부대찌개','부대찌개',7500,'부대찌개에 돈까스넣지마세요');
insert into LUNCHBOX_RESTO ( RESTO_NUMBER, RESTO_TITLE, RESTO_MENU, RESTO_PRICE, RESTO_CONTENT)
values (8,'라공방','마라탕',7000,'떨떠름한 그맛');
insert into LUNCHBOX_RESTO ( RESTO_NUMBER, RESTO_TITLE, RESTO_MENU, RESTO_PRICE, RESTO_CONTENT)
values (9,'맘스터치','싸이버거',7000,'버거 나오는 속도가 엄청느리다');
insert into LUNCHBOX_RESTO ( RESTO_NUMBER, RESTO_TITLE, RESTO_MENU, RESTO_PRICE, RESTO_CONTENT)
values (10,'맛보래떡볶이','치즈떡볶이',7000,'치즈떡볶이 치즈양이 엄청나다');
insert into LUNCHBOX_RESTO ( RESTO_NUMBER, RESTO_TITLE, RESTO_MENU, RESTO_PRICE, RESTO_CONTENT)
values (11,'맥도날드','빅맥',7000,'빅맥,슈비,1955,상하이계열');
insert into LUNCHBOX_RESTO ( RESTO_NUMBER, RESTO_TITLE, RESTO_MENU, RESTO_PRICE, RESTO_CONTENT)
values (12, '맹버칼','버섯칼국수','7000','휴가때 먹는 맛');
insert into LUNCHBOX_RESTO ( RESTO_NUMBER, RESTO_TITLE, RESTO_MENU, RESTO_PRICE, RESTO_CONTENT)
values (13,'먹쇠고기','냉면셋트',6000,'가깝고 가성비좋다');
insert into LUNCHBOX_RESTO ( RESTO_NUMBER, RESTO_TITLE, RESTO_MENU, RESTO_PRICE, RESTO_CONTENT)
values (14,'미진','판메밀',9000,'4인기준 [판2비빔1전병1]');
insert into LUNCHBOX_RESTO ( RESTO_NUMBER, RESTO_TITLE, RESTO_MENU, RESTO_PRICE, RESTO_CONTENT)
values (15,'버거킹','와퍼',7000,'버거킹은 버거킹');
insert into LUNCHBOX_RESTO ( RESTO_NUMBER, RESTO_TITLE, RESTO_MENU, RESTO_PRICE, RESTO_CONTENT)
values (16,'북촌손만두','피냉면',6000,'가성비: 만두+냉면 < 만두국');
insert into LUNCHBOX_RESTO ( RESTO_NUMBER, RESTO_TITLE, RESTO_MENU, RESTO_PRICE, RESTO_CONTENT)
values (17,'삼백집','콩나물국밥',7000,'깔끔하고 시원하다');
insert into LUNCHBOX_RESTO ( RESTO_NUMBER, RESTO_TITLE, RESTO_MENU, RESTO_PRICE, RESTO_CONTENT)
values (18,'서브웨이','BLT',6500,'한끼 식사 대용, 속이 편안하다');
insert into LUNCHBOX_RESTO ( RESTO_NUMBER, RESTO_TITLE, RESTO_MENU, RESTO_PRICE, RESTO_CONTENT)
values (19,'수제왕돈까스','돈까스',6500,'4층 계단을 오를 체력이 있으면...');
insert into LUNCHBOX_RESTO ( RESTO_NUMBER, RESTO_TITLE, RESTO_MENU, RESTO_PRICE, RESTO_CONTENT)
values (20,'시골집','장터국밥',9000,'소해장국, 돈아깝지않다');
insert into LUNCHBOX_RESTO ( RESTO_NUMBER, RESTO_TITLE, RESTO_MENU, RESTO_PRICE, RESTO_CONTENT)
values (21,'신일분식','백반',6000,'할머니들이 해주시는 집밥');
insert into LUNCHBOX_RESTO ( RESTO_NUMBER, RESTO_TITLE, RESTO_MENU, RESTO_PRICE, RESTO_CONTENT)
values (22,'신주쿠카레','카레라이스',5000,'베이스는 5000원이지만 토핑을 올리면..');
insert into LUNCHBOX_RESTO ( RESTO_NUMBER, RESTO_TITLE, RESTO_MENU, RESTO_PRICE, RESTO_CONTENT)
values (23,'엽기떡볶이','오리지널볶이',7000,'종각점이 아니라 다른데 시켰습니다');
insert into LUNCHBOX_RESTO ( RESTO_NUMBER, RESTO_TITLE, RESTO_MENU, RESTO_PRICE, RESTO_CONTENT)
values (24,'오양식관','김치찌개',7500,'김치찌개에 계란말이추가가 좋음');
insert into LUNCHBOX_RESTO ( RESTO_NUMBER, RESTO_TITLE, RESTO_MENU, RESTO_PRICE, RESTO_CONTENT)
values (25,'이가네감자탕','뼈해장국',7000,'맛있다, 아는맛');
insert into LUNCHBOX_RESTO ( RESTO_NUMBER, RESTO_TITLE, RESTO_MENU, RESTO_PRICE, RESTO_CONTENT)
values (26,'일산닭한마리','닭칼국수',7000,'닭국물의 적당한 담백함에 칼국수');
insert into LUNCHBOX_RESTO ( RESTO_NUMBER, RESTO_TITLE, RESTO_MENU, RESTO_PRICE, RESTO_CONTENT)
values (27,'제레미20','대만식면요리',8500,'맛있는데 가격대가높다');
insert into LUNCHBOX_RESTO ( RESTO_NUMBER, RESTO_TITLE, RESTO_MENU, RESTO_PRICE, RESTO_CONTENT)
values (28,'참토우','쭈꾸미정식',7000,'맛있다, 맵다!');
insert into LUNCHBOX_RESTO ( RESTO_NUMBER, RESTO_TITLE, RESTO_MENU, RESTO_PRICE, RESTO_CONTENT)
values (29,'청계면관','고추간짜장',7000,'고추간짜장이 제일 인상적');
insert into LUNCHBOX_RESTO ( RESTO_NUMBER, RESTO_TITLE, RESTO_MENU, RESTO_PRICE, RESTO_CONTENT)
values (30,'촌놈닭갈비','닭갈비정식',7000,'막국수에 숯불닭갈비');
insert into LUNCHBOX_RESTO ( RESTO_NUMBER, RESTO_TITLE, RESTO_MENU, RESTO_PRICE, RESTO_CONTENT)
values (31,'카츠야','돈카츠',7000,'약속된 맛, 결제시 마다 1000원쿠폰 지급');
insert into LUNCHBOX_RESTO ( RESTO_NUMBER, RESTO_TITLE, RESTO_MENU, RESTO_PRICE, RESTO_CONTENT)
values (32,'파파존스','아일리쉬포테토',7000,'도미노와는 다르지만 맛있다');
insert into LUNCHBOX_RESTO ( RESTO_NUMBER, RESTO_TITLE, RESTO_MENU, RESTO_PRICE, RESTO_CONTENT)
values (33,'한솥','치킨마요',5000,'어릴때부터 먹던 한솥도시락');
insert into LUNCHBOX_RESTO ( RESTO_NUMBER, RESTO_TITLE, RESTO_MENU, RESTO_PRICE, RESTO_CONTENT)
values (34,'홍콩반점','짜장면',6000,'백종원 체인점');
insert into LUNCHBOX_RESTO ( RESTO_NUMBER, RESTO_TITLE, RESTO_MENU, RESTO_PRICE, RESTO_CONTENT)
values (35,'황소고집','고기백반',7000,'맛있다, 양은 조금 아쉽다');
insert into LUNCHBOX_RESTO ( RESTO_NUMBER, RESTO_TITLE, RESTO_MENU, RESTO_PRICE, RESTO_CONTENT)
values (36,'KFC','징거버거',7000,'치킨버거 오리진');

commit;

select * from LUNCHBOX_RESTO;