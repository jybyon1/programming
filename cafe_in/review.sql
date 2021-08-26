/*

--일련번호
create sequence seq_review_r_idx

--삭제
DROP SEQUENCE seq_review_r_idx

--테이블
create table review
(
   r_idx  		int				,			--리뷰 번호
   r_content  	varchar2(1000) 	,  			--리뷰 내용
   r_star   	int 			,			--별점
   r_regdate   	date			,			--작성일자
   i_id         varchar2(100)   ,           --작성자아이디
   
   c_idx		int							--카페 일련번호
   
)
--기본키 설정
alter table review
	add constraint pk_review_r_idx primary key(r_idx);

--외래키
alter table review
	add constraint fk_review_c_idx foreign key(c_idx) references cafe(c_idx) on delete cascade;

alter table review
	add constraint fk_review_i_id foreign key(i_id) references i_member(i_id);

--
insert into review values (seq_review_r_idx.nextVal, '안녕', 4, sysdate, 'dool', 1)
insert into review values (seq_review_r_idx.nextVal, '두번째여야해', 3, sysdate, 'dool', 3)
insert into review values (seq_review_r_idx.nextVal, '넌세번째여야해', 2, sysdate, 'admin', 4)
insert into review values (seq_review_r_idx.nextVal, '두번째로내려와야해', 1, sysdate, 'admin', 1)
insert into review values (seq_review_r_idx.nextVal, '아아아', 1, sysdate, 'admin', 1)
insert into review values (seq_review_r_idx.nextVal, '세번째로내려와야해', 1, sysdate, 'admin', 1)

select *from review

*/