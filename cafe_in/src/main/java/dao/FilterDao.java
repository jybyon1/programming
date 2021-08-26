package dao;

import java.util.List;
import java.util.Map;

import vo.CafeSearchVo;
import vo.CafeVo;
import vo.DessertVo;
import vo.MoodVo;
import vo.RecommendVo;

public interface FilterDao {

	List<CafeSearchVo> selectList(CafeSearchVo vo);

	List<MoodVo> selectMoodList();
	
	List<DessertVo> selectDessertList();

	List<RecommendVo> selectList(Map map);
	
}
