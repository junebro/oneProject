<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="<%=appName%>/WorldServlet" method="post">
		순번 : <input type="text" name="pnum" value="1"><br />  
		이름 : <input type="text" name="name" value="박영희"><br /> 
		회사 : <input type="text" name="company" value="IT"><br /> 
		가격 : <input type="text" name="price" value="300"> <br /> 
		<input type="submit" value="전송">
	</form>
</body>
</html>