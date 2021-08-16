package service;

import java.util.Map;

import vo.PurchaseVo;

public interface PurchaseService {
	public int insertPurchase(PurchaseVo vo) throws Exception;
	
	public Map getPurchaseList(int m_idx,Integer month);
	public Map getPaymentList(int m_idx,int t_idx);
}
