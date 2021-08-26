package controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import service.FavoritesService;
import vo.FavoritesVo;
import vo.MemberVo;

@Controller
@RequestMapping("/favorites/")
public class FavoritesController {
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;
	
	FavoritesService favorites_service;

	public void setFavorites_service(FavoritesService favorites_service) {
		this.favorites_service = favorites_service;
	}

	
	// 가고싶다 목록 조회
	@RequestMapping("favorites_list.do")
	public String list(Model model) {
		
		//로그인된 사용자 정보를를 직접얻오오기때문에 int i_idx를 인자로 넣을 필요가 없지 오히려 넣으면 에러나지..
		//넘겨주지를 않기때문에 불필요한 변수가 되는거지....
		MemberVo user =  (MemberVo) session.getAttribute("user");
		
		//로그인 안된상태
		if(user==null) {
			model.addAttribute("reason", "end_session");
			return "redirect:../member/login_form.do";
		}
		
		
		List<FavoritesVo> list = favorites_service.selectList(user.getI_idx());
		
		model.addAttribute("list",list);
		
		return "/favorites/favorites_list";

	}
	
	// 가고싶다 삭제
	@RequestMapping("favorites_delete.do")
	@ResponseBody
	public Map delete(int f_idx) {
		
		Map map = favorites_service.delete(f_idx);

		return map;
	}
	
	// 가고싶다 추가
	@RequestMapping("favorites_insert.do")
	@ResponseBody
	public Map insert(FavoritesVo vo) {	
		
		Map map = favorites_service.insert(vo);
		
		return map;
	}
	
	
}
