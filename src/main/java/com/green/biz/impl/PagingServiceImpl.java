package com.green.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.biz.dao.PagingDAO;
import com.green.biz.dto.BoardVO;
import com.green.biz.dto.PagingVO;
import com.green.biz.dto.UserVO;
import com.green.biz.service.PagingService;

@Service("PagingService")
public class PagingServiceImpl implements PagingService {

	@Autowired
	private PagingDAO dao;

	@Override
	public int countBoard(PagingVO vo) {
		return dao.countBoard(vo);
	}

	@Override
	public List<BoardVO> getBoardList(PagingVO vo) {
		return dao.getBoardList(vo);
	}

	@Override
	public int countUsers(PagingVO vo) {
		return dao.countUsers(vo);
	}

	@Override
	public List<UserVO> getUserList(PagingVO vo) {
		return dao.getUserList(vo);
	}

	
	

}
