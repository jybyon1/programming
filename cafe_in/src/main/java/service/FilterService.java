package service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import vo.RecommendVo;

public interface FilterService {

	Map selectList();


	List<RecommendVo> selectList(int[] m_idx, int[] d_idx, Integer c_nokidz, Integer c_parking, Integer c_alcohol);

}
