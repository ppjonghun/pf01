package com.green.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.biz.dto.BannerVO;
import com.green.biz.dto.UserVO;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<BannerVO> bannerList(BannerVO vo){
		return mybatis.selectList("BannerDAO.bannerList", vo);
	}
	
	public void insertBanner(BannerVO vo) {
		mybatis.insert("BannerDAO.insertBanner", vo);
	}
	
	public void updateBanner(BannerVO vo) {
		mybatis.update("BannerDAO.updateBanner", vo);
	}
	
	public void deleteBanner(BannerVO vo) {
		mybatis.delete("BannerDAO.deleteBanner", vo);
	}
}
