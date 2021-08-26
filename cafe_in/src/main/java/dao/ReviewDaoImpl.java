package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.ReviewVo;
import vo.ThumbVo;

public class ReviewDaoImpl implements ReviewDao {

   SqlSession sqlSession;

   public void setSqlSession(SqlSession sqlSession) {
      this.sqlSession = sqlSession;
   }

   @Override
   public int insert(ReviewVo vo) {
      // TODO Auto-generated method stub
      return sqlSession.insert("review.review_insert",vo);
   }

   @Override
   public List selectList(int c_idx) {
      // TODO Auto-generated method stub
      return sqlSession.selectList("review.review_list", c_idx);
   }

   @Override
   public int delete(int r_idx) {
      // TODO Auto-generated method stub
      return sqlSession.delete("review.review_delete",r_idx);
   }

   @Override
   public ThumbVo selectOne(ThumbVo vo) {
      // TODO Auto-generated method stub
      return sqlSession.selectOne("review.thumb_list_one", vo);
   }

   @Override
   public int insert_thumb(ThumbVo vo) {
      // TODO Auto-generated method stub
      return sqlSession.insert("review.thumb_insert", vo);
   }

   @Override
   public int selectCount(int r_idx) {
      // TODO Auto-generated method stub
      return sqlSession.selectOne("review.thumb_count", r_idx);
   }

   @Override
   public int delete_thumb(ThumbVo vo) {
      // TODO Auto-generated method stub
      return sqlSession.delete("review.thumb_delete",vo);
   }

   @Override
   public List<ReviewVo> selectList(Map map) {
      // TODO Auto-generated method stub
      return sqlSession.selectList("review.review_condition_list", map);
   }

   @Override
   public int selectRowTatal(int c_idx) {
      // TODO Auto-generated method stub
      return sqlSession.selectOne("review.review_row_total", c_idx);
   }


   
}