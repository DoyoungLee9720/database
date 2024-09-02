insert into Users value 
    ('user1', '김유신', '1976-01-21', 'M', '010-1101-1976', 'kimys@naver.com', '0', '1', '서울', '2022-01-10 10:50:12'),
    ('user2', '계백', '1975-06-11', 'M', '010-1102-1975', null, '1000', '1', '서울', '2022-01-10 10:50:12'),
    ('user3', '김춘추', '1989-05-30', 'M', '010-1103-1989', null, '1200', '2', '서울', '2022-01-10 10:50:12'),
    ('user4', '이사부', '1979-04-13', 'M', '010-2101-1979', 'leesabu@gmail.com', '2600', '1', '서울', '2022-01-10 10:50:12'),
    ('user5', '장보고', '1966-09-12', 'M', '010-2104-1966', 'jangbg@naver.com', '9400', '4', '대전', '2022-01-10 10:50:12'),
    ('user6', '선덕여왕', '1979-07-28', 'M', '010-3101-1979', 'gueen@naver.com', '1600', '2', '대전', '2022-01-10 10:50:12'),
    ('user7', '강감찬', '1984-06-15', 'F', '010-4101-1984', 'kang@daum.net', '800', '0', '대구', '2022-01-10 10:50:12'),
    ('user8', '신사임당', '1965-10-21', 'M', '010-5101-1965', 'sinsa@gmail.com', '1500', '1', '대구', '2022-01-10 10:50:12'),
    ('user9', '이이', '1972-11-28', 'F', '010-6101-1972', 'leelee@nate.com', '3400', '3', '부산', '2022-01-10 10:50:12'),
    ('user10', '허난설헌', '1992-09-07', 'F', '010-7103-1992', null, '4100', '3', '광주', '2022-01-10 10:50:12');
    
insert into Points value (NULL, 'user1', '1000', '회원가입 1000 적립', '2022-01-10 10:50:12'),
(NULL, 'user1', '6000', '상품구매 5% 적립', '2022-01-10 10:50:12'),
(NULL, 'user3', '2835', '상품구매 5% 적립', '2022-01-10 10:50:12'),
(NULL, 'user7', '3610', '상품구매 5% 적립', '2022-01-10 10:50:12'),
(NULL, 'user5', '3000', '이벤트 응모 3000 적립', '2022-01-10 10:50:12'),
(NULL, 'user2', '1000', '회원가입 1000 적립', '2022-01-10 10:50:12'),
(NULL, 'user2', '2000', '이벤트 응모 2000 적립', '2022-01-10 10:50:12'),
(NULL, 'user2', '2615', '상품구매 5% 적립', '2022-01-10 10:50:12'),
(NULL, 'user3', '1500', '이벤트 응모 1500 적립', '2022-01-10 10:50:12'),
(NULL, 'user6', '15840', '상품구매 2% 적립', '2022-01-10 10:50:12');

insert into sellers value ('10001', '(주)다팔아', '서울', '02-201-1976', '정우성'),
('10002', '판매의민족', '서울', '02-102-1975', '이정재'),
('10003', '멋남', '경기', '031-103-1989', '원빈'),
('10004', '스타일살아', '경기', '032-201-1979', '이나영'),
('10005', '(주)삼성전자', '서울', '02-214-1966', '장동건'),
('10006', '복실이옷짱', '부산', '051-301-1979', '고소영'),
('10007', '컴퓨존(주)', '대구', '055-401-1984', '유재석'),
('10008', '(주)LG전자', '서울', '02-511-1965', '강호동'),
('10009', '굿바디스포츠', '부산', '070-6101-1972', '조인성'),
('10010', '누리푸드', '부산', '051-710-1992', '강동원');




insert into categories value ('10', '여성의류패션'),
('11', '남성의류패션'),
('12', '식품·생필품'),
('13', '취미·반려견'),
('14', '홈·문구'),
('15', '자동차·공구'),
('16', '스포츠·건강'),
('17', '컴퓨터·가전·디지털'),
('18', '여행'),
('19', '도서');

insert into products value ('100101', '11', '10003', '반팔티 L~2XL', '869', '25000', '132', '20'),
('100110', '10', '10004', '트레이닝 통바지', '1602', '38000', '398', '15'),
('110101', '10', '10003', '신상 여성운동화', '160', '76000', '40', '5'),
('120101', '12', '10010', '암소 1등급 구이셋트 1.2kg', null, '150000', '87', '15'),
('120103', '12', '10010', '바로구이 부채살 250g', null, '21000', '61', '10'),
('130101', '13', '10006', '[ANF] 식스프리 강아지 사료', '58', '56000', '142', '0'),
('130112', '13', '10006', '중대형 사계절 강아지옷', '120', '15000', '80', '0'),
('141001', '14', '10001', '라떼 2인 소파/방수 패브릭', null, '320000', '42', '0'),
('170115', '17', '10007', '지포스 3080 그래픽카드', '28', '900000', '12', '12'),
('160103', '16', '10009', '치닝디핑 33BR 철봉', '32', '120000', '28', '0');

insert into orders value ('22010210001', 'user2', '52300', '서울시 마포구 121', '1', '2022-01-10 10:50:12'),
('22010210002', 'user3', '56700', '서울시 강남구 21-1', '1', '2022-01-10 10:50:12'),
('22010210010', 'user4', '72200', '서울시 강서구 큰대로 38', '2', '2022-01-10 10:50:12'),
('22010310001', 'user5', '127000', '경기도 광주시 초월로 21', '1', '2022-01-10 10:50:12'),
('22010310100', 'user1', '120000', '경기도 수원시 120번지', '0', '2022-01-10 10:50:12'),
('22010410101', 'user6', '792000', '부산시 남구 21-1', '2', '2022-01-10 10:50:12'),
('22010510021', 'user7', '92200', '부산시 부산진구 56 10층', '4', '2022-01-10 10:50:12'),
('22010510027', 'user8', '112000', '대구시 팔달로 9', '3', '2022-01-10 10:50:12'),
('22010510031', 'user10', '792000', '대전시 한밭로 24-1', '2', '2022-01-10 10:50:12'),
('22010710110', 'user9', '94500', '광주시 충열로 11', '1', '2022-01-10 10:50:12');

insert into OrderItems value (NULL, '22010210001', '100110', '38000', '15', '1'),
(NULL, '22010210001', '100101', '25000', '20', '1'),
(NULL, '22010210002', '120103', '21000', '10', '3'),
(NULL, '22010310001', '130112', '15000', '0', '1'),
(NULL, '22010310001', '130101', '56000', '0', '2'),
(NULL, '22010210010', '110101', '76000', '5', '1'),
(NULL, '22010310100', '160103', '120000', '0', '1'),
(NULL, '22010410101', '170115', '900000', '12', '1'),
(NULL, '22010510021', '110101', '76000', '5', '1'),
(NULL, '22010510027', '130101', '56000', '0', '2'),
(NULL, '22010510021', '100101', '25000', '20', '1'),
(NULL, '22010510031', '170115', '900000', '12', '1'),
(NULL, '22010710110', '120103', '21000', '10', '5');

insert into Carts value (1, 'user1', '100101', '1', '2022-01-10 10:50:12'),
(2, 'user1', '100110', '2', '2022-01-10 10:50:12'),
(3, 'user3', '120103', '1', '2022-01-10 10:50:12'),
(4, 'user4', '130112', '1', '2022-01-10 10:50:12'),
(5, 'user5', '130101', '1', '2022-01-10 10:50:12'),
(6, 'user2', '110101', '3', '2022-01-10 10:50:12'),
(7, 'user2', '160103', '1', '2022-01-10 10:50:12'),
(8, 'user2', '170115', '1', '2022-01-10 10:50:12'),
(9, 'user3', '110101', '1', '2022-01-10 10:50:12'),
(10, 'user6', '130101', '1', '2022-01-10 10:50:12');

#고객 : users	주문 : orders	주문상품상세 : orderItems	장바구니 : carts	상품 : products	상품카테고리 : categories
#문제 1
select 
	userName,
    prodName,
	cartProdCount
    from carts, users, products
    where 
    carts.prodNo = products.prodNo
    and carts.userId = users.userid
    and cartProdCount >= 2;

#문제 2
select prodNo, cateName, prodName, prodPrice, sellermanager, sellerPhone  from products, categories, sellers where products.cateNo = categories.cateNo and products.sellerNo = sellers.sellerNo;

#문제 3
select users.userid,
	userName,
    userhp,
    userPoint,
    ifnull(sum(`point`),0)
	from users
    left join points
    on points.userid = users.userid
    group by userid
    ;

#문제 4
select 
	orders.orderNo
    ,orders.userId
    ,userName
    ,prodName
    ,itemPrice
    ,orderdate
 from orders, users, products, orderItems
 where orders.userId = users.userId
	and orders.orderNo = orderItems.orderNo
    and orderItems.prodNo = products.prodNo
	and itemPrice >= 100000;
 ;
 
 # 문제 5
select 
	orders.orderNo
    ,orders.userId
    ,userName
    ,group_concat(prodName,',')
    ,orderdate
 from orders, users, products, orderItems
 where orders.userId = users.userId
	and orders.orderNo = orderItems.orderNo
    and orderItems.prodNo = products.prodNo
group by orders.orderno
 ;
#문제 6
select products.prodno
    ,prodname
    ,prodPrice
    ,itemDiscount
    ,prodprice - (prodPrice/100 * proddiscount)
	from products, orderitems
    where products.prodno = orderitems.prodNo
    ;
    
#문제7
select prodno, prodname, prodprice , prodstock, sellermanager 
	from sellers, products
	where sellers.sellerNo = products.sellerNo 
	and sellermanager = '고소영';

#문제8
select sellers.sellerNo, sellerBizName, sellermanager, sellerPhone from sellers
	left join products on sellers.sellerNo = products.sellerNo where prodno is null;

#문제 9
select orderno,
	sum(`할인가`) as `최종 총합`
from
	(select *,
		floor(itemPrice * (1-itemdiscount/100)) as 할인가
		from orderitems
        ) as a
	group by orderno
    having `최종 총합` >= 100000
    order by `최종 총합` desc
    ;

#문제 10