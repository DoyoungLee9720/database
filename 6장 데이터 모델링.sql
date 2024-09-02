# 날짜 : 2024/07/15
# 이름 : 강중원
# 내용 : 데이터 모델링 실습하기

#실습 6-1
#실습 6-2
insert into customer value ("c101", '김유신', '010-1234-1001', '경남 김해시', '2023-01-01'),
						   ("c102", '김춘추', '010-1234-1002', '경남 경주시', '2023-01-02'),
                           ("c103", '장보고', '010-1234-1003', '전남 완도군', '2023-01-03'),
                           ("c104", '강감찬', '010-1234-1004', '서울시 관악구', '2023-01-04'),
                           ("c105", '이순신', '010-1234-1005', '부산시 금정구', '2023-01-05');
                           
insert into product value (1,'새우깡', 5000, 1500, '농심'),
						  (2,'초코파이', 2500, 2500, '오리온'),
                          (3,'포카칩', 3600, 1700, '오리온'),
                          (4,'양파링', 1250, 1800, '농심'),
                          (5,'죠리퐁', 2200, null, '크라운');
                          
                          
insert into `order` value (1, 'c102', 3, 2, '2024-01-01 13:15:10'),
						  (2, 'c101', 4, 1, '2024-01-01 13:15:12'),
                          (3, 'c102', 1, 1, '2024-01-01 13:15:14'),
                          (5, 'c105', 2, 1, '2024-01-01 13:15:18');
                          #(4, 'c103', 6, 5, '2024-01-01 13:15:16'),
                          
#실습 6-3
select * from customer;

select `orderId`,`prodNo`, `prodName`, `price`, `orderCount`, `orderDate` from customer, product, `order` where customer.custId = `order`.orderId and `order`.orderProduct = `product`.prodNo;

select sum(price*orderCount) as `총 주문 금액` from Product, `order` where `order`.orderProduct = `product`.prodNo;

#실습 6-4
use bankerd;
#실습 6-5
insert into bank_customer value ('730432-1000001', '김유신', 1, '010-1234-1001', '경남 김해시'),
								('730432-1000002', '김춘추', 1, '010-1234-1002', '경남 경주시'),
                                ('730432-1000003', '장보고', 1, '010-1234-1003', '전남 완도군'),
                                ('102-12-51094', '김유신', 2, '051-500-1004', '부산시 부산진구'),
                                ('730432-1000005', '이순신', 1, '010-1234-1005', '서울 종로구');
                                
insert into bank_account value ('101-11-1001', 'S1', '자유저축예금', '730432-1000001', 1550000, '2011-04-11'),
							   ('101-11-1002', 'S1', '자유저축예금', '730432-1000005', 260000, '2011-05-12'),
                               ('101-11-1003', 'S1', '자유저축예금', '730432-1000003', 75000, '2011-06-13'),
                               ('101-12-1001', 'S2', '기업저축예금', '102-12-51094', 15000000, '2011-07-14'),
                               ('101-13-1001', 'S3', '정기저축예금', '730432-1000002', 1200000, '2011-08-15');
                                                         
                                                         

insert into bank_transaction value (null,'101-11-1001', 1, 50000, '2023-01-01 13:15:10'),
								   (null,'101-12-1001', 2, 1000000, '2023-01-02 13:15:12'),
                                   (null,'101-11-1002', 3, 260000, '2023-01-03 13:15:14'),
                                   (null,'101-11-1002', 2, 100000, '2023-01-04 13:15:16'),
                                   (null,'101-11-1003', 3, 75000, '2023-01-05 13:15:18'),
                                   (null,'101-11-1001', 1, 150000, '2023-01-06 13:15:28');
                                   
                                   
# 실습6-6
select * from bank_account;

select `c_name`, `t_dist`, `t_amount`, `t_datetime` from bank_account, bank_customer, bank_transaction where bank_account.a_c_no = bank_customer.c_no and bank_account.a_no = bank_transaction.t_a_no and c_name like '이순신';

select c_no, c_name, a_no, a_balance, a_open_date from bank_account, bank_customer where bank_account.a_c_no = bank_customer.c_no and a_balance = (select max(a_balance) from bank_account);

# 실습6-7
drop database collegeERD;
use collegeERD;
# 실습6-8
insert into student value ('20201011', '김유신', '010-1234-1001', 3, '경남 김해시'),
						  ('20201022', '김춘추', '010-1234-1002', 3, '경남 경주시'),
                          ('20210213', '장보고', '010-1234-1003', 2, '전남 완도군'),
                          ('20210324', '강감찬', '010-1234-1004', 2, '서울 관악구'),
                          ('20220415', '이순신', '010-1234-1005', 1, '서울 종로구');
                          
insert into Lecture value (101, '컴퓨터과학 개론', 2, 40, '본301'),
						  (102, '프로그래밍 언어', 3, 52, '본302'),
                          (103, '데이터베이스', 3, 56, '본303'),
                          (104, '자료구조', 3, 60, '본304'),
                          (105, '운영체제', 3, 52, '본305');
                          
insert into Register value ("20220415", 101, 60, 30, null, null),
						   ("20210324", 103, 54, 36, null, null),
                           ("20201011", 105, 52, 28, null, null),
                           ("20220415", 102, 38, 40, null, null),
                           ("20210324", 104, 56, 32, null, null),
                           ("20210213", 103, 48, 40, null, null);
                           
# 실습 6-9
select `stdno`, `stdname`,`stdhp`,`stdyear` from student where not exists (select regStdNo from register where regStdNo = stdNo);

update `register` set `regTotalscore` = `regmidscore` + `regFinalScore`, 
							`regGrade` = if(`regtotalscore` >= 90, 'A',
										 if(`regtotalscore` >= 80, 'B',
                                         if(`regtotalscore` >= 70, 'C',
                                         if(`regtotalscore` >= 60, 'D', 'F'))));
select * from register;

select `stdno`, `stdname`, `stdyear`, `lecname`, `regmidscore`, `regfinalscore`, `regtotalscore`,`reggrade`
from student, lecture, register
where student.stdNo = register.regstdno and lecture.lecno = register.reglecno and stdyear = 2;