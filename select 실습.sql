select
	*
from
	library_mst
where
	순번 < 50
and 출판사 = '웨일북';

select
	*
from
	library_mst
where
	도서명 like '%나를%'; -- 시작에 들어가든 중간이든 끝이든 포함만되면 검색됨
    
select
	*
from
	library_mst
where
	저작자 in ('채사장 지음', '최인철 지음'); -- 둘 중에 하나라도 있으면 검색
    
    
/* ==================<< select insert >>==================*/

insert into author_mst 
	(author_name)
select distinct
	저작자
from
	library_mst
order by
	저작자;
    
select * from author_mst;


insert into publisher_mst
	(publisher_name)
select distinct
	출판사
from 
	library_mst
order by
	출판사;

select * from publisher_mst;

/* ==================<< select update >>==================*/

update library_mst lm
set lm.저작자 = (select 
					author_id 
                from 
					author_mst am
                where 
					author_name = lm.저작자);

select * from library_mst;


update library_mst, author_mst
set 
   저작자 = author_id
where 
   저작자 = author_name;

select * from library_mst;

update library_mst, publisher_mst
set 
   출판사 = publisher_id
where 
   출판사 = publisher_name;

select * from library_mst;

delete
from
	library_mst
where
	순번 > 1000;

select
	*
from
	library_mst lm
    left outer join author_mst am on (am.author_id = lm.저작자)
    left outer join publisher_mst pm on (pm.publisher_id = lm.출판사);

/*============================================================*/

select * from author_mst;

set profiling = 1;
set profiling_history_size = 30;

-- like와 in으로 조회
select 
	도서관명,
    도서명
from
	library_mst
where
	저작자 in (select author_id from author_mst where author_name like '%김주%');
-- join으로 조회
select 
	도서관명,
    도서명
from
	library_mst lm
    left outer join author_mst am on (am.author_id = lm.저작자)
where
	am.author_name like '%김주%';
                        
show profiles;
	












