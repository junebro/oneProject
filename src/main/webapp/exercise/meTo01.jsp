<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 한글 깨짐 방지를 위한 문자열 인코딩으로 반드시 최상단에 명시해야 합니다.
	request.setCharacterEncoding("UTF-8") ;

	// 자바 코딩하는 공간으로 '스크립트릿'이라고 합니다.
	String name = "김철수";
	int age = 30 ;
	
	// request 내장 객체에 파라미터 정보가 담겨져 넘어 옵니다.
	String id = request.getParameter("id") ;
	String password = request.getParameter("password") ;
	int mpoint = Integer.parseInt(request.getParameter("mpoint")) ;
	
	// 체크 박스 양식은 여러 개 선택이 가능하므로 getParameterValues() 메소드를 사용합니다.
	String[] hobbies = request.getParameterValues("hobby");
	String hobby = "" ;
	
	if(hobbies == null){// 아무것도 체크 안하면
		hobby = "제발 좀 체크 해주세요.";
	}else{
		for(int i=0;i<hobbies.length;i++){
			hobby += hobbies[i] + "," ; 
		}	
	}
	
%>

<%! 
	// 선언문 : 인스턴스 변수나 인스턴스 메소드를 작성하는 영역입니다.
	public String sayHello(String name){
		return name + "님~~안녕하세요";
	}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- html 주석은 소스 보기에서 보입니다. -->
	
	<%-- jsp 주석은 소스 보기에서 보이지 않습니다. --%>
	
	아이디 : <%=id%><br/>
	이름 : <%=name%><br/>
	비번 : <%=password%><br/>
	나이 : <%=age%><br/>
	포인트 : <%=mpoint+100%><br/>
	취미 : <%=hobby%><br/>   
	인사말 : <%=sayHello("이순자")%><br/>
</body>
</html>





