package com.study.board.web;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.study.board.service.BoardServiceImpl;
import com.study.board.vo.Board;
import com.study.servlet.IController;

public class BoardViewController implements IController {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		
		BoardServiceImpl boardrService = new BoardServiceImpl();
		String viewPage = "/WEB-INF/view/Board/boardView.jsp"; // viewPage는 상대경로 x 절대경로로 해야 실행된다.
		
		String bo_no = request.getParameter("bo_no");	
	
		if(bo_no == null || bo_no.trim().equals("")) {
			return "redirect:/Board/boardList.do";
		}
		
		
		Board board = boardrService.getBorad(Integer.parseInt(bo_no)); 
		request.setAttribute("board", board);

		
		
		return viewPage;
	}

}
