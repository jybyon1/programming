package dao;

import java.util.List;

import vo.RecommendVo;

public interface RecommendDao {
	
	//목록 조회
	public List<RecommendVo> selectList();
	
}
