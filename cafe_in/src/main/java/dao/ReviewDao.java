package dao;

import java.util.List;
import java.util.Map;

import vo.ReviewVo;
import vo.ThumbVo;

public interface ReviewDao {

   //리뷰조회
   List selectList(int c_idx);
   
   //리뷰작성
   int insert(ReviewVo vo);

   //리뷰삭제
   int delete(int r_idx);

   //좋아요 체크
   ThumbVo selectOne(ThumbVo vo);

   //좋아요 추가
   int insert_thumb(ThumbVo vo);
   
   int delete_thumb(ThumbVo vo);

   //좋아요 카운트
   int selectCount(int r_idx);

   //페이지별 리뷰 조회
   List<ReviewVo> selectList(Map map);

   //전체행수
   int selectRowTatal(int c_idx);

}