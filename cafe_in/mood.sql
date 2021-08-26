/*

select * from mood

create sequence seq_mood_m_idx

create table mood
(
	m_idx int,
	m_name	varchar2(100)
)

alter table mood 
	add constraint pk_mood_m_idx primary key(m_idx);
	

--sample data
insert into mood values (seq_mood_m_idx.nextVal, 'date');
insert into mood values (seq_mood_m_idx.nextVal, 'antique');
insert into mood values (seq_mood_m_idx.nextVal, 'vintage');
insert into mood values (seq_mood_m_idx.nextVal, 'lovely');
insert into mood values (seq_mood_m_idx.nextVal, 'modern');


*/