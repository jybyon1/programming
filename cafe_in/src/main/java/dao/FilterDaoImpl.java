package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.CafeSearchVo;
import vo.CafeVo;
import vo.DessertVo;
import vo.MoodVo;
import vo.RecommendVo;

public class FilterDaoImpl implements FilterDao {
	
	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<CafeSearchVo> selectList(CafeSearchVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("filter.filter_list",vo);
	}

	@Override
	public List<MoodVo> selectMoodList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("filter.filter_mood_list");
	}

	@Override
	public List<DessertVo> selectDessertList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("filter.filter_dessert_list");
	}

	@Override
	public List<RecommendVo> selectList(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("filter.filter_condition_list",map);
	}
	
}
