<%@page import="com.shopping.model.bean.Member"%>
<%@page import="com.shopping.model.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./../common/common.jsp"%>

<%
	MemberDao dao = new MemberDao();
	Member bean = new Member();
	
	bean.setAddress(request.getParameter("address"));
	bean.setBirth(request.getParameter("birth"));
	bean.setGender(request.getParameter("gender"));
	bean.setId(request.getParameter("id"));
	bean.setMarriage(request.getParameter("marriage"));
	bean.setName(request.getParameter("name"));
	bean.setPassword(request.getParameter("password"));
	
	String hobby = "";
	String[] hobbies = request.getParameterValues("hobby");
	out.print(hobbies + "<br>");
	if(hobbies == null) {
		hobby = null;
	} else {
		for(int i=0; i<hobbies.length; i++){
			hobby += hobbies[i] + "/";
		}
	}
	bean.setHobby(hobby);
	
	out.print(bean + "<br>");
	
	int cnt = dao.insertData(bean);

	String message = "";
	
	if(cnt ==1) {
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