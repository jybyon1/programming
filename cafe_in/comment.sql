/*

--일련번호 관리객체
create sequence seq_comment_tb_c_idx

--테이블
create table comment_tb
(
   c_idx     int,				--일련번호
   c_content varchar2(1000),	--내용
   c_ip      varchar2(100),		--IP
   c_regdate date,				--작성일자
   b_idx     int,				--기준글 idx
   i_idx     int,				--작성자 idx
   i_name    varchar2(100)
)

--기본키
alter table comment_tb
   add constraint pk_comment_tb_c_idx  primary key(c_idx);

--외래키
alter table comment_tb
   add constraint fk_comment_tb_b_idx  foreign key(b_idx)
                                       references  board(b_idx);
       
--제약조건 삭제

alter table comment_tb
   add constraint fk_comment_tb_i_idx  foreign key(i_idx)
                                       references  i_member(i_idx)    
                                       on  delete cascade;  
                                                                                                                                                                                                                                                                                        
--paging 처리를 위한 SQL문
select * from
(
	select
		rank() over(order by c_idx desc) as no,
			c.*
	from   
		(select * from comment_tb where b_idx=10) c
)
where no between 1 and 3                                       
                  
*/