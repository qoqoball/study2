<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>List</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>

<div class="container">
	<div class="page-header">
		<h1>회원 목록</h1>
	</div>

<div class="row">
	<div class="col-md-6 col-md-offset-8 text-right">
		<a href="memberForm.do" class="btn btn-sm btn-primary">회원등록</a>
	</div>
</div>

<div class="row">
	
	<table class="table table-striped">
		<thead>

			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>가입</th>
			</tr>
		
		</thead>
		
		<tbody>
		
		
		<c:if test="${empty list}">
		
			<tr>
			
				<td>목록이 조회되지 않았습니다.</td>
			
			</tr>	
		
		</c:if>
		
		<c:if test="${not empty list}">
		
		<c:forEach var="member" items="${list}" > 
			
				<tr>
					
					
					<td>${member.mem_id}</td> <!-- 현재 몇번 반복하고 있는지 알고싶을 때 ${st.count}쓰면됨.-->
					<td><a href="memberView.do?mem_id=${member.mem_id}">
						${member.mem_name}
					</a></td>
					<td>${member.mem_phone}</td>
					<td>${member.mem_email}</td>
					
					<td>${member.reg_date}</td>
				
				</tr>		
			
		 	</c:forEach> 
		
		</c:if>
		
		
		
		</tbody>
	</table>
	</div>
	
	<div class="row text-center">
		<div>
			<ul class="pagination">
			
				<c:if test="${search.startPage > 1}">
				
					<li>
					
						<a href="memberList.do?currentPage=${search.startPage -1}">
						<span aria-hidden="true">&laquo;</span>
						</a>
						
					</li>
				
				</c:if>
				<c:forEach var="i" begin="${search.startPage}" end="${search.endPage}">
				
					<c:if test="${i eq search.currentPage}">
					
						<li class="active"><a href="#">${i}</a></li>
					
					</c:if>
					<c:if test="${i ne search.currentPage}">
					
						<li><a href="memberList.do?currentPage${i}">${i}</a></li>
					
					</c:if>
				
				
				</c:forEach>
			
				<c:if test="${search.endPage < search.totalPageCount}">
				
					<li><a href="memberList.do?currentPage=${search.endPage + 1}">
					<span aria-hidden="true">&raquo;</span>
					</a>
				
				</c:if>
			
			
			</ul>
		
		</div>
	
	
	</div>
	
	
	
</div>
</body>
</html>