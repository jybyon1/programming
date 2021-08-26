/*

drop table mood_filter cascade constraints
drop table mood_filter

DROP SEQUENCE seq_mood_filter_m_f_idx

create sequence seq_mood_filter_m_f_idx



create table mood_filter
(
	m_f_idx		int,
	m_idx		int,
	c_idx		int	
)


--프라이머리키 설정
alter table mood_filter
	add constraint pk_mood_filter_m_f_idx primary key(m_f_idx);
	
--외래키 설정	

alter table mood_filter 
	add constraint fk_mood_filter_m_idx foreign key(m_idx) references mood(m_idx);

alter table mood_filter 
	add constraint pk_mood_filter_c_idx foreign key(c_idx) references cafe(c_idx) on delete cascade;	
	

select * from mood_filter

insert into mood_filter values (seq_mood_filter_m_f_idx.nextVal,3,1);
insert into mood_filter values (seq_mood_filter_m_f_idx.nextVal,2,3);
insert into mood_filter values (seq_mood_filter_m_f_idx.nextVal,1,4);
insert into mood_filter values (seq_mood_filter_m_f_idx.nextVal,4,5);
insert into mood_filter values (seq_mood_filter_m_f_idx.nextVal,5,6);





*/