<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	아이디 : ${param.id}<br/>
	비번 : ${param.password}<br/>
	취미 : 
		${paramValues.hobby[0]}
		${paramValues.hobby[1]}
		<br/>
	포인트 : ${param.mpoint}<br/>
</body>
</html>