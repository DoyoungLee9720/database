#날짜 : 2024/07/05
#이름 : 이도영
#내용 : SQL 연습문제1 실습하기
use shop; #DB 사용시
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
#실습 1-1
CREATE DATABASE `Shop`;
CREATE USER 'shop'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON Shop.* TO 'shop'@'%';
FLUSH PRIVILEGES;

#실습 1-2
Create table `Customer`(
	`custid` varchar(10) PRIMARY KEY,
    `name` varchar(10) not null,
    `hp` char(13) UNIQUE,
    `addr` varchar(100),
    `rdate` Date
);

create table `Product`(
	`prodNo` int PRIMARY KEY,
    `prodName` varchar(10) not null,
    `stock` int default 0,
    `price` int,
    `company` varchar(20) NOT NULL
);

create table `Order`(
	`orderNo` int PRIMARY KEY AUTO_INCREMENT,
    `orderId` varchar(10) not null,
    `orderProduct` int not null,
    `orderCount` int not null default 1,
    `orderDate` DATETIME not null
);

#실습 1-3
INSERT INTO `Customer` values('c101','김유신','010-1234-1001','김해시 봉황동','2022-01-01');
INSERT INTO `Customer` values('c102','김춘추','010-1234-1002','경주시 보문동','2022-01-02');
INSERT INTO `Customer` values('c103','장보고','010-1234-1003','완도군 청산면','2022-01-03');
INSERT INTO `Customer` values('c104','강감찬','010-1234-1004','서울시 마포구','2022-01-04');
INSERT INTO `Customer` (`custId`,`name`,`rdate`) values('c105','이성계','2022-01-05');
INSERT INTO `Customer` values('c106','정철','010-1234-1006','경기도 용인시','2022-01-06');
INSERT INTO `Customer` (`custId`,`name`,`rdate`) values('c107','허준','2022-01-07');
INSERT INTO `Customer` values('c108','이순신','010-1234-1008','서울시 영등포구','2022-01-08');
INSERT INTO `Customer` values('c109','송상현','010-1234-1009','부산시 동래구','2022-01-09');
INSERT INTO `Customer` values('c110','정약용','010-1234-1010','경기도 광주시','2022-01-10');


INSERT INTO `Product` (`prodNo`,`prodName`,`stock`,`price`,`company`) values('1','새우깡',5000,1500,'농심');
INSERT INTO `Product` (`prodNo`,`prodName`,`stock`,`price`,`company`) values('2','초코파이',2500,2500,'오리온');
INSERT INTO `Product` (`prodNo`,`prodName`,`stock`,`price`,`company`) values('3','포카칩',3600,1700,'오리온');
INSERT INTO `Product` (`prodNo`,`prodName`,`stock`,`price`,`company`) values('4','양파링',1250,1800,'농심');
INSERT INTO `Product` (`prodNo`,`prodName`,`stock`,`company`) values('5','죠리퐁',2200,'크라운');
INSERT INTO `Product` (`prodNo`,`prodName`,`stock`,`price`,`company`) values('6','마카렛트',3500,3500,'롯데');
INSERT INTO `Product` (`prodNo`,`prodName`,`stock`,`price`,`company`) values('7','뿌셔뿌셔',1650,1200,'오뚜기');


INSERT INTO `Order` (`orderId`,`orderProduct`,`orderCount`,`orderDate`) values('c102',3,2,'2022-07-01 13:15:10');
INSERT INTO `Order` (`orderId`,`orderProduct`,`orderCount`,`orderDate`) values('c101',4,1,'2022-07-01 14:16:11');
INSERT INTO `Order` (`orderId`,`orderProduct`,`orderCount`,`orderDate`) values('c108',1,1,'2022-07-01 17:23:18');
INSERT INTO `Order` (`orderId`,`orderProduct`,`orderCount`,`orderDate`) values('c109',6,5,'2022-07-02 10:46:36');
INSERT INTO `Order` (`orderId`,`orderProduct`,`orderCount`,`orderDate`) values('c102',2,1,'2022-07-03 09:15:37');
INSERT INTO `Order` (`orderId`,`orderProduct`,`orderCount`,`orderDate`) values('c101',7,3,'2022-07-03 12:35:12');
INSERT INTO `Order` (`orderId`,`orderProduct`,`orderCount`,`orderDate`) values('c110',1,2,'2022-07-03 16:55:36');
INSERT INTO `Order` (`orderId`,`orderProduct`,`orderCount`,`orderDate`) values('c104',2,4,'2022-07-04 14:23:23');
INSERT INTO `Order` (`orderId`,`orderProduct`,`orderCount`,`orderDate`) values('c102',1,3,'2022-07-04 21:54:34');
INSERT INTO `Order` (`orderId`,`orderProduct`,`orderCount`,`orderDate`) values('c107',6,1,'2022-07-05 14:21:03');
select * from `Order`;

#실습 1-4
select * from Customer;

#실습 1-5
select `custid`,`name`,`hp` from Customer;

#실습 1-6
select * from product;

#실습 1-7
select `company` from product;

#실습 1-8
select distinct `company` from product;

#실습 1-9
select `prodName` , `price` from product;

#실습 1-10
select `prodName`, `price` + 500 as 조정단가 from product;

#실습 1-11
select `prodName`, `stock`, `price` from `product` where `company` = '오리온';

#실습 1-12
select `orderProduct`, `orderCount`, `orderDate` from `Order` as a 
	join `Customer` as b on a.orderId = b.custId
	where `orderId` = 'c102';
    
#실습 1-13
select `orderProduct`,`orderCount`,`orderDate` from `Order` as a
	join `Customer` as b on a.orderId = b.custId
    where `orderId` = 'c102' and orderCount >= 2;
    
#실습 1-14
select * from `product` where price >=1000 AND price <=2000;

#실습 1-15
select `custid`, `name`, `hp`,`addr` from `Customer` where name like '김%';

#실습 1-16
select `custid`, `name`, `hp`, `addr` from `Customer` where name like '__';

#실습 1-17
select * from `Customer` where `hp` IS NULL;

#실습 1-18
select * from `Customer` where `addr` is not NULL;

#실습 1-19
select * from `Customer` 
	order by `custId` DESC;
#실습 1-20
select * from `Order` where `orderCount` >= 3 
	order by `orderCount` desc, `orderProduct` asc;
    
#실습 1-21
select AVG(`price`) from `Product`;

#실습 1-22
select sum(stock) as '재고량 합계' from `Product` where `company` = '농심';

#실습 1-23
select count(custId) as '고객수' from `Customer`;

#실습 1-24
select count(distinct company) as '제조업체 수' from `Product`;

#실습 1-25
select `orderProduct` as '주문 상품번호' ,SUM(`orderCount`) as '총 주문수량' From `Order` Group by `orderProduct` order by orderProduct asc;

#실습 1-26
select `company` as '제조업체', COUNT(*) as '제품수', MAX(`price`) as '최고가' from `Product` group by `company` order by `company`;

#실습 1-27
select `company` as '제조업체', COUNT(*) as '제품수',  MAX(`price`) as '최고가' 
	from `Product` group by `company` having COUNT(*) >=2;
	
#실습 1-28
select `orderProduct`, `orderId`, SUM(`orderCount`) as '총 주문수량'
	FROM `Order` 
    GROUP BY 
    `orderId`, `orderProduct`
	ORDER BY 
    `orderId`, `orderProduct` desc;

#실습 1-29
select a.orderId, b.prodName 
	from `Order` AS a
	JOIN `Product` as b
	on a.orderProduct  = b.prodNO
	where a.`orderid` = 'c102';
SELECT *
FROM `Order`
WHERE `orderId` = 'c102';
#실습 1-30
select `orderId`, `name`, `prodName`, `orderDate` from `Order` AS a 
JOIN `Customer` AS b
ON a.orderId = b.custId
JOIN `Product` AS c
ON a.orderProduct = c.prodNO
WHERE a.orderDate like '2022-07-03%';

select `orderId`, `name`, `prodName`, `orderDate` from `Order` AS a 
JOIN `Customer` AS b
ON a.orderId = b.custId
JOIN `Product` AS c
ON a.orderProduct = c.prodNO
WHERE a.orderDate like '2022-07-03%';