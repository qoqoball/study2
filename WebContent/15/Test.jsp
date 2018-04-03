<%@page import="com.study.member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  
mem_id = <%=request.getParameter("mem_id") %> <br>
el mem_id = ${param.mem_id} <br>

${1000 + "4"} <br>
${20 div 4} <br>
${20 % 3} <br>
${20 mod 3} <br>

${4 > 3} <br>
${4 gt 3} <br>

${4 gt 3 and 1 eq 1} <br>
${4 > 3 && 1 == 1} <br>

<%
 // String abc = "hello";
 request.setAttribute("abc", "Hello");
%>

\${empty abc} <br>
\${empty param.mem_id} <br>
\${empty param.mem_id} = ${empty param.mem_id} <br>

${ 4 > 5 ? "4가 크네요" : "4가 작네요" } <br>

<%
	Member member = new Member("hong", "길동아빠", "1234", "042-710-8850", "gildong@daum.net", 1004);
	Member member2 = new Member("nolja", "놀자", "1234", "042-502-2234", "nolja@daum.net", 0);
	
	request.setAttribute("member", member);
%>
\${member.mem_id} = ${memberl.mem_id} <br>
\${member.mem_name}의 마일리지는 ${member.mem_mileage}입니다. <br>
\${member.mem_name += '의 마일리지는 '  += member.mem_mileage += " 입니다."} <br>
 ${member.mem_name}의 마일리지는 ${member.mem_mileage}입니다. <br>
 ${member.mem_name += '의 마일리지는 ' += member.mem_mileage += " 입니다." } <br>
 
 
 ${arr =[1, 2, 3, 4, 5]} <br />
 \${arr = [2] } = ${arr[2] } <br>
 <hr>
 ${var1 = 1004; var2 = 100; ''} <br>
 값은 = ${var1}, ${var1 + var2} <br>
 <hr>
 <%=member.getMem_name() %> <br>
 <%=member2.getMem_name() %> <br>
 <hr>
 ${arr1 = ["길동아빠", "소향엄마", "놀자"]; ''}
 ${arr2 = {'name':'홍길동','age':20 } ; ''}
 
 \${arr1[2] } = ${arr1[2]} <br>
 ${arr2['name']} = ${arr2.name } <br> 
 
  </body>

</html>