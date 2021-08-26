package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;

import dao.FavoritesDao;
import vo.FavoritesVo;
import vo.MemberVo;

public class FavoritesServiceImpl implements FavoritesService {
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;
	
	FavoritesDao favorites_dao;

	public void setFavorites_dao(FavoritesDao favorites_dao) {
		this.favorites_dao = favorites_dao;
	}

	
	@Override
	public List<FavoritesVo> selectList(int i_idx) {
		// TODO Auto-generated method stub
		
		List<FavoritesVo> list = favorites_dao.selectList(i_idx);
		
		return favorites_dao.selectList(i_idx);
	}

	
	@Override
	public Map delete(int f_idx) {
		// TODO Auto-generated method stub
		
		
		int res = 0;
		
		try {
			res = favorites_dao.delete(f_idx);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		   
		//Map -> JSON코드로 변환 => 결과전송
		Map map = new HashMap();
			
		map.put("result", (res==1) ? "success" : "fail"); // { "result" : "success" }
			
		return map;

	}


	@Override
	public Map insert(FavoritesVo vo) {
		// TODO Auto-generated method stub
		int res = 0;

		Map map = new HashedMap();
				
		try {
			
			
		    //이전 등록사항 확인
			FavoritesVo vo1 = favorites_dao.selectOne(vo);
		    if(vo1!=null) {
		    	
		    	map.put("result", "exists");
		    	return map;
		    }
		    
			
			res = favorites_dao.insert(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		map.put("result", (res==1) ? "success":"fail");	//res가 1이면 success 아니면 fail
														// success시에 { "result" : "success" }
		
		return map;
	}
	
	
}
