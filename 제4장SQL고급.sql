#날자 : 2024/07/03
#이름 : 이도영
#내용 : 4장 SQL고급
use StudyDB; #DB 사용시
set sql_safe_updates=0; # 삭제 업데이트에 문제가 생길 경우
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
#실습 4-1
#직원테이블(Member)정보
CREATE TABLE `Member` (
    `uid` VARCHAR(10) PRIMARY KEY,
    `name` VARCHAR(10) NOT NULL,
    `hp` CHAR(13) UNIQUE NOT NULL,
    `pos` VARCHAR(10) NOT NULL DEFAULT '사원',
    `dep` INT,
    `rdate` DATETIME NOT NULL
);

#부서 테이블(Department)정보
create table `Department`(
		`depNo` int NOT NULL,
        `name` VARCHAR(10) NOT NULL,
        `tel` VARCHAR(12) NOT NULL
);

#매출 테이블(Sales)정보
create table `Sales`(
	`seq` int PRIMARY KEY AUTO_INCREMENT,
    `uid` VARCHAR(10) NOT NULL,
    `year` year NOT NULL,
    `month` int NOT NULL,
    `sale` int
);

#실습 4-2
#직원테이블
insert into Member values('a101','박혁거세','010-1234-1001','부장',101,now());
insert into Member values('a102','김유신','010-1234-1002','차장',101,now());
insert into Member values('a103','김춘추','010-1234-1003','사원',101,now());
insert into Member values('a104','장보고','010-1234-1004','대리',102,now());
insert into Member values('a105','강감찬','010-1234-1005','과장',102,now());
insert into Member values('a106','이성계','010-1234-1006','차장',103,now());
insert into Member values('a107','정철','010-1234-1007','차장',103,now());
insert into Member values('a108','이순신','010-1234-1008','부장',104,now());
insert into Member values('a109','허균','010-1234-1009','부장',104,now());
insert into Member values('a110','정약욕','010-1234-1010','사원',105,now());
insert into Member values('a111','박지원','010-1234-1011','사원',105,now());
select * from member;

#부서 테이블
insert into Department values(101,'영업1부','051-512-1001');
insert into Department values(102,'영업2부','051-512-1002');
insert into Department values(103,'영업3부','051-512-1003');
insert into Department values(104,'영업4부','051-512-1004');
insert into Department values(105,'영업5부','051-512-1005');
insert into Department values(106,'영업지원부','051-512-1006');
insert into Department values(107,'인사부','051-512-1007');
select * from Department;

#매출 테이블
INSERT INTO Sales (uid, year, month, sale) VALUES ('a101', 2018, 1, 98100);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a102', 2018, 1, 136000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a103', 2018, 1, 80100);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a104', 2018, 1, 78000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a105', 2018, 1, 93000);

INSERT INTO Sales (uid, year, month, sale) VALUES ('a101', 2018, 2, 23500);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a102', 2018, 2, 126000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a103', 2018, 2, 18500);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a105', 2018, 2, 19000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a106', 2018, 2, 53000);

INSERT INTO Sales (uid, year, month, sale) VALUES ('a101', 2019, 1, 24000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a102', 2019, 1, 109000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a103', 2019, 1, 101000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a104', 2019, 1, 53500);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a107', 2019, 1, 24000);

INSERT INTO Sales (uid, year, month, sale) VALUES ('a102', 2019, 2, 160000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a103', 2019, 2, 101000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a104', 2019, 2, 43000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a105', 2019, 2, 24000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a106', 2019, 2, 109000);

INSERT INTO Sales (uid, year, month, sale) VALUES ('a102', 2020, 1, 201000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a104', 2020, 1, 63000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a105', 2020, 1, 74000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a106', 2020, 1, 122000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a107', 2020, 1, 111000);

INSERT INTO Sales (uid, year, month, sale) VALUES ('a102', 2020, 2, 120000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a103', 2020, 2, 93000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a104', 2020, 2, 84000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a105', 2020, 2, 180000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a108', 2020, 2, 76000);
select * from Sales;
Drop table Sales;
#실습 4-3
select * from Member where name ='김유신';
select * from Member where pos ='차장' and dep=101;
select * from Member where pos ='차장' or dep=101;
select * from member  where name != '김춘추';
select * from member where name <> '김춘추';
select * from member where pos ='사원' or pos='대리';
select * from member where pos IN('사원','대리');
select * from member where dep IN(101,102,103);
select * from member where name LIKE '%신';
select * from member where name LIKE '김%';
select * from member where name LIKE '김__';
select * from member where name LIKE '_성_';
select * from member where name LIKE '정_';
select * from sales where sale > 50000;
select * from sales where sale >= 50000 and sale < 100000 and month = 1;
select * from sales where sale between 50000 and 100000;
select * from sales where sale not between 50000 and 100000;
select * from sales where year IN(2020);
select * from sales where month IN(1,2);

#실습 4-4 오름/내림차순
select * from sales order by sale;
select * from sales order by sale asc;
select * from sales order by sale desc;
select * from member order by name;
select * from member order by name asc;
select * from member order by name desc;
select * from sales where sale > 50000 order by sale desc;
select * from sales where sale > 50000 order by year,month,sale desc;

#실습 4-5 투프 개수를 제한
select * from sales LIMIT 3;
select * from sales LIMIT 0,3;
select * from sales LIMIT 1,2;
select * from sales LIMIT 5,3;
select * from sales order by sale desc LIMIT 3,5;
select * from sales where 'sale' < 50000 order by sale desc LIMIT 3;
select * from sales
where sale > 50000
order by year desc, month, sale desc
LIMIT 5;

#실습 4-6 칼럼명을 별칭으로 사용하기
select sum(sale) as '합계' from sales;
select avg(sale) as '평균' from sales;
select MAX(sale) as '최대값' from sales;
select MIN(sale) as '최소값' from sales;
select CEILING(1.2);
select ceiling(1.8);
select floor(1.2);
select floor(1.8);
select RAND();
select Ceiling(rand()* 10);
select count(sale) AS '갯수' from sales;
select count(*) AS '갯수' from sales;

select left('HelloWorld',5);
select right('HelloWorld',5);
select substring('HelloWorld',5,6);
select concat('Hello','World');
select concat(uid, name, hp) from member where uid='a108';
select curdate();
select curtime();
select now();
insert into member values('a112','유관순','010-1234-1012','대리',107,now());

#실습 4-7
select SUM(sale) AS '2018년 1월 총매출' from sales where year=2018 and month=1;

#실습 4-8
select
	Sum(sale) AS '2019년 2월 5만원이상 총매출',
    avg(sale) AS '2019년 2월 5만원이상 평균'
from sales 
where year=2019 and month=2;

#실습 4-9
select
	Sum(sale) AS '2020년 전체 매출',
    MIN(sale) AS '2020년 최저 매출',
    MAX(sale) AS '2020년 최고 매출'
from sales
where year=2020;
    
#실습 4-10 그룹별로 조회
SELECT * FROM `Sales` GROUP BY `uid`;
SELECT * FROM `Sales` GROUP BY `year`;
SELECT * FROM `Sales` GROUP BY `uid`, `year`;

select uid, count(*) as '건수' from sales group by uid;
select uid, sum(sale) as '합계' from sales group by uid;
select uid, avg(sale) as '평균' from sales group by uid;

select uid,year,sum(sale) AS '합계'
from sales
group by uid, year;

select uid,year,sum(sale) AS '합계'
from sales
group by uid, year
order by year asc, '합계' desc;

select uid,year,sum(sale) AS '합계'
from sales
where sale >= 50000
group by uid, year
order by '합계' desc;


#실습 4-11 그룹화에 검색조건 설정
select uid , sum(sale) as 합계 from sales 
group by uid
having 합계 >= 200000;

select uid, year, sum(sale) as 합계
from sales
where sale >= 10000
group by uid, year
having 합계 >= 200000
order by 합계 desc;

#실습 4-12 실습 테이블 합치기
Create Table `Sales2` LIKE `Sales`;
INSERT INTO `Sales2` SELECT * FROM `Sales`;
UPDATE `Sales2` SET `year` = `year` + 3;

select * from sales union select * from sales2;
select * from sales where sale >= 100000
UNION
select * from sales2 where sale >= 100000;

select uid, year, sale from sales
union
select uid, year, sale from sales2;

select uid, year, sum(sale) AS 합계
from sales
group by uid, year
union
select uid, year, sum(sale) as 합계
from sales2
group by uid, year
order by year ASC, 합계 desc;


#실습 4-13 테이블 결합
select * from sales inner join member on sales.uid = member.uid;
select * from member inner join department on member.dep = department.depno;

select * from sales as a join member as b on a.uid = b.uid;
select * from member as a join department as b on a.dep = b.depno;

select * from sales as a, member as b where a.uid = b.uid;
select * from member as a, department as b where a.dep = b.depno;

select a.seq, a.uid, sale, name, pos from sales as a join member as b on a.uid = b.uid;
select a.seq, a.uid, sale, name, pos from sales as a join member as b using(uid);

select a.seq,a.uid,sale,name,pos from sales as a join member as b on a.uid = b.uid where sale >=100000;

select a.seq, a.uid, b.name, b.pos, year, SUM(sale) as 합계 from sales as a 
	join member as b on a.uid = b.uid
    group by a.uid, a.year having 합계 >= 100000
    order by a.year asc, 합계 desc;


select * from sales as a
	join member as b on a.uid=b.uid
    join department as c on b.dep = c.depno;
    
select a.seq, a.uid, a.sale, b.name, b.pos, c.name from sales as a
	join member as b on a.uid = b.uid
    join department as c on b.dep = c.depno;
    
select a.seq, a.uid, a.sale, b.name, b.pos, c.name from sales as a
	join member as b on a.uid =b.uid
    join department as c on b.dep = c.depNO
    where sale > 100000
    order by sale desc;
    
    
#실습 4-14 외부조인(LEFT, RIGHT JOIN)

select * from sales as a left join member as b on a.uid = b.uid;
select * from sales as a right join member as b on a.uid = b.uid;
select a.seq, a.uid, sale, name, pos from sales as a
	left join member as b using(uid);
    
select a.seq, a.uid, sale, name, pos from sales as a
	right join member as b using(uid);
    

#실습 4-15 모든 직원의 아이디,이름,직급,부서명을 조회하시오
select 
	a.`uid`as `아이디`,
    a.`name` as `이름`,
    a.`pos`as  `직급`,
    b.`name` as `부서명` 
from Member as a 
join `department` as b 
on a.`dep` = b.`depno`;

#실습 4-16 김유신 직원의 2019년도 매출의 합을 조회하시오.
select all
	a.`uid`,
	`name`,
	SUM(a.sale) as `2019년도 매출합`
from sales as a 
join member as b
on a.uid = b.uid
where 
	a.year = 2019 and 
    b.name = "김유신";
    
#실습 4-17 2019년 5만원이상의 매출에 대해 직원별 매출의 합이 10만원 이상인 (직원이름,부서명,직급,년도,매출 합을) 조회하시오
#단 매출 합이 큰 순서 부터 정렬
select 	M.`name` as `직원이름`,
		D.`name` as `부서명`,
        M.`pos` as `직급`,
        S.`year` as `년도`,
        SUM(S.`sale`) as `총매출`
from `member` as M
join `sales` as S on M.uid = S.uid
join `department` as D ON M.dep = D.depNo
where S.year = 2019 ANd S.sale >=50000 
group by M.name, D.name, M.pos, S.year
having `총매출` >= 100000
Order by 총매출 DESC;

