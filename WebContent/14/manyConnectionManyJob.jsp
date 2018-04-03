<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.SQLException"%>

<%@page import="java.sql.DriverManager"%>

<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.Statement"%>

<%@page import="java.sql.Connection"%>

<%@page import="oracle.jdbc.driver.OracleDriver"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="ko">

  <head>

    <meta charset="UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>14/ manyConnManyJob.jsp</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>	

  </head>  

<body>

<div class="container">

<div class="page-header">

	<h2>회원 목록</h2>

</div>

<div class="row">

	<div class="col-md-4 col-md-offset-8  text-right">

		<a href="memberForm.jsp" class="btn btn-sm btn-primary">회원등록</a>	

	</div>

</div>

 

<div class="row">

<%

//JDBC 변수 선언

Connection conn = null; // 연결

PreparedStatement  pstmt = null; // 구문

ResultSet  rs = null;   // select 한 결과를 담는 객체

long startTime = System.currentTimeMillis();

for(int i = 0; i < 15; i++) {

	try{

		conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");	

		String query = "SELECT * FROM tb_member2 WHERE ROWNUM = 1 ";			

		pstmt = conn.prepareStatement(query); //ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
		
		rs = pstmt.executeQuery();

		if(rs.next()) {

			out.println(rs.getString("mem_id"));

		}	

	}catch(SQLException ex){

		out.println("DB 오류 : " + ex.getMessage());

		ex.printStackTrace();

	}finally{

		if(rs != null) try{rs.close();}catch(Exception e){}

		if(pstmt != null) try{pstmt.close();}catch(Exception e){} 

		if(conn != null) try{conn.close();}catch(Exception e){} // 연결세션은 꼭 닫아주세요

	}

} // for end

out.println("<br>소요시간 = " + (System.currentTimeMillis() - startTime));

%>

</div>

</div>

</body>

</html>