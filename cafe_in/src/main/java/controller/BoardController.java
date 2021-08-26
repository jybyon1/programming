package controller;

import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import service.BoardService;
import vo.BoardVo;
import vo.MemberVo;

@Controller
@RequestMapping("/board/")

public class BoardController {
   
   @Autowired
   ServletContext application;
   
   @Autowired
   HttpServletRequest request;
   
   @Autowired
   HttpSession session;
   
   
   BoardService board_service;
   
   
   public void setBoard_service(BoardService board_service) {
      this.board_service = board_service;
   }


   //�Խ��� ����Ʈ
   @RequestMapping("board_list.do")
   public String board_list(@RequestParam(value="page", required=false,defaultValue="1")        int nowPage, 
                           @RequestParam(value="search",required=false,defaultValue="all")     String search,
                           @RequestParam(value="search_text",required=false,defaultValue="")   String search_text,
                           Model model) {
      

      Map map = board_service.selectList(nowPage, search, search_text);

      
      model.addAttribute("map", map);
      
      return "board/board_list";
   }
   
   
   //�Խñ� �ۼ��� ����
   @RequestMapping("insert_form.do")
   public String board_insert_form() {
         
      
      return "board/board_insert_form";
   }
   
   
   //�Խñ� ����ϱ�
   @RequestMapping("board_insert.do")
   public String insert(BoardVo vo, Model model, @RequestParam MultipartFile photo) throws Exception {
      
      //�߰��� ���ؾ� �� �׸� : b_ip, i_idx, i_name
      MemberVo user = (MemberVo) session.getAttribute("user");
      
      //���� �����...
      if(user==null) {
         model.addAttribute("reason", "end_session");
         return "redirect:../member/member_login_form.do";
      }
      
      board_service.insert(vo, photo);
        
      return "redirect:board_list.do";
   }
   
   
   //�Խñۺ���
   @RequestMapping("board_view.do")
   public String view(int b_idx,Model model) {
      
      BoardVo vo = board_service.selectOne(b_idx);

      int res = board_service.update_readhit(b_idx);
      
      model.addAttribute("vo", vo);
      
      return "board/board_view";
   }
   
   
   //������ ����
   @RequestMapping("modify_form.do")
   public String modify_form(int b_idx, Model model) {
      
      //1.���������� ���� 1�� ������
      BoardVo  vo = board_service.selectOne(b_idx);
      
      // <br> -> \r\n ����
      String b_content = vo.getB_content().replaceAll("<br>", "\r\n");
      vo.setB_content(b_content);
      
      //2.��������� request binding
      model.addAttribute("vo", vo);
      
      return "board/board_modify_form";
   }
   
   
   //�����ϱ�
   @RequestMapping("board_modify.do")
   public String modify(BoardVo vo,
                      @RequestParam(value="search",required=false,defaultValue="all")     String search,
                        @RequestParam(value="search_text",required=false,defaultValue="")   String search_text, 
                      Model model) {
      
      //�߰��� ���ؾ� �� �׸� : b_ip, i_idx, i_name
      MemberVo user = (MemberVo) session.getAttribute("user");
      
      //���� �����...
      if(user==null) {
         model.addAttribute("reason", "end_session");
         return "redirect:../member/member_login_form.do";
      }

      board_service.update(vo, search, search_text);
      
      //model���ؼ� ���޵� �����Ͱ� query�̿�
      model.addAttribute("b_idx", vo.getB_idx());
      model.addAttribute("search", search);
      model.addAttribute("search_text", search_text);
      
      return "redirect:board_view.do";
   }
   
   
   //����...
   @RequestMapping("board_delete.do")
   public String delete(int b_idx,
                       String search,String search_text, 
                       Model model) {
      
      board_service.update_use_yn(b_idx, search, search_text);
      
      //���� model�� ������ DispatcherServlet�� query�� ó��
      model.addAttribute("search", search);
      model.addAttribute("search_text", search_text);
       
      
      return "redirect:board_list.do";
   }

}