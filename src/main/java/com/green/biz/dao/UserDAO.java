package com.green.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.biz.dto.UserVO;
import com.green.biz.dto.AddressVO;

@Repository
public class UserDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public UserVO getUser(UserVO vo) {
		return mybatis.selectOne("UserDAO.getUser",vo);
	}
	
	public void insertUser(UserVO vo) {
		mybatis.insert("UserDAO.insertUser", vo);
	}
	
	public List<AddressVO> selectAddressByDong(String dong){
		return mybatis.selectList("UserDAO.selectAddressByDong", dong);
	}
	
	public List<UserVO> findIdPwd(UserVO vo) {
		return mybatis.selectList("UserDAO.findIdPwd", vo);
	}
	
	public void updateUser(UserVO vo) {
		mybatis.update("UserDAO.updateUser",vo);
	}
	
	public void updateUserPwd(UserVO vo) {
		mybatis.update("UserDAO.updateUserPwd", vo);
	}
	
	public void deleteUser(UserVO vo) {
		mybatis.delete("UserDAO.deleteUser", vo);
	}
	
	public void turnOnAdmin(String userid) {
		mybatis.update("UserDAO.turnOnAdmin", userid);
	}
}
