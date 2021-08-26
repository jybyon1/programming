package controller;

import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import service.ReviewService;
import vo.ReviewVo;
import vo.ThumbVo;

@Controller
@RequestMapping("/review/")
public class ReviewController {
	
	@Autowired
	ServletContext application;
	
	HttpServletRequest request;
	
	ReviewService review_service;
	
   public void setReview_service(ReviewService review_service) {
		this.review_service = review_service;
	}
   
	@RequestMapping("list.do")
	   public String review_list(int c_idx,
	         @RequestParam(value = "page", required = false, defaultValue = "1") int nowPage,
	         Model model) {
	      
			Map map = review_service.selectList(c_idx, nowPage);

			model.addAttribute("map", map);
			
	      return "review/review_list";
	   }

	
	// ∏Æ∫‰¿€º∫ ∆˚
	@RequestMapping("review_form.do")
	public String review_insert_form() {

		return "review/review_insert_form";
	}


	// ∏Æ∫‰¿€º∫
	// /comment/insert.do?r_content=s&r_star=1&c_idx=3&m_id=admin
	@RequestMapping("insert.do")
	@ResponseBody
	public Map insert(ReviewVo vo) {
		
		return review_service.insert(vo);
	}
	
   //∏Æ∫‰ªË¡¶
   // /comment/delete.do?c_idx=4;
   @RequestMapping("delete.do") 
   @ResponseBody
   public Map delete(int r_idx) {
   
   return review_service.delete(r_idx);
	   
   }
   
   //¡¡æ∆ø‰
	@RequestMapping("thumb_insert.do")
	@ResponseBody
	public Map thumb_insert(ThumbVo vo) {
		
	return	review_service.thumb_insert(vo);
	}
	   
	   
}
