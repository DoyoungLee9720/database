#날짜 : 2024/07/08
#이름 : 강중원
#내용 : SQL 연습문제1 실습하기

#실습1-1
create database `Shop`;
Create User 'shop'@'%' identified by '1234';
GRANT ALL privileges on Shop.* TO 'shop'@'%';
FLUSH privileges;

use Shop;

#실습1-2
Create table `customer`(
	`custid` VARCHAR(10) NOT NULL primary key,
    `name` VARCHAR(10) NOT NULL,
    `hp` VARCHAR(13) default NULL,
    `addr` VARCHAR(100) default NULL,
    `rdate` DATE NOT NULL
);
DROP table customer;

Create table `Product`(
	`prodNo` INT NOT NULL primary key,
    `prodName` VARCHAR(10) NOT NULL,
    `stock` INT NOT NULL,
    `price` INT default NULL,
    `company` VARCHAR(20) NOT NULL
);
DROP TABLE `product`;

CREATE TABLE `ORDER`(
	`orderNo` INT auto_increment primary key,
    `orderid` VARCHAR(10) NOT NULL,
    `orderProduct` INT NOT NULL,
    `orderCount` INT default 1 NOT NULL,
    `orderDate` datetime NOT NULL
);


#실습1-3
insert INTO `customer` value ('c101', '김유신', '010-1234-1001', '김해시 봉황동', '2022-01-01');
insert INTO `customer` value ('c102', '김춘추', '010-1234-1002', '경주시 보문동', '2022-01-02');
insert INTO `customer` value ('c103', '장보고', '010-1234-1003', '완도군 청산면', '2022-01-03');
insert INTO `customer` value ('c104', '강감찬', '010-1234-1004', '서울시 마포구', '2022-01-04');
insert INTO `customer` value ('c105', '이성계', NULL, NULL, '2022-01-05');
insert INTO `customer` value ('c106', '정철', '010-1234-1006', '경기도 용인시', '2022-01-06');
insert INTO `customer` value ('c107', '허준', NULL, NULL, '2022-01-07');
insert INTO `customer` value ('c108', '이순신', '010-1234-1008', '서울시 영등포구', '2022-01-08');
insert INTO `customer` value ('c109', '송상현', '010-1234-1009', '부산시 동래구', '2022-01-09');
insert INTO `customer` value ('c110', '정약용', '010-1234-1010', '경기도 광주시', '2022-01-10');

insert INTO `product` value(1, '새우깡', 5000, 1500, '농심');
insert INTO `product` value(2, '초코파이',2500, 2500, '오리온');
insert INTO `product` value(3, '포카칩', 3600, 1700, '오리온');
insert INTO `product` value(4, '양파링', 1250, 1800, '농심');
insert INTO `product` value(5, '죠리퐁', 2200, NULL, '크라운');
insert INTO `product` value(6, '마카렛트', 3500, 3500, '롯데');
insert INTO `product` value(7, '뿌셔뿌셔', 1650, 1200, '오뚜기');

insert into `order` value(NULL, 'c102', 3, 2, '2022-07-01 13:15:10');
insert into `order` value(NULL, 'c101', 4, 1, '2022-07-01 14:16:11');
insert into `order` value(NULL, 'c108', 1, 1, '2022-07-01 17:23:18');
insert into `order` value(NULL, 'c109', 6, 5, '2022-07-02 10:46:36');
insert into `order` value(NULL, 'c102', 2, 1, '2022-07-03 09:15:37');
insert into `order` value(NULL, 'c101', 7, 3, '2022-07-03 12:35:12');
insert into `order` value(NULL, 'c110', 1, 2, '2022-07-03 16:55:36');
insert into `order` value(NULL, 'c104', 2, 4, '2022-07-04 14:23:23');
insert into `order` value(NULL, 'c102', 1, 3, '2022-07-04 21:54:34');
insert into `order` value(NULL, 'c107', 6, 1, '2022-07-05 14:21:03');

#실습1-4
SELECT * FROM customer;

#실습1-5
SELECT `custid`, `name`, `hp` from `customer`;

#실습1-6
select * from `product`;

#실습1-7
select `company` from `product`;

#실습1-8
select distinct `company` from `product`;

#실습1-9
select `prodName`, `price` from `product`;

#실습1-10
select `prodName`, `price` + 500 AS '조정단가' FROM `product`;

#실습1-11
select `prodName`, `stock`, `price` FROM `product` where `company` = '오리온';

#실습1-12
select `orderProduct`, `orderCount`, `orderDate` from `order` where `orderid` = 'c102';

#실습1-13
SELECT `orderProduct`, `orderCount`, `orderDate` from `order` where `orderid` = 'c102' and `ordercount` >= 2;

#실습1-14
select * from `product` where `price` >= 1000 and `price` <= 2000;

#실습1-15
select `custid`, `name`, `hp`, `addr` from `customer` where `name` like '김%';

#실습1-16
select `custid`, `name`, `hp`, `addr` from `customer` where `name` like '__';

#실습1-17
select * from `customer` where `hp` IS NULL;

#실습1-18
select * from `customer` where `addr` IS NOT NULL;

#실습1-19
select * from `customer` order by rdate DESC;

#실습1-20
select * from `order` where `orderCount` >= 3 order by orderCount DESC, orderProduct ASC;

#실습1-21
select AVG(`price`) from `product`;

#실습1-22
select SUM(`stock`) AS `재고량 합계` from `product` where `company` = '농심';

#실습1-23
select count(*) AS '고객수' from `customer`;

#실습1-24
select count(distinct company) AS '제조업체 수' from  `product`;

#실습1-25
select `orderProduct` AS `주문 상품번호`, SUM(`orderCount`) AS `총 주문수량` 
	from `order` 
    group by `orderproduct` 
    order by `orderproduct`;

#실습1-26
select `company` AS `제조업체`, count(*) AS `제품수`, MAX(`price`) AS `최고가` 
	from `product` 
    group by `company` 
    order by `company`;

#실습1-27
select `company` AS `제조업체`, count(*) AS `제품수`, max(`price`) AS `최고가` 
	from `product` 
    group by `company` 
    having `제품수` >= 2;

#실습1-28
select `orderproduct` , `orderId`, sum(`ordercount`) AS `총 주문수량` 
	fROM `order` 
    group by `orderproduct`, `orderid` 
    order by `orderproduct`, `orderid`;

#실습1-29
select a.orderid, b.prodName from `order` as a 
	JOIN `product` as b ON a.`orderproduct` = b.`prodNo` 
    where `orderid` = 'c102';

#실습1-30
SELECT `orderid`, `name`, `prodName`, `orderDate`
	From `order` as a 
	join `customer` as b
    on a.orderId = b. custid
    join `product` as c
    on a.orderproduct = c.prodNo
    #where `orderDate` LIKE '_____07_03%';
    where substr(orderDate, 1, 10) = '2022-07-03'
