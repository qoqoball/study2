<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html lang="ko">
<fmt:setLocale value="de" />
<fmt:bundle basename="resource.message"  >
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><fmt:message key="BOARD.TITLE" />  </title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>	
  </head>  
<body>
<div class="container">
<div class="page-header">
	<h2>게시판 상세보기</h2>
</div>
<div class="row">

<table class="table">
	<tbody>
		<c:if test="${not empty board}">
			<tr>
				<th><fmt:message key="BOARD.TITLE" /></th>
				<fmt:message key="BOARD.MESSAGE" var="bsg">
					<fmt:param value="${board.bo_title}"   />
					<fmt:param value="1004" />						
				</fmt:message>
				<td title="${bsg}">${board.bo_no}</td>
			</tr>		
			<tr>
				<th><fmt:message key="BOARD.WRITER" /></th>
				<td>${board.bo_writer}</td>
			</tr>
			<tr>
				<th><fmt:message key="BOARD.PASSWD" /></th>
				<td>${board.bo_passwd}</td>
			</tr>
			<tr>
				<th><fmt:message key="BOARD.CONTENT" /></th>
				<td>${board.bo_content}</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td>${board.bo_reg_date}</td>
			</tr>
		</c:if>
		<c:if test="${ empty board }">
			<tr>
				<td><fmt:message key="BOARD.NOTFOUND" /></td>
			</tr>
		</c:if>
	</tbody>
</table>
</div>

<div class="row">
	<div class="col-md-6">
		<a href="boardList.do" class="btn btn-sm btn-warning">
		<fmt:message key="BOARD.LIST" /></a>
	</div>
	<div class="col-md-6 text-right">
		<a href="boardEdit.do?bo_no=${board.bo_no}" class="btn btn-sm btn-primary">
		<fmt:message key="BOARD.SUBMIT" /></a>	
	</div>
</div>
</div>
</body>
</fmt:bundle>
</html>
