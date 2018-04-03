<%@page import="com.study.member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	조아라 사이트
	<a href="<%=request.getContextPath() %>/index.jsp">Home</a>
	<a href="<%=request.getContextPath() %>/member/memberList.do">회원관리</a>
	<a href="<%=request.getContextPath() %>/Board/boardList.do">게시판</a>
<%-- 	id = <%=request.getParameter("id") %> <!-- 사용자가 건낸 정보를 넘겨서 받는 것이니까 -->
	age = <%=request.getParameter("age") %> --%>
	<%
		Member mem = (Member)session.getAttribute("LOGIN");
		if(mem != null){
	
	%>
	
	
	<!-- 로그인 상태인 경우 -->
	<%=mem.getMem_name() %>님 방가~~   
	<a href="<%=request.getContextPath() %>/12/logout.jsp">로그아웃</a>
<%

		} else {

%>	
	<!-- 비 로그인 상태인 경우 -->
	<a href="<%=request.getContextPath() %>/12/login.jsp">로그인</a>
<%
		}
%>
</div>
<body>

<hr>
	

</body>