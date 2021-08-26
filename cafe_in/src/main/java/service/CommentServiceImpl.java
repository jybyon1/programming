package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import dao.CommentDao;
import mycommon.MyConstant;
import util.Paging;
import vo.CommentVo;

public class CommentServiceImpl implements CommentService {

	@Autowired
	HttpServletRequest request;
	
	CommentDao comment_dao;

	public void setComment_dao(CommentDao comment_dao) {
		this.comment_dao = comment_dao;
	}
	

	@Override
	public Map selectList(int b_idx,int nowPage) {
		// TODO Auto-generated method stub
		
		int start = (nowPage-1) * MyConstant.Comment.BLOCK_LIST + 1;
		int end   = start + MyConstant.Comment.BLOCK_LIST - 1;
		
		Map map = new HashMap();
		map.put("b_idx", b_idx);
		map.put("start", start);
		map.put("end", end);
		

		List<CommentVo> list = comment_dao.selectList(map);
		
		int row_total = comment_dao.selectRowTotal(b_idx);
		
		String pageMenu = Paging.getCommentPaging(nowPage, row_total, 
												  MyConstant.Comment.BLOCK_LIST,
												  MyConstant.Comment.BLOCK_PAGE);
		
		Map resultMap = new HashMap();
		resultMap.put("list", list);

		if(row_total>0) {
			resultMap.put("pageMenu", pageMenu);
		}

		return resultMap;
	}


	@Override
	public int selectRowTotal(int b_idx) {
		// TODO Auto-generated method stub
		return comment_dao.selectRowTotal(b_idx);
	}

	@Override
	public Map insert(CommentVo vo) throws Exception {
		// TODO Auto-generated method stub
		String c_content = vo.getC_content().replaceAll("\r\n", "<br>");
		vo.setC_content(c_content);
		
		//IP���ϱ�
		String c_ip = request.getRemoteAddr();
		vo.setC_ip(c_ip);
				
		
		int res = 0;
		try {
			res = comment_dao.insert(vo);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Map map = new HashMap();
		
		map.put("result", (res==1) ? "success": "fail"); // {"result":"success"}
		
		return map;
	}

	@Override
	public Map delete(int c_idx) throws Exception {
		// TODO Auto-generated method stub
		int res = 0;
		
		try {
			res = comment_dao.delete(c_idx);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Map map = new HashMap();
		
		map.put("result", (res==1) ? "success": "fail"); // {"result":"success"}
		
		return map;
	}

}
