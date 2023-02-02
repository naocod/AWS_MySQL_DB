show variables like 'AUTOCOMMIT';
set autocommit = 0;

savepoint sp3;

start transaction; -- autocommit이 off인 상태에서 해야함

insert into user_mst
values (0, 'jjj', '1234', '김준일', 'jjj@gmail.com');

select * from user_mst;

rollback to sp1;

commit;