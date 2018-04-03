package com.study.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns= {"/admin/*", "*.nhm"})
public class HelloServlet extends HttpServlet {
	
	@Override
	public void init() throws ServletException {
		// 최초에 메모리에 올라올 때 (인스턴스 될 때 1번 호출)
		super.init();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 사용자의 요청이 get 방식인 경우 호출
		PrintWriter out = resp.getWriter();
		out.println("<html lang=\"ko\">" );
		out.println("<head>");
		out.println("<title>Hello</title>");
		out.println("</head>");
		out.println("<body>");
		String msg = "Hello 아라사이트에 오신 걸 환영합니다.";
		out.println("<h3>" + msg + "</h3>");
		out.println("<body>");
		out.println("</html>");
		
		
	}
	
	@Override
	public void destroy() {
		// 메모리에서 해체될 때
		super.destroy();
	}
	
}
