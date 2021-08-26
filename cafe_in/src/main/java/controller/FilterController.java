package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.FilterDao;
import service.FilterService;
import vo.CafeSearchVo;
import vo.CafeVo;
import vo.DessertVo;
import vo.MoodVo;
import vo.RecommendVo;

@Controller
public class FilterController {

	FilterService filter_service;
	
	
	
	public void setFilter_service(FilterService filter_service) {
		this.filter_service = filter_service;
	}

	@RequestMapping("/filter_list.do")
	@ResponseBody
	public Map filter_list(Model model) {
		
		Map map = filter_service.selectList();
		
		model.addAttribute("map",map);
		
		return map;
		
	}
	

   
   @RequestMapping("/filter_register.do")
   public String register(int [] m_idx, int [] d_idx, 
          Integer c_nokidz, Integer c_parking, Integer c_alcohol,Model model) {
	   

	  List<RecommendVo> list = filter_service.selectList(m_idx, d_idx, c_nokidz, c_parking, c_alcohol);
      
	  model.addAttribute("list", list);

      
      return "etc/filter_list"; 
   }
	

}
