package service;

import java.util.Map;

import vo.ReviewVo;
import vo.ThumbVo;

public interface ReviewService {

	Map selectList(int c_idx,int nowPage);

	int selectRowTatal(int c_idx);

	Map insert(ReviewVo vo);

	Map delete(int r_idx);

	ThumbVo selectOne(ThumbVo vo);

	int delete_thumb(ThumbVo vo);

	int selectCount(int r_idx);

	int insert_thumb(ThumbVo vo);
	
	Map thumb_insert(ThumbVo vo);
	
}
