<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStreamReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   request.setCharacterEncoding("utf-8");
   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>08/ readFile.jsp</title>
<%-- <script type="text/javascript" src="<%=ctxPath %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=ctxPath %>/js/month.js"></script>
<script type="text/javascript" src="<%=ctxPath %>/js/abcd.js"></script>
<link href="<%=ctxPath %>/css/main.css" type="text/css"> --%>
</head>
<body>
<table>
	<colgroup>
	<col width="20%" />
	<col />
	</colgroup>
	<tr>
		<td colspan="2">
			<!-- 메뉴영역 START top.jsp?age=36&id=ara -->
			<jsp:include page="/include/top.jsp" flush="false" />
			 <jsp:param value="36" name="age" /> <!-- 있던 파라미터 외 파라미터를 더 추가하고 싶을 때 -->
			 <jsp:param value="이민경" name="id" />
			 </jsp:include>
			<!-- 메뉴영역 END -->
		</td>
	</tr>
	<tr>
		<td>
			<!-- 좌측메뉴 START -->
			<%
			int sum = 5050;
			%>
			<%-- <jsp:include page="/include/left.jsp" flush="false" /> --%>
			<%@include file="/include/left.jsp" %>
			<jsp:include page="/include/left.jsp" flush="false" />
			<!-- 좌측메뉴 END -->
		</td>
		<td>
			<!-- 본문 START -->
			경로 1 : <%=application.getRealPath("") %> <br>
			경로 2 : <%=application.getRealPath("/08/notice.txt") %> <br>
			경로 3(deprecate) : <%=request.getRealPath("/08/notice.txt") %> <br>

<%
	String path = application.getRealPath("/08/notice.txt");
%>
<hr>
<%
	char[] buff = new char[32];
	int len = -1;
	
	InputStreamReader reader = null;
	
	try{
		reader = new InputStreamReader( new FileInputStream(path), "utf-8");
		while( (len = reader.read(buff)) != -1){
			out.print(new String(buff, 0, 32));
		}
	}catch(IOException ex){
		out.print(ex.getMessage());
	}finally{
		if(reader != null)try{ reader.close();}catch(Exception e){}
	}
%>
			
			<!-- 본문 END -->
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<!-- 푸터 START -->
			<jsp:include page="/include/footer.jsp" flush="false" />
			<!-- 푸터 END -->
		</td>
	</tr>

</table>




</body>
</html>