select
	순번,
	도서관명,
    구분,
    도서명,
    저작자,
    출판사,
    case -- 자바의 if
		when 발행연도 is null then '2050'
        when 발행연도 = '' then '2090'
        else 발행연도
	end as 발행연도,
    -- ifnull(발행연도, '2051') as 발행연도2, -- 해당 컬럼에 null값이 있으면 바꿈
    if(ifnull(발행연도, '') = '', '2023', 발행연도) as 발행연도2, -- 발행연도가 null이면 ''으로 바꾸고 if문에서 공백이면 2023으로 바꿈
    nullif(발행연도, '') as 발행연도3, -- 두개의 값이 같으면 null을 리턴함
    if (청구기호 = '', '기호없음', 청구기호) as 청구기호 -- 삼항연산자
    --    조건     ,    참    , 거짓
from
	library_mst
where
	-- 발행연도 like '201_'; 
    -- %는 여러개 _는 특정위치 하나만 
    not 발행연도 = ''; -- null일때만 is null /is not null 사용
    -- 공백이 아닌 것을 조회 할때는 not 컬럼명 = ''
    
update library_mst
set
	발행연도 = ''
where
	발행연도 = '2009';