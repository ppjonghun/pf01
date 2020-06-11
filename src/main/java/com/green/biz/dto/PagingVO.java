package com.green.biz.dto;

public class PagingVO {
	private int nowPage; // 현재페이지
	private int startPage; // 시작페이지
	private int endPage; // 끝페이지
	private int total; // 게시글 총 갯수
	private int cntPerPage; // 페이지당 글 갯수
	private int lastPage; // 마지막페이지
	private int start; // SQL 쿼리용
	private int end; // SQL 쿼리용
	private int cntPage = 10;
	private String searchCondition; // 검색 조건
	private String keyword;// 검색단어

	public PagingVO() {

	}

	public PagingVO(int total, int nowPage, int cntPerPage) {
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), cntPage);
		calcStartEnd(getNowPage(), getCntPerPage());
	}

	// 검색할려고 만듬
	public PagingVO(int total, int nowPage, int cntPerPage, String searchCondition, String keyword) {
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), cntPage);
		calcStartEnd(getNowPage(), getCntPerPage());
		setSearchCondition(searchCondition);
		setKeyword(keyword);
	}

	// 마지막 페이지 계산
	public void calcLastPage(int total, int cntPerPage) {
		if ((int) Math.ceil((double) total / (double) cntPerPage) == 0) {
			setLastPage(1);
		} else {
			setLastPage((int) Math.ceil((double) total / (double) cntPerPage));
		}
	}

	// 시작, 끝 페이지 계산
	public void calcStartEndPage(int nowPage, int cntPerPage) {

		if (nowPage > cntPage) {
			int p = nowPage / cntPage;
			cntPage = cntPage * p;
			setEndPage(((int) Math.ceil((double) nowPage / (double) cntPage)) * cntPage);
		} else {
			setEndPage(((int) Math.ceil((double) nowPage / (double) cntPage)) * cntPage);
		}
		
		
		if (getLastPage() < getEndPage()) {
			setEndPage(getLastPage());
		} 
		
		
		if(nowPage > cntPage) {
			int p = nowPage / cntPage;
			cntPage = cntPage * p;
			setStartPage(getEndPage() - cntPage + 1);
			if (getStartPage() < 1) {
				setStartPage(1);
			}
		}else {
			setStartPage(getEndPage() - cntPage + 1);
			if (getStartPage() < 1) {
				setStartPage(1);
			}
		}
	}

	// DB 쿼리에서 사용할 start, end 값 계산
	public void calcStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage * cntPerPage);
		setStart(getEnd() - cntPerPage + 1);
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCntPerPage() {
		return cntPerPage;
	}

	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getCntPage() {
		return cntPage;
	}

	public void setCntPage(int cntPage) {
		this.cntPage = cntPage;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "PagingVO [nowPage=" + nowPage + ", startPage=" + startPage + ", endPage=" + endPage + ", total=" + total
				+ ", cntPerPage=" + cntPerPage + ", lastPage=" + lastPage + ", start=" + start + ", end=" + end
				+ ", cntPage=" + cntPage + ", searchCondition=" + searchCondition + ", keyword=" + keyword + "]";
	}
}
