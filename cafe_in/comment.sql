/*

--�Ϸù�ȣ ������ü
create sequence seq_comment_tb_c_idx

--���̺�
create table comment_tb
(
   c_idx     int,				--�Ϸù�ȣ
   c_content varchar2(1000),	--����
   c_ip      varchar2(100),		--IP
   c_regdate date,				--�ۼ�����
   b_idx     int,				--���ر� idx
   i_idx     int,				--�ۼ��� idx
   i_name    varchar2(100)
)

--�⺻Ű
alter table comment_tb
   add constraint pk_comment_tb_c_idx  primary key(c_idx);

--�ܷ�Ű
alter table comment_tb
   add constraint fk_comment_tb_b_idx  foreign key(b_idx)
                                       references  board(b_idx);
       
--�������� ����

alter table comment_tb
   add constraint fk_comment_tb_i_idx  foreign key(i_idx)
                                       references  i_member(i_idx)    
                                       on  delete cascade;  
                                                                                                                                                                                                                                                                                        
--paging ó���� ���� SQL��
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