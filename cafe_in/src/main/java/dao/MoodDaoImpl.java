package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.MoodVo;

public class MoodDaoImpl implements MoodDao {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<MoodVo> selectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mood.mood_list");
	}
}
