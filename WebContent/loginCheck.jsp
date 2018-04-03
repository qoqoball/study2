<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>05/ loginCheck.jsp </title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("passwd");
	// id, pass 중 하나라도 널이면
	if(id == null || pass ==null
	|| "".equals(id) || "".equals(pass))  {
%>		
	아이디나 패스워드가 비어있습니다. <br>
	<a href="login.jsp">로그인 페이지</a>

<%
	} else{
		// id가 널이 아니고 패스워다와 같으면
		// 첫화면(index.jsp)로 리다이렉트
		if(id != null && id.equals(pass)){
			String msg = URLEncoder.encode("로그인에 성공했네요~~", "utf-8");
			// 0response.sendRedirect("/study/index.jsp");
			response.sendRedirect("/study/index.jsp?moon=" + msg);
		}else {
			out.println("아이디와 비밀번호가 같지 않습니다.");
			out.println("<a href=\"login.jsp\">로그인 페이지</a>");
		}
	}

%>
</body>
</html>