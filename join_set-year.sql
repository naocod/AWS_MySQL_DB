update publisher_mst
set
	publisher_year = '2023-01-25'
where
	publisher_id in (146, 147);
    
select
	*
from
	publisher_mst;