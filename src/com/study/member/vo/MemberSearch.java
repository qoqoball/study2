package com.study.member.vo;

import com.study.common.vo.PagingVO;

public class MemberSearch extends PagingVO {

	private String searchWord = "";
	private String searchType = "";
	
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	
	
	
}
