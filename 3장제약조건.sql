#날자 : 2024/07/02
#이름 : 이도영
#내용 : 3장 제약조건
use StudyDB; #DB 사용시
set sql_safe_updates=0; # 삭제 업데이트에 문제가 생길 경우
Delete From parent where pid LIKE 'A%'; #무엇으로 시작하는 단어 삭제

#기본키
#실습 3-1
CREATE TABLE `User2` (
	`uid` VARCHAR(10) PRIMARY KEY,
	`name` VARCHAR(10),
	`birth` CHAR(10),
	`addr` VARCHAR(50)
);
#실습 3-2
INSERT into User2 values('A101','김유신','1968-05-09','경남 김해시');
INSERT into user2 values('A102','김춘추','1972-11-23','경남 광주시');
INSERT into user2 values('A103','장보고','1978-03-01','전남 완도군');
INSERT into user2 values('A104','강감찬','1979-08-16','서울시 관악구');
INSERT into user2 values('A105','이순신','1981-05-23','부산시 진구');
select * From user2;



#고유키
#실습 3-3
CREATE TABLE `User3` (
	`uid` VARCHAR(10) PRIMARY KEY,
	`name` VARCHAR(10),
	`birth` CHAR(10),
	`hp` CHAR(13) UNIQUE,
	`addr` VARCHAR(50)
);
#실습 3-4
INSERT into User3 values('A101','김유신','1968-05-09','010-1234-1001','경남 김해시');
INSERT into User3 values('A102','김춘추','1972-11-23','010-1234-1002','경남 광주시');
INSERT into User3 values('A103','장보고','1978-03-01','010-1234-1003','전남 완도군');
INSERT into User3 values('A104','강감찬','1979-08-16','010-1234-1004','서울시 관악구');
INSERT into User3 values('A105','이순신','1981-05-23','010-1234-1005','부산시 진구');
select * From user3;


#외래키
#실습 3-5
CREATE TABLE `Parent` (
	`pid` VARCHAR(10) PRIMARY KEY,
	`name` VARCHAR(10),
	`birth` CHAR(10),
	`addr` VARCHAR(100)
);

CREATE TABLE `Child` (
	`cid` VARCHAR(10) PRIMARY KEY,
	`name` VARCHAR(10),
	`hp` CHAR(13) UNIQUE,
	`parent` VARCHAR(10),
	FOREIGN KEY (`parent`) REFERENCES `Parent` (`pid`)
);
#실습 3-6
INSERT into Parent values('P101','김유신','1968-05-09','경남 김해시');
INSERT into Parent values('P102','김춘추','1972-11-23','경남 광주시');
INSERT into Parent values('P103','장보고','1978-03-01','전남 완도군');
INSERT into Parent values('P104','강감찬','1979-08-16','서울시 관악구');
INSERT into Parent values('P105','이순신','1981-05-23','부산시 진구');

insert into Child values('C101','김철수','010-1234-1001','P101');
insert into Child values('C102','김영희','010-1234-1002','P101');
insert into Child values('C103','강철수','010-1234-1003','P103');
insert into Child values('C104','이철수','010-1234-1004','P105');
insert into Child values('C104','이철수','010-1234-1004','P107');
select * From Parent;
select * From Child;


#DEFAULT와 NOT NULL
# 실습 3-7
CREATE TABLE `User4`(
	`uid` VARCHAR(10) PRIMARY KEY,
	`name` VARCHAR(10) NOT NULL,
	`gender` CHAR(1),
	`age` INT DEFAULT 1,
	`hp` CHAR(13) UNIQUE,
	`addr` VARCHAR(20)
);
#실습 3-8
INSERT into User4 values('A101','김유신','M',25,'010-1234-1111','경남 김해시');
INSERT into User4 values('A102','김춘추','M',23,'010-1234-2222','경남 광주시');
INSERT into User4 values('A103','장보고','M',35,'010-1234-3333','전남 완도군');
INSERT into User4 values('A104','강감찬','M',42,'010-1234-4444','서울시 관악구');
INSERT into User4 values('A105', NULL ,'M',null,'010-1234-5555','부산시 진구');
INSERT into User4 values('A106','신사임당','F',32,null,'강릉시');
INSERT into User4 values('A107','허난설현','F',27,null,'경기도 광주시');
INSERT into User4 (`uid`,`name`,`gender`,`hp`,`addr`) values('A105', '이순신','M','010-1234-5555','부산시 진구');
select * From User4;



#CHECK와 AUTO_INCREMENT
#실습 3-9
CREATE TABLE `User5`(
	`seq` INT PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(10) NOT NULL,
	`gender` CHAR(1) CHECK (`gender` IN ('M', 'F')),
	`age` INT DEFAULT 1 CHECK (`age` > 0 AND `age` < 100),
	`addr` VARCHAR(20)
);
#실습 3-10
INSERT into User5 values(1,'김유신','M',25,'경남 김해시');
INSERT into User5 values(2,'김춘추','M',23,'경남 경주시');
INSERT into User5 values(3,'장보고','M',35,'전남 완도시');
INSERT into User5 values(4,'강감찬','M',42,'서울시 관악구');
INSERT into User5 values(5,'이순신','A',51,'부산시');
INSERT into User5 values(6,'신사임당','F',-1,'강릉시');
select * From User5;