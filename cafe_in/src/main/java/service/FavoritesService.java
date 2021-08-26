package service;

import java.util.List;
import java.util.Map;

import vo.FavoritesVo;

public interface FavoritesService {

	List<FavoritesVo> selectList(int i_idx);

	Map delete(int f_idx);

	Map insert(FavoritesVo vo);

}
