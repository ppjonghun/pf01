package com.green.view.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.biz.dto.BannerVO;
import com.green.biz.dto.UserVO;
import com.green.biz.service.AdminService;
import com.green.biz.service.UserService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService aService;
	
	@Autowired
	UserService uService;
	
	@RequestMapping(value="/admin_user_remove", method=RequestMethod.POST)
	public String userRemove(String[] selectUser){
		
		for(String user : selectUser) {
			UserVO vo = new UserVO();
			vo.setUserid(user);
			uService.deleteUser(vo);
		}		
		return "redirect:user_list";
	}
	
	@RequestMapping(value="/admin_management_userDetail", method=RequestMethod.GET)
	public String adminManagementUserDetail(UserVO user, Model mo) {
		user = uService.getUser(user);
		mo.addAttribute("user", user);
		mo.addAttribute("now", "am_userDetail");
		
		return "admin/am_userDetail";
	}
	
	@RequestMapping(value="/turnOn_admin", method=RequestMethod.POST)
	public String turnOnAdmin(String selectUser){		
			UserVO vo = new UserVO();
			vo.setUserid(selectUser);
			uService.turnOnAdmin(selectUser);
		
		return "redirect:user_list";
	}
	
	@RequestMapping(value="/banner_management", method=RequestMethod.GET)
	public String bannerManger(Model mo) {
		BannerVO vo = new BannerVO();
		List<BannerVO> bannerList = aService.bannerList(vo);
		for(BannerVO ba : bannerList) {
			if(ba.getTitle().length() > 50) {
				String ss = ba.getTitle().substring(0,49) + "...";
				ba.setTitle(ss);
			}
			
			if(ba.getImage() == null) {
				bannerList.remove(ba);
			}
		}		
		mo.addAttribute("bannerList", bannerList);		
		mo.addAttribute("now", "bannerManagement");
		return "admin/bannerManagement";
	}
	
	@RequestMapping(value="/banner_use", method=RequestMethod.POST)
	public String bannerUse(@RequestParam(value="useableCheckbox")int[] checkBseq) {
		
		for(int i : checkBseq) {
			BannerVO banner = new BannerVO();
			banner.setBseq(i);
			banner.setStatus("1");
			aService.updateBanner(banner);
		}
		
		return "redirect:banner_management";
	}
	
	@RequestMapping(value="/banner_notuse", method=RequestMethod.POST)
	public String bannerNotUse(@RequestParam(value="usingCheckbox")int[] checkBseq) {
		
		for(int i : checkBseq) {
			BannerVO banner = new BannerVO();
			banner.setBseq(i);
			banner.setStatus("0");
			aService.updateBanner(banner);
		}
		
		return "redirect:banner_management";
	}
	
}
