#날짜 : 2024/07/10
#이름 : 강중원
#내용 : SQL 연습문제 4

SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

#실습 4-1
Create database `Theater`;
create user 'theater'@'%' identified by '1234';
grant all privileges on theater.* to 'theater'@'%';
flush privileges;

use theater;

#실습 4-2
Create table `movies`(
	movie_id int primary key auto_increment,
    title VARCHAR(30) not null,
    genre varchar(10) not null,
    release_date date not null
    );
    
create table customers(
	customer_id int primary key auto_increment,
    `name` varchar(20) not null,
    email varchar(50) not null,
    phone char(13) not null
);

create table bookings(
	booking_id int primary key,
    customer_id int not null,
    movie_id int not null,
    num_tickets int not null,
    booking_date datetime not null
);

#실습 4-3
insert into movies value (null, "쇼생크의 탈출", "드라마", "1999-10-14"),
						 (null, "타이타닉", "로맨스", "1997-03-24"),
                         (null, "탑건", "액션", "1987-07-16"),
                         (null, "쥬라기공원", "액션", "1994-02-11"),
                         (null, "글래디에이터", "액션", "2000-05-03"),
                         (null, "시네마천국", "드라마", "1995-04-12"),
                         (null, "미션임파서블", "액션", "1995-11-11"),
                         (null, "노트북", "로맨스", "2003-08-23"),
                         (null, "인터스텔라", "SF", "2011-05-26"),
                         (null, "아바타", "SF", "2010-02-10");

INSERT INTO `CUSTOMERS` VALUE (NULL, "김유신","kys@example.com", "010-1234-1001"),
							  (NULL, "김춘추","kcc@example.com", "010-1234-1002"),
							  (NULL, "장보고","jbg@example.com", "010-1234-1003"),
							  (NULL, "강감찬","kgc@example.com", "010-1234-1004"),
							  (NULL, "이순신","iss@example.com", "010-1234-1005");
                              

insert into bookings value ( 101, 1, 1, 2, "2023-01-10 00:00:00"),
						   ( 102, 2, 2, 3, "2023-01-11 00:00:00"),
						   ( 103, 3, 2, 2, "2023-01-13 00:00:00"),
						   ( 104, 4, 3, 1, "2023-01-17 00:00:00"),
						   ( 105, 5, 5, 2, "2023-01-21 00:00:00"),
						   ( 106, 3, 8, 2, "2023-01-21 00:00:00"),
						   ( 107, 1, 10, 4, "2023-01-21 00:00:00"),
						   ( 108, 2, 9, 1, "2023-01-22 00:00:00"),
						   ( 109, 5, 7, 2, "2023-01-23 00:00:00"),
						   ( 110, 3, 4, 2, "2023-01-23 00:00:00"),
						   ( 111, 1, 6, 1, "2023-01-24 00:00:00"),
						   ( 112, 3, 5, 3, "2023-01-25 00:00:00");
                           
#실습 4-4
select title from movies;

#실습 4-5
select * from movies where genre like '로맨스';

#실습 4-6
select
	title,
    release_date
from movies where release_date >= "2010-01-01";

#실습 4-7
select
	booking_id, booking_date
from bookings where num_tickets >= 3;

#실습 4-8
select * from bookings where booking_date <= "2023-01-20";

#실습 4-9
select * from movies where release_date between '1990-01-01' and '1999-12-31';

#실습 4-10
select * from bookings
order by booking_date desc
limit 3;

#실습 4-11
select title, release_date from movies
order by release_date asc
limit 1;

#실습 4-12
select
concat(title, ' - ', release_date) as movie_info
from movies
where title like '%공원%'
order by release_date asc
limit 1;

#실습 4-13
select booking_date, title
from bookings
join movies
using (movie_id)
where customer_id = 2;

#실습 4-14
select
	`name`,
    phone,
    booking_date,
    title
from bookings B
Join customers C on b.customer_id = C.customer_id
join movies M on b.movie_id = M.movie_id;

#실습 4-15
select
	M.genre,
    Avg(b.num_tickets) as avg_tickets
from bookings B
join Movies M on b.movie_id = m.movie_id
group by M.genre;

#실습 4-16
select
	C.name,
    avg(B.num_tickets) as avg_tickets
from bookings B
join Customers C on B.customer_id = C.customer_id
group by C.name;

#실습 4-17
select
	C.name,
    sum(B.num_tickets) as `전체 예매 티켓 수`
from bookings b
join customers C on b.customer_id = C.customer_id
group by c.name
order by `전체 예매 티켓 수` desc;

#실습 4-18
select
	booking_id,
    movie_id,
    name,
    booking_date
from bookings b
join customers C on b.customer_id = c.customer_id
order by b. booking_date asc
limit 1;

#실습 4-19
select
	genre, title, release_date
from movies
where(genre, release_date) in (select genre, max(release_date) from movies group by genre);

#실습 4-20
select * from movies
where movie_id in(
	select movie_id from bookings
    where customer_id = (select customer_id from customers where name like '김유신')
);

#실습 4-21
select name, email from customers
where customer_id = (
	select customer_id
    from bookings
    group by customer_id
    order by sum(num_tickets)desc
    limit 1);

#실습 4-22
select * from bookings
where num_tickets > (select avg(num_tickets) from bookings);

#실습 4-23
select
	m.title, sum(b.num_tickets) as total_tickets
from bookings B
join movies m on B.movie_id = m.movie_id
group by title;

#실습 4-24
select
	c.name,
    sum(b.num_tickets) as total_tickets,
    avg(b.num_tickets) as avg_tickets
from bookings b
join customers c on b.customer_id = c.customer_id
group by name;

#실습 4-25
select
	c.customer_id,
    c.name,
    c.email,
    sum(b.num_tickets) as `예매 티켓수`
from bookings b
join customers c on b. customer_id = c.customer_id
group by customer_id
order by `예매 티켓수` desc;

#실습 4-26
select
	name,
    title,
    num_tickets,
    booking_date
from bookings b
join customers c on b.customer_id = c.customer_id
join movies m on b.movie_id = m.movie_id
order by num_tickets desc;

#실습 4-27
select
	m.title,
    m.genre,
    sum(b.num_tickets) as `예매 티켓 수`,
    avg(b.num_tickets) as `평균 티켓 수`
from bookings b
join movies m on b.movie_id = m.movie_id
where m.genre = '액션'
group by title
order by `평균 티켓 수` desc
limit 1;

#실습 4-28
select
	b.customer_id,
    c.name,
    sum(`num_tickets`) as `ticket_total`
from bookings B
join customers c on b.customer_id = C.customer_id
group by b.customer_id
order by ticket_total desc;

#실습 4-29
select
	b.booking_id,
    b.customer_id,
    b.movie_id,
    MaxTickets.max_tickets
from bookings B
join(
	select movie_id, max(num_tickets) as max_tickets
    from bookings
    group by movie_id
)as maxtickets
on b.movie_id = maxtickets.movie_id and b.num_tickets = maxtickets.max_tickets;

#실습 4-30
select
	b.booking_id,
    b.customer_id,
    c.name,
    m.title,
    m.genre,
    sum(b.num_tickets) as `예매 티켓 수`
from bookings B
join movies m on B.movie_id = m.movie_id
join customers c on b.customer_id = c.customer_id
group by m.title
having `예매 티켓 수` = (
	select max(total_tickets)
    from(
		select sum(b2.num_tickets)as total_tickets
        from bookings b2
        join movies m2 on b2.movie_id = m2.movie_id
        where m2.genre = m.genre
        group by m2.title
	)as selectMax
)
order by `예매 티켓 수` DESC;

