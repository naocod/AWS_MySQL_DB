/*
	DML
    C: insert / into	데이터 추가
    R: select / from	데이터 조회
    U: update / set		데이터 수정
    D: delete / from	데이터 삭제
*/

/* ==================<< insert >>==================*/

select * from student_mst;
 
insert into 
	`db_study2_explain`.`student_mst` -- 데이터베이스명, 테이블명, 컬럼명을 사용할때는 백쿼터를 사용해야하며 생략할 수 있다
	(`student_id`, `student_name`) -- 키값의 순서를 바꾸면 데이터를 넣을 때도 순서를 바꿔야한다 => 원하는 키값만 넣을 수 있으며 null값이 들어갈 수 있다(null 허용일 경우)
values (4, '손지호');

insert into student_mst -- insert가 한건인 경우
(student_id, student_name, mentor_id)
values 
	(5, 	'이강용', 	10),
	(6, 	'김준경', 	10),
	(7, 	'이현수', 	10),
	(8, 	'정의현', 	10);
    
-- ---------------------------
 
insert into university_mst
values
	(4, '한국외대'),
	(5, '서울시립대'),
	(6, '고려대'),
	(7, '연세대'),
	(8, '성균관대'),
	(9, '한양대'),
	(10, '카이스트');
    
select * from university_mst;
 
 
/* ==================<< update >>==================*/
 
select * from student_mst;
 
update student_mst 
set
	student_name = '김재영',
	mentor_id = 15
where
	student_id = 5;
	
/*멘토 아이디가 10인 학생들의 멘토 아이디를 1로 바꿔라*/
select * from student_mst;

update student_mst
set
	mentor_id = 1
where
	mentor_id = 10;
    
/* ==================<< delete >>==================*/

delete 
from 
	student_mst 
where 
	student_id = 4
and student_name = '손지호';


delete
from
	university_mst
where
	university_id = 3
and university_name = '경상대';
   