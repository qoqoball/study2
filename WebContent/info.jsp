<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
<%@ 디렉티브 : 페이지 설정, 태그, 외부파일 %>
<% ~~~ %> : 스크립트릿, 자바코드영역
<%= ~~ %> : 표현식, out.print(); 의 약식표현
<%! ~~~ %>: 선언부, 멤버변수, 멤버메서드 생성

--%>

<%
int sum = 0;
for(int i = 1; i <= 10; i++) {
	sum += i;


%>
	<div class="abced"><%=i %>까지의 결과 =<%=sum%><br></div>

<%
}
%>
</body>
</html>