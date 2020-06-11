package com.green.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.biz.dto.BoardVO;
import com.green.biz.dto.PagingVO;
import com.green.biz.dto.UserVO;

@Repository
public class PagingDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int countBoard(PagingVO vo) {
		return mybatis.selectOne("PagingDAO.countBoard", vo);
	}
	
	public List<BoardVO> getBoardList(PagingVO vo){
		return mybatis.selectList("PagingDAO.getBoardList", vo);
	}
	
	public int countUsers(PagingVO vo) {
		return mybatis.selectOne("PagingDAO.countUsers", vo);
	}
	
	public List<UserVO> getUserList(PagingVO vo){
		return mybatis.selectList("PagingDAO.getUserList", vo);
	}
	
}
