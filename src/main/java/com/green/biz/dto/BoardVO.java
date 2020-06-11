package com.green.biz.dto;

import java.sql.Date;

import lombok.Data;
@Data
public class BoardVO {
	private int bseq;
	private String title;
	private String content;
	private String writer;
	private Date indate;
	private int cnt;
	private String image;
	private String kind;
	private String status;
	private String searchCondition;
	private String keyword;
	
	private int replyCnt;
	
	private String userid;
	private int gob;
	private Date re_date; // 추천한날
	
	// 다음, 이전 게시글
	private int next_bseq;
	private String next_title;
	private int pre_bseq;
	private String pre_title;
	
}
