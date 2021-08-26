/*

create sequence seq_thumb_t_idx

drop table thumb

create table thumb
(
	t_idx		int	,
	i_id 		varchar2(100),
	r_idx		int
)

--프라이머리키 설정
alter table thumb
	add constraint pk_thumb_t_idx primary key(t_idx);
	
--외래키 설정	
alter table thumb
	add constraint fk_thumb_i_id foreign key(i_id) references i_member(i_id);
	
alter table thumb 
	add constraint fk_thumb_r_idx foreign key(r_idx) references review(r_idx);	








*/