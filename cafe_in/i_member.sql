/*
--ORA-02449: �ܷ� Ű�� ���� �����Ǵ� ����/�⺻ Ű�� ���̺� �ֽ��ϴ�
--�ڽ��� �⺻Ű�� ����Ű�� �����ϴ� ���̺��� ���������� �����ϰ� ����
drop table i_member cascade constraints

drop table i_member

--��ȸ
select * from i_member

--����
DROP SEQUENCE seq_member_i_idx

--�Ϸù�ȣ
create sequence seq_member_i_idx

--���̺�

create table i_member
(
	i_idx	  		int                   	,		--�Ϸù�ȣ
	i_name	  		varchar2(100) not null	,		--�̸�
	i_id	  		varchar2(100) not null	,		--���̵�
	i_pwd	  		varchar2(100) not null	,		--��й�ȣ
	i_email	  		varchar2(100) 			,		--�̸���
	i_zipcode 		varchar2(100)		    ,		--�����ȣ
	i_addr	    	varchar2(100)			,		--�ּ�
	i_addr_detail	varchar2(100)		    ,		--���ּ�
	i_birth			varchar2(100)			,		--����
	i_ip			varchar2(100) 			,		--������
	i_tel			varchar2(100)			,		--������������¥
	i_grade	  		varchar2(100) default '�Ϲ�'		 --ȸ����� : �Ϲ� or ������
)


--�����̸Ӹ�Ű ����
alter table i_member 
	add constraint pk_i_member_i_idx primary key(i_idx);
	
--�ߺ��Ұ�
alter table i_member
	add constraint unique_i_member_i_id unique(i_id);
	
--smaple data

insert into i_member values(seq_member_i_idx.nextVal, '�����', 'admin', '1234',
							'notyun@naver.com','54321','����� ���빮��','�����','930119',
							'121.162.221.226',
							sysdate,
							'������');
							
insert into i_member values(seq_member_i_idx.nextVal, '�Ѹ�', 'dool', '1234',
							'notyun@naver.com','54321','����� ���빮��','�����','931111',
							'121.162.111.332',
							sysdate,
							'�Ϲ�');		
							
					select * from i_member		
							
DELETE FROM i_member
           WHERE i_idx=22;

						


*/