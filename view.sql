-- 테이블을 만들지 않고
create view library_view as -- 아래 select의 결과를 view로 사용 > 스키마 새로고침하면 view 생김
-- 자주 쓰는 select를 저장함 => select를 저장하기 위한 가짜 테이블 
-- 매번 join을 하지 않아도 됨
select
	-- row_number() over(partition by 도서관명 order by 도서관명) as 도서관순번, -- 도서관들끼리(그룹에서) 묶어서 그 안에서 row_number를 줌 (행에 number를 주는 것)
    row_number() over(order by 도서관명) as 도서관순번, -- 중복제거된 도서관에 순번을 넣어줌
	도서관명
from
	library_mst
group by
	도서관명;