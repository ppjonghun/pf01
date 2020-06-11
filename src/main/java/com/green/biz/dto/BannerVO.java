package com.green.biz.dto;

public class BannerVO {
	private int bseq;
	private String title;
	private String image;
	private int order_seq;
	private String status;
	public int getBseq() {
		return bseq;
	}
	public void setBseq(int bseq) {
		this.bseq = bseq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getOrder_seq() {
		return order_seq;
	}
	public void setOrder_seq(int order_seq) {
		this.order_seq = order_seq;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "BannerVO [bseq=" + bseq + ", title=" + title + ", image=" + image + ", order_seq=" + order_seq
				+ ", status=" + status + "]";
	}
	
	
}
