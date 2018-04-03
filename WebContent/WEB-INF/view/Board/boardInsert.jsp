<%@page import="com.study.board.service.BoardServiceImpl"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>board/ boardInsert.jsp</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  	
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	
</head>
<body>
<div class="container">
<jsp:useBean id="board" class="com.study.board.vo.Board" />
<jsp:setProperty property="*" name="board" />
	<%	
	
	board.setBo_ip(request.getRemoteAddr());
	BoardServiceImpl boardService = new BoardServiceImpl();
	int cnt = boardService.registBoard(board);


	if(cnt > 0) {
	%>	
	<div class="row text-center" />
	<div class="alert alert-success">
		글 등록에 성공하였습니다.
	</div>
	<a href="boardList.jsp" class="btn btn-xs btn-default">목록으로</a>
	<%
	}else {
	%>
	<div class="row">
		실패~~
	</div>
	<%
	}
	%>
</body>
</html>