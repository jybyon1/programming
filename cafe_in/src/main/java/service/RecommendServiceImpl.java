package service;

import java.util.List;

import dao.RecommendDao;
import vo.RecommendVo;

public class RecommendServiceImpl implements RecommendService {
	
	RecommendDao recommend_dao;

	public void setRecommend_dao(RecommendDao recommend_dao) {
		this.recommend_dao = recommend_dao;
	}

	@Override
	public List<RecommendVo> selectList() {
		// TODO Auto-generated method stub
		
		List<RecommendVo> list = recommend_dao.selectList();
		
		return list;
	}


	
}
