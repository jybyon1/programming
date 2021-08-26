package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.BoardVo;

public class BoardDaoImpl implements BoardDao {
	
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<BoardVo> selectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.board_list");
	}

	@Override
	public int insert(BoardVo vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("board.board_insert", vo);
	}

	@Override
	public int update(BoardVo vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("board.board_update", vo);
	}

	@Override
	public int update_readhit(int b_idx) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("board.board_update_readhit", b_idx);
	}

	@Override
	public int update_use_yn(int b_idx) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("board.board_update_use_yn", b_idx);
	}

	@Override
	public List<BoardVo> selectList(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.board_list_condition", map);
	}

	@Override
	public BoardVo selectOne(int b_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.board_one", b_idx);
	}

	@Override
	public int selectRowTotal() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.board_row_total");
	}

	@Override
	public int selectRowTotal(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.board_condition_row_total" ,map);
	}
}
