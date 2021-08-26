package service;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import dao.DessertDao;
import dao.DetailDao;
import dao.MoodDao;
import vo.CafeVo;
import vo.DessertFilterVo;
import vo.MoodFilterVo;

public class DetailServiceImpl implements DetailService {
	
	@Autowired
	ServletContext application;

	@Autowired
	HttpServletRequest request;
	
	DetailDao 	detail_dao;
	MoodDao	  	mood_dao;
	DessertDao	dessert_dao;
	
	

	public void setMood_dao(MoodDao mood_dao) {
		this.mood_dao = mood_dao;
	}

	public void setDessert_dao(DessertDao dessert_dao) {
		this.dessert_dao = dessert_dao;
	}

	public void setDetail_dao(DetailDao detail_dao) {
		this.detail_dao = detail_dao;
	}

	@Override
	public CafeVo selectOne(int c_idx) {
		// TODO Auto-generated method stub
		
		return detail_dao.selectOne(c_idx);
	
	}


	@Override
	public void insert(CafeVo vo, int[] m_idx_array, int[] d_idx_array, Model model) throws Exception {
		// TODO Auto-generated method stub
		
		// System.out.println("--1--");
		// �ӽ÷� ������ ���� upload file(MultipartFile photo)�� ������ ��ġ�� �����ؾ� �Ѵ�
		// ������ �����
		String web_path = "/resources/upload/";

		// ����θ� �����η� ������(ó����ü : ServletContext application)
		String abs_path = application.getRealPath(web_path);

		// �ӽð��(MultipartFile photo)�� ���� ���ϸ�
		String filename = vo.getPhoto().getOriginalFilename();

		// ������ ���� ���� ����
		File f = new File(abs_path, filename);

		// ip
		String c_ip = request.getRemoteAddr();
		vo.setC_ip(c_ip);

		// �������� ���� üũ( while�� ��������:�������ϸ��� ���������� �ݺ�)
		while (f.exists()) { // ���������� ������

			long time = System.currentTimeMillis();

			// filename = "87651234511111_a.jpg";
			filename = String.format("%d_%s", time, filename);

			f = new File(abs_path, filename);
		}

		// ���ε�� ���ϸ�
		vo.setC_photo(filename);

		// �ӽ��������ִ���(MultipartFile photo)�� "/resources/upload" �� ����
		vo.getPhoto().transferTo(f);

		// DB insert
		int res = detail_dao.insert(vo);

		// ��ϵ� Cafe c_idx : select max(c_idx) from cafe
		int c_idx = detail_dao.selectCafeIdx();

		// mood_filter insert
		if(m_idx_array!=null) {
			for (int m_idx : m_idx_array) {
				MoodFilterVo vo1 = new MoodFilterVo();
				vo1.setC_idx(c_idx);
				vo1.setM_idx(m_idx);
				int res1 = detail_dao.insert_mood(vo1);
			}
		}

		// dessert_filter insert
		if(d_idx_array != null) {
			for (int d_idx : d_idx_array) {
				DessertFilterVo vo2 = new DessertFilterVo();
				vo2.setC_idx(c_idx);
				vo2.setD_idx(d_idx);
				int res2 = detail_dao.insert_dessert(vo2);
	
			}
		}
	
	}

	
	// ī�� �����ϱ�
	@Override
	public void update(CafeVo vo,int[] m_idx_array,int[] d_idx_array) {
		// TODO Auto-generated method stub
		// 2-2 IP
		String c_ip = request.getRemoteAddr();

		vo.setC_ip(c_ip);

		// DB update
		int res = detail_dao.update(vo);
	
		// ��ϵ� Cafe c_idx : select max(c_idx) from cafe
		int c_idx = vo.getC_idx();

		int res1 = detail_dao.mood_filter_delete(c_idx);
		// mood_filter insert
		if(m_idx_array!=null) {
			for (int m_idx : m_idx_array) {
				MoodFilterVo vo1 = new MoodFilterVo();
				vo1.setC_idx(c_idx);
				vo1.setM_idx(m_idx);
				int res3 = detail_dao.insert_mood(vo1);
			}
		}

		
		int res2 = detail_dao.dessert_filter_delete(c_idx);
		// dessert_filter insert
		if(d_idx_array != null) {
			for (int d_idx : d_idx_array) {
				DessertFilterVo vo2 = new DessertFilterVo();
				vo2.setC_idx(c_idx);
				vo2.setD_idx(d_idx);
				int res4 = detail_dao.insert_dessert(vo2);
	
			}
		}

	}
	
	// ī�� �����ϱ�
	@Override
	public void delete(int c_idx) {
		// TODO Auto-generated method stub
		
		CafeVo vo = detail_dao.selectOne(c_idx);
	      
	    String web_path = "/resources/upload/";
	      
	    String save_dir = application.getRealPath(web_path);
	      
	    //4. ���ϻ���
	    File f = new File(save_dir, vo.getC_photo());
	    f.delete();
	      
	    int res = detail_dao.delete(c_idx);
		
	}
	
}
