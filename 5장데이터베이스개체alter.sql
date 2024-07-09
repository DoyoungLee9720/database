#날짜 : 2024/07/05
#이름 : 이도영
#내용 : 5장 데이터베이스 개체alter
use StudyDB; #DB 사용시
#실습 5-1
show index from `user1`;
show index from `user2`;
show index from `user3`;

#실습 5-2
create index `idx_user5_uid` ON `user5` (`name`);
analyze table `user5`;

select * from `user5`;
insert into `user5` (`name`,`gender`,`age`,`addr`) select `name`,`gender`,`age`,`addr` from `user5`;

update `user5` set `name` = '홍길동' where `seq`=3;
update `user5` set `name` = '정약용' where `seq`=2000000;

drop table `user5`;

select count(*) from `user5`;
select * from `user5` where `seq`=2100000;
select * from `user5` where `seq` = 4000000;


delete from user5 where seq > 4;

#실습 5-4 뷰 생성
create view `vw_user1` as(select `name`, `hp`, `age` from `user1`);
create view `vw_user4_age_under30` as(select * from `user4` where `age` < 30);
create view `vw_member_with_sales` as(
	select
		a.`uid` as `직원아이디`,
        b.`name` as `직원이름`,
        b.`pos` as `직급`,
        c.`name` as `부서명`,
        a.`year` as  `매출년도`,
        a.`month` as  `월`,
        a.`sale` as `매출액`
	from `sales` as a
    join `member` as b on a.uid=b.uid
	join `department` as c on b.dep = c.depno
	);

#실습 5-5 뷰 조회
select * from `vw_user1`;
select * from `vw_user4_age_under30`;

#실습 5-6 뷰 삭제
drop view `vw_user1`;
drop view `vw_user4_age_under30`;

#실습 5-7 프로시저 생성 및 실행 기본
DELIMITER $$
	create procedure proc_test1()
    begin
		select * from `member`;
        select * from `department`;
    end$$
DELIMITER ;

call proc_test1();

#실습 5-8 매개변수를 갖는 프로시저 생성 및생성
DELIMITER $$
	CREATE PROCEDURE proc_test2(IN _userName VARCHAR(10))
	BEGIN
		SELECT * FROM `Member` WHERE `name`=_userName;
	END $$
DELIMITER ;
CALL proc_test2('김유신');

DELIMITER $$
	CREATE PROCEDURE proc_test3(IN _pos VARCHAR(10), IN _dep TINYINT)
	BEGIN
		SELECT * FROM `Member` WHERE `pos`=_pos AND `dep`=_dep;
	END $$
DELIMITER ;
CALL proc_test3('차장',101);

DELIMITER $$
	CREATE PROCEDURE proc_test4(IN _pos VARCHAR(10), OUT _count INT)
	BEGIN
		SELECT COUNT(*) INTO _count FROM `Member` WHERE `pos`=_pos ;
	END $$
DELIMITER ;
CALL proc_test4('대리', @_count);
SELECT CONCAT('_count : ', @_count);


# 실습 5-9 프로시저 프로그래밍
DELIMITER $$
	CREATE PROCEDURE proc_test5(IN _name VARCHAR(10))
	BEGIN
	DECLARE userId VARCHAR(10);
		select `uid` into userId from `Member` where `name` = _name;
		select * from `Sales` where `uid`=userId;
	END $$
DELIMITER ;
CALL proc_test5('김유신');


DELIMITER $$
	CREATE PROCEDURE proc_test6()
		BEGIN
			DECLARE num1 INT;
			DECLARE num2 INT;
			SET num1 = 1;
			SET num2 = 2;
			IF (NUM1 > NUM2) THEN
				SELECT 'NUM1이 NUM2보다 크다.' as `결과2`;
			ELSE
				SELECT 'NUM1이 NUM2보다 작다.' as `결과2`;
			END IF;
END $$
DELIMITER ;
CALL proc_test6();


DELIMITER $$
	CREATE PROCEDURE proc_test7()
	BEGIN
		DECLARE sum INT;
		DECLARE num INT;
		SET sum = 0;
		SET num = 1;
		WHILE (num <= 10) DO
			SET sum = sum + num;
			SET num = num + 1;
		END WHILE;
		SELECT sum AS '1부터 10까지 합계';
	END $$
DELIMITER ;
CALL proc_test7();

#실습 5-10 커서를 활용하는 프로시저
DELIMITER $$
CREATE PROCEDURE proc_test8()
	BEGIN
	# 변수 선언
	DECLARE total INT DEFAULT 0;
	DECLARE price INT;
	DECLARE endOfRow BOOLEAN DEFAULT false;
    
	# 커서 선언
	DECLARE salesCursor CURSOR FOR
		SELECT `sale` FROM `Sales`;
    
	# 반복 조건
	DECLARE CONTINUE HANDLER
		FOR NOT FOUND SET endOfRow = TRUE;
    
	# 커서 열기
	OPEN salesCursor;
	cursor_loop: LOOP
		FETCH salesCursor INTO price;
		IF endOfRow THEN
			LEAVE cursor_loop;
		END IF;
			SET total = total + price;
		END LOOP;
	SELECT total AS '전체 합계';
	CLOSE salesCursor;
END $$
DELIMITER ;
CALL proc_test8();

#실습 5-11 저장 함수 생성 및 호출
SET GLOBAL  log_bin_trust_function_creators=ON;
DELIMITER $$
	CREATE FUNCTION func_test1(_userid VARCHAR(10)) RETURNS INT
	BEGIN
		DECLARE total INT;
		SELECT SUM(`sale`) INTO total FROM `Sales` WHERE `uid`=_userid;
	RETURN total;
END $$
DELIMITER ;
SELECT func_test1('a101');

DELIMITER $$
	CREATE FUNCTION func_test2(_sale INT) RETURNS DOUBLE
	BEGIN
		DECLARE bonus DOUBLE;
		IF (_sale >= 100000) THEN
			SET bonus = _sale * 0.1;
		ELSE
			SET bonus = _sale * 0.05;
		END IF;
	RETURN bonus;
	END $$
DELIMITER ;

SELECT
	`uid`,
	`year`,
	`month`,
	`sale`,
	func_test2(`sale`) as `bonus`
FROM `Sales`;