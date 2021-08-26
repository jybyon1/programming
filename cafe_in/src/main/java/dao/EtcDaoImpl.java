package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.CafeVo;

public class EtcDaoImpl implements EtcDao {
	
	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<CafeVo> selectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("etc.etc_list");
	}

	@Override
	public List<CafeVo> selectList(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("etc.cafe_search",map);
	}

	
}
