package com.green.biz.service;

import java.util.List;

import com.green.biz.dto.BoardVO;

public interface BoardService {
	
	BoardVO getBoard(BoardVO vo);
	BoardVO getNextAndPreBoard(BoardVO vo);
	List<BoardVO> getNoticeBoardList(BoardVO vo);
	void insertBoard(BoardVO vo);
	void updateBoard(BoardVO vo);
	void deleteBoard(BoardVO vo);
	void upCnt(BoardVO vo);
	List<BoardVO> latelyBoardList();
	BoardVO latelyBoard();
	List<BoardVO> popBoardList();
	List<Integer> recommendCnt(BoardVO vo);
	BoardVO boardRecommendCheck(BoardVO vo);
	void boardRecommend(BoardVO vo);
	void boardRecommendCancel(BoardVO vo);
	void deleteRecommend(int bseq);
}
