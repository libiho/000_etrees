package com.spring.board.vo;

public class TypeVo {
	private int pageNo = 0; //현재 페이지 번호
	private int perPage = 5; // 페이지당 게시글 수
	
	
	private String boardType;
	
	
	
	
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	
	
	
	
	
	
	
	
	
	
	
}
