/*

--ORA-02449: 외래 키에 의해 참조되는 고유/기본 키가 테이블에 있습니다
--자신의 기본키나 고유키를 참조하는 테이블의 제약조건을 삭제하고 진행
drop table favorites cascade constraints

drop sequence seq_favorites_f_idx

--관심목록 일련번호
create sequence seq_favorites_f_idx 


drop table favorites

--관심목록 테이블
create table favorites 
(
	f_idx	int,				--관심목록 idx
	i_idx	int,				--멤버 idx
	c_idx	int   				--카페 idx
)





--기본키 (primary key) 설정
alter table favorites add constraint pk_favorites_f_idx primary key(f_idx);

--카페테이블(cafe)의 c_idx와 관심목록(favorites)의 c_idx간의 외래키 설정
alter table favorites add constraint fk_favorites_c_idx foreign key(c_idx) references cafe(c_idx) on delete cascade;


--회원테이블(i_member)의 i_idx와 관심록록(favorites)의 i_idx간의 외래키 설정
alter table favorites add constraint fk_favorites_i_idx foreign key(i_idx) references i_member(i_idx);

--2개를 묶어서 유니크해야지
alter table favorites
  add constraint unique_favorites_i_idx_c_idx unique(i_idx,c_idx);


select * from cafe
select * from i_member

-- Join을 통해서 조회정보를 추출
create or replace view favorites_view
as
   select
	   f.f_idx, f.c_idx,c.c_name,f.i_idx
	from cafe c inner join  favorites f on (c.c_idx = f.c_idx)

select * from favorites


--뷰 삭제
drop view favorites_view



--sample data
insert into favorites values(seq_favorites_f_idx.nextVal,2,1);
insert into favorites values(seq_favorites_f_idx.nextVal,2,2);   


select * from favorites_view

			
select rownum as no,
       f.*
from			
  (select * from favorites order by f_idx asc) f			
			
			
			
			
*/