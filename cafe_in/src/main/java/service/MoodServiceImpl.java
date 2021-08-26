package service;

import java.util.List;

import dao.MoodDao;
import vo.MoodVo;

public class MoodServiceImpl implements MoodService {
	
	MoodDao mood_dao;

	public void setMood_dao(MoodDao mood_dao) {
		this.mood_dao = mood_dao;
	}

	@Override
	public List<MoodVo> selectList() {
		// TODO Auto-generated method stub
		return mood_dao.selectList();
	}
	
	
}
