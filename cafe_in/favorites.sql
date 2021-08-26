/*

--ORA-02449: �ܷ� Ű�� ���� �����Ǵ� ����/�⺻ Ű�� ���̺� �ֽ��ϴ�
--�ڽ��� �⺻Ű�� ����Ű�� �����ϴ� ���̺��� ���������� �����ϰ� ����
drop table favorites cascade constraints

drop sequence seq_favorites_f_idx

--���ɸ�� �Ϸù�ȣ
create sequence seq_favorites_f_idx 


drop table favorites

--���ɸ�� ���̺�
create table favorites 
(
	f_idx	int,				--���ɸ�� idx
	i_idx	int,				--��� idx
	c_idx	int   				--ī�� idx
)





--�⺻Ű (primary key) ����
alter table favorites add constraint pk_favorites_f_idx primary key(f_idx);

--ī�����̺�(cafe)�� c_idx�� ���ɸ��(favorites)�� c_idx���� �ܷ�Ű ����
alter table favorites add constraint fk_favorites_c_idx foreign key(c_idx) references cafe(c_idx) on delete cascade;


--ȸ�����̺�(i_member)�� i_idx�� ���ɷϷ�(favorites)�� i_idx���� �ܷ�Ű ����
alter table favorites add constraint fk_favorites_i_idx foreign key(i_idx) references i_member(i_idx);

--2���� ��� ����ũ�ؾ���
alter table favorites
  add constraint unique_favorites_i_idx_c_idx unique(i_idx,c_idx);


select * from cafe
select * from i_member

-- Join�� ���ؼ� ��ȸ������ ����
create or replace view favorites_view
as
   select
	   f.f_idx, f.c_idx,c.c_name,f.i_idx
	from cafe c inner join  favorites f on (c.c_idx = f.c_idx)

select * from favorites


--�� ����
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