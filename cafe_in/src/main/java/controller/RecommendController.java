package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.RecommendDao;
import service.RecommendService;
import vo.RecommendVo;

@Controller
@RequestMapping("/etc/")
public class RecommendController {

	RecommendService recommend_service;

	public void setRecommend_service(RecommendService recommend_service) {
		this.recommend_service = recommend_service;
	}




	// 추천카페
	@RequestMapping("recommend_list.do")
	public String list(Model model) {
		
		List<RecommendVo> list = recommend_service.selectList();
		
		model.addAttribute("list",list);
		
		return "etc/recommend_list";
	}

}
