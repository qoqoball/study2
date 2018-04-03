<%@page import="com.study.member.service.MemberServiceImpl"%>
<%@page import="com.study.member.vo.Member"%>
<%@page import="org.apache.catalina.tribes.MembershipService"%>
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
<title>13/ memberUpdate.jsp</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  	
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	
</head>
<body>
<div class="container">
<jsp:useBean id="member" class="com.study.member.vo.Member" />
<jsp:setProperty property="*" name="member" />
	
	
	<%	
/* 
	// JDBC 변수 선언
	Connection conn = null; // 연결
	PreparedStatement pstmt = null; // 구문
	ResultSet rs = null; // 결과 집합, select 한 결과를 처리하는 객

	try {
	
	// OracleDriver driver = new OracleDriver();
	String driver = "oracle.jdbc.driver.OracleDriver"; // 외부 설정파일에서 읽기
	Class.forName(driver);	
	
	conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "java", "oracle");
	
	String mem_id = request.getParameter("mem_id");
	String mem_name = request.getParameter("mem_name");
	String mem_phone = request.getParameter("mem_phone");
	String mem_email = request.getParameter("mem_email");
	
	Member member = new Member();
	member.setMem_id(mem_id);
	member.setMem_name(mem_name); */
	

	// JDBC 변수 선언
	Connection conn = null; // 연결
	PreparedStatement pstmt = null; // 구문
	ResultSet rs = null; // 결과 집합, select 한 결과를 처리하는 객
	
	
	
	try {
	MemberServiceImpl memberService = new MemberServiceImpl();
	int cnt = memberService.modifyMember(member);
	if(cnt > 0){
			
	%>	
	<div class="alert alert-success" role="alert">
		추카추카~~
	</div>
	<%
	}else {
	%>
	<div class="row">
		실패~~
	</div>
	<%
	}

	} catch (ClassNotFoundException ex) {

	out.println("드라이버가 없거나, 명칭이 틀렸을 거야~~");

} catch (SQLException ex) {

	out.println("DB 오류 : " + ex.getMessage());

} finally {

	if (rs != null) try{rs.close();}catch(Exception e) {}
	
	if (pstmt != null) try{pstmt.close();}catch(Exception e) {}
	
	// 연결 세션은 꼭 닫아주세요.
	if (conn != null) try{conn.close();}catch(Exception e) {}

}
%>

</body>
</html>