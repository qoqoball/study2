<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  
    <title>타이틀</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  	
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  
  </head>
  
  <body>
  
    <a href="<%=request.getContextPath() %>/16/memberList11.jsp">회원목록</a> <br>
    <a href="${pageContext.request.contextPath}/16/memberList11.jsp">회원목록</a> <br>
    <a href='<c:url value="/16/memberList11.jsp" />'   >회원목록 </a> <br>
    
    <img alt="" src="/image/토마토.jpg" width="200px"> <br>
         
    <img alt="" src="<c:url value="img/토마토.jpg" />" width="200px"> <br>
    
    <a href="/study/common/download.dd?id=" class="btn btn-sm btn-primary" >
    	<span class="glyhicon glyohicon-fioppy-disk"> Down </span>
    </a> <br>
  
  </body>

</html>