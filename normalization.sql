insert into student_mst values (1, '김동민', 1);
insert into student_mst values (2, '김두영', 1);
insert into student_mst values (3, '장진원', 2);
-- 학생 정보 추가
select * from student_mst; 

insert into insructor_mst values (1, '김준일', 1);
insert into insructor_mst values (2, '김준이', 2);
insert into insructor_mst values (3, '김준삼', 3);
-- 강사 정보 추가
select * from insructor_mst;

insert into lecture_mst values (1, 'java', 100000);
insert into lecture_mst values (2, 'python', 80000);
insert into lecture_mst values (3, 'c', 90000);
-- 강의 정보 추가
select * from lecture_mst;

insert into university_mst values (1, '서울대');
insert into university_mst values (2, '부산대');
insert into university_mst values (3, '경상대');
-- 학교 정보 추가
select * from university_mst;

insert into mentor_mst values (1, '문자영');
insert into mentor_mst values (2, '문성현');
-- 멘토 정보 추가
select * from mentor_mst;

insert into course_mst values (1, 1, 1, 1);
insert into course_mst values (2, 2, 1, 1);
insert into course_mst values (3, 3, 2, 2);
insert into course_mst values (4, 2, 3, 3);
-- 수강신청 정보 추가
select * from course_mst;

select
	*
from
	course_mst cm
    left outer join student_mst sm on(sm.student_id = cm.student_id)
	left outer join mentor_mst mm on (mm.mentor_id = sm.mentor_id)
    left outer join lecture_mst lm on(lm.lecture_code = cm.lecture_code)
    left outer join insructor_mst im on(im.insructor_id = cm.insructor_id)
    left outer join university_mst um on(um. university_code = im.university_code);