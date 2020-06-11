package com.green.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.biz.dao.ReplyDAO;
import com.green.biz.dto.ReplyVO;
import com.green.biz.service.ReplyService;

@Service("ReplyService")
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	ReplyDAO dao;
	
	@Override
	public int replyCnt(ReplyVO vo) {
		return dao.replyCnt(vo);
	}

	@Override
	public List<ReplyVO> replyList(ReplyVO vo) {
		return dao.replyList(vo);
	}

	@Override
	public void insertReply(ReplyVO vo) {
		dao.insertReply(vo);
	}

	@Override
	public void updateReply(ReplyVO vo) {
		dao.updateReply(vo);
	}

	@Override
	public void deleteReply(ReplyVO vo) {
		dao.deleteReply(vo);
	}

}
