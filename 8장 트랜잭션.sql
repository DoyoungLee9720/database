# 날짜 2024/07/19
# 이름 : 강중원
# 내용 : 8장 트랜잭션 실습하기

#실습 8 -1
start transaction;
Select * from `bank_account`;

UPDATE `bank_account` set `a_balance` = `bank_account` - 10000
	where `a_no` = '101-11-1001';
    
UPDATE `bank_account` set `a_balance` = `bank_account` + 10000
	where `a_no` = '101-11-1212';
    
commit;

select * from `bank_acount`