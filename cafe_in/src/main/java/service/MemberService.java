package service;

import java.util.Map;

import vo.MemberVo;

public interface MemberService {
	
	public MemberVo selectOne(int i_idx);
	
	public MemberVo selectOne(String i_id);
	
	public int insert(MemberVo vo,int year,int month,int day);
	
	public int update(MemberVo vo);
	
	Map check_id(String i_id); 
	
}
