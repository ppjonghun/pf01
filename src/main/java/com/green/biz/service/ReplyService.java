package com.green.biz.service;

import java.util.List;

import com.green.biz.dto.ReplyVO;

public interface ReplyService {
	int replyCnt(ReplyVO vo);
	List<ReplyVO> replyList(ReplyVO vo);
	void insertReply(ReplyVO vo);
	void updateReply(ReplyVO vo);
	void deleteReply(ReplyVO vo);
}
