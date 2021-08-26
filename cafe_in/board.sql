/*

--�Ϸù�ȣ ������ü
create sequence  seq_board_b_idx

--���̺�
create table board
(
   b_idx 			int,			--�Ϸù�ȣ
   b_subject		varchar2(500),	--����
   b_content		clob,			--����
   b_photo			varchar2(255),	--�Խ��ǻ���
   b_readhit		int,			--��ȸ��
   b_ip				varchar2(100),	--������
   b_regdate		date,			--�������
   b_use_yn			char(1),		--�������(y or n)
   i_idx			int,			--ȸ����ȣ
   i_name			varchar2(100)	--ȸ����
)

--�⺻Ű ����
alter table board
  add constraint pk_board_b_idx primary key(b_idx);
  
--�ܷ�Ű ����
alter table board
  add constraint fk_board_i_idx foreign key(i_idx)
                                 references i_member(i_idx);

select * from i_member                                                                  
                                 
--sample data
--�۾���
  insert into  board values(seq_board_b_idx.nextVal,
                            '����',
                            'sample',
                            'sample.jpg',
                            0,
                            '127.0.0.1',
                            sysdate,
                            'y',
                            2,
                            '�Ѹ�'
                            );  
                            
  insert into  board values(seq_board_b_idx.nextVal,
                            '����2',
                            'sample2',
                            'sample.jpg',
                            0,
                            '127.0.0.1',
                            sysdate,
                            'y',
                            1,
                            '�����'
                            );        
                            
  insert into  board values(seq_board_b_idx.nextVal,
                            '����3',
                            'sample3',
                            'sample.jpg',
                            0,
                            '127.0.0.1',
                            sysdate,
                            'y',
                            1,
                            '�����'
                            );       
                                                                     
 insert into  board values(seq_board_b_idx.nextVal,
                            '����4',
                            'sample4',
                            'sample.jpg',
                            0,
                            '127.0.0.1',
                            sysdate,
                            'y',
                            1,
                            '�����'
                            );  
                            
  update board set b_use_yn = 'y'
  
  commit
  
  select * from board




*/