<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
  
    <title>16/ jstlCore.jsp</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  	
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  
  </head>
  
  <body>
  	<!-- // jstl var 로 시작하는 속성에는 EL 사용하지 마세요 -->
  	<c:set var="msg" value="1000" />
  	${msg} <br>
  	<c:set var="msg2" value="${msg + 4}"  />
  	${msg2} <br>
  	
  	<c:set var="member" value="<%=new Member() %>" />
  	<c:set target="${member}" property="mem_name" value="배고파ㅏㅏㅏㅏㅏㅏㅏ" />
  	<c:set target="${member}" property="mem_id" value="gilDong" />
  	${member.mem_name } <br>
   	${member.mem_phone = '042-719-8850'; ''}
   	${member.mem_phone} <br>
   	<hr>
   	<c:remove var="member" />
	
	1 : ${member.mem_name } <br>
	2 : ${member.mem_phone } <br>
	
	<c:set var="jumsu" value="89" />
	
	<c:if test="${jumsu > 90 && jumsu <= 100}">참 잘했어요 ~~ ~ ~ ~ ~ ~ <br></c:if>
	<c:if test="${jumsu gt 80 and jumsu le 90}">잘했어요 ~~ ~ ~ ~ ~ ~ <br></c:if>
	<c:if test="${jumsu > 70 and jumsu <= 80}">보통 ~~ ~ ~ ~ ~ ~ <br></c:if>
	<c:if test="${jumsu <= 70}">너 때문에 못 살아 ~~ ~ ~ ~ ~ ~ <br></c:if>
	
	<c:choose>
		<c:when test="${jumsu > 90 && jumsu <= 100}"> ㅋ ㅋ ㅋ ㅋ ㅋ ㅋ ㅋ</c:when>
		<c:when test="${jumsu gt 80 and jumsu le 90}"> ㅎ ㅎ ㅎ ㅎ ㅎ ㅎ ㅎ </c:when>
		<c:when test="${jumsu > 70 and jumsu <= 80}"> ㅋ ㅎㅋ ㅋㅎㅋㅎㅋㅎㅋ</c:when>
		<c:otherwise> ㅜ ㅜ ㅠ ㅠ ㅠ ㅠ ㅠ ㅠ ㅠ</c:otherwise>
	</c:choose>
	<hr>
	<c:forEach var="i" begin="1" end="10" step="1">
		${i} 배고파요 ~~ ~ ~ <br>
	</c:forEach>
	<hr>
	
	<c:set var="sum" value="0" />
	<c:forEach var="i" begin="1" end="100">
		<c:set var="sum" value="${sum + i}" />
	</c:forEach>
	1부터 100까지의 합 = ${sum} <br>	
	<hr>
	
	<%
		List<Member> list = new ArrayList();
		list.add(new Member("hong", "홍길동", "1234", "010-1111-2222", "hong@gmail.com", 0));
		list.add(new Member("sang", "상길동", "1234", "010-1111-2222", "hong@gmail.com", 0));
		list.add(new Member("kim", "김길동", "1234", "010-1111-2222", "hong@gmail.com", 0));
		
		request.setAttribute("members", list);
	
	%>
	<ul>
	<c:forEach var="user" items="${members}">
		<li>${user.mem_id} = ${user.mem_name} </li>
	</c:forEach>
	</ul>
	
	<ul>
	
	<hr style="border-color: red; border-style:botted; " > 
	<c:forEach var="user" items="${members}" begin="1" varStatus="st">
		<li> ${st.count}, ${st.index}, ${st.first}, ${st.current.mem_id}, ${user.mem_id} </li>
	</c:forEach>
	</ul>
	
	
   	
  </body>

</html>