insert into user_mst
values (0, 'test', '1234', 'test', 'test@gmail.com');

delete
from
	user_mst
where
	username = 'test';

call show_all_user_mst('안녕하세요');

select * from user_mst;
select * from user_dtl;