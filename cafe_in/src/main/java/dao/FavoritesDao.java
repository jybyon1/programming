package dao;

import java.util.List;

import vo.FavoritesVo;

public interface FavoritesDao {



	// ������ ���ɸ�� ��ȸ
	public List<FavoritesVo> selectList(int i_idx);
	
	// ���ɷϷ� insert
	public int insert(FavoritesVo vo);
	
	// ���ɸ�� delete
	public int delete(int f_idx);

	public FavoritesVo selectOne(FavoritesVo vo);

	
	
	
}
