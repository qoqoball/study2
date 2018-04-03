<%@page import="com.study.member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
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
  
  <c:set var="msg">서지연, 나혜진, 조아라, 이민경, 김연임, 남솔, 한재은</c:set>
  <c:set var="msg2"><h4>어제 술을 많이 먹어서 조금전에 일어났습니다.</h4>
  <b style="color: blue; font-size:130%;">영진이 아빠 파이팅</b> </c:set>
  <script>alert("불금이네요~~~~~"); // location.href="http://www.daum.net";</script>
  
  <pre>
  ${msg}
  
  <c:forTokens items="${msg}" delims="," var="m" varStatus="st">
  ${st.count}, ${m}
  </c:forTokens> <!-- 쪼개서 하나씩 입력하는 것 -->
  
  ${msg2}
  
  <c:out value="${msg2}" escapeXml="true" />
  
  msg3=<c:out value="${msg3}" default="N/A" />
  
  
  <c:set var="member" 
  		 value='<%=new Member("hong", "길동", "1234", "042-719-8850", "hong@daum.net", 10) %>' />
 
 <c:catch var="ex">
  ${member.mem_name }
  ${member.mem_id3 }
  ${member.mem_pwd }
 </c:catch>
 휴~~~~ 
  
   </pre>
 
 <c:if test="${not empty ex }">
	예외발생 : ${ex.message}
 </c:if>
   
  
  </body>

</html>