package com.study.board.web;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.study.board.service.BoardServiceImpl;
import com.study.board.vo.Board;
import com.study.board.vo.BoardSearch;
import com.study.servlet.IController;

public class BoardInsertController implements IController {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException {

		// <jsp:useBean id="board" class="com.study.board.vo.Board" />
		// <jsp:setProperty property="*" name="board" />
		Board board = new Board();
		
		try {
		BeanUtils.populate(board, request.getParameterMap());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		board.setBo_ip( request.getRemoteAddr() );
		
		BoardServiceImpl boardService = new BoardServiceImpl();
		
		int cnt = boardService.registBoard(board);
		
		
		if(cnt > 0) {
			request.setAttribute("message", "성공");
		} else {
			request.setAttribute("message", "실패");
		}
		
		request.setAttribute("board", board);
		// 왜 담았지?  ->  글번호 때문에!
		
		return "/WEB-INF/view/Board/boardInsert.jsp";

	}

}



