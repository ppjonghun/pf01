package com.green.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.biz.dto.BoardVO;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public BoardVO getBoard(BoardVO vo) {
		return mybatis.selectOne("BoardDAO.getBoard", vo);
	}
	
	public BoardVO getNextAndPreBoard(BoardVO vo) {
		return mybatis.selectOne("BoardDAO.getNextAndPreBoard", vo);
	}
	
	public List<BoardVO> getNoticeBoardList(BoardVO vo) {
		return mybatis.selectList("BoardDAO.noticeBoardList", vo);
	}
	
	public void insertBoard(BoardVO vo) {
		mybatis.insert("BoardDAO.insertBoard", vo);
	}
	
	public void updateBoard(BoardVO vo) {
		mybatis.update("BoardDAO.updateBoard", vo);
	}
	
	public void deleteBoard(BoardVO vo) {
		mybatis.delete("BoardDAO.deleteBoard", vo);
	}
	
	public void upCnt(BoardVO vo) {
		mybatis.update("BoardDAO.upCnt", vo);
	}
	
	public List<BoardVO> latelyBoardList(){
		return mybatis.selectList("BoardDAO.latelyBoardList");
	}
	
	public BoardVO latelyBoard() {
		return mybatis.selectOne("BoardDAO.latelyBoard");
	}
	
	public List<BoardVO> popBoardList(){
		return mybatis.selectList("BoardDAO.popBoardList");
	}
	
	public List<Integer> recommendCnt(BoardVO vo){
		return mybatis.selectList("BoardDAO.recommendCnt", vo);
	}
	
	public BoardVO boardRecommendCheck(BoardVO vo) {
		return mybatis.selectOne("BoardDAO.boardRecommendCheck", vo);
	}
	
	public void boardRecommend(BoardVO vo) {
		mybatis.insert("BoardDAO.boardRecommend", vo);
	}
	
	public void boardRecommendCancel(BoardVO vo) {
		mybatis.delete("BoardDAO.boardRecommendCancel", vo);
	}
	
	public void deleteRecommend(int bseq) {
		mybatis.delete("BoardDAO.deleteRecommend", bseq);
	}
}
