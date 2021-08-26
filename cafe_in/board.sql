/*

--일련번호 관리객체
create sequence  seq_board_b_idx

--테이블
create table board
(
   b_idx 			int,			--일련번호
   b_subject		varchar2(500),	--제목
   b_content		clob,			--내용
   b_photo			varchar2(255),	--게시판사진
   b_readhit		int,			--조회수
   b_ip				varchar2(100),	--아이피
   b_regdate		date,			--등록일자
   b_use_yn			char(1),		--사용유무(y or n)
   i_idx			int,			--회원번호
   i_name			varchar2(100)	--회원명
)

--기본키 설정
alter table board
  add constraint pk_board_b_idx primary key(b_idx);
  
--외래키 설정
alter table board
  add constraint fk_board_i_idx foreign key(i_idx)
                                 references i_member(i_idx);

select * from i_member                                                                  
                                 
--sample data
--글쓰기
  insert into  board values(seq_board_b_idx.nextVal,
                            '샘플',
                            'sample',
                            'sample.jpg',
                            0,
                            '127.0.0.1',
                            sysdate,
                            'y',
                            2,
                            '둘리'
                            );  
                            
  insert into  board values(seq_board_b_idx.nextVal,
                            '샘플2',
                            'sample2',
                            'sample.jpg',
                            0,
                            '127.0.0.1',
                            sysdate,
                            'y',
                            1,
                            '장관리'
                            );        
                            
  insert into  board values(seq_board_b_idx.nextVal,
                            '샘플3',
                            'sample3',
                            'sample.jpg',
                            0,
                            '127.0.0.1',
                            sysdate,
                            'y',
                            1,
                            '장관리'
                            );       
                                                                     
 insert into  board values(seq_board_b_idx.nextVal,
                            '샘플4',
                            'sample4',
                            'sample.jpg',
                            0,
                            '127.0.0.1',
                            sysdate,
                            'y',
                            1,
                            '장관리'
                            );  
                            
  update board set b_use_yn = 'y'
  
  commit
  
  select * from board




*/