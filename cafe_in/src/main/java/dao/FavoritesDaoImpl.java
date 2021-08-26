package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.FavoritesVo;

public class FavoritesDaoImpl implements FavoritesDao {
	
	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// ����ʹ� ��ȸ
	@Override
	public List<FavoritesVo> selectList(int i_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("favorites.favorites_list",i_idx);
	}
	
	
	
	// ����ʹ� ����
	@Override
	public int delete(int f_idx) {
		// TODO Auto-generated method stub
		return sqlSession.delete("favorites.favorites_delete",f_idx);
	}

	// ����ʹ� �߰�
	@Override
	public int insert(FavoritesVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("favorites.favorites_insert",vo);
	}

	@Override
	public FavoritesVo selectOne(FavoritesVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("favorites.favorites_one",vo);
	}



	
	
	
	
}
