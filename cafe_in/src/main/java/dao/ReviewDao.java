package dao;

import java.util.List;
import java.util.Map;

import vo.ReviewVo;
import vo.ThumbVo;

public interface ReviewDao {

   //������ȸ
   List selectList(int c_idx);
   
   //�����ۼ�
   int insert(ReviewVo vo);

   //�������
   int delete(int r_idx);

   //���ƿ� üũ
   ThumbVo selectOne(ThumbVo vo);

   //���ƿ� �߰�
   int insert_thumb(ThumbVo vo);
   
   int delete_thumb(ThumbVo vo);

   //���ƿ� ī��Ʈ
   int selectCount(int r_idx);

   //�������� ���� ��ȸ
   List<ReviewVo> selectList(Map map);

   //��ü���
   int selectRowTatal(int c_idx);

}