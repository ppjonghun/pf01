package com.green.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.biz.dao.BoardDAO;
import com.green.biz.dto.BoardVO;
import com.green.biz.service.BoardService;

@Service("BoardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO dao;
	
	@Override
	public BoardVO getBoard(BoardVO vo) {
		return dao.getBoard(vo);
	}
	
	@Override
	public BoardVO getNextAndPreBoard(BoardVO vo) {
		return dao.getNextAndPreBoard(vo);
	}
	
	@Override
	public List<BoardVO> getNoticeBoardList(BoardVO vo) {
		return dao.getNoticeBoardList(vo);
	}
	@Override
	public void insertBoard(BoardVO vo) {
		dao.insertBoard(vo);
	}

	@Override
	public void updateBoard(BoardVO vo) {
		dao.updateBoard(vo);
	}

	@Override
	public void deleteBoard(BoardVO vo) {
		dao.deleteBoard(vo);
	}

	@Override
	public void upCnt(BoardVO vo) {
		dao.upCnt(vo);
	}

	@Override
	public List<BoardVO> latelyBoardList() {
		return dao.latelyBoardList();
	}

	@Override
	public BoardVO latelyBoard() {
		return dao.latelyBoard();
	}
	
	@Override
	public List<BoardVO> popBoardList() {
		return dao.popBoardList();
	}

	@Override
	public List<Integer> recommendCnt(BoardVO vo) {
		return dao.recommendCnt(vo);
	}

	@Override
	public BoardVO boardRecommendCheck(BoardVO vo) {
		return dao.boardRecommendCheck(vo);
	}

	@Override
	public void boardRecommend(BoardVO vo) {
		dao.boardRecommend(vo);
	}

	@Override
	public void boardRecommendCancel(BoardVO vo) {
		dao.boardRecommendCancel(vo);
	}

	@Override
	public void deleteRecommend(int bseq) {
		dao.deleteRecommend(bseq);
	}

}
