package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.CafeVo;
import vo.DessertFilterVo;
import vo.DessertVo;
import vo.MoodFilterVo;
import vo.MoodVo;

public class UploadDaoImpl implements UploadDao {

	SqlSession sqlSession;
	
	
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<CafeVo> selectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("upload.upload_list");
	}

	@Override
	public CafeVo selectOne(int c_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("upload.upload_one",c_idx);
	}
	

	@Override
	public int insert(CafeVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("upload.upload_insert",vo);
	}

	@Override
	public int delete(int c_idx) {
		// TODO Auto-generated method stub
		return sqlSession.delete("upload.upload_delete",c_idx);
	}

	@Override
	public int update(CafeVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.update("upload.upload_update",vo);
	}

	@Override
	public int selectCafeIdx() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("upload.upload_select_c_idx");
	}

	@Override
	public int insert_mood(MoodFilterVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("upload.insert_mood",vo);
	}

	@Override
	public int insert_dessert(DessertFilterVo vo1) {
		// TODO Auto-generated method stub
		return sqlSession.insert("upload.insert_dessert",vo1);
	}

	@Override
	public List<MoodFilterVo> selectMoodList(int c_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("upload.mood_list",c_idx);
	}

	@Override
	public List<DessertFilterVo> selectDessertList(int c_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("upload.dessert_list",c_idx);
	}

	
	@Override
	public List<MoodVo> selectMoodList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("upload.dessertfilter_list");
	}

	@Override
	public List<DessertVo> selectDessertList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CafeVo> selectListUpload() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("upload.upload_selectlist");
	}

	@Override
	public int mood_filter_delete(int c_idx) {
		// TODO Auto-generated method stub
		return sqlSession.delete("upload.mood_filter_delete",c_idx);
	}

	@Override
	public int dessert_filter_delete(int c_idx) {
		// TODO Auto-generated method stub
		return sqlSession.delete("upload.dessert_filter_delete",c_idx);
	}

}
