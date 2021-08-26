package service;

import java.util.Map;

import vo.CommentVo;

public interface CommentService {
	
	Map selectList(int b_idx,int nowpage);
	
	int selectRowTotal(int b_idx);
	
	Map insert(CommentVo vo) throws Exception;
	
	Map delete(int c_idx) throws Exception;
	
	
	
}
