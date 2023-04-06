create database delivery_db character set = utf8mb4 collate = utf8mb4_general_ci;

create table delivery_mst(
	delivery_id int primary key auto_increment not null,
    delivery_company varchar(20) not null,
    delivery_man varchar(15) not null,
    delivery_address varchar(100) not null,
	consignee_name varchar(15) not null,
    consignee_phone varchar(14) not null,
    consignee_message text
);

show databases;

use delivery_db;

show tables;

desc delivery_mst;


insert into student_mst
values (0, '김춘식'),
	   (0, '손흥민');
       
insert into subject_mst
values (0, '컴퓨터 구조'),
	   (0, '데이터베이스'),
	   (0, '인공지능');
       
insert into score_mst
values (0, 1, 1, 95),
		(0, 2, 1, 84),
        (0, 1, 2, 89),
        (0, 2, 2, 92),
        (0, 1, 3, 100),
        (0, 2, 3, 88);
	   

select
	cm.score_id,
    cm.student_id,
    sm.student_name,
    cm.subject_id,
    jm.subject_name,
    cm.score
from
	score_mst cm
    left outer join student_mst sm on(sm.student_id = cm.student_id)
    left outer join subject_mst jm on(jm.subject_id = cm.subject_id)
where
	jm.subject_id < 3;

insert into product_mst
values (0, '딸기사탕', 50),
		(0, '누룽지사탕', 100);

select
	*
from
	product_mst;
    
show variables like 'AUTOCOMMIT';
set autocommit = 0;

START TRANSACTION;
 
INSERT INTO product_mst
VALUES(0, '오렌지사탕', 20);

savepoint sp_insert;

UPDATE `상품`
SET
    `수량` = 200
WHERE
    `상품코드` = 2;

DELETE
FROM
    product_mst
WHERE
    `상품코드` = 2;

rollback to sp_insert;

UPDATE product_mst
SET
    `수량` = 200
WHERE
    `상품코드` = 1;
    
DELETE
FROM
    product_mst
WHERE
    `상품코드` = 2;

COMMIT;

create view USER_VIEW as
SELECT
    `ID`,
    `USERNAME`,
    `PASSWORD`,
    `NAME`,
    `EMAIL`
FROM
    `USER_MST`
WHERE
    `ID` BETWEEN 1 AND 200;
    
insert into user_mst
values (0, 'aa', '1234', 'aa', 'aa@gmail.com'),
		(0, 'bb', '1234', 'bb', 'bb@gmail.com'),
        (0, 'cc', '1234', 'cc', 'cc@gmail.com'),
        (0, 'aaa', '1234', 'aaa', 'aaa@gmail.com'),
        (0, 'abc', '1234', 'abc', 'abc@gmail.com');
    
select 
	* 
from USER_VIEW
where
	 `USERNAME` like 'a%';

show full tables in delivery_db
where
	table_type like 'VIEW';
    
CREATE TABLE sales ( 

    customer VARCHAR(255), 

    amount INT

);

INSERT INTO sales (customer, amount)

VALUES 

    ('John', 100), 

    ('Jane', 200), 

    ('John', 150), 

    ('Jane', 50), 

    ('Jim', 300);
    
  
select
	customer,
    sum(amount) as total_sales,
    rank() over (order by sum(amount) desc) as sales_rank
from
	sales
group by
	customer
order by
	sales_rank desc,
    customer;
    
select
	*
from
	role_dtl;


create role admin_group;

create user 'new_user'@'localhost' identified by 'password';

show grants for 'new_user'@'localhost'; 

grant admin_group to 'new_user'@'localhost';

grant select, insert, update on *.* to 'new_user'@'localhost';


insert into 
	user_mst
values
	(1, 'JOHN', 'JOHN@gmail.com'),
	(2, 'JANE', 'JANE@gmail.com'),
	(3, 'JIM', 'JIM@gmail.com');

insert into 
	user_dtl
values
	(1, '010-1111-2222', 'MALE'),
	(2, '010-3333-4444', 'FEMALE'),
	(3, '010-5555-6666', 'MALE');
    
CALL FIND_USER_BY_USERNAME('JOHN');


