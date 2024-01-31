<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = (String)request.getAttribute("id");
%>

	<h3>개별 변수 바인딩</h3>
	아이디 : <%=id%><br>
	이름 : ${requestScope.name}<br>
	나이 : ${requestScope.age}<br>
	취미 : ${requestScope.hobby}<br>
	<hr>
	
	<h3>bean 객체 바인딩</h3>
    아이디 : ${requestScope.xxx.id}<br>
	이름 : ${requestScope.xxx.name}<br>
	나이 : ${requestScope.xxx.age}<br>
	취미 : ${requestScope.xxx.hobby}<br>


	<h3>세션 영역 바인딩</h3>
    회사 : ${sessionScope.company}<br>
	주소 : ${address}<br>
	
	<h3>애플리케이션 영역 바인딩</h3>
	인사말 : ${applicationScope.hello}<br>
</body>
</html>