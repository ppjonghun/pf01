package com.green.view.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.green.biz.dto.BannerVO;
import com.green.biz.dto.BoardVO;
import com.green.biz.dto.ReplyVO;
import com.green.biz.service.AdminService;
import com.green.biz.service.BoardService;
import com.green.biz.service.ReplyService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private ReplyService rService;
	@Autowired
	private AdminService adService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String home(Model model) {
		BannerVO banner = new BannerVO();
		banner.setStatus("1");
		List<BannerVO> bannerList = adService.bannerList(banner);
		List<BannerVO> useBanner = new ArrayList<BannerVO>();
		for(BannerVO ba : bannerList) {
			if(ba.getStatus().equals("1")) {
				useBanner.add(ba);
			}
		}
		model.addAttribute("bList",useBanner);
		
		List<BoardVO> lbList = boardService.latelyBoardList();
		for(BoardVO bo : lbList) {
			ReplyVO re = new ReplyVO();
			re.setKind("board");
			re.setSeq(Integer.toString(bo.getBseq()));
			bo.setReplyCnt(rService.replyCnt(re));
		}
		model.addAttribute("latelyBoardList", lbList);
		
		List<BoardVO> popList = boardService.popBoardList();
		for(BoardVO bo : popList) {
			if(bo.getTitle().length() > 20) {
				String title = bo.getTitle();
				title = title.substring(0,19) + "...";
				bo.setTitle(title);
			}
			ReplyVO re = new ReplyVO();
			re.setKind("board");
			re.setSeq(Integer.toString(bo.getBseq()));
			bo.setReplyCnt(rService.replyCnt(re));
		}
		
		
		model.addAttribute("popBoardList", popList);
		
		return "index";
	}
	
}
