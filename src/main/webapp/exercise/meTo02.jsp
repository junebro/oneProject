<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.shopping.model.bean.Member" %>    
<%
	Member bean = new Member();	
%>    
<%
	request.setCharacterEncoding("UTF-8") ;

	String id = request.getParameter("id") ;
	String password = request.getParameter("password") ;
	int mpoint = Integer.parseInt(request.getParameter("mpoint")) ;

	String[] hobbies = request.getParameterValues("hobby");
	String hobby = "" ;
	
	if(hobbies == null){// 아무것도 체크 안하면
		hobby = "제발 좀 체크 해주세요.";
	}else{
		for(int i=0;i<hobbies.length;i++){
			hobby += hobbies[i] + "," ; 
		}	
	}	
	
	bean.setId(id);
	bean.setPassword(password);
	bean.setHobby(hobby);
	bean.setMpoint(mpoint);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	아이디 : <%=bean.getId()%><br/>
	비번 : <%=bean.getPassword()%><br/>
	취미 : <%=bean.getHobby()%><br/>
	포인트 : <%=bean.getMpoint()%><br/>
	객체 : <%=bean%>
</body>
</html>






