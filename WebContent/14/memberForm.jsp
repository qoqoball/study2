<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>13/ memberForm.jsp</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  	
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	
</head>
<body>
<div class="container">

<div class="page-header">
	<h2>회원 등록</h2>
	
<form action="memberInsert.jsp" method="post">
<div class="row">	


<table class="table">
	<tbody>	
		<tr>
			
			<th>ID</th>
			<td>
				<input type="text" name="mem_id" value="">
			</td>
		
		</tr>
		
		<tr>
			
			<th>비밀번호</th>
			<td>
				<input type="password" name="mem_pwd" value="">
			</td>
		
		</tr>
		
		<tr>
			
			<th>이름</th>
			<td>
				<input type="text" name="mem_name" value="">
			</td>
		
		</tr>

		<tr>
			
			<th>연락처</th>
			<td>
				<input type="text" name="mem_phone" value="">
			</td>
		
		</tr>

		<tr>
			
			<th>이메일</th>
			<td>
				<input type="text" name="mem_email" value="">
			</td>
		
		</tr>
	</tbody>

</table>
</div>
<div class="row">
	<div class="col-md-6 col-xs-4">
	
		<a href="memberList.jsp" class="btn btn-xs btn-default">목록으로</a>
	</div>
	<div class="col-md-6 text-right">
		<button type="submit" class="btn btn-xs btn-default">저장</button>
	</div>	
</div>
</form>

</body>
</html>