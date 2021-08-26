package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.DessertVo;

public class DessertDaoImpl implements DessertDao {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<DessertVo> selectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("dessert.dessert_list");
	}
}
