package dao;

import java.util.List;

import vo.CafeVo;
import vo.DessertFilterVo;
import vo.DessertVo;
import vo.MoodFilterVo;
import vo.MoodVo;

public interface DetailDao {

	CafeVo selectOne(int c_idx);

	int insert(CafeVo vo);

	int delete(int c_idx);

	int update(CafeVo vo);

	int selectCafeIdx();

	int insert_mood(MoodFilterVo vo);

	int insert_dessert(DessertFilterVo vo1);

	List<MoodFilterVo> selectMoodList(int c_idx);

	List<DessertFilterVo> selectDessertList(int c_idx);

	int mood_filter_delete(int c_idx);

	int dessert_filter_delete(int c_idx);



	
}
