package com.study.common.vo;

public class PagingVO {

	private int totalRowCount ; // 총 레코드 갯수
	private int totalPageCount; // 총 페이지 갯수
	private int listSize; // 화면당 레코드 갯수
	private int startRow; // 시작 레코드 번호, (페이지) 시작 로우
	private int endRow; // (페이지) 마지막 로우
	private int currentPage; // 현재 페이지
	
	private int startPage; // (페이지블럭에서) 시작페이지 번호
	private int endPage; // (페이지블럭에서) 마지막페이지 번호
	private int pageSize; // 페이지블럭 사이즈
	
	public void setting(int rowCount ) {
		this.totalRowCount = rowCount;
		this.currentPage = currentPage;
		if(currentPage < 1 ) currentPage = 1;
		if(listSize < 1 ) listSize = 10;
		if(pageSize < 1 ) pageSize = 10;
		
		totalPageCount = (this.totalRowCount - 1) / listSize + 1;
		startRow = (currentPage - 1) * listSize + 1;
		endRow = currentPage * listSize;
		
		// currentPage : 1 ~ 10 	11 ~ 20		21~30		21~33
		// startPage   : 1 			11			21			31
		// endPage     : 10			20			30			40
		
		startPage = ((currentPage - 1) / pageSize) * pageSize + 1;
		endPage = startPage + pageSize - 1;
		if(endPage > totalPageCount) endPage = totalPageCount;
		
	}

	public int getTotalRowCount() {
		return totalRowCount;
	}

	public void setTotalRowCount(int totalRowCount) {
		this.totalRowCount = totalRowCount;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
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

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	

	
}
