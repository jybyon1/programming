package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.CafeVo;
import vo.ReviewVo;

public class CafeDaoImpl implements CafeDao {
	
	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<CafeVo> selectList() {
		// TODO Auto-generated method stub
		
		List<CafeVo> list = null;
		
		list = sqlSession.selectList("cafe.cafe_select");
		
		return list;
	}

	@Override
	public List<CafeVo> selectList(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cafe.cafe_search",map);
	}

	
}
