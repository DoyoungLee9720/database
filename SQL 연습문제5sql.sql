#날짜 : 2024/07/12
#이름 : 강중원
#내용 : SQL 연습문제 5

# 실습5-1
Create database `bookstore`;
create user 'bookstore'@'%' identified by '1234';
grant all privileges on `bookstore`.* to 'bookstore'@'%';
flush privileges;

use bookstore;

# 실습5-2
Create table customer(
	custid int primary key auto_increment,
    `name` VARCHAR(10) not null,
    address varchar(20) default null,
    phone varchar(13) default null);

create table book(
	bookid int primary key,
    bookname varchar(20) not null,
    publisher varchar(20) not null,
    price int default null);
    
create table `order`(
	orderId int primary key auto_increment,
    custid int not null,
    bookid int not null,
    saleprice int not null,
    orderdate date not null);
    

# 실습5-3
insert into customer value (null, '박지성', '영국 맨체스타', '000-5000-0001'),
						   (null, '김연아', '대한민국 서울', '000-6000-0001'),
                           (null, '장미란', '대한민국 강원도', '000-7000-0001'),
                           (null, '추신수', '미국 클리블랜드', '000-8000-0001'),
                           (null, '박세리', '대한민국 대전', null);

insert into book value (1, '축구의 역사', '굿스포츠', 7000),
						  (2, '축구아는 여자', '나무수', 13000),
                          (3, '축구의 이해', '대한미디어', 22000),
                          (4, '골프 바이블', '대한미디어', 35000),
                          (5, '피겨 교본', '굿스포츠', 8000),
                          (6, '역도 단계별기술', '굿스포츠', 6000),
                          (7, '야구의 추억', '이상미디어', 20000),
                          (8, '야구를 부탁해', '이상미디어', 13000),
                          (9, '올림픽 이야기', '삼성당', 7500),
                          (10, 'Olympic Champion', 'Pearson', 13000);
                          
insert into `Orders` value (null, 1, 1, 6000, '2014-07-01'),
						  (null, 1, 3, 21000, '2014-07-03'),
                          (null, 2, 5, 8000, '2014-07-03'),
                          (null, 3, 6, 6000, '2014-07-04'),
                          (null, 4, 7, 20000, '2014-07-05'),
                          (null, 1, 2, 12000, '2014-07-07'),
                          (null, 4, 8, 13000, '2014-07-07'),
                          (null, 3, 10, 12000, '2014-07-08'),
                          (null, 2, 10, 7000, '2014-07-09'),
                          (null, 3, 8, 13000, '2014-07-10');
# 실습5-4
select custid, name, address from customer;

# 실습5-5
select bookname, price from book;

# 실습5-6
select price, bookname from book;

# 실습5-7
select * from book;

# 실습5-8
select publisher from book;

# 실습5-9
select distinct publisher from book; 

# 실습5-10
select * from book where price >= 20000;

# 실습5-11
select * from book where price <= 20000;

# 실습5-12
select * from book where price between 10000 and 20000;

# 실습5-13
select bookid, bookname, price from book where price between 15000 and 30000;

# 실습5-14
select * from book where bookid in (2,3,5);

# 실습5-15
select * from book where bookid % 2 = 0;

# 실습5-16
select * from Customer where name like '박%';

# 실습5-17
select * from customer where address like '%대한민국%';

# 실습5-18
select * from customer where phone is not null;

# 실습5-19
select * from book where publisher in ('굿스포츠', '대한미디어');

# 실습5-20
select publisher from book where bookname like '축구의 역사';

# 실습5-21
select publisher from book where bookname like '축구%';

# 실습5-22
select * from book where bookname like '_구%';

# 실습5-23
select * from book where price >= 20000 and bookname like '%축구%';

# 실습5-24
select * from book order by bookname;

# 실습5-25
select * from book order by price, bookname;

# 실습5-26
select * from book order by price desc, publisher asc;

# 실습5-27
select * from book order by price desc limit 3;

# 실습5-28
select * from book order by price asc limit 3;

# 실습5-29
select sum(saleprice) as `총판매액` from `orders`;

# 실습5-30
select sum(saleprice) as 총판매액, avg(saleprice) as 평균값, min(saleprice) as 최저가, max(saleprice) as 최고가 from orders;

# 실습5-31
select count(*) as 판매건수 from orders;

# 실습5-32

select bookid, replace (bookname, '야구', '농구') as bookname ,publisher, price from book;

# 실습5-33
select custid, count(*) as 수량 from orders where saleprice >= 8000 group by custid having `수량` >= 2;

# 실습5-34
select * from customer, orders where customer.custid = orders.custid;

# 실습5-35
select * from customer, orders where customer.custid = orders.custid order by customer.custid;

# 실습5-36
select name, saleprice from customer, orders where customer.custid = orders.custid order by customer.custid;

# 실습5-37
select name, sum(saleprice) from customer, orders where customer.custid = orders.custid  group by name order by name;

# 실습5-38
select name, bookname from customer, orders, book where customer.custid = orders.custid and orders.bookid = book.bookid;

# 실습5-39
select name, bookname from customer, orders, book where customer.custid = orders.custid and orders.bookid = book.bookid and saleprice = 20000;

# 실습5-40
select name, saleprice from customer left join orders on customer.custid = orders.custid;

# 실습5-41
select sum(saleprice) as `총매출` from customer, orders where customer.custid = orders.custid and name like '김연아';

# 실습5-42
select bookname from book where price = (select max(price) from book); 

# 실습5-43
select name from customer left join orders on customer.custid = orders.custid where orderid is null;


# 실습5-44
insert into book value (11,'스포츠 의학', '한솔의학서적', null);
select * from book;

# 실습5-45
update customer set address = '대한민국 부산' where custid =5;
select * from customer;

# 실습5-46
delete from customer where custid = 5;
select * from customer;
