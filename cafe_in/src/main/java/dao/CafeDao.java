package dao;

import java.util.List;
import java.util.Map;

import vo.CafeVo;
import vo.ReviewVo;

public interface CafeDao {
	
	//��� ��ȸ
	public List<CafeVo> selectList();

	// �˻� ��ȸ
	public List<CafeVo> selectList(Map map);
	
}
