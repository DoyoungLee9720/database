#날짜 : 2024/07/10
#이름 : 강중원
#내용 : SQL 연습문제 3

#실습 3-1
Create database `College`;
Create user 'college'@'%' identified by '1234';
grant all privileges on College.* to 'college'@'%';
flush privileges;

use college;

#실습 3-2
Create table `student`(
	`stdNo` CHAR(8) primary key,
    `stdName` VARCHAR(20) not null,
    `stdHp` CHAR(13) not null unique,
    `stdYear` INT not null,
    `stdAddress` VARCHAR(100) default null
);

Create table `lecture`(
	`lecNo` int primary key,
    `lecName` VARCHAR(20) not null,
    `lecCredit` int not null,
    `lecTime` INT not null,
    `lecClass` VARCHAR(10) default null
);

create table `register`(
	`regStdNo` char(8) not null,
    `regLecNo` int not null,
    `regMidScore` int default null,
    `regFinalScore` int default null,
    `regTotalScore` int default null,
    `regGrade` char(1) default null
);

#실습 3-3
Insert into `student` value ('20201016', '김유신', '010-1234-1001', 3,null),
							('20201126', '김춘추', '010-1234-1002', 3,'경상남도 경주시'),
							('20210216', '장보고', '010-1234-1003', 2,'전라남도 완도시'),
							('20210326', '강감찬', '010-1234-1004', 2,'서울시 영등포구'),
							('20220416', '이순신', '010-1234-1005', 1,'부산시 부산진구'),
							('20220521', '송상현', '010-1234-1006', 1,'부산시 동래구');

insert into `lecture` value (159, '인지행동심리학', 3, 40, '본304'),
							(167, '운영체제론', 3, 25, '본B05'),
                            (234, '중급 영문법', 3, 20, '본201'),
                            (239, '세법개론', 3, 40, '본204'),
                            (248, '빅데이터 개론', 3, 20, '본B01'),
                            (253, '컴퓨터사고와 코딩', 2, 10, '본B02'),
                            (349, '사회복지 마케팅', 2, 50, '본301');

Insert into `register` (`regStdNo`,`reglecNo`) value ('20201126', 234),
													 ('20201016', 248),
                                                     ('20201016', 253),
                                                     ('20201126', 239),
                                                     ('20210216', 349),
                                                     ('20210326', 349),
                                                     ('20201016', 167),
                                                     ('20220416', 349);
#실습 3-4
select * from lecture;

#실습 3-5
select * from student;

#실습 3-6
select * from register;

#실습 3-7
select * from `student` where stdyear = 3;

#실습 3-8
select * from `lecture` where leccredit = 2;

#실습 3-9
UPDATE `Register` SET `regMidScore` = 36, `regFinalScore`= 42 WHERE
`regStdNo`='20201126' AND `regLecNo`=234;
UPDATE `Register` SET `regMidScore` = 24, `regFinalScore`= 62 WHERE
`regStdNo`='20201016' AND `regLecNo`=248;
UPDATE `Register` SET `regMidScore` = 28, `regFinalScore`= 40 WHERE
`regStdNo`='20201016' AND `regLecNo`=253;
UPDATE `Register` SET `regMidScore` = 37, `regFinalScore`= 57 WHERE
`regStdNo`='20201126' AND `regLecNo`=239;
UPDATE `Register` SET `regMidScore` = 28, `regFinalScore`= 68 WHERE
`regStdNo`='20210216' AND `regLecNo`=349;
UPDATE `Register` SET `regMidScore` = 16, `regFinalScore`= 65 WHERE
`regStdNo`='20210326' AND `regLecNo`=349;
UPDATE `Register` SET `regMidScore` = 18, `regFinalScore`= 38 WHERE
`regStdNo`='20201016' AND `regLecNo`=167;
UPDATE `Register` SET `regMidScore` = 25, `regFinalScore`= 58 WHERE
`regStdNo`='20220416' AND `regLecNo`=349;
SELECT * FROM `Register`;

#실습 3-10
update `register` set `regTotalscore` = `regmidscore` + `regFinalScore`, 
							`regGrade` = if(`regtotalscore` >= 90, 'A',
										 if(`regtotalscore` >= 80, 'B',
                                         if(`regtotalscore` >= 70, 'C',
                                         if(`regtotalscore` >= 60, 'D', 'F'))));
SELECT * FROM `Register`;

#실습 3-11
SELECT * FROM `Register` ORDER BY `regTotalScore` DESC;

#실습 3-12
Select * from `register` where reglecno = 349 order by regtotalscore desc;

#실습 3-13
select * from `lecture` where lectime >= 30;

#실습 3-14
select lecname, lecclass from lecture;

#실습 3-15
select stdno, stdname from student;

#실습 3-16
select * from `student` where stdaddress is null;

#실습 3-17
select * from `student` where stdaddress like '부산시%';

#실습 3-18
select * from `student` as a left JOIN `register` as b on a.stdNo = b.regstdno;

#실습 3-19
select 
	stdno, stdname, reglecno, regmidscore, regfinalscore, regtotalscore, reggrade
FROM `Student` AS a, `Register` AS b WHERE a.stdNo = b.regStdNo;
#실습 3-20
select `stdName`, `stdNo`, `regLecNo`
from `student` as a
join register as b
where a.stdno = b.regstdno and reglecno = 349;

#실습 3-21
select `stdno`, `stdname`, count(`regtotalscore`) as `수강신청 건수`, sum(`regtotalscore`) as `종합점수`, sum(`regtotalscore`) / count(stdno) as `평균`
from `student` as a
join `register` as b
on a.stdNo = b.regStdNo
group by stdno, stdname;

#실습 3-22
select * from `register` as a
join lecture as b
on a.reglecno = b.lecno;

#실습 3-23
select
	`regstdno`,
    `reglecno`,
    `lecname`,
    `regMidscore`,
    `regfinalscore`,
    `regtotalscore`,
    `reggrade`
from `register`, `lecture` where reglecno = lecno;

#실습 3-24
select
	count(*) as `사회복지 마케팅 수강 신청건수`,
    avg(`regtotalscore`) as `사회복지 마케팅 평균`
from `register` as a join `lecture` as b on a.reglecno = b.lecno
where lecname like '사회복지 마케팅';

#실습 3-25
select
	`regstdno`,
    `lecname`
from `register` as a join `lecture` as b on a.reglecno = b.lecno
where regGrade like 'A';

#실습 3-26
select * from `student` as a
join `register` as b on a.stdno = b.regstdno
join `lecture` as c on b.reglecno = c.lecno;

#실습 3-27
select
	`stdno`,
    `stdname`,
    `lecno`,
    `lecname`,
    `regmidscore`,
    `regfinalscore`,
    `regtotalscore`,
    `reggrade`
from `student` as a
join `register` as b on a.stdno = b. regstdno
join `lecture` as c on b.reglecno = c.lecno
order by reggrade;

#실습 3-28
select
	`stdNo`,
	`stdName`,
	`lecName`,
	`regTotalScore`,
	`regGrade`
from `student` as a
join `register` as b on a.stdno = b.regstdno
join `lecture` as c on b.reglecno = c.lecno
where reggrade like 'F';

#실습 3-29
select
	`stdNo`,
    `stdName`,
    sum(`leccredit`) as `이수학점`
from `student` as a
join `register` as b on a.stdno = b.regstdno
join `lecture` as c on b.reglecno = c.lecno
where regtotalscore >= 60
group by stdno order by stdno;

#실습 3-30
select
	`stdno`,
    `stdname`,
    group_concat(`lecname`) as `신청과목`,
    group_concat(if(`regtotalscore` >= 60, `lecname`,null)) as `이수과목`
from `student` as a
join `register` as b on a.stdno = b.regstdno
join `lecture` as c on b.reglecno = c.lecno
where `regGrade` <> 'F'
group by stdno;
