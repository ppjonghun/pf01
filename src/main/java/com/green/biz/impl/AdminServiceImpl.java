package com.green.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.biz.dao.AdminDAO;
import com.green.biz.dto.BannerVO;
import com.green.biz.dto.UserVO;
import com.green.biz.service.AdminService;

@Service("AdminService")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO dao;

	@Override
	public List<BannerVO> bannerList(BannerVO vo) {
		return dao.bannerList(vo);
	}

	@Override
	public void insertBanner(BannerVO vo) {
		dao.insertBanner(vo);
	}

	@Override
	public void updateBanner(BannerVO vo) {
		dao.updateBanner(vo);
	}

	@Override
	public void deleteBanner(BannerVO vo) {
		dao.deleteBanner(vo);
	}
	
}
