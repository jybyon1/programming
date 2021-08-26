package service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import dao.MemberDao;
import vo.MemberVo;

public class MemberServiceImpl implements MemberService {
	
	MemberDao member_dao;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;
	
	public void setMember_dao(MemberDao member_dao) {
		this.member_dao = member_dao;
	}

	@Override
	public MemberVo selectOne(int i_idx) {
		// TODO Auto-generated method stub
		return member_dao.selectOne(i_idx);
	}

	@Override
	public MemberVo selectOne(String i_id) {
		// TODO Auto-generated method stub

		return member_dao.selectOne(i_id);
	}

	@Override
	public int insert(MemberVo vo, int year, int month, int day) {
		// TODO Auto-generated method stub
		
		String i_ip = request.getRemoteAddr();
		vo.setI_ip(i_ip);
		
		String i_birth = String.format("%d-%02d-%02d", year,month,day);
		vo.setI_birth(i_birth);
		
		return member_dao.insert(vo);
	}

	@Override
	public int update(MemberVo vo) {
		// TODO Auto-generated method stub
		String i_ip = request.getRemoteAddr();
		vo.setI_ip(i_ip);
		
		return member_dao.update(vo);
	}

	@Override
	public Map check_id(String i_id) {
		// TODO Auto-generated method stub
		
		MemberVo  vo = member_dao.selectOne(i_id);
		
		Map map = new HashMap();
		map.put("result", (vo==null));
		
		return map;
	}

	
	
	
	
	

}
