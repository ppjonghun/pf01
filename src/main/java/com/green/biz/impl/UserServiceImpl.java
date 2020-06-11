package com.green.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.biz.dao.UserDAO;
import com.green.biz.dto.AddressVO;
import com.green.biz.dto.UserVO;
import com.green.biz.service.UserService;

@Service("UserService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO dao;

	@Override
	public UserVO getUser(UserVO vo) {
		return dao.getUser(vo);
	}

	@Override
	public void insertUser(UserVO vo) {
		dao.insertUser(vo);
	}

	@Override
	public List<UserVO> findIdPwd(UserVO vo) {
		return dao.findIdPwd(vo);
	}

	@Override
	public List<AddressVO> selectAddressByDong(String dong) {
		return dao.selectAddressByDong(dong);
	}

	@Override
	public void updateUser(UserVO vo) {
		dao.updateUser(vo);		
	}
	
	@Override
	public void updateUserPwd(UserVO vo) {
		dao.updateUserPwd(vo);
	}

	@Override
	public void deleteUser(UserVO vo) {
		dao.deleteUser(vo);
	}

	@Override
	public void turnOnAdmin(String userid) {
		dao.turnOnAdmin(userid);
	}

}
