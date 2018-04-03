package com.study.member.web;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.study.member.service.MemberServiceImpl;
import com.study.member.vo.Member;
import com.study.member.vo.MemberSearch;
import com.study.servlet.IController;

public class MemberListController implements IController {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		
		MemberSearch memberSearch = new MemberSearch();
		
		String currentPage = request.getParameter("currentPage");
		
		if(currentPage != null && !currentPage.trim().equals("")) {
			memberSearch.setCurrentPage(Integer.parseInt(currentPage));
			
		}
		
		MemberServiceImpl memberService = new MemberServiceImpl();
		memberSearch.setListSize(3);
		memberSearch.setting( memberService.getMemberCount(memberSearch));
		
		List<Member> list = memberService.getMemberList(memberSearch);
		request.setAttribute("list", list);
		request.setAttribute("search", memberSearch);
		
		String viewPage = "/WEB-INF/view/member/memberList.jsp";
		
		
		return "/WEB-INF/view/member/memberList.jsp";
	}

}
