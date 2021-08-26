/*

--�Ϸù�ȣ
create sequence seq_review_r_idx

--����
DROP SEQUENCE seq_review_r_idx

--���̺�
create table review
(
   r_idx  		int				,			--���� ��ȣ
   r_content  	varchar2(1000) 	,  			--���� ����
   r_star   	int 			,			--����
   r_regdate   	date			,			--�ۼ�����
   i_id         varchar2(100)   ,           --�ۼ��ھ��̵�
   
   c_idx		int							--ī�� �Ϸù�ȣ
   
)
--�⺻Ű ����
alter table review
	add constraint pk_review_r_idx primary key(r_idx);

--�ܷ�Ű
alter table review
	add constraint fk_review_c_idx foreign key(c_idx) references cafe(c_idx) on delete cascade;

alter table review
	add constraint fk_review_i_id foreign key(i_id) references i_member(i_id);

--
insert into review values (seq_review_r_idx.nextVal, '�ȳ�', 4, sysdate, 'dool', 1)
insert into review values (seq_review_r_idx.nextVal, '�ι�°������', 3, sysdate, 'dool', 3)
insert into review values (seq_review_r_idx.nextVal, '�ͼ���°������', 2, sysdate, 'admin', 4)
insert into review values (seq_review_r_idx.nextVal, '�ι�°�γ����;���', 1, sysdate, 'admin', 1)
insert into review values (seq_review_r_idx.nextVal, '�ƾƾ�', 1, sysdate, 'admin', 1)
insert into review values (seq_review_r_idx.nextVal, '����°�γ����;���', 1, sysdate, 'admin', 1)

select *from review

*/