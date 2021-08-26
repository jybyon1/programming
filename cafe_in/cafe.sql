/*

--ORA-02449: �ܷ� Ű�� ���� �����Ǵ� ����/�⺻ Ű�� ���̺� �ֽ��ϴ�
--�ڽ��� �⺻Ű�� ����Ű�� �����ϴ� ���̺��� ���������� �����ϰ� ����
drop table cafe cascade constraints

--����
DROP SEQUENCE seq_cafe_c_idx

--�Ϸù�ȣ
create sequence seq_cafe_c_idx

select max(c_idx) from cafe

create table cafe
(
   c_idx     	     int,                  
   c_name    	     varchar2(100) not null,        
   c_tel     	     varchar2(100) not null,
   c_zipcode         varchar2(100) not null,  
   c_addr      	  	 varchar2(100) not null,  
   c_addr_detail     varchar2(100),

   c_parking 		 int,
   c_alcohol 		 int,
   c_nokidz  		 int,
   c_ip     		 varchar2(100),
   c_photo   		 varchar2(255)
)
--�����̸Ӹ� Ű ����
alter table cafe
   add constraint pk_cafe_c_idx primary key(c_idx);



--��ȸ
select * from cafe_filter

     

--���ͺ�		
create or replace view cafe_filter
as
	SELECT
		A.c_idx,
		A.c_name,
		A.c_tel,
		A.c_zipcode,
		A.c_addr,
		A.c_addr_detail,
		A.c_parking,
		A.c_alcohol,
		A.c_nokidz,
		A.c_ip,
		A.c_photo,
		D.m_name,
		B.d_name, E.m_idx, B.d_idx
	FROM    cafe A inner JOIN dessert_filter C ON A.C_idx = C.c_idx
			inner JOIN dessert B ON B.d_idx = C.d_idx
			inner JOIN mood_filter E ON E.C_idx = A.c_idx
			inner JOIN mood D ON D.m_idx = E.m_idx
--

SELECT * FROM cafe
LEFT JOIN mood_filter ON cafe.c_idx=mood_filter.c_idx
LEFT JOIN mood ON mood_filter.m_idx=mood.m_idx
LEFT JOIN dessert_filter ON cafe.c_idx=dessert_filter.c_idx
LEFT JOIN dessert ON dessert_filter.d_idx=dessert.d_idx;


*/