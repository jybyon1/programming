package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import dao.ReviewDao;
import mycommon.MyConstant;
import util.Paging;
import vo.ReviewVo;
import vo.ThumbVo;

@Service
public class ReviewServiceImpl implements ReviewService {

	ReviewDao review_dao;

	public void setReview_dao(ReviewDao review_dao) {
		this.review_dao = review_dao;
	}

	@Override
	public Map selectList(int c_idx,int nowPage) {
		// TODO Auto-generated method stub
		int start = (nowPage - 1) * MyConstant.Review.BLOCK_LIST + 1;
		int end = start + MyConstant.Review.BLOCK_LIST - 1;

		Map map = new HashMap();
		map.put("c_idx", c_idx);
		map.put("start", start);
		map.put("end", end);

		List<ReviewVo> list = review_dao.selectList(map);
		
		 //c_idx에 달린 리뷰의 갯수
	      int row_total = selectRowTatal(c_idx);
	      
	      String pageMenu = Paging.getReviewPaging(nowPage, row_total, 
	                                      MyConstant.Review.BLOCK_LIST, 
	                                      MyConstant.Review.BLOCK_PAGE);
	      
		Map resultMap = new HashMap();
		resultMap.put("list", list);
		if(row_total>0){
			resultMap.put("pageMenu", pageMenu);
			}
		return resultMap;
	}

	@Override
	public int selectRowTatal(int c_idx) {
		// TODO Auto-generated method stub
		return review_dao.selectRowTatal(c_idx);
	}

	@Override
	public Map insert(ReviewVo vo) {
		// TODO Auto-generated method stub
		String c_content = vo.getR_content().replaceAll("\n", "<br>");
		vo.setR_content(c_content);

		int res = 0;
		try {
			res = review_dao.insert(vo);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// Map -> JSON코드로 변환 => 결과전송
		Map map = new HashMap();

		map.put("result", (res == 1) ? "success" : "fail"); // { "result" : "success" }

		return map;
	}

	@Override
	public Map delete(int r_idx) {
		// TODO Auto-generated method stub

		int res = 0;

		try {
			res = review_dao.delete(r_idx);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// Map -> JSON코드로 변환 => 결과전송
		Map map = new HashMap();

		map.put("result", (res == 1) ? "success" : "fail"); // { "result" : "success" }

		return map;
	}

	//service로 수정
	@Override
	public Map thumb_insert(ThumbVo vo) {
		// TODO Auto-generated method stub
		Map map = new HashMap();	

		ThumbVo thumb = review_dao.selectOne(vo);	

		if(thumb!=null) {
			int res = review_dao.delete_thumb(vo);
			int cnt = review_dao.selectCount(vo.getR_idx());
			
			map.put("result","cancle_success");
			map.put("count", cnt);
			
		}else {
			int res = review_dao.insert_thumb(vo);
			int cnt = review_dao.selectCount(vo.getR_idx());
			
			map.put("result","success");
			map.put("count", cnt);
		}
		
		return map;
	}
	

	@Override
	public ThumbVo selectOne(ThumbVo vo) {
		// TODO Auto-generated method stub
		return review_dao.selectOne(vo);
	}

	@Override
	public int delete_thumb(ThumbVo vo) {
		// TODO Auto-generated method stub
		return review_dao.delete_thumb(vo);
	}

	@Override
	public int selectCount(int r_idx) {
		// TODO Auto-generated method stub
		return review_dao.selectCount(r_idx);
	}

	@Override
	public int insert_thumb(ThumbVo vo) {
		// TODO Auto-generated method stub
		return review_dao.insert_thumb(vo);
	}

}
