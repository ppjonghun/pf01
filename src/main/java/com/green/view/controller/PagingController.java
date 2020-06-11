package com.green.view.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.green.biz.dto.BoardVO;
import com.green.biz.dto.PagingVO;
import com.green.biz.dto.ReplyVO;
import com.green.biz.dto.UserVO;
import com.green.biz.service.PagingService;
import com.green.biz.service.ReplyService;

@Controller
public class PagingController {

	@Autowired
	private PagingService pagingService;
	@Autowired
	private ReplyService rService;

	@RequestMapping(value = "/board_list")
	public String boatdListAction(Model mo, @RequestParam(value = "searchCondition", required = false) String condition,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

		PagingVO vo = new PagingVO();

		if (condition == null) {
			vo.setSearchCondition("title");
		}else {
			vo.setSearchCondition(condition);
		}
		
		if (keyword == null) {
			vo.setKeyword("");
		}else {
			vo.setKeyword(keyword);
		}

		int total = 0;

		total = pagingService.countBoard(vo);

		if ((nowPage == null && cntPerPage == null) || (nowPage.equals("") && cntPerPage == null)) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null || nowPage.equals("")) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}

		List<BoardVO> boardList = new ArrayList<BoardVO>();

		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), vo.getSearchCondition(),
				vo.getKeyword());

		boardList = pagingService.getBoardList(vo);

		for (BoardVO bo : boardList) {

			ReplyVO re = new ReplyVO();
			re.setKind("board");
			re.setSeq(Integer.toString(bo.getBseq()));
			bo.setReplyCnt(rService.replyCnt(re));
		}
		mo.addAttribute("paging", vo);
		mo.addAttribute("boardList", boardList);
		return "board/boardList";
	}

	@RequestMapping(value = "/user_list")
	public String userManagementView(Model mo,
			@RequestParam(value = "searchCondition", required = false) String condition,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		
		PagingVO vo = new PagingVO();

		if (condition == null) {
			vo.setSearchCondition("userid");
		}else {
			vo.setSearchCondition(condition);
		}
		
		if (keyword == null) {
			vo.setKeyword("");
		}else {
			vo.setKeyword(keyword);
		}


		int total = 0;

		total = pagingService.countUsers(vo);
		
		if ((nowPage == null && cntPerPage == null) || (nowPage.equals("") && cntPerPage == null)) {
			nowPage = "1";
			cntPerPage = "15";
		} else if (nowPage == null || nowPage.equals("")) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "15";
		}

		List<UserVO> userList = new ArrayList<UserVO>();

		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), vo.getSearchCondition(),
				vo.getKeyword());

		userList = pagingService.getUserList(vo);
		
		mo.addAttribute("paging", vo);
		mo.addAttribute("userList",userList);
		mo.addAttribute("now", "userManagement");
		return "admin/userManagement";
	}

}
