package dao;

import java.util.List;

import vo.CafeVo;
import vo.DessertFilterVo;
import vo.DessertVo;
import vo.MoodFilterVo;
import vo.MoodVo;

public interface UploadDao {
	
	

	public List<CafeVo> selectList();
	

	public CafeVo selectOne(int c_idx);
	
	public int insert(CafeVo vo);	
	
	public int delete(int c_idx);
	
	public int update(CafeVo vo);


	public int selectCafeIdx();


	public int insert_mood(MoodFilterVo vo);


	public int insert_dessert(DessertFilterVo vo1);


	public List<MoodFilterVo> selectMoodList(int c_idx);


	public List<DessertFilterVo> selectDessertList(int c_idx);


	

	public List<MoodVo> selectMoodList();


	public List<DessertVo> selectDessertList();


	public List<CafeVo> selectListUpload();


	public int mood_filter_delete(int c_idx);


	public int dessert_filter_delete(int c_idx);



	
}
