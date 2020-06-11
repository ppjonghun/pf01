package com.green.biz.service;

import java.util.List;

import com.green.biz.dto.BoardVO;
import com.green.biz.dto.PagingVO;
import com.green.biz.dto.UserVO;

public interface PagingService {
	
	int countBoard(PagingVO vo);
	List<BoardVO> getBoardList(PagingVO vo);
	
	int countUsers(PagingVO vo);
	List<UserVO> getUserList(PagingVO vo);
}
