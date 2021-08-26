package service;

import java.util.List;

import org.springframework.ui.Model;

import vo.CafeVo;

public interface EtcService {

	List<CafeVo> selectList();

	List<CafeVo> recommend_selectList(String search_text, Model model);

	
}
