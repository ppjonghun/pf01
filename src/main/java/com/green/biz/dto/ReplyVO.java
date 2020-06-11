package com.green.biz.dto;

import java.sql.Date;

public class ReplyVO {
	private String seq;
	private String content;
	private String writer;
	private Date indate;
	private String kind;
	private int reply_seq;
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getIndate() {
		return indate;
	}
	public void setIndate(Date indate) {
		this.indate = indate;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	
	public int getReply_seq() {
		return reply_seq;
	}
	public void setReply_seq(int reply_seq) {
		this.reply_seq = reply_seq;
	}
	@Override
	public String toString() {
		return "ReplyVO [seq=" + seq + ", content=" + content + ", writer=" + writer + ", indate=" + indate + ", kind="
				+ kind + ", reply_seq=" + reply_seq + "]";
	}	
	
	
}
