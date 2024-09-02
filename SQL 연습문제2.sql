#날짜 : 2024/07/09
#이름 : 강중원
#내용 : SQL 연습문제 2

SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
#실습 2-1
create database `Bank`;
create user 'bank'@'%' identified by '1234';
grant all privileges on `bank`.* to 'bank'@'%';
flush privileges;

drop table `bank_customer`;
drop table `bank_account`;
drop table `bank_transaction`;
#실습 2-2
Create table `bank_customer`(
	`c_no` VARCHAR(14) primary key,
    `c_name` VARCHAR(20) NOT NULL,
    `c_dist` INT NOT NULL,
    `c_phone` VARCHAR(20) NOT NULL,
    `c_addr` VARCHAR(100) default NULL
);
Create table `bank_account`(
	`a_no` VARCHAR(11) primary key,
    `a_item_dist` VARCHAR(2) NOT NULL,
    `a_item_name` VARCHAR(20) NOT NULL,
    `a_c_no` VARCHAR(14) NOT NULL,
    `a_balance` INT not NULL default 0,
    `a_open_date` date not null
);
Create table `bank_transaction`(
	`t_no` int primary key auto_increment,
    `t_a_no` VARCHAR(11) NOT NULL,
    `t_dist` INT NOT NULL,
    `t_amount` INT NOT NULL default 0,
    `t_datetime` datetime NOT NULL
);
use `bank`;
#실습 2-3
#drop table `bank_customer`;
insert into `bank_customer` value ('102-22-51094', '부산의원', 2, '051-518-1010', '부산시 남구'),
									('220-82-52237', '(주)한국전산', 2, '02-134-1045', '서울시 강서구'),
                                    ('361-22-42687', '(주)정보산업', 2, '031-563-1253', '경기도 광명시'),
                                    ('730423-1000001', '김유신', 1, '010-1234-1001', '경기도 수원시'),
                                    ('750210-1000002', '김춘추', 1, '010-1234-1002', '경기도 광주시'),
                                    ('830513-2000003', '선덕여왕', 1, '010-1234-1003', '서울시 마포구'),
                                    ('870830-1000004', '강감찬', 1, '010-1234-1004', '서울시 영등포구'),
                                    ('910912-2000005', '신사임당', 1, '010-1234-1005', '강원도 강릉시'),
                                    ('941127-1000006', '이순신', 1, '010-1234-1006', '부산시 영도구');
insert into `bank_account` value ('101-11-1001', 'S1', '자유저축예금', '730423-1000001', 420000, '2005-07-21'),
									('101-11-1003', 'S1', '자유저축예금', '870830-1000004', 53000, '2007-02-17'),
                                    ('101-11-2001', 'S1', '자유저축예금', '220-82-52237', 23000000, '2003-04-14'),
                                    ('101-11-2002', 'S1', '자유저축예금', '361-22-42687', 4201000, '2008-12-30'),
                                    ('101-11-2003', 'S1', '자유저축예금', '102-22-51094', 8325010, '2010-06-07'),
                                    ('101-12-1002', 'S2', '정기적립예금', '830513-2000003', 1020000, '2011-05-13'),
                                    ('101-13-1005', 'S3', '주택청약예금', '941127-1000006', 720800, '2012-10-15'),
                                    ('101-21-1004', 'L1', '고객신용대출', '910912-1000005', 1200500, '2009-08-25'),
                                    ('101-22-1006', 'L2', '예금담보대출', '730423-1000001', 25000, '2013-12-11'),
                                    ('101-23-1007', 'L3', '주택담보대출', '750210-1000002', 2700000, '2020-09-23');
insert into `bank_transaction` value (null, '101-11-1001', 1, 50000, '2022-08-21 04:26:52'),
										(null, '101-11-1003', 2, 120000, '2022-08-21 04:26:52'),
                                        (null, '101-11-2001', 2, 300000, '2022-08-21 04:26:52'),
                                        (null, '101-12-1002', 1, 1000000, '2022-08-21 04:26:52'),
                                        (null, '101-11-1001', 3, 0, '2022-08-21 04:26:52'),
                                        (null, '101-13-1005', 1, 200000, '2022-08-21 04:26:52'),
                                        (null, '101-11-1001', 1, 450000, '2022-08-21 04:26:52'),
                                        (null, '101-11-1002', 2, 32000, '2022-08-21 04:26:52'),
                                        (null, '101-11-2003', 3, 0, '2022-08-21 04:26:52'),
                                        (null, '101-11-1003', 1, 75000, '2022-08-21 04:26:52');
#실습 2-4
select * from `bank_account`;

#실습 2-5
select * from `bank_customer`;

#실습 2-6
select * from `bank_transaction`;

#실습 2-7
select `c_name`, `c_no` from `bank_customer`;

#실습 2-8
select `a_item_dist`, `a_item_name` from `bank_account`;

#실습 2-9
select distinct `a_item_dist`, `a_item_name` from `bank_account`;

#실습 2-10
select * from `bank_account` where `a_item_name` like '자유저축예금' and `a_balance` >= 1000000;

#실습 2-11
select * from `bank_customer` where `c_addr` like '경기도%';

#실습 2-12
select * from `bank_customer` where `c_dist` = 2;

#실습 2-13
select * from `bank_transaction` where `t_dist` = 1;
#실습 2-14
select * from `bank_transaction` where `t_dist` = 2 order by `t_amount`;
#실습 2-15
select
	sum(`t_amount`) as `입금총합`,
    avg(`t_amount`) as `입금평균`
from `bank_transaction`
where `t_dist` = 1;

#실습 2-16
select
	max(`t_amount`) as `큰 금액`,
    min(`t_amount`) as `작은 금앢`
from `bank_transaction`
where `t_dist` = 2;

#실습 2-17
select * from `bank_account` where `a_item_name` like '자유저축예금' order by `a_balance` desc;

#실습 2-18
select * from `bank_account` where `a_item_name` like '자유저축예금' order by `a_balance` desc limit 1;
#실습 2-19
select * from `bank_transaction` where `t_dist` <> 3 order by `t_dist`, `t_amount` DESC;
#실습 2-20
select count(case when `t_dist` = 1 then 1 end) as `입금 건수` ,count(case when `t_dist` = 2 then 1 end) as `출금 건수`,count(case when `t_dist` = 3 then 1 end) `조회 건수` from `bank_transaction`;
#실습 2-21
select
	`t_dist`,
    case
		when `t_dist` = 1 then '입금' 
        when `t_dist` = 2 then '출금' 
        when `t_dist` = 3 then '조회' 
	end AS `type`,
    `t_a_no`,
    `t_amount`
from `bank_transaction`;
#실습 2-22
select t_dist, count(`t_no`) from `bank_transaction` group by `t_dist`;

#실습 2-23
select `t_a_no`, `t_dist`, sum(`t_amount`)
from `bank_transaction`
where `t_dist` = 1
group by t_a_no;

#실습 2-24
select
	`t_a_no`,
    `t_dist`,
    sum(`t_amount`) as `합계`
from `bank_transaction`
where `t_dist` = 1
group by `t_a_no` having `합계` >= 100000
order by `합계` desc;

#실습 2-25
select * from `bank_account` AS a
join `bank_customer` as b
on a.a_c_no = b.c_no;

#실습 2-26
select
	a.a_no as `계좌번호`,
    a.a_item_name as `계좌이름`,
    b.c_no as `주민번호(사업자번호)`,
    b.c_name as `고객명`,
    a.a_balance as `현재잔액`
from `bank_account` as a
join `bank_customer` as b
on a.a_c_no = b.c_no;

#실습 2-27
select * from `bank_transaction` as a
join `bank_account` as b
on a.t_a_no = b.a_no;

#실습 2-28
select
	`t_no` AS `거래번호`,
    `t_a_no` as `계좌번호`,
    `a_c_no` as `고객번호(주민번호)`,
    `t_dist` as `거래구분`,
    `t_amount` as `거래금액`,
    `t_datetime` as `거래일자`
from `bank_account` as a
join `bank_transaction` as b
on b.t_a_no = a.a_no;

#실습 2-29
select
	`t_no`,
    `a_no`,
    `c_no`,
    `t_dist`,
    `a_item_name`,
    `c_name`,
    `t_amount`,
    `t_datetime`
from `bank_transaction` as a
join `bank_account` as b on a.t_a_no = b.a_no
join `bank_customer` as c on b.a_c_no = c.c_no
where `t_dist` = 1
order by `t_amount` desc;

#실습 2-30
select
	`t_no`,
    `a_no`,
    `c_no`,
    `t_dist`,
    `a_item_name`,
    `c_name`,count(`t_no`) as `거래건수`
from `bank_transaction` as a
join `bank_account` as b on a.t_a_no = b.a_no
join `bank_customer` as c on b.a_c_no = c.c_no
where `t_dist` in (1,2) and `c_dist` = 1
group by `c_no`
order by `t_dist`, `거래건수` desc;
