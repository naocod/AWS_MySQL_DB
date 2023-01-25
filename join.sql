select
	*
from
	library_mst;
    
select
	*
from
	author_mst;
    
select
	순번,
    도서관명,
    구분,
    도서명,
    저작자,
    (select author_name from author_mst where author_id = 저작자) as 저작자명,
    출판사,
	(select publisher_name from publisher_mst where publisher_id = 출판사) as 출판사명,
    (select publisher_year from publisher_mst where publisher_id = 출판사) as 출판사설립일,
    발행연도,
    청구기호
from
	library_mst;

/*===================================================================================*/

SELECT * FROM db_study3.library_mst order by 순번 desc;

insert into library_mst
values (0, '테스트도서관', '999(테스트)', '테스트도서명', '9999', '9999', '2023', '999.9-테99ㅌ');

select
	lm.순번,
    lm.도서명,
    lm.구분,
    lm.도서명,
    lm.출판사,
    pm.publisher_name as 출판사명,
    pm.publisher_year as 출판사_발행연도
from
	library_mst lm
    left outer join publisher_mst pm on(pm.publisher_id = lm.출판사)
-- where
-- 	pm.publisher_id is null -- A에 있는건 존재하지만 B에 존재하는것을 뺀것
order by
	lm.순번 desc;
    
    
    
    
    
    
    
    
    
    
    