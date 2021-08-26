package dao;

import java.util.List;
import java.util.Map;

import vo.CommentVo;

public interface CommentDao {
	
	List<CommentVo> selectList(Map map);
	List<CommentVo> selectList(int b_idx);
	int 			selectRowTotal(int b_idx);
	
	
	int             insert(CommentVo vo) throws Exception;
	int             delete(int c_idx)    throws Exception;

	default int    update(CommentVo vo)  throws Exception { return  0; }

}
