package dao;

import vo.MemberVo;

public interface MemberDao {
	
	//i_idx�� �ش�Ǵ� ȸ������ 1��
	public MemberVo selectOne(int i_idx);
	
	//i_id�� �ش�Ǵ� ȸ������ 1��
	public MemberVo selectOne(String i_id);
	
	//�߰�
	public int insert(MemberVo vo);
	
	//����
	public int update(MemberVo vo);
}
