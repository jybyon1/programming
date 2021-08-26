package controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.EtcService;
import vo.CafeVo;

@Controller
@RequestMapping("/etc/")
public class EtcController {
	
	@Autowired
	ServletContext application;
   
	@Autowired
	HttpServletRequest request;
	
	EtcService		etc_service;

	
	public void setEtc_service(EtcService etc_service) {
		this.etc_service = etc_service;
	}


	
	//메인 화면 카페 목록
	@RequestMapping("list.do")
	public String list(Model model) {
		
		List<CafeVo> list = etc_service.selectList();
	      
	    model.addAttribute("list", list);
	      
		
		return "etc/main_list";
	}
	
	// 카페 이름 검색 결과 recommend_search_list
	@RequestMapping("recommend_search_list.do")
	public String recommend_list(@RequestParam(value = "search_text", required = false, defaultValue = "") String search_text,Model model) {

		List<CafeVo> list = etc_service.recommend_selectList(search_text,model);

		model.addAttribute("list", list);

		return "etc/recommend_list";
	}


	
	@RequestMapping("only_menu.do")
	public String only_menu() {
		
		return "etc/only_menu";
	}
	

	

	
}
	
