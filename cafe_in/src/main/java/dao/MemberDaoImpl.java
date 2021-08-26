package dao;

import org.apache.ibatis.session.SqlSession;

import vo.MemberVo;

public class MemberDaoImpl implements MemberDao {

	SqlSession sqlSession;
	
	
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public MemberVo selectOne(int i_idx) {
		//System.out.println("i_idx : " + i_idx);
		
		return sqlSession.selectOne("member.member_one_i_idx", i_idx);
	}

	@Override
	public MemberVo selectOne(String i_id) {
		// TODO Auto-generated method stub
		
		
		return sqlSession.selectOne("member.member_one_i_id",i_id);
	}

	@Override
	public int insert(MemberVo vo) {

		//System.out.println("??:"+vo.toString());
		return sqlSession.insert("member.member_insert",vo);
	}



	@Override
	public int update(MemberVo vo) {
		// TODO Auto-generated method stub
		
		//System.out.println("??:"+vo.toString());
		return sqlSession.update("member.member_update",vo);
	}
	
	
	
}
