package controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.DessertService;
import service.DetailService;
import service.MoodService;
import vo.CafeVo;
import vo.DessertVo;
import vo.MoodVo;

@Controller
@RequestMapping("/detail/")
public class DetailController {

	@Autowired
	ServletContext application;

	@Autowired
	HttpServletRequest request;

	DetailService	detail_service;
	DessertService	dessert_service;
	MoodService		mood_service;
	
	
	public void setDetail_service(DetailService detail_service) {
		this.detail_service = detail_service;
	}
	
	public void setDessert_service(DessertService dessert_service) {
		this.dessert_service = dessert_service;
	}

	public void setMood_service(MoodService mood_service) {
		this.mood_service = mood_service;
	}



	//해당 카페 디테일 페이지 
	@RequestMapping("detail_list.do")
	public String cafe_detail(int c_idx ,Model model) {
		
		CafeVo vo = detail_service.selectOne(c_idx);
		
		model.addAttribute("vo",vo);

		return "detail/detail_list";
	}
	
	// insert form 
	@RequestMapping("detail_insert_form.do")
	public String detail_insert_form(int c_idx ,Model model) {
		
		CafeVo vo = detail_service.selectOne(c_idx);
	      
		model.addAttribute("vo",vo);
	      
		return "detail/detail_insert_form";
	}
	
	// insert 
	@RequestMapping("insert.do")
	public String cafe_insert(CafeVo vo, @RequestParam(value = "m_idx", required = false) int[] m_idx_array,
									@RequestParam(value = "d_idx", required = false) int[] d_idx_array, Model model) throws Exception {

		detail_service.insert(vo, m_idx_array, d_idx_array, model);
		

		return "redirect:../etc/list.do";

	}

	// modify form 
	@RequestMapping("detail_modify_form.do")
	public String cafe_modify_form(int c_idx, Model model) {

		CafeVo vo = detail_service.selectOne(c_idx);
		List<MoodVo> mood_list = mood_service.selectList();
		List<DessertVo> dessert_list = dessert_service.selectList();

		
		model.addAttribute("vo", vo);
		model.addAttribute("mood_list", mood_list);
		model.addAttribute("dessert_list", dessert_list);

		return "detail/detail_modify_form";
	}
	
	
	// 수정하기 
	@RequestMapping("modify.do")
	public String cafe_modify(CafeVo vo, 
						 @RequestParam(value = "m_idx", required = false) int[] m_idx_array,
						 @RequestParam(value = "d_idx", required = false) int[] d_idx_array, 
						 Model model) {
		
		// 등록된 Cafe c_idx : select max(c_idx) from cafe
		int c_idx = vo.getC_idx();
		
		detail_service.update(vo, m_idx_array, d_idx_array);

		return "redirect:../detail/detail_list.do?c_idx=" + c_idx;
	}

	
	// delete
	@RequestMapping("delete.do")
	public String cafe_delete(int c_idx,Model model) {

		
		detail_service.delete(c_idx);
		
		return "redirect:../etc/list.do";

	}

	
	// 카페 업로드 폼 
	@RequestMapping("cafe_upload_form.do")
	public String cafe_upload_form(Model model) {
		
		List<MoodVo> m_list = mood_service.selectList();
		List<DessertVo> d_list = dessert_service.selectList();
		
		model.addAttribute("m_list",m_list);
		model.addAttribute("d_list",d_list);
		
		return "detail/cafe_upload_form";
	}

}
