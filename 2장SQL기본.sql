#날자 : 2024/07/01
#이름 : 이도영
#내용 : 2장 SQL기본
use StudyDB; #DB 사용시
set sql_safe_updates=0; # 삭제 업데이트에 문제가 생길 경우

#실습 2-1. 테이블 생성, 제거

create table `User1`(
	`uid` varchar(10),
	`name` varchar(10),
    `hp` char(13),
    `age` int
);

Drop Table `Tb1Product`;

#실습 2-2. 데이터 입력
insert into User1 Values('A101','김유신','010-1234-1111',25);
insert into User1 Values('A102','김춘추','010-1234-2222',23);
insert into User1 Values('A103','장보고','010-1234-3333',32);
INSERT INTO User1 (`uid`, `name`, `age`) VALUES ('A104', '강감찬', 45);
INSERT INTO User1 SET uid='A105', name='이순신', hp='010-1234-5555';


#실습 2-3. 데이터 조회
SELECT * FROM `User1`;
SELECT * FROM `User1` WHERE `uid`='A101';
SELECT * FROM `User1` WHERE `name`='김춘추';
SELECT * FROM `User1` WHERE `age` < 30;
SELECT * FROM `User1` WHERE `age` >= 30;
SELECT `uid`, `name`, `age` FROM `User1`;

#실습 2-4. 데이터 수정
UPDATE `User1` SET `hp`='010-1234-4444' WHERE `uid`='A104';
UPDATE `User1` SET `age`=51 WHERE `uid`='A105';
UPDATE `User1` SET `hp`='010-1234-1001', `age`=27 WHERE `uid`='A101';

#실습 2-5. 데이터 삭제
DELETE FROM `User1` WHERE `uid`='A101';
DELETE FROM `User1` WHERE `uid`='A102' AND `age`=25;
DELETE FROM `User1` WHERE `age` >= 30;

#실습 2-6. 테이블 컬럼 수정
ALTER TABLE `User1` ADD `gender` TINYINT;
ALTER TABLE `User1` ADD `birth` CHAR(10) AFTER `name`;
ALTER TABLE `User1` MODIFY `gender` CHAR(1);
ALTER TABLE `User1` MODIFY `age` TINYINT;
ALTER TABLE `User1` DROP `gender`;

#실습 2-7. 테이블 복사
CREATE TABLE `User1Copy` LIKE `User1`;
INSERT INTO `User1Copy` SELECT * FROM `User1`;


#2-8. 테이블을 생성 후 데이터를 입력
create table `Tb1User`(
	`user_id` varchar(10),
	`user_name` varchar(10),
    `user_hp` char(13),
    `user_age` int,
    `user_addr` varchar(10)
);
create table `Tb1Product`(
	`prod_no` int,
	`prod_name` varchar(10),
    `prod_price` varchar(10),
    `prod_stock` int,
    `prod_company` varchar(10),
    `prod_date` char(10)
);
insert into Tb1User Values('p101','김유신','010-1234-1001',25,'경남 김해시');
insert into Tb1User Values('p102','김춘추','010-1234-1002',23,'경남 경주시');
insert into Tb1User Values('p103','장보고',NULL,31,'경남 완도군');
insert into Tb1User Values('p104','강감찬',NULL,NULL,'서울시 중구');
insert into Tb1User Values('p105','이순신','010-1234-1005',50,NULL);

insert into Tb1Product Values(1001,'냉장고','800,000',25,'LG전자',2022-01-06);
insert into Tb1Product Values(1002,'노트북','1,200,000',120,'삼성전자',2022-01-07);
insert into Tb1Product Values(1003,'모니터','350,000',35,'LG전자',2023-01-13);
insert into Tb1Product Values(1004,'세탁기','1,000,000',80,'삼성전자',2021-01-01);
insert into Tb1Product Values(1005,'컴퓨터','1,500,000',20,'삼성전자',2023-10-10);
INSERT INTO Tb1Product (`prod_no`, `prod_name`, `prod_price`,`prod_stock`) VALUES (1006, '휴대폰', '950,000',102);
#실습 2-9 아래 SQL을 실행하시오.

SELECT * FROM `Tb1User`;
SELECT `user_name` FROM `Tb1User`;
SELECT `user_name`, `user_hp` FROM `Tb1User`;
SELECT * FROM `Tb1User` WHERE `user_id`='p102';
SELECT * FROM `Tb1User` WHERE `user_id`='p104' OR `user_id`='p105';
SELECT * FROM `Tb1User` WHERE `user_addr`='부산시 금정구';
SELECT * FROM `Tb1User` WHERE `user_age` > 30;
SELECT * FROM `Tb1User` WHERE `user_hp` IS NULL;
UPDATE `Tb1User` SET `user_age`=42 WHERE `user_id`='p104';
UPDATE `Tb1User` SET `user_addr`='부산시 진구' WHERE `user_id`='p105';
DELETE FROM `Tb1User` WHERE `user_id`='p103';


SELECT * FROM `Tb1Product`;
SELECT `prod_name` FROM `Tb1Product`;
SELECT `prod_name`, `prod_company`, `prod_price` FROM `Tb1Product`;
SELECT * FROM `Tb1Product` WHERE `prod_company`='LG전자';
SELECT * FROM `Tb1Product` WHERE `prod_company`='삼성전자';
UPDATE `Tb1Product` SET `prod_company`='삼성전자', `prod_date`='2024-01-01' WHERE `prod_no`=1006;

