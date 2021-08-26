package controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import service.CommentService;
import vo.CommentVo;

@Controller
@RequestMapping("/comment/")
public class CommentController {
	
	@Autowired
	HttpServletRequest request;
	
	CommentService comment_service;

	
	
	public void setComment_service(CommentService comment_service) {
		this.comment_service = comment_service;
	}

	//�Խù�(b_idx)�� ��۸��
	@RequestMapping("list.do")
	public String  list(int b_idx,
						@RequestParam(value="page", required=false, defaultValue="1") int nowPage,
			Model model){
		
		Map map = comment_service.selectList(b_idx, nowPage);
		
		model.addAttribute("map",map);
		
		return "comment/comment_list";
	}
	
	//��۾���
	@RequestMapping("insert.do")
	@ResponseBody
	public Map  insert(CommentVo vo) throws Exception {
		
		
	      
	      return comment_service.insert(vo);
	}
	
	//��ۻ���
	@RequestMapping("delete.do")
	@ResponseBody
	public Map delete(int c_idx) throws Exception {
		
		
	      
	      return comment_service.delete(c_idx);
		
	}

}
