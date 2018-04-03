<%@page import="java.sql.PreparedStatement"%>
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
<title>13/ memberEdit.jsp</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  	
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	
</head>
<body>
<div class="container">
<div class="page-header">
	<h2>회원 정보 수정</h2>
<form action="memberUpdate.jsp" method="post">
<div class="row">	
	<%	

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
	
	String query = "SELECT * FROM tb_member WHERE mem_id = '" + mem_id + "'";
	
	pstmt = conn.prepareStatement(query);
	pstmt.setString(1, mem_id);	
	rs = pstmt.executeQuery();
	
%>

<table class="table">
	<tbody>
		<%
		if(rs.next()){ // 프라이머리 키이기 때문에 있거나 없거나, 굳이 while 사용하지 않아도 ㄱㅊ
		
		%>		
		<tr>
			
			<th>ID</th>
			<td>
				<%=rs.getString("mem_id") %>
				<input type="hidden" name="mem_id" value="<%=rs.getString("mem_id") %>">
			</td>
		
		</tr>
		
		<tr>
			
			<th>이름</th>
			<td>
				<input type="text" name="mem_name" value="<%=rs.getString("mem_name") %>">
			</td>
		
		</tr>

		<tr>
			
			<th>연락처</th>
			<td>
				<input type="text" name="mem_phone" value="<%=rs.getString("mem_phone") %>">
			</td>
		
		</tr>

		<tr>
			
			<th>이메일</th>
			<td>
				<input type="text" name="mem_email" value="<%=rs.getString("mem_email") %>">
			</td>
		
		</tr>
		
		<tr>
			
			<th>가입일</th>
			<td>
				<%=rs.getString("reg_date") %>
			</td>
		
		</tr>
		
		<%
		
		} else {
		
		%>
		
		<tr>
		
			<td>해당 회원이 존재하지 않습니다.</td>
		
		</tr>
	
		<%
	
		}
		
		%>
	
	</tbody>

</table>
</div>
<div class="row">
	<div class="col-md-6 col-xs-4">
	
		<a href="memberList.jsp" class="btn btn-xs btn-default">목록으로</a>
	</div>
	<div class="col-md-6 text-right">
		<button type="submit" class="btn btn-xs btn-default">저장</button>
	</div>	
</div>
</form>


<%

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