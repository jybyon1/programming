/*
--ORA-02449: 외래 키에 의해 참조되는 고유/기본 키가 테이블에 있습니다
--자신의 기본키나 고유키를 참조하는 테이블의 제약조건을 삭제하고 진행
drop table i_member cascade constraints

drop table i_member

--조회
select * from i_member

--삭제
DROP SEQUENCE seq_member_i_idx

--일련번호
create sequence seq_member_i_idx

--테이블

create table i_member
(
	i_idx	  		int                   	,		--일련번호
	i_name	  		varchar2(100) not null	,		--이름
	i_id	  		varchar2(100) not null	,		--아이디
	i_pwd	  		varchar2(100) not null	,		--비밀번호
	i_email	  		varchar2(100) 			,		--이메일
	i_zipcode 		varchar2(100)		    ,		--우편번호
	i_addr	    	varchar2(100)			,		--주소
	i_addr_detail	varchar2(100)		    ,		--상세주소
	i_birth			varchar2(100)			,		--생일
	i_ip			varchar2(100) 			,		--아이피
	i_tel			varchar2(100)			,		--마지막수정날짜
	i_grade	  		varchar2(100) default '일반'		 --회원등급 : 일반 or 관리자
)


--프라이머리키 설정
alter table i_member 
	add constraint pk_i_member_i_idx primary key(i_idx);
	
--중복불가
alter table i_member
	add constraint unique_i_member_i_id unique(i_id);
	
--smaple data

insert into i_member values(seq_member_i_idx.nextVal, '장관리', 'admin', '1234',
							'notyun@naver.com','54321','서울시 서대문구','경기대로','930119',
							'121.162.221.226',
							sysdate,
							'관리자');
							
insert into i_member values(seq_member_i_idx.nextVal, '둘리', 'dool', '1234',
							'notyun@naver.com','54321','서울시 서대문구','경기대로','931111',
							'121.162.111.332',
							sysdate,
							'일반');		
							
					select * from i_member		
							
DELETE FROM i_member
           WHERE i_idx=22;

						


*/