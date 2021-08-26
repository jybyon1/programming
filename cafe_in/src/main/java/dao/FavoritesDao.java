package dao;

import java.util.List;

import vo.FavoritesVo;

public interface FavoritesDao {



	// 유저별 관심목록 조회
	public List<FavoritesVo> selectList(int i_idx);
	
	// 관심록록 insert
	public int insert(FavoritesVo vo);
	
	// 관심목록 delete
	public int delete(int f_idx);

	public FavoritesVo selectOne(FavoritesVo vo);

	
	
	
}
