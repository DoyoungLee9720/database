# 날짜 : 2024/07/15
# 이름 : 강중원
# 내용 : ERD 실습하기 1


#실습 1
#실습 2
#실습 3
use university;
#실습 4
insert into departments value (10, "국어국문학과", "051-510-1010"),
							  (11, "영어영문학과", "051-510-1011"),
                              (20, "경영학과", "051-510-1020"),
                              (21, "경제학과", "051-510-1021"),
                              (22, "정치외교학과", "051-510-1022"),
                              (23, "사회복지학과", "051-510-1023"),
                              (30, "수학과", "051-510-1030"),
                              (31, "통계학과", "051-510-1031"),
                              (32, "생명과학과", "051-510-1032"),
                              (40, "기계공학과", "051-510-1040"),
                              (41, "전자공학과", "051-510-1041"),
                              (42, "컴퓨터공학과", "051-510-1042");
                              
insert into professors value ("P10101", 10, '김유신', '750120-1234567', '010-1101-1976','kimys@hg.ac.kr', '서울'),
							 ("P10102", 10, '계백', '750610-1234567', '010-1102-1975', 'gaeback@hg.ac.kr', '서울'),
                             ("P11101", 11, '김관창', '880529-1234567', '010-1103-1989', 'kwanch@hg.ac.kr', '대전'),
                             ("P11103", 11, '김춘추', '780412-1234567', '010-2101-1979', 'kimcc@hg.ac.kr', '대전'),
                             ("P11104", 11, '이사부', '650811-1234567', '010-2104-1966', 'leesabu@hg.ac.kr', '대전'),
                             ("P22110", 22, '장보고', '780727-1234567', '010-3101-1979', 'jangbg@hg.ac.kr', '대구'),
                             ("P23102", 23, '선덕여왕', '830614-1234567', '010-4101-1984', 'gueen@hg.ac.kr', '대구'),
                             ("P31101", 31, '강감찬', '641020-1234567', '010-5101-1965', 'kang@hg.ac.kr', '대구'),
                             ("P31104", 31, '신사임당', '711127-1234567', '010-6101-1972', 'sinsa@hg.ac.kr', '부산'),
                             ("P40101", 40, '이이', '910906-1234567', '010-7103-1992', 'leelee@hg.ac.kr', '부산'),
                             ("P40102", 40, '이황', '881208-1234567', '010-7104-1989', 'hwang@hg.ac.kr', '광주'),
                             ("P42103", 42, '송상현', '760313-1234567', '010-8101-1977', 'ssh@hg.ac.kr', '광주');
                             
insert into students value ("20101001", 10, 'P10101','정우성', '760121-1234567', '010-1101-7601',null,'서울'),
						  ("20101002", 10, 'P10101','이정재', '750611-1234567', '010-1102-7506',null,'서울'),
                          ("20111011", 11, 'P11103','전지현', '890530-1234567', '010-1103-8905','jjh@naver.com','대전'),
                          ("20111013", 11, 'P11103','이나영', '790413-1234567', '010-2101-7904','lee@naver.com','대전'),
                          ("20111014", 11, 'P11104','원빈', '660812-1234567', '010-2104-6609','one@daum.net','대전'),
                          ("21221010", 22, 'P22110','장동건', '790728-1234567', '010-3101-7907','jang@naver.com','대구'),
                          ("21231002", 23, 'P23102','고소영', '840615-1234567', '010-4101-8406','goso@daum.com','대구'),
                          ("22311011", 31, 'P31104','김연아', '651021-1234567', '010-5101-6510','yuna@daum.com','대구'),
                          ("22311014", 31, 'P31104','유재석', '721128-1234567', '010-6101-7211',null,'부산'),
                          ("22401001", 40, 'P40101','강호동', '920907-1234567', '010-7103-9209',null,'부산'),
                          ("22401002", 40, 'P40101','조인성', '891209-1234567', '010-7104-8912','join@gmail.com','광주'),
                          ("22421003", 42, 'P42103','강동원', '770314-1234567', '010-8101-7703','dong@naver.com','광주');
                              
                              
insert into lectures value ("101001", 'P10101', '대학 글쓰기', 2,10,'본102'),
						   ("101002", 'P10102', '한국어음운론', 3,30,'본102'),
                           ("101003", 'P10102', '한국현대문학사', 3,30,'본103'),
                           ("111011", 'P11103', '중세영문학', 3,25,'본201'),
                           ("111012", 'P11104', '영미시', 3,25,'본201'),
                           ("231110", 'P23102', '사회복지학개론', 1,8,'별관103'),
                           ("311002", 'P31101', '통계학의 이해', 2,16,'별관303'),
                           ("311003", 'P31104', '기초 통계학', 3,26,'별관303'),
                           ("401019", 'P40101', '기계역학', 3,36,'공학관 102'),
                           ("421012", 'P42103', '데이터베이스', 3,32,'공학관 103');
                           
insert into register value ("20101001", "101001", "P10101", null, null,null,null,null,null),
						   ("20101001", "101002", "P10102", null, null,null,null,null,null),
                           ("20111013", "111011", "P11103", null, null,null,null,null,null),
                           ("21231002", "231110", "P23102", null, null,null,null,null,null),
                           ("22401001", "401019", "P40101", null, null,null,null,null,null),
                           ("22401001", "421012", "P42103", null, null,null,null,null,null),
                           ("20101001", "101003", "P10102", null, null,null,null,null,null),
                           ("22421003", "311003", "P31104", null, null,null,null,null,null),
                           ("22421003", "421012", "P42103", null, null,null,null,null,null),
                           ("20111013", "111012", "P11104", null, null,null,null,null,null);
					
                           
#문제1
SELECT
	`stdNo`,
	`stdName`,
	`stdHp`,
	b.`depNo`,
	`depName`
FROM `Students` AS a
JOIN `Departments` AS b ON a.depNo = b.depNo;

#문제2
SELECT
	`proNo`,
	`proName`,
	`proHp`,
	b.`depNo`,
	`depName`
FROM `Professors` AS a
JOIN `Departments` AS b ON a.depNo = b.depNo;

#문제3
SELECT
	`lecNo`,
	`lecName`,
	`proName`,
	`proHp`
FROM `Lectures` AS a
JOIN `Professors` AS b ON a.proNo = b.proNo;

#문제4
SELECT 
	`lecNo`,
	`lecName`,
	b.`proNo`,
	`proName`,
	`proHp`,
	c.`depNo`,
	`depName`
FROM `Lectures` AS a
JOIN `Professors` AS b ON a.proNo = b.proNo
JOIN `Departments` AS c ON b.depNo = c.depNo;

#문제5
SELECT 
	a.`stdNo`,
	b.`stdName`,
	a.`lecNo`,
	c.`lecName`,
	a.`proNo`,
	d.`proName`
FROM `Register` AS a
JOIN `Students` AS b ON a.stdNo = b.stdNo
JOIN `Lectures` AS c ON a.lecNo = c.lecNo
JOIN `Professors` AS d ON a.proNo = d.proNo;

#문제6
UPDATE `Register` SET
					`regAttenScore` = CEIL(RAND() * 100),
					`regMidScore`   = CEIL(RAND() * 100),
					`regFinalScore` = CEIL(RAND() * 100);

#문제7
UPDATE `Register` SET 
					`regTotal` = (`regAttenScore` + `regMidScore` + `regFinalScore`) / 3;

#문제8
UPDATE `Register` SET 
					`regGrade` = if(`regTotal` >= 90, 'A', 
								 if(`regTotal` >= 80, 'B',
								 if(`regTotal` >= 70, 'C',
								 if(`regTotal` >= 60, 'D', 'F'))));
#문제9
SELECT `regTotal` FROM `Register` ORDER BY `regTotal` DESC LIMIT 1;

#문제10
Select AVG(`regTotal`) from `Register` as a
JOIN `Students` as b
on a.stdNo = b.stdNo
where `stdName`='정우성';