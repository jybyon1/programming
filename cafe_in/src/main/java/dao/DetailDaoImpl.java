package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.CafeVo;
import vo.DessertFilterVo;
import vo.DessertVo;
import vo.MoodFilterVo;
import vo.MoodVo;

public class DetailDaoImpl implements DetailDao {

	SqlSession sqlSession;
	
	
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}


	@Override
	public CafeVo selectOne(int c_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("detail.cafe_one",c_idx);
	}
	

	@Override
	public int insert(CafeVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("detail.cafe_insert",vo);
	}


	@Override
	public int delete(int c_idx) {
		// TODO Auto-generated method stub
		return sqlSession.delete("detail.cafe_delete",c_idx);
	}

	
	@Override
	public int update(CafeVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.update("detail.cafe_update",vo);
	}


	@Override
	public int selectCafeIdx() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("detail.cafe_select_c_idx");
	}


	@Override
	public int insert_mood(MoodFilterVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("detail.insert_mood",vo);
	}


	@Override
	public int insert_dessert(DessertFilterVo vo1) {
		// TODO Auto-generated method stub
		return sqlSession.insert("detail.insert_dessert",vo1);
	}


	@Override
	public List<MoodFilterVo> selectMoodList(int c_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("detail.mood_list",c_idx);
	}


	@Override
	public List<DessertFilterVo> selectDessertList(int c_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("detail.dessert_list",c_idx);
	}



	@Override
	public int mood_filter_delete(int c_idx) {
		// TODO Auto-generated method stub
		return sqlSession.delete("detail.mood_filter_delete",c_idx);
	}


	@Override
	public int dessert_filter_delete(int c_idx) {
		// TODO Auto-generated method stub
		return sqlSession.delete("detail.dessert_filter_delete",c_idx);
	}



}
