# 날짜 : 2024/07/17
# 이름 : 강중원
# 내용 : ERD 실습하기 2


#실습 1
#실습 2
#실습 3
use hospital;
#실습 4
insert into departments value ('101', '소아과', '김유신','051-123-0101'),
							  ('102', '내과', '김춘추','051-123-0102'),
                              ('103', '외과', '장보고','051-123-0103'),
                              ('104', '피부과', '선덕여왕','051-123-0104'),
                              ('105', '이비인후과', '강감찬','051-123-0105'),
                              ('106', '산부인과', '신사임당','051-123-0106'),
                              ('107', '흉부외과', '류성룡','051-123-0107'),
                              ('108', '정형외과', '송상현','051-123-0108'),
                              ('109', '신경외과', '이순신','051-123-0109'),
                              ('110', '비뇨기과', '정약용','051-123-0110'),
                              ('111', '안과', '박지원','051-123-0111'),
                              ('112', '치과', '전봉준','051-123-0112');

insert into doctors value('D101101', '김유신', '1976-01-21', 'M', '101', '과장', '010-1101-1976', 'kimys@bw.com'),
						 ('D101102', '계백', '1975-06-11', 'M', '101', '전문의', '010-1102-1975', 'gaeback@bw.com'),
						 ('D101103', '김관창', '1989-05-30', 'M', '101', '전문의', '010-1103-1989', 'kwanch@bw.com'),
						 ('D102101', '김춘추', '1979-04-13', 'M', '102', '과장', '010-2101-1979', 'kimcc@bw.com'),
						 ('D102104', '이사부', '1966-09-12', 'M', '102', '전문의', '010-2104-1966', 'leesabu@bw.com'),
						 ('D103101', '장보고', '1979-07-28', 'M', '103', '과장', '010-3101-1979', 'jangbg@bw.com'),
						 ('D104101', '선덕여왕', '1984-06-15', 'F', '104', '과장', '010-4101-1984', 'gueen@bw.com'),
						 ('D105101', '강감찬', '1965-10-21', 'M', '105', '과장', '010-5101-1965', 'kang@bw.com'),
						 ('D106101', '신사임당', '1972-11-28', 'F', '106', '과장', '010-6101-1972', 'sinsa@bw.com'),
						 ('D107103', '이이', '1992-09-07', 'M', '107', '전문의', '010-7103-1992', 'leelee@bw.com'),
						 ('D107104', '이황', '1989-12-09', 'M', '107', '전문의', '010-7104-1989', 'hwang@bw.com'),
						 ('D108101', '송상현', '1977-03-14', 'M', '108', '과장', '010-8101-1977', 'ssh@bw.com');
                         
insert into nurses value ('N101101', '송승헌', '1976-02-21', 'M', '101', '수간호사', '010-1101-7602', 'ssh@bw.com'),
						 ('N102101', '이영애', '1975-07-11', 'F', '102', '수간호사', '010-1102-7507', 'yung@bw.com'),
						 ('N102102', '엄정화', '1989-06-30', 'F', '102', '주임', '010-1103-8906', 'um@bw.com'),
						 ('N102103', '박명수', '1979-05-13', 'M', '102', '주임', '010-2101-7905', 'park@bw.com'),
						 ('N103101', '정준하', '1966-10-12', 'M', '103', '주임', '010-2104-6610', 'jung@bw.com'),
						 ('N104101', '김태희', '1979-08-28', 'F', '104', '주임', '010-3101-7908', 'taeh@bw.com'),
						 ('N105101', '송혜교', '1984-07-15', 'F', '105', '주임', '010-4101-8407', 'song@bw.com'),
						 ('N106101', '공유', '1965-11-21', 'M', '106', '간호사', '010-5101-6511', 'gong@bw.com'),
						 ('N107101', '이병헌', '1972-12-28', 'M', '107', '간호사', '010-6101-7212', 'byung@bw.com'),
						 ('N108101', '송중기', '1992-10-07', 'M', '108', '간호사', '010-7103-9210', 'jungi@bw.com');
                         
insert into patients value ('P102101', 'D102101', 'N102101', '정우성', '760121-1234567', 'M', '서울', '010-1101-7601', null, '배우'),
						   ('P103101', 'D103101', 'N103101', '이정재', '750611-1234567', 'M', '서울', '010-1102-7506', null, '배우'),
						   ('P102102', 'D102104', 'N102103', '전지현', '890530-1234567', 'F', '대전', '010-1103-8905', 'jjh@naver.com', '자영업'),
						   ('P104101', 'D104101', 'N104101', '이나영', '790413-1234567', 'F', '대전', '010-2101-7904', 'lee@naver.com', '회사원'),
						   ('P105101', 'D105101', 'N105101', '원빈', '660912-1234567', 'M', '대전', '010-2104-6609', 'one@daum.net', '배우'),
						   ('P103102', 'D103101', 'N103101', '장동건', '790728-1234567', 'M', '대구', '010-3101-7907', 'jang@naver.com', '배우'),
						   ('P104102', 'D104101', 'N104101', '고소영', '840615-1234567', 'F', '대구', '010-4101-8406', 'goso@daum.net', '회사원'),
						   ('P108101', 'D108101', 'N108101', '김연아', '651021-1234567', 'F', '대구', '010-5101-6510', 'yuna@daum.net', '운동선수'),
						   ('P102103', 'D102104', 'N102102', '유재석', '721128-1234567', 'M', '부산', '010-6101-7211', null, '개그맨'),
						   ('P107101', 'D107104', 'N107101', '강호동', '920907-1234567', 'M', '부산', '010-7103-9209', null, '개그맨'),
						   ('P105102', 'D105101', 'N105101', '조인성', '891209-1234567', 'M', '광주', '010-7104-8912', 'join@gmail.com', '배우'),
						   ('P104103', 'D104101', 'N104101', '강동원', '770314-1234567', 'M', '광주', '010-8101-7703', 'dong@naver.com', '배우');

insert into treatments value ('1021001', 'D102101', 'P102101', '감기, 몸살', '2022-01-10 10:50:12'),
							 ('1031002', 'D103101', 'P103101', '교통사고 외상', '2022-01-10 10:50:12'),
							 ('1021003', 'D102104', 'P102102', '위염, 장염', '2022-01-10 10:50:12'),
							 ('1041004', 'D104101', 'P104101', '피부 트러블', '2022-01-10 10:50:12'),
							 ('1051005', 'D105101', 'P105101', '코막힘 및 비염', '2022-01-10 10:50:12'),
							 ('1031006', 'D103101', 'P103102', '목 디스크', '2022-01-10 10:50:12'),
							 ('1041007', 'D104101', 'P104102', '여드름', '2022-01-10 10:50:12'),
							 ('1081008', 'D108101', 'P108101', '오른쪽 발목 뼈 골절', '2022-01-10 10:50:12'),
							 ('1021009', 'D102104', 'P102103', '소화불량', '2022-01-10 10:50:12'),
							 ('1071010', 'D107104', 'P107101', '가슴 통증', '2022-01-10 10:50:12'),
 							 ('1051011', 'D105101', 'P105102', '귀 이명', '2022-01-10 10:50:12'),
							 ('1041012', 'D104101', 'P104103', '팔목 화상', '2022-01-10 10:50:12');

insert into charts value ('C1021001', '1021001', 'D102101', 'P102101', '감기 주사 및 약 처방'),
						 ('C1031002', '1031002', 'D103101', 'P103101', '입원 치료'),
						 ('C1021003', '1021003', 'D102104', 'P102102', '위내시경'),
						 ('C1041004', '1041004', 'D104101', 'P104101', '피부 감염 방지 주사'),
						 ('C1051005', '1051005', 'D105101', 'P105101', '비염 치료'),
						 ('C1031006', '1031006', 'D103101', 'P103102', '목 견인치료'),
						 ('C1041007', '1041007', 'D104101', 'P104102', '여드름 치료약 처방'),
						 ('C1081008', '1081008', 'D108101', 'P108101', '발목 깁스'),
						 ('C1021009', '1021009', 'D102104', 'P102103', '주사 처방'),
						 ('C1071010', '1071010', 'D107104', 'P107101', 'MRI 검사'),
						 ('C1051011', '1051011', 'D105101', 'P105102', '귀 청소 및 약 처방'),
						 ('C1041012', '1041012', 'D104101', 'P104103', '화상 크림약 처방');


#실습 5-1
select doc_id, doc_name, doc_birth, doctors.dep_no, dep_name 
from doctors, departments 
where doctors.dep_no = departments.dep_no;

#실습 5-2
select nur_id, nur_name, nur_birth, nurses.dep_no, dep_name 
from nurses, departments 
where nurses.dep_no = departments.dep_no;

#실습 5-3
select pat_id, pat_name, pat_jumin, pat_phone, doc_name, nur_name 
from patients, nurses, doctors 
where nurses.nur_id=patients.nur_id and doctors.doc_id = patients.doc_id;

#실습 5-4
select pat_name, doc_name, treat_contents, chart_contents, treat_datetime 
from patients, doctors, treatments, charts 
where patients.pat_id = treatments.pat_id 
	and doctors.doc_id = treatments.doc_id 
	and treatments.treat_no = charts.treat_no;

#실습 5-5
select treatments.treat_no, pat_name, doc_name, treat_contents, chart_contents, treat_datetime 
from patients, doctors, treatments, charts, departments 
where patients.pat_id = treatments.pat_id 
	and doctors.doc_id = treatments.doc_id 
    and treatments.treat_no = charts.treat_no 
    and doctors.dep_no = departments.dep_no 
    and dep_name = '외과';

#실습 5-6
select treatments.treat_no, pat_name, doc_name, treat_contents, chart_contents, treat_datetime 
from patients, doctors, treatments, charts 
where patients.pat_id = treatments.pat_id 
	and doctors.doc_id = treatments.doc_id 
    and treatments.treat_no = charts.treat_no 
    and treat_contents like '%화상%';

#실습 5-7
select 
	*
	from
		(select 
			*,
			year(now()) - `year` as `age`
			from(
				select 
					*,
					concat('19', substring(`pat_jumin`, 1, 2)) as `year`
					from patients) as a ) as b
	where age between 30 and 39;
    
#두번째 방법
select *
	from `patients`
    where 
		year(now()) - concat('19',left(`pat_jumin`,2)) >= 30
        and 
		year(now()) - concat('19',left(`pat_jumin`,2)) < 40;
        
#세번째 방법


#실습 5-8
select
	a.dep_name,
    a.dep_manager
from `departments` as a
left join `doctors` as b on a.dep_no = b.dep_no
where `doc_id` is null; 

#실습 5-9
select GROUP_CONCAT(patients.pat_name SEPARATOR '^') 
from nurses, patients 
where patients.nur_id = nurses.nur_id 
	and nur_name = '김태희';

#실습 5-10
select nurses.nur_id, nur_name, count(pat_id) as `pat_num` 
from nurses, patients 
where patients.nur_id = nurses.nur_id 
group by nur_id
having `pat_num` = (select max(count(pat_id)) from nurses, patients where patients.nur_id = nurses.nur_id);