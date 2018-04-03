<%@page import="java.sql.PreparedStatement"%>
<%@page import="oracle.jdbc.driver.OracleDriver"%>
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
<title>14/ OneConnOne.jsp</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  	
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	
</head>
<body>
<div class="container">
<div class="page-header">
	<h1>회원 목록</h1>
</div>
<div class="row">
	<div class="col-md-6 col-md-offset-8 text-right">
		<a href="memberForm.jsp" class="btn btn-xs btn-default">회원등록</a>
	</div>
</div>
<%	

	// JDBC 변수 선언
	Connection conn = null; // 연결
	PreparedStatement pstmt = null; // 구문
	ResultSet rs = null; // 결과 집합, select 한 결과를 처리하는 객
	long startTime = System.currentTimeMillis();

for(int i = 0; i < 15; i++) {
	try {
		
	conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "java", "oracle");
	
	String query = " SELECT * FROM tb_member WHERE ROWNUM = 1 ";
	
	pstmt = conn.prepareStatement(query); // (ResultSet.CONCUR_READ_ONLY, ResultSet.CONCUR_READ_ONLY);
	
	rs = pstmt.executeQuery();
	if(rs.next()){
		out.println(rs.getString("mem_id"));
	}

} catch (SQLException ex) {

	out.println("DB 오류 : " + ex.getMessage());
	ex.printStackTrace();
} finally {

	if (rs != null) try{rs.close();}catch(Exception e) {}
	
	if (pstmt != null) try{pstmt.close();}catch(Exception e) {}
	
	// 연결 세션은 꼭 닫아주세요.
	if (conn != null) try{conn.close();}catch(Exception e) {}

	}
} // for end
	out.println("<br>소요시간 = " + (System.currentTimeMillis() - startTime ) );
%>
</div>
</body>
</html>