package com.green.view.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.green.biz.dto.BannerVO;
import com.green.biz.dto.BoardVO;
import com.green.biz.dto.PagingVO;
import com.green.biz.dto.ReplyVO;
import com.green.biz.dto.UserVO;
import com.green.biz.service.AdminService;
import com.green.biz.service.BoardService;
import com.green.biz.service.ReplyService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private ReplyService rService;
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="/board_detail", method=RequestMethod.GET)
	public String boardDetailView(BoardVO vo, Model mo,String nowPage) {
		boardService.upCnt(vo);
		BoardVO board = boardService.getBoard(vo);
		
		ReplyVO reply = new ReplyVO();
		reply.setKind("board");
		reply.setSeq(Integer.toString(vo.getBseq()));
		
		board.setReplyCnt(rService.replyCnt(reply));
		List<ReplyVO> rList = rService.replyList(reply);
		
		BoardVO napBoard = new BoardVO();
		napBoard = boardService.getNextAndPreBoard(board);
		
		mo.addAttribute("board", board);
		mo.addAttribute("nap", napBoard);
		mo.addAttribute("nowPage",nowPage);		
		mo.addAttribute("replyList", rList);		
		
		return "board/boardDetail";
	}
	
	@RequestMapping(value="/board_write", method=RequestMethod.GET)
	public String boardWriteView(HttpSession session) {
		
		UserVO user = (UserVO) session.getAttribute("loginUser");
		
		if(user==null) {
			return "user/loginForm";
		}else {
			return "board/boardWriteForm";
		}		
	}
	
	@RequestMapping(value="/board_write", method=RequestMethod.POST)
	public String boardWriteAction(HttpSession session, BoardVO vo,
			@RequestParam(value="uploadFile")MultipartFile file,
			@RequestParam(value="kind", required=false)String kind)throws IOException {
		
		UserVO user = (UserVO) session.getAttribute("loginUser");
		if(user==null) {
			return "user/loginForm";
		}else {
			vo.setWriter(user.getUserid());
			
			if(kind==null) {
				kind="0";
			}
			vo.setKind(kind);
			
			if (!file.isEmpty()) {
				String fileName = file.getOriginalFilename();
				vo.setImage(fileName);
				file.transferTo(
						new File("D:\\spring_workspace\\Jonghun\\src\\main\\webapp\\WEB-INF\\resources\\images\\board\\"
								+ fileName));
			}else {
				vo.setImage("");
			}
			boardService.insertBoard(vo);
			
			BoardVO newBo = boardService.latelyBoard();
			
			if(newBo.getKind().equals("1")) {
				BannerVO banner = new BannerVO();
				banner.setBseq(newBo.getBseq());
				banner.setTitle(newBo.getTitle());
				banner.setImage(newBo.getImage());
				adminService.insertBanner(banner);
			}
			
			return "redirect:board_list";
		}		
	}
	
	@RequestMapping(value="/board_update", method=RequestMethod.GET)
	public String boardUpdateView(int bseq, Model mo) {
		BoardVO vo = new BoardVO();
		vo.setBseq(bseq);
		vo = boardService.getBoard(vo);
		mo.addAttribute("board", vo);
		
		return "board/boardUpdateForm";
	}
	
	@RequestMapping(value="/board_update", method=RequestMethod.POST)
	public String boardUpdateAction(BoardVO vo, String image
			,@RequestParam(value="kind", required=false)String kind,
			@RequestParam(value="uploadFile")MultipartFile file)throws IOException {
		
		if(kind==null) {
			kind="0";
		}

		vo.setKind(kind);
		
		if (!file.isEmpty()) {
			String fileName = file.getOriginalFilename();
			vo.setImage(fileName);
			file.transferTo(
					new File("D:\\spring_workspace\\Jonghun\\src\\main\\webapp\\WEB-INF\\resources\\images\\board\\"
							+ fileName));
		}else {
			if(image == null) {
			vo.setImage("");
			}else {
				vo.setImage(image);
			}
		}
		
		boardService.updateBoard(vo);
		
		if(vo.getKind().equals("1")) {
			BannerVO banner = new BannerVO();
			banner.setStatus("0");
			banner.setBseq(vo.getBseq());
			banner.setTitle(vo.getTitle());
			banner.setImage(vo.getImage());
			adminService.updateBanner(banner);
		}
		
		return "redirect:board_list";
	}
	
	@RequestMapping(value="/board_delete")
	public String boardDeleteAction(int bseq, int nowPage) {
		BoardVO vo = new BoardVO();
		vo.setBseq(bseq);
		vo = boardService.getBoard(vo);
		if(vo.getKind().equals("1")) {
			BannerVO banner = new BannerVO();
			banner.setBseq(vo.getBseq());
			adminService.deleteBanner(banner);
		}

		boardService.deleteBoard(vo);
		boardService.deleteRecommend(vo.getBseq());
		
		return "redirect:board_list?nowPage="+nowPage;
	}
	
	
	
	@RequestMapping(value="/insert_board_reply", method=RequestMethod.POST)
	public String boardReplyInsert(ReplyVO vo, BoardVO board) {

		rService.insertReply(vo);
		
		return "redirect:/board_detail?bseq="+vo.getSeq();
	}
	
	@RequestMapping(value="/reply_update")
	public String boardReplyUpdate(ReplyVO re, BoardVO bo) {
		
		rService.updateReply(re);
		
		return "redirect:board_detail?bseq="+bo.getBseq();
	}
	
	@RequestMapping(value="/reply_delete")
	public String boardReplyDeleteAction(ReplyVO vo, BoardVO board) {
		rService.deleteReply(vo);
		return "redirect:board_detail?bseq="+board.getBseq();
	}
}
