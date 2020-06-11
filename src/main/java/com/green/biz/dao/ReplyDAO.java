package com.green.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.biz.dto.ReplyVO;

@Repository
public class ReplyDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int replyCnt(ReplyVO vo) {
		return mybatis.selectOne("ReplyDAO.replyCount", vo);
	}
	
	public List<ReplyVO> replyList(ReplyVO vo){
		return mybatis.selectList("ReplyDAO.replyList", vo);
	}
	
	public void insertReply(ReplyVO vo) {
		mybatis.insert("ReplyDAO.insertReply", vo);
	}
	
	public void updateReply(ReplyVO vo) {
		mybatis.update("ReplyDAO.updateReply", vo);
	}
	
	public void deleteReply(ReplyVO vo) {
		mybatis.delete("ReplyDAO.deleteReply", vo);
	}
	
}
