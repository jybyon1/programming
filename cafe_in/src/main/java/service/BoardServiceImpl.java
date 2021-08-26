package service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dao.BoardDao;
import mycommon.MyConstant;
import util.Paging;
import vo.BoardVo;
import vo.MemberVo;

public class BoardServiceImpl implements BoardService {
   
   BoardDao board_dao;
   
   @Autowired
   ServletContext application;
   
   @Autowired
   HttpServletRequest request;
   
   @Autowired
   HttpSession session;

   public void setBoard_dao(BoardDao board_dao) {
      this.board_dao = board_dao;
   }

   @Override
   public Map selectList(int nowPage, String search, String search_text) {
      //현재 보여질 페이지 : nowPage

      //가져올 범위계산
      int start = (nowPage-1) * MyConstant.Board.BLOCK_LIST + 1;
      int end   = start + MyConstant.Board.BLOCK_LIST - 1;
      
      Map map = new HashMap();
      map.put("start", start);
      map.put("end", end);
      
      //검색조건을 Map에 추가
      if(search.equals("name")) {
          map.put("name", search_text);   
      }else if(search.equals("subject")) {
         map.put("subject", search_text);   
      }else if(search.equals("content")) {
         map.put("content", search_text);   
      }else if(search.equals("subject_content")) {
         map.put("subject", search_text);
         map.put("content", search_text);   
      }
      
      List<BoardVo> list = board_dao.selectList(map);
      
      int rowTotal = selectRowTotal(map);
      
      String search_filter = String.format("&search=%s&search_text=%s", search,search_text);
      
      String pageMenu = Paging.getPaging("board_list.do", nowPage, rowTotal, search_filter, 
                                 MyConstant.Board.BLOCK_LIST, 
                                 MyConstant.Board.BLOCK_PAGE);
      
      Map resultMap = new HashMap();
      resultMap.put("list", list);
      resultMap.put("pageMenu", pageMenu);
      
      //board_view.do에서 봤냐?에 대한정보 기록해놓은 값 => 제거
      session.removeAttribute("show");
      
      
      return resultMap;
   }
   
   @Override
   public int selectRowTotal(Map map) {
      // TODO Auto-generated method stub
      return board_dao.selectRowTotal(map);
   }



   @Override
   public int insert(BoardVo vo, @RequestParam MultipartFile photo) throws Exception, IOException {

      //추가로 구해야 할 항목 : b_ip, i_idx, i_name
      MemberVo user = (MemberVo) session.getAttribute("user");
      
       //저장할 웹경로
       String web_path = "/resources/upload/";
       //웹경로->절대경로 얻어온다( 처리객체 : ServletContext application )
       String save_dir = application.getRealPath(web_path);
          
       //업로드된 파일정보 구하기
       String filename = "no_file";

       // 첨부파일 업로드
       if(!photo.isEmpty()) {
          
          //(임시경로에)저장파일명
          filename = photo.getOriginalFilename();
             
          //저장할 파일정보 설정
          File f = new File(save_dir,filename);
             
          //동일 파일 여부 체크(동일파일명이 없을때까지 반복)
          while(f.exists()) { //파일명이 같은 파일 있으면
                  
             long time = System.currentTimeMillis();

             filename = String.format("%d_%s", time,filename);
                  
             f = new File(save_dir,filename);
          }
             
          //업로드된 파일정보 얻어오기
          vo.setB_photo(filename);
             
          //임시->복사
          photo.transferTo(f);
        }
   
        //\r\n  ->   <br> 변경
        String b_content = vo.getB_content().replaceAll("\r\n", "<br>");
        vo.setB_content(b_content);
           
        //유저번호와 이름을 vo에 담는다
        vo.setI_idx(user.getI_idx());
        vo.setI_name(user.getI_name());
           
        //ip 구하기
        String b_ip = request.getRemoteAddr();
        vo.setB_ip(b_ip);
             
        //DB Insert
        int res = 0;
        
        try {
            
           res = board_dao.insert(vo);
            
        } catch (Exception e) {
           // TODO Auto-generated catch block
           e.printStackTrace();
        }
             
        return res;
   }

   @Override
   public BoardVo selectOne(int b_idx) {
      // TODO Auto-generated method stub
      
      return board_dao.selectOne(b_idx);
   }

   @Override
   public int update_readhit(int b_idx) {
      
      int res = 0;
      
      //조회수 증가
      try {
         
         //게시물을 봤냐?
         if(session.getAttribute("show")==null) {
             //안봤으면  null
             res = board_dao.update_readhit(b_idx);//조회수증가
             
             //봤다고 기록
             session.setAttribute("show", true);
         }
         
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }      
      
      return res;
   }

   @Override
   public int update(BoardVo vo, String search, String search_text) {
      // TODO Auto-generated method stub   
      //추가로 구해야 할 항목 : b_ip, i_idx, i_name
      MemberVo user = (MemberVo) session.getAttribute("user");
            
      //유저번호와 이름을 vo에 담는다
      vo.setI_idx(user.getI_idx());
      vo.setI_name(user.getI_name());
      
      //작성자IP
      String b_ip = request.getRemoteAddr();
      vo.setB_ip(b_ip);
      
      //\r\n -> <br>
      String b_content = vo.getB_content().replaceAll("\r\n", "<br>");
      vo.setB_content(b_content);
      
      int res = 0;
      
      //DB update
      try {      
         res = board_dao.update(vo);
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      return res;
   }

   @Override
   public int update_use_yn(int b_idx, String search, String search_text) {
      // TODO Auto-generated method stub
      
	   BoardVo vo = board_dao.selectOne(b_idx);
	      
	      String web_path = "/resources/upload/";
	      
	      String save_dir = application.getRealPath(web_path);
	      
	      //4. 파일삭제
	        File f = new File(save_dir, vo.getB_photo());
	        f.delete();
	      
	      int res = 0;
	      
	      try {
	         res = board_dao.update_use_yn(b_idx);
	      } catch (Exception e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      
	      return res;
   }


}