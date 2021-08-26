package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import dao.EtcDao;
import vo.CafeVo;

public class EtcServiceImpl implements EtcService {
	
	EtcDao etc_dao;

	public void setEtc_dao(EtcDao etc_dao) {
		this.etc_dao = etc_dao;
	}

	
	@Override
	public List<CafeVo> selectList() {
		// TODO Auto-generated method stub
		
		return etc_dao.selectList();
	}
	
	
	// 검색 결과 창 recommend_search_list	
	@Override
	public List<CafeVo> recommend_selectList(@RequestParam(value = "search_text", required = false, defaultValue = "") String search_text, Model model) {

		Map map = new HashMap();
		map.put("search_text", search_text);

		List<CafeVo> list = etc_dao.selectList(map);

		return list;
	}
	
}
