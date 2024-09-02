#날짜 : 2024/07/02
#이름 : 강중원
#내용 : 3장 제약조건

#실습 3-1
create table `user2`(
	`uid` VARCHAR(10) PRIMARY KEY,
    `name` VARCHAR(10),
    `birth` CHAR(10),
    `addr` VARCHAR(50)
    );

    
    
#실습 3-2
Insert into `user2` value ('A101', '김유신', '1968-05-09', '경남 김해시');
Insert into `user2` value ('A102', '김춘추', '1972-11-23', '경남 경주시');
Insert into `user2` value ('A103', '장보고', '1978-03-01', '전남 완도시');
Insert into `user2` value ('A104', '강감찬', '1979-08-16', '서울시 관악구');
Insert into `user2` value ('A105', '이순신', '1981-05-23', '부산시 진구');

#실습 3-3
create table `user3`(
	`uid` VARCHAR(10) PRIMARY KEY,
    `name` VARCHAR(10),
    `birth` CHAR(10),
    `hp` Char(13) UniQue,
    `addr` VARCHAR(50)
    );
    
#실습 3-4    
Insert into `user3` value ('A101', '김유신', '1968-05-09', "010-1234-1001", '경남 김해시');
Insert into `user3` value ('A102', '김춘추', '1972-11-23', "010-1234-1002",'경남 경주시');
Insert into `user3` value ('A103', '장보고', '1978-03-01', "010-1234-1003",'전남 완도시');
Insert into `user3` value ('A104', '강감찬', '1979-08-16', "010-1234-1004",'서울시 관악구');
Insert into `user3` value ('A105', '이순신', '1981-05-23', "010-1234-1005",'부산시 진구');   

#실습 3-5
create table `parent`(
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
Insert into `parent` value ('P101', '김유신', '1968-05-09', '경남 김해시');
Insert into `parent` value ('P102', '김춘추', '1972-11-23', '경남 경주시');
Insert into `parent` value ('P103', '장보고', '1978-03-01', '전남 완도시');
Insert into `parent` value ('P104', '강감찬', '1979-08-16', '서울시 관악구');
Insert into `parent` value ('P105', '이순신', '1981-05-23', '부산시 진구');

Insert into `child` value ('C101', '김철수', '010-1234-1001', 'P101');
Insert into `child` value ('C102', '김영희', '010-1234-1002', 'P101');
Insert into `child` value ('C103', '장철수', '010-1234-1003', 'P103');
Insert into `child` value ('C104', '이철수', '010-1234-1004', 'P105');

#실습 3-7
CREATE TABLE `User4`(
	`uid` VARCHAR(10) PRIMARY KEY,
    `name` VARCHAR(10) NOT NULL,
    `gender` CHAR(1),
    `age` INT DEFAULT 1,
    `hp` CHAR(13) UNIQUE,
    `addr` VARCHAR(20)
    );

#실습 3-8
Insert into `user4` value ('A101', '김유신','M', 25, '010-1234-1111', '경남 김해시');
Insert into `user4` value ('A102', '김춘추','M', 23, '010-1234-2222', '경남 경주');
Insert into `user4` value ('A103', '장보고','M', 35, '010-1234-3333', '전남 완도시');
Insert into `user4` value ('A104', '강감찬','M', 42, '010-1234-4444', '서울시 관악구');
INSERT INTO `user4` (`uid`,`name`, `gender`, `hp`,`addr`) VALUES ('A105','이순신', 'M', '010-1234-5555','부산시 진구');
INSERT INTO `user4` (`uid`, `name`,`gender`, `age`, `addr`) VALUES ('A106', '신사임당','F', 32, '강릉시');
INSERT INTO `user4` (`uid`, `name`,`gender`, `age`, `addr`) VALUES ('A107', '허난설헌','F', 27, '경기도 광주시');


#실습 3-9
CREATE TABLE `USER5`(
	`seq` INT PRIMARY KEY auto_increment,
    `name` VARCHAR(10) NOT NULL,
    `gender` CHAR(1) CHECK (`gender` IN ('M', 'F')),
    `age` INT DEFAULT 1 CHECK (`age` > 0 AND `age` < 100),
    `addr` VARCHAR(20)
    );


#실습 3-10
INSERT INTO `user5` (`name`, `gender`, `age` , `addr`)  VALUES ('김유신','M', 25, '경남 김해시');
INSERT INTO `user5` (`name`, `gender`, `age` , `addr`)  VALUES ('김춘추','M', 23, '경남 경주시');
INSERT INTO `user5` (`name`, `gender`, `age` , `addr`)  VALUES ('장보고','M', 35, '전남 완도시');
INSERT INTO `user5` (`name`, `gender`, `age` , `addr`)  VALUES ('강감찬','M', 42, '서울시 관악구');
INSERT INTO `user5` (`name`, `gender`, `age` , `addr`)  VALUES ('이순신','M', 51, '부산시');
INSERT INTO `user5` (`name`, `gender`, `age` , `addr`)  VALUES ('신사임당','F', 25, '강릉시');


