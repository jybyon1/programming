package dao;

import java.util.List;
import java.util.Map;

import vo.CafeVo;

public interface EtcDao {

	public List<CafeVo> selectList();

	public List<CafeVo> selectList(Map map);

}
