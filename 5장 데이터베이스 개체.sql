#날짜 : 2024/07/03
#이름 : 강중원
#내용 : 5장 데이터베이스 개체

#실습 5-1
SHOW INDEX FROM `user1`;
SHOW INDEX FROM `user2`;
SHOW INDEX FROM `user3`;

#실습 5-2
CREATE INDEX `idx_user1_uid` On `user1`(`uid`);
Analyze table `user1`;
drop index idx_user1_uid on `user1`;

#실습 5-3
select * from `user5`;
insert into `user5`(`name`,`gender`,`age`,`addr`) select `name`,`gender`,`age`,`addr` from `user5`;

update `user5` set `name` = '홍길동' where `seq` = 3;
update `user5` set `name` = '정약용' where `seq` = 2000000;

drop table `user5`;

select count(*) from `user5`;
select * from `user5` where `seq` = 11000;
select * from `user5` where `name` = '정약용';

create index `idx_user5_name` on `user5` (`name`);
analyze table `user5`;

delete from `user5` where `seq` > 4;

#실습 5-4
create view `vw_user1` as (select `name`, `hp`, `age` from `user1`);
CREATE VIEW `vw_user4_age_under30` AS (SELECT * FROM `User4` WHERE `age` < 30);
CREATE VIEW `vw_member_with_sales` AS (
	SELECT 
	a.`uid` AS `직원아이디`,
	b.`name` AS `직원이름`,
	b.`pos` AS `직급`,
	c.`name` AS `부서명`,
	a.`year` AS `매출년도`,
	a.`month` AS `월`,
	a.`sale` AS `매출액`
	FROM `Sales` AS a 
	JOIN `Member` AS b ON a.uid = b.uid
	JOIN `Department` AS c ON b.dep = c.depNo
	);
#실습 5-5
select * from `vw_user1`;
select * from `vw_user4_age_under30`;
select * from `vw_member_with_sales`;

#실습 5-6 
DROP view `vw_user`;
Drop view `vw_user4_age_under30`;

#실습 5-7
DELIMITER $$
	create procedure proc_test1()
    BEGIN
		select * from `member`;
        select * from `department`;
	END $$
DELIMITER ;

call proc_test1();

#실습 5-8
DELIMITER $$
	create procedure proc_test2(IN _userName VARCHAR(10))
    BEGIN
		SELECT * FROM `member` where `name` = _userName;
	END $$
DELIMITER ;

CALL proc_test2('김유신');

DELIMITER $$
	create procedure proc_test3(IN _pos VARCHAR(10), IN _dep TINYINT)
    BEGIN
		SELECT * FROM `Member` WHERE `pos` = _pos AND `dep` = _dep;
	END $$
DELIMITER ;

drop procedure proc_test4;

CALL proc_test3('차장', 101);

DELIMITER $$
	create procedure proc_test4(IN _pos VARCHAR(10), OUT _count INT)
    BEGIN
		SELECT count(*) INTO _count FROM `member` where `pos` = _pos;
	END $$
DELIMITER ;

CALL proc_test4('대리', @_count);
SELECT CONCAT('_count : ', @_count);

#실습 5-9
DELIMITER $$
	create procedure proc_test5(IN _name VARCHAR(10))
    BEGIN
		DECLARE userId VARCHAR(10);
		SELECT `uid` into userId from `Member` where `name` = _name;
        SELECT * from `Sales` where `uid` = userId;
	END $$
DELIMITER ;

CALL proc_test5('김유신');

DELIMITER $$
	create procedure proc_test6()
    BEGIN
		DECLARE num1 INT;
        DECLARE num2 INT;
        
        SET num1 = 1;
        SET num2 = 2;
			
        IF(num1 > num2) then
			select 'num1이 num2보다 크다.' as `결과2`;
		else
			select 'num1이 num2보다 크다.' as `결과2`;
		end if;
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


DELIMITER $$	
	CREATE PROCEDURE proc_test8()
    BEGIN
		#변수 선언
        DECLARE total INT DEFAULT 0;
        DECLARE price INT;
        DECLARE endOfRow BOOLEAN DEFAULT false;
        
        #커서 선언
        DECLARE salesCursor CURSOR FOR
			SELECT `sale` FROM `SALES`;
        
        #반복 조건
		DECLARE CONTINUE handler
			for not found set endOfRow = TRUE;
		
		#커서 열기
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

call proc_test8();


#실습 5-11
SET GLOBAL  log_bin_trust_function_creators=ON;
DELIMITER $$
	CREATE FUNCTION func_test1(_userid VARCHAR(10)) returns INT
    BEGIN
		DECLARE total int;
        
        select sum(`sale`) into total from `sales` where `uid` = _userid;
        
        return total;
	end $$
    DELIMITER ;
drop function func_test1;

select func_test1('a101');


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
 FROM `Sales`


