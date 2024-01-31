<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./../common/common.jsp" %>


<% request.setCharacterEncoding("UTF-8"); %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	아이디 : ${param.id}<br/>
	
	<c:choose>
		<c:when test="${param.id == 'hong'}">
			${param.id}님 방가워요^^<br/>
		</c:when>
		<c:when test="${param.id eq 'park'}">
			${param.id} 매니점님 수고하세요^^<br/>
		</c:when>	
		<c:otherwise>
			누구시죠?<br/>
		</c:otherwise>
	</c:choose>	
	
	비번 : ${param.password}<br/>
	숫자 : ${param.su}<br/>
	
	<c:set var="total" value="0"/>
	
	<c:forEach var="i" begin="1" end="${param.su}" step="1">
		<c:set var="total" value="${total + i}"/>
	</c:forEach>
	
	총합 : ${total}<br/>
	
	취미 : 
		${paramValues.hobby[0]}
		${paramValues.hobby[1]}
		<br/>
	포인트 : ${param.mpoint}<br/>
	<c:if test="${param.mpoint >= 500}">
		<c:out value="high point" /> 
	</c:if>
	<c:if test="${param.mpoint < 500}">
		<c:out value="low point"></c:out> 
	</c:if>
</body>
</html>