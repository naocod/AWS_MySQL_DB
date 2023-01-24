/* ==================<< select >>==================*/

select * from student_mst;

/* 전체 컬럼 조회 */
select 
	*
from
	student_mst;
    
/* 지정 컬럼 조회 */
select 
	student_id,
    student_name
from
	student_mst;
    
/* 임시 컬럼 추가 */
select
	1 as num,
    '김준일' as name;
    
select
	student_id,
    student_name,
    '김준일' as instructor_name
from
	student_mst;
    
/* 컬럼명을 임시로 바꾸는 방법 as(alias) */
select 
	student_id as studentId -- 카멜 표기법 사용
from
	student_mst sm; -- 보통 테이블 명의 as 생략하고 컬럼명은 생략하지 않음

/* 조회조건 where */
select
	*
from
	student_mst
where
	mentor_id = 1;

select
	*
from
	student_mst
where
	mentor_id = (select
						mentor_id
					from
						mentor_mst
					where
						mentor_name = '문자영');
                        
select
	student_id,
    student_name,
    mentor_id,
    (select 
		mentor_name 
    from 
		mentor_mst 
    where 
		mentor_id = student_mst.mentor_id) as mentor_name -- row마다 select가 실행되어 비효율적이기에 이런경우는 join을 사용한다.
from
	student_mst;

/* 그룹으로 묶어서 조회하기 */ -- 중복 제거용으로 사용하면 안되고 그룹끼기 묶어서 연산처리할 때 사용함

select
	count(mentor_id),
    min(student_id), -- 그룹으로 묶인 것 안에서 제일 작은거
    max(student_id),
    avg(student_id),
    sum(student_id),
	mentor_id
from
	student_mst
group by
	mentor_id;
    
/* 중복 제거 */

select distinct
	mentor_id
from
	student_mst;
    
/* 그룹으로 조회한 결과에 조건 */ 

select
	count(mentor_id) as mentor_count,
    min(student_id),
    max(student_id),
    avg(student_id),
    sum(student_id),
	mentor_id
from
	student_mst
group by
	mentor_id
having
	mentor_count = 5;
    
/* 정렬 */
select
	*
from
	student_mst
order by
	mentor_id,
    student_id desc;
    
/* 전체 조합 실습 */

select
	count(*) as student_count,
    mentor_id
from
	student_mst
where
	student_id > 2
group by
	mentor_id
having
	student_count = 1
order by
	mentor_id desc;









