<%@page import="com.study.member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
  	<c:set var="msg" value="Hello 오늘은 금요일~~ hoho " />
  	
  	${fn:length(msg)} <br>
  	${fn:toUpperCase(msg)} <br>
  	${fn:contains(msg,"금요일") } <br>
  	${fn:replace(msg, 'hoho', 'kara') } <br>
  	
  	<c:forEach items="${fn:split(msg, ' ') }" varStatus="st">
  		${st.count}, ${st.current} <br>
  	</c:forEach>
  	
   	<c:set var="member" value='<%=new Member("hong", "길동2", "1234", "042-719-8850", "hong@daum.net", 10) %>'/>
  	id = ${member.mem_id} <br>
  	id = ${member.getMem_id() } <br>
  	${member.setMem_id('Nolja')} <br>
  	id = ${member.mem_id} <br>
  
  	${FileUtil.fancySize(15245558) } <br>
  	
  	${greaterThen = (a,b) -> a > b ? true : false; ''}
  	
  	${greaterThen(3,2) } <br>
  	
  	${factorial = (n) -> n == 1 ? 1 : n * factorial(n-1); '' } 
  	
  	${factorial(5) } <br>
  	
  	size < 1024 ? size += "bytes" : (size < 10485760 ? size / 1024.0 += "Kb" : size / 10485760.0 += "Mb")
  	
  	${fancy = (size)-> size < 1024 ? size += "bytes" 
  								   : (size < 10485760 ? size / 1024.0 += "Kb"
  								   					: size / 10485760.0 += "Mb") ; '' }
  <hr>
  ${fancy(102455541)} <br>  	
  
  <!-- // 문제 : 람다식을 한번 만들어 보세요 -->
  <c:set var="dan" value="7" />
  <ul>
  ${gugu = (dan, i) -> dan * i }
  <c:forEach begin="1" end="9" var="i">
  	<li>${gugu(dan, i) } </li>

  </c:forEach>
  </ul>
  
  
  
  
  
  </body>

</html>