
<%@page import="util.Cookies"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>12/ loginCheck.jsp</title>
</head>
<body>
<%
   
	String id = request.getParameter("id");
	String pass = request.getParameter("passwd");
	String id_save= request.getParameter("id_save");
	// id, pass중 하나라도 널이면
	
	
	if(id == null || pass == null || "".equals(id) || id.equals("")) {
%>
	아이디나 패스워드가 비어있습니다. <br>
	<a href="login.jsp">로그인 페이지</a>
<% 
		
	}else{
		// id가 널이 아니고 패스워드와 같으면
		// 첫화면(index.jsp)러 리다이렉트
		if(id != null && id.equals(pass)) {
			Cookie cookie = null;
			if("Y".equals(id_save)){
				cookie = Cookies.createCookie("REMEMBER_ID",id,"/",60*60*24*7);
		        response.addCookie(cookie);	
			}else{
				//이전에 혹시 쿠키가 저장 되어 있을 수 있으므로 삭제 
				cookie = Cookies.createCookie("REMEMBER_ID","","/",0);
		        response.addCookie(cookie);	
			}
			
			String msg = URLEncoder.encode("로그인에 성공했네요~~","utf-8");
			//String msg = "로그인에 성공했네요~~";
			response.sendRedirect("/study/index.jsp?moon=" + msg);
		}else {
			out.println("아이디와 비밀번호가 같지 않아요~~");
			out.println("<a href=\"login.jsp\">로그인 페이지</a>");
		}
	}


%>




</body>
</html>