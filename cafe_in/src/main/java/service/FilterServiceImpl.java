package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import dao.FilterDao;
import vo.DessertVo;
import vo.MoodVo;
import vo.RecommendVo;

public class FilterServiceImpl implements FilterService {
	
	FilterDao filter_dao;

	public void setFilter_dao(FilterDao filter_dao) {
		this.filter_dao = filter_dao;
	}

	@Override
	public Map selectList() {
		// TODO Auto-generated method stub
		List<MoodVo>    mood_list    = filter_dao.selectMoodList();
		List<DessertVo> dessert_list = filter_dao.selectDessertList();

		Map map = new HashMap();
		
		map.put("mood_list", mood_list);
		map.put("dessert_list", dessert_list);

		return map;

	}


	@Override
	public List<RecommendVo> selectList(int [] m_idx, int [] d_idx, 
	          Integer c_nokidz, Integer c_parking, Integer c_alcohol) {
		// TODO Auto-generated method stub
		
		Map map = new HashMap();
	      
		map.put("m_idx_array", m_idx);
	    map.put("d_idx_array", d_idx);
	    if(c_nokidz != null) {
	       map.put("c_nokidz", c_nokidz);
	    }
	    if(c_parking != null) {
	       map.put("c_parking", c_parking);
	    }
	    if(c_alcohol != null) {
	       map.put("c_alcohol", c_alcohol);
	    }

	    List<RecommendVo> list = filter_dao.selectList(map);
	      
		
	    return list;
		
	}
	
	
	
	
}
