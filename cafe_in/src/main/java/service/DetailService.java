package service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import vo.CafeVo;
import vo.DessertFilterVo;
import vo.MoodFilterVo;

public interface DetailService {

	CafeVo selectOne(int c_idx);

	void insert(CafeVo vo, int[] m_idx_array, int[] d_idx_array, Model model) throws Exception;

	void update(CafeVo vo, int[] m_idx_array, int[] d_idx_array);

	void delete(int c_idx);
	
}
