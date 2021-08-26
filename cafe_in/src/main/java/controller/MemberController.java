package controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.MemberDao;
import service.MemberService;
import vo.MemberVo;

@Controller
@RequestMapping("/member/")
public class MemberController {
   
   @Autowired
   HttpSession session;
   
   @Autowired
   HttpServletRequest request;
   
   MemberService member_service;
   
   
   
   public void setMember_service(MemberService member_service) {
	this.member_service = member_service;
   }

   @RequestMapping("login_form.do")
   public String login_form() {
      
      return "member/member_login_form";
   }
   
   @RequestMapping("login.do")
   public String login(MemberVo vo,Model model) {
	   
	   String i_id = vo.getI_id();
	   String i_pwd = vo.getI_pwd();

       //3.m_id�� �ش�Ǵ� MemberVo 1�� ������
       MemberVo user = member_service.selectOne(i_id);
      
       if(user==null) { //ID�� ���°��
         
          model.addAttribute("reason", "fail_id"); 
         
          return "redirect:login_form.do";
       }
      
       //��й�ȣ ��
       if(user.getI_pwd().equals(i_pwd)==false) {
         
         model.addAttribute("reason", "fail_pwd");
         return "redirect:login_form.do";
       }
       
       //�������� �α��λ���
       //���� user�� ����Ҽ� �ִ� session���� ���ϱ�
       session.setAttribute("user", user);
         
       return "redirect:../etc/list.do";
      
    }
   
   //�α׾ƿ�
   @RequestMapping("logout.do")
   public String logout() {
	   
	   session.removeAttribute("user");
	   
	   return "redirect:../etc/list.do";
   }
   
   //������
   @RequestMapping("modify_form.do")
   public String modify_form(int i_idx,Model model) {
	   
	   MemberVo vo = member_service.selectOne(i_idx);
			  
	   model.addAttribute("vo", vo);
		 
	   return "member/member_modify_form";
   }
   
   //����
   @RequestMapping("modify.do")
	public String modify(MemberVo vo) {

		int res = member_service.update(vo);

		return "redirect:../etc/list.do";
	}
   
   //ȸ�������� ����
   @RequestMapping("insert_form.do")
   public String insert_form() {
	   
	   return "member/member_insert_form";
   }
   
    //ȸ������
    @RequestMapping("insert.do")
	public String insert(MemberVo vo, int year, int month, int day) {
		
		int res = member_service.insert(vo, year, month, day);

		return "redirect:login_form.do";
	}
   
    //ȸ�����Խ� �ߺ����̵� üũ
	@RequestMapping("check_id.do")
	@ResponseBody
	public Map check_id(String i_id) {
		
		return member_service.check_id(i_id);
	}
	
	
   
}