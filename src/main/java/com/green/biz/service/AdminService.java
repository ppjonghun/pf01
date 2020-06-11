package com.green.biz.service;

import java.util.List;

import com.green.biz.dto.BannerVO;

public interface AdminService {
	List<BannerVO> bannerList(BannerVO vo);
	void insertBanner(BannerVO vo);
	void updateBanner(BannerVO vo);
	void deleteBanner(BannerVO vo);
}
