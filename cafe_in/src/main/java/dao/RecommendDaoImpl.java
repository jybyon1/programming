package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.RecommendVo;

public class RecommendDaoImpl implements RecommendDao {
	
	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<RecommendVo> selectList() {
		// TODO Auto-generated method stub
		
		List<RecommendVo> list = null;
		
		list = sqlSession.selectList("recommend.recommend_list");
		
		return list;
	}

}
