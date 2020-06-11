package com.green.view.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.green.biz.dto.BoardVO;
import com.green.biz.dto.UserVO;
import com.green.biz.service.BoardService;

@RestController
public class RecommendController {

	@Autowired
	BoardService boardService;

	@RequestMapping(value = "/get_board_recommend", method = RequestMethod.GET)
	public List<Integer> getBoardRecommend(BoardVO vo, int boardSeq) {
		vo.setBseq(boardSeq);
		List<Integer> reList = boardService.recommendCnt(vo);

		return reList;
	}

	@RequestMapping(value = "/board_recommend_check", method = RequestMethod.GET)
	public BoardVO boardRecommendCheck(@RequestParam(value="boardSeq", required=false)int boardSeq, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("loginUser");
		BoardVO vo = new BoardVO();
		if(user == null) {
			vo.setGob(100);
			return vo;
		}else {		
			vo.setBseq(boardSeq);
			vo.setUserid(user.getUserid());			
			vo = boardService.boardRecommendCheck(vo);
			return vo;
		}
	}

	@RequestMapping(value = "/board_recommend", method = RequestMethod.GET)
	public int boardRecommend(int boardSeq, BoardVO vo, int click, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("loginUser");
		if (user == null) {
			return 0;
		} else {
			vo.setBseq(boardSeq);
			vo.setUserid(user.getUserid());
			vo = boardService.boardRecommendCheck(vo);
			if(vo == null ) {
				BoardVO bo = new BoardVO();
				bo.setGob(click);
				bo.setBseq(boardSeq);
				bo.setUserid(user.getUserid());
				boardService.boardRecommend(bo);
			}else {
				BoardVO bo = new BoardVO();
				bo.setUserid(user.getUserid());
				bo.setBseq(boardSeq);
				boardService.boardRecommendCancel(vo);
			}
			return 1;
		}
	}

}
