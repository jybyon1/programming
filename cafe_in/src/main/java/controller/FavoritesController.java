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

	
	// ����ʹ� ��� ��ȸ
	@RequestMapping("favorites_list.do")
	public String list(Model model) {
		
		//�α��ε� ����� �������� ����������⶧���� int i_idx�� ���ڷ� ���� �ʿ䰡 ���� ������ ������ ��������..
		//�Ѱ������� �ʱ⶧���� ���ʿ��� ������ �Ǵ°���....
		MemberVo user =  (MemberVo) session.getAttribute("user");
		
		//�α��� �ȵȻ���
		if(user==null) {
			model.addAttribute("reason", "end_session");
			return "redirect:../member/login_form.do";
		}
		
		
		List<FavoritesVo> list = favorites_service.selectList(user.getI_idx());
		
		model.addAttribute("list",list);
		
		return "/favorites/favorites_list";

	}
	
	// ����ʹ� ����
	@RequestMapping("favorites_delete.do")
	@ResponseBody
	public Map delete(int f_idx) {
		
		Map map = favorites_service.delete(f_idx);

		return map;
	}
	
	// ����ʹ� �߰�
	@RequestMapping("favorites_insert.do")
	@ResponseBody
	public Map insert(FavoritesVo vo) {	
		
		Map map = favorites_service.insert(vo);
		
		return map;
	}
	
	
}
