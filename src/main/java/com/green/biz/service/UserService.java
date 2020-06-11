package com.green.biz.service;

import java.util.List;

import com.green.biz.dto.UserVO;
import com.green.biz.dto.AddressVO;

public interface UserService {
	UserVO getUser(UserVO vo);
	void insertUser(UserVO vo);
	List<UserVO> findIdPwd(UserVO vo);
	void updateUser(UserVO vo);
	void updateUserPwd(UserVO vo);
	void deleteUser(UserVO vo);
	void turnOnAdmin(String userid);
	
	public List<AddressVO> selectAddressByDong(String dong);
}
