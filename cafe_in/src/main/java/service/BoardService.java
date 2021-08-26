package service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import vo.BoardVo;

public interface BoardService {

   Map selectList(int nowPage, String search, String search_text);


   int insert(BoardVo vo,MultipartFile photo) throws Exception;

   BoardVo selectOne(int b_idx);

   int update_readhit(int b_idx);

   int update(BoardVo vo, String search, String search_text);

   int update_use_yn(int b_idx, String search, String search_text);

   int selectRowTotal(Map map);

}