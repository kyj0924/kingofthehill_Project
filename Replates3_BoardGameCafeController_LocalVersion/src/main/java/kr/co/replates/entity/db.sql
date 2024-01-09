CREATE TABLE player (
  player_idx int NOT NULL AUTO_INCREMENT,
  player_ID varchar(20) NOT NULL,
  player_PW varchar(20) NOT NULL,
  player_Name varchar(20) NOT NULL,
  player_Tel varchar(20) NOT NULL,
  player_Email varchar(50) NOT NULL,
  player_Rating varchar(20) NOT NULL DEFAULT '폰',
  ownerTag int NOT NULL DEFAULT '0',
  player_Payment int NOT NULL DEFAULT '0',
  PRIMARY KEY (player_idx)
);

CREATE TABLE  playDesk (
   desk_idx  int NOT NULL,
   player_ID  varchar(20) DEFAULT NULL,
   player_Name  varchar(20) DEFAULT NULL,
   start_Time  datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
   game_Name  varchar(20) DEFAULT NULL,
   playTime  int DEFAULT NULL,
   desk_Alarm  varchar(20) NOT NULL DEFAULT 'false',
   call_Alarm  varchar(20) NOT NULL DEFAULT 'false',
  PRIMARY KEY ( desk_idx )
);

CREATE TABLE  deskOrder  (
   order_idx  int NOT NULL AUTO_INCREMENT,
   desk_idx  int NOT NULL,
   food_Name  varchar(20) NOT NULL,
   food_Price  int NOT NULL,
   food_Count  int NOT NULL,
   order_Time  datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ( order_idx )
);

CREATE TABLE  foodMenu  (
   food_idx  int NOT NULL AUTO_INCREMENT,
   food_Name  varchar(20) NOT NULL,
   food_Count  int NOT NULL,
   food_Price  int NOT NULL,
   food_Type  varchar(20) NOT NULL,
   food_Image  varchar(50) DEFAULT NULL,
  PRIMARY KEY ( food_idx )
);


CREATE TABLE  gameMenu  (
   game_idx  int NOT NULL AUTO_INCREMENT,
   game_Name  varchar(50) NOT NULL,
   game_Count  int NOT NULL,
   game_TotalCount  int NOT NULL,
   game_Price  int NOT NULL,
   game_info  varchar(80) NOT NULL,
   game_PlayerNum  varchar(20) NOT NULL,
   game_Image  varchar(50) DEFAULT NULL,
  PRIMARY KEY ( game_idx )
);

CREATE TABLE  totalSell  (
   day_Data  datetime NOT NULL,
   total_Price  int NOT NULL,
   food_Price  int NOT NULL,
   playTime_Price  int NOT NULL,
  PRIMARY KEY ( day_Data )
);

CREATE TABLE  needFriend_Board  (
   nf_idx  int NOT NULL AUTO_INCREMENT,
   nf_Title  varchar(20) NOT NULL,
   nf_Content  varchar(100) NOT NULL,
   player_ID  varchar(20) NOT NULL,
   nf_Indate  datetime DEFAULT CURRENT_TIMESTAMP,
   nf_ViewCount  int DEFAULT '0',
  PRIMARY KEY ( nf_idx )
);

CREATE TABLE  notice_Board  (
   notice_idx  int NOT NULL AUTO_INCREMENT,
   notice_Title  varchar(20) NOT NULL,
   notice_Content  varchar(100) NOT NULL,
   notice_Writer  varchar(20) NOT NULL,
   notice_Indate  datetime DEFAULT CURRENT_TIMESTAMP,
   notice_ViewCount  int DEFAULT '0',
  PRIMARY KEY ( notice_idx )
);

CREATE TABLE  request_Board  (
   request_idx  int NOT NULL AUTO_INCREMENT,
   request_Title  varchar(20) NOT NULL,
   request_Content  varchar(100) NOT NULL,
   request_Writer  varchar(20) NOT NULL,
   request_Indate  datetime DEFAULT CURRENT_TIMESTAMP,
   request_ViewCount  int DEFAULT '0',
  PRIMARY KEY ( request_idx )
);

CREATE TABLE  comment  (
   comment_idx  int NOT NULL AUTO_INCREMENT,
   comment_Content  varchar(50) NOT NULL,
   comment_Writer  varchar(45) NOT NULL,
   comment_Indate  datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
   comment_Board_idx  int NOT NULL,
  PRIMARY KEY ( comment_idx )
);

CREATE TABLE nf_Comment(
   nf_comment_idx  int NOT NULL AUTO_INCREMENT,
   nf_comment_Content  varchar(50) NOT NULL,
   nf_comment_Writer  varchar(45) NOT NULL,
   nf_comment_Indate  datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
   nf_comment_Board_idx  int NOT NULL,
  PRIMARY KEY ( nf_comment_idx )
);

--고객 플레이 데스크 셋팅
insert into playDesk (desk_idx)
values (1);
insert into playDesk (desk_idx)
values (2);
insert into playDesk (desk_idx)
values (3);
insert into playDesk (desk_idx)
values (4);
insert into playDesk (desk_idx)
values (5);
insert into playDesk (desk_idx)
values (6);
insert into playDesk (desk_idx)
values (7);
insert into playDesk (desk_idx)
values (8);

--음식 메뉴
insert into foodMenu (food_idx, food_Name, food_Count, food_Price, food_Type) values (1, '아메리카노(HOT)', 100, 2500, '음료');
insert into foodMenu (food_idx, food_Name, food_Count, food_Price, food_Type) values (2, '아메리카노(ICED)', 100, 2500, '음료');
insert into foodMenu (food_idx, food_Name, food_Count, food_Price, food_Type) values (3, '카페라떼', 100, 3000, '음료');
insert into foodMenu (food_idx, food_Name, food_Count, food_Price, food_Type) values (4, '콜라', 100, 2000, '음료');
insert into foodMenu (food_idx, food_Name, food_Count, food_Price, food_Type) values (5, '사이다', 100, 2000, '음료');
insert into foodMenu (food_idx, food_Name, food_Count, food_Price, food_Type) values (6, '그린애플소다', 100, 4000, '음료');
insert into foodMenu (food_idx, food_Name, food_Count, food_Price, food_Type) values (7, '망고스무디', 100, 4500, '음료');
insert into foodMenu (food_idx, food_Name, food_Count, food_Price, food_Type) values (8, '딸기스무디', 100, 4500, '음료');
insert into foodMenu (food_idx, food_Name, food_Count, food_Price, food_Type) values (9, '블루레몬에이드', 100, 4000, '음료');
insert into foodMenu (food_idx, food_Name, food_Count, food_Price, food_Type) values (10, '자몽에이드', 100, 4000, '음료');
insert into foodMenu (food_idx, food_Name, food_Count, food_Price, food_Type) values (11, '떡볶이', 100, 3500, '음식');
insert into foodMenu (food_idx, food_Name, food_Count, food_Price, food_Type) values (12, '소시지', 100, 3500, '음식');
insert into foodMenu (food_idx, food_Name, food_Count, food_Price, food_Type) values (13, '샌드위치', 100, 4000, '음식');
insert into foodMenu (food_idx, food_Name, food_Count, food_Price, food_Type) values (14, '감자튀김', 100, 2500, '음식');
insert into foodMenu (food_idx, food_Name, food_Count, food_Price, food_Type) values (15, '햄버거', 100, 3000, '음식');
insert into foodMenu (food_idx, food_Name, food_Count, food_Price, food_Type) values (16, '라면', 100, 2500, '음식');
insert into foodMenu (food_idx, food_Name, food_Count, food_Price, food_Type) values (17, '피자', 100, 5000, '음식');
insert into foodMenu (food_idx, food_Name, food_Count, food_Price, food_Type) values (18, '만두', 100, 4000, '음식');
insert into foodMenu (food_idx, food_Name, food_Count, food_Price, food_Type) values (19, '츄러스', 100, 3500, '음식');
insert into foodMenu (food_idx, food_Name, food_Count, food_Price, food_Type) values (20, '치킨', 100, 10000, '음식');

--관리자 계정
insert into player (player_ID, player_PW, player_Name, player_Tel, player_Email, ownerTag) values ('admin', '123', 'admin', '010-1234-5678', 'abc@def', 1);
--유저 계정
insert into player(player_ID, player_PW, player_Name, player_Tel, player_Email, ownerTag) values('id', 'pw', '홍길동', '010-1234-5678', 'aaa@naver.com', 0);

--게임 리스트
INSERT INTO gameMenu(game_idx, game_Name, game_Count, game_TotalCount, game_Price, game_info, game_PlayerNum)
VALUES (1, '훈트', 5, 5, 1, 'https://www.boardmfactory.com/hund', '2,3,4,5');
INSERT INTO gameMenu(game_idx, game_Name, game_Count, game_TotalCount, game_Price, game_info, game_PlayerNum)
VALUES (2, '사이언시아', 5, 5, 1, 'https://www.boardmfactory.com/scientia', '2,3,4');
INSERT INTO gameMenu(game_idx, game_Name, game_Count, game_TotalCount, game_Price, game_info, game_PlayerNum)
VALUES (3, '헤게모니', 5, 5, 1, 'https://www.boardmfactory.com/hegemony', '2,3,4');
INSERT INTO gameMenu(game_idx, game_Name, game_Count, game_TotalCount, game_Price, game_info, game_PlayerNum)
VALUES (4, '메시브다크', 5, 5, 1, 'https://www.boardmfactory.com/md2', '1,2,3,4,5,6');
INSERT INTO gameMenu(game_idx, game_Name, game_Count, game_TotalCount, game_Price, game_info, game_PlayerNum)
VALUES (5, '좀비사이드', 5, 5, 1, 'https://www.boardmfactory.com/zombicide-gearup','1,2,3,4,5,6');
INSERT INTO gameMenu(game_idx, game_Name, game_Count, game_TotalCount, game_Price, game_info, game_PlayerNum)
VALUES (6, '레지사이드', 5, 5, 1, 'https://www.boardmfactory.com/regicide', '1,2,3,4');
INSERT INTO gameMenu(game_idx, game_Name, game_Count, game_TotalCount, game_Price, game_info, game_PlayerNum)
VALUES (7, '로젠코닉', 5, 5, 1, 'https://www.boardmfactory.com/ultimaterailroads','2');
INSERT INTO gameMenu(game_idx, game_Name, game_Count, game_TotalCount, game_Price, game_info, game_PlayerNum)
VALUES (8, '마블좀비', 5, 5, 1, 'https://www.boardmfactory.com/marvelzombies', '1,2,3,4,5,6');
INSERT INTO gameMenu(game_idx, game_Name, game_Count, game_TotalCount, game_Price, game_info, game_PlayerNum)
VALUES (9, '개구리스프', 5, 5, 1, 'https://www.boardmfactory.com/frogsoup', '1,2,3,4');
INSERT INTO gameMenu(game_idx, game_Name, game_Count, game_TotalCount, game_Price, game_info, game_PlayerNum)
VALUES (10, '마운틴고트', 5, 5, 1, 'https://www.boardmfactory.com/mountaingoats', '2,3,4');
INSERT INTO gameMenu(game_idx, game_Name, game_Count, game_TotalCount, game_Price, game_info, game_PlayerNum)
VALUES (11, '메모아일랜드', 5, 5, 1, 'https://www.boardmfactory.com/memoryisland', '2,3,4');
INSERT INTO gameMenu(game_idx, game_Name, game_Count, game_TotalCount, game_Price, game_info, game_PlayerNum)
VALUES (12, '요람에서무덤', 5, 5, 1, 'https://www.boardmfactory.com/c2g', '2,3,4,5');

commit;


