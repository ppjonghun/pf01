package com.green.view.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.green.biz.dto.AddressVO;
import com.green.biz.dto.UserVO;
import com.green.biz.service.UserService;

@Controller
@SessionAttributes("loginUser")
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginView() {
		return "user/loginForm";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginAction(Model mo, UserVO vo) {

		UserVO user = userService.getUser(vo);

		if (user == null || !vo.getPwd().equals(user.getPwd())) {
			mo.addAttribute("message", "아이디 혹은 비밀번호를 다시 확인하세요.");
			return "user/loginForm";
		} else {
			mo.addAttribute("loginUser", user);
			return "redirect:index";
		}
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutAction(SessionStatus status) {
		status.setComplete();
		return "redirect:index";
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinView() {
		return "user/joinForm";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinAction(UserVO vo) {
		if (vo.getAddress() == null) {
			vo.setAddress("");
		}

		userService.insertUser(vo);

		return "user/joinFinish";
	}

	@RequestMapping(value = "/id_check", method = RequestMethod.GET)
	public String idCheckView(Model mo, String userid) {
		UserVO vo = new UserVO();
		vo.setUserid(userid);

		UserVO user = new UserVO();

		user = userService.getUser(vo);

		if (user == null) {
			mo.addAttribute("message", 1);
		} else {
			mo.addAttribute("message", 0);
		}

		mo.addAttribute("userid", vo.getUserid());

		return "user/idCheckForm";
	}

	@RequestMapping(value = "/id_check", method = RequestMethod.POST)
	public String idCheckAction(Model mo, String userid) {
		UserVO vo = new UserVO();
		vo.setUserid(userid);

		UserVO user = new UserVO();

		user = userService.getUser(vo);

		if (user == null) {
			mo.addAttribute("message", 1);
		} else {
			mo.addAttribute("message", 0);
		}

		mo.addAttribute("userid", vo.getUserid());

		return "user/idCheckForm";
	}

	@RequestMapping(value = "/find_zip_num", method = RequestMethod.GET)
	public String findZipNumView() {
		return "user/findZipNum";
	}

	@RequestMapping(value = "/find_zip_num", method = RequestMethod.POST)
	public String findZipNumAction(@RequestParam(value = "dong") String dong, Model mo) {
		List<AddressVO> list = userService.selectAddressByDong(dong);
		mo.addAttribute("addressList", list);
		return "user/findZipNum";
	}

	@RequestMapping(value = "/find_id_pwd", method = RequestMethod.GET)
	public String findIdPwdView(String find, Model mo) {
		mo.addAttribute("find", find);
		return "user/findIdPwd";
	}

	@RequestMapping(value = "/find_id_pwd", method = RequestMethod.POST)
	public String findIdPwdAction(String find, Model mo, UserVO vo) {
		if (vo.getUserid() == null) {
			vo.setUserid("");
		}

		List<UserVO> findUser = userService.findIdPwd(vo);
		if (findUser.size() != 0) {
			for (UserVO v : findUser) {
				String pass = v.getPwd().substring(0, v.getPwd().length() - 3);
				pass = pass + "***";
				v.setPwd(pass);
			}
			mo.addAttribute("findUser", findUser);
		}

		mo.addAttribute("findResult", find);
		return "user/findIdPwd";
	}
	
	@RequestMapping(value="/mypage", method = RequestMethod.GET)
	public String myPageUserCheck(HttpSession session, Model mo, String menu) {
		
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			return "user/loginForm";
		}else {
			if(menu.equals("main")) {
				mo.addAttribute("now", "main");
				mo.addAttribute("loginUser", loginUser);
				return "user/mypage";
			}else if(menu.equals("change")){
				mo.addAttribute("now", "change");
				mo.addAttribute("loginUser", loginUser);
				return "user/userInfoChange";
			}else if(menu.equals("changePwd")) {
				mo.addAttribute("now", "changePwd");
				mo.addAttribute("loginUser", loginUser);
				return "user/userChangePassword";
			}else if(menu.equals("withdrawal")) {
				mo.addAttribute("now", "withdrawal");
				mo.addAttribute("loginUser", loginUser);
				return "user/userWithdrawal";
			}
		}
		return "";
	}
	
	@RequestMapping(value="/user_info_change", method=RequestMethod.POST)
	public String userInfoChange(UserVO user) {
		userService.updateUser(user);
		return "redirect:mypage?menu=main";
	}
	
	@RequestMapping(value="/user_pwd_change", method=RequestMethod.POST)
	public String userPwdChange(UserVO vo) {
		userService.updateUserPwd(vo);
		return "redirect:mypage?menu=main";
	}
	
	@RequestMapping(value="/user_withdarawal", method=RequestMethod.POST)
	public String userDelete(UserVO vo, SessionStatus status) {
		userService.deleteUser(vo);
		status.setComplete();
		return "redirect:index";
	}

}
