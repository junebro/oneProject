<%@page import="com.shopping.model.bean.Board"%>
<%@page import="com.shopping.model.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./../common/common.jsp"%>

<%
	BoardDao dao = new BoardDao();
	Board bean = new Board();
	
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String subject = request.getParameter("subject");
	String contents = request.getParameter("contents");
	
	bean.setId(id);
	bean.setPassword(password);
	bean.setSubject(subject);
	bean.setContents(contents);
	
	out.print(bean + "<br>");
	
	int cnt = -1;
	cnt = dao.InsertData(bean);
	String message = "";
	
	if ( cnt == 1 ) {
		message = "인서트 성공";
		
	} else {
		message = "인서트 실패";		
	}
	
	out.print(message + "<br>");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
<script>
	$(document).ready(function() {
		$("button").click(function() {
			$("p").slideToggle();
		});
	});
</script>

</head>
<body>

</body>
</html>