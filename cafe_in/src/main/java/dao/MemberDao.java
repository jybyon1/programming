package dao;

import vo.MemberVo;

public interface MemberDao {
	
	//i_idx에 해당되는 회원정보 1건
	public MemberVo selectOne(int i_idx);
	
	//i_id에 해당되는 회원정보 1건
	public MemberVo selectOne(String i_id);
	
	//추가
	public int insert(MemberVo vo);
	
	//수정
	public int update(MemberVo vo);
}
