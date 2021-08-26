package dao;

import java.util.List;
import java.util.Map;

import vo.CafeVo;
import vo.ReviewVo;

public interface CafeDao {
	
	//목록 조회
	public List<CafeVo> selectList();

	// 검색 조회
	public List<CafeVo> selectList(Map map);
	
}
