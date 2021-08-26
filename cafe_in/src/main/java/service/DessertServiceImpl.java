package service;

import java.util.List;

import dao.DessertDao;
import vo.DessertVo;

public class DessertServiceImpl implements DessertService {
	
	DessertDao dessert_dao;

	public void setDessert_dao(DessertDao dessert_dao) {
		this.dessert_dao = dessert_dao;
	}

	@Override
	public List<DessertVo> selectList() {
		// TODO Auto-generated method stub
		return dessert_dao.selectList();
	}
	
	
}
