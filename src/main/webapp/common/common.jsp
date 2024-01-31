<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.*"%>

<%-- jstl tag library section --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%-- whoLogin 변수는 현재 로그인 상태를 알려주는 변수 입니다. --%>
<%-- 미로그인(0), 일반 사용자(1), 관리자(2) --%>
<c:set var="whologin" value="0" />

<%-- 아이디가 'admin'이면 '관리자'입니다. --%>
<%-- loginfo 속성을 사용하여 현재 로그인 상태를 확인할 수 있습니다. --%>
<c:if test="${not empty sessionScope.loginfo}">
	<c:if test="${sessionScope.loginfo.id == 'admin'}">
		<c:set var="whologin" value="2" />
	</c:if>
	<c:if test="${sessionScope.loginfo.id != 'admin'}">
		<c:set var="whologin" value="1" />
	</c:if>
</c:if>
\${whologin}=${whologin}
<%
// appName : 애플리케이션 컨텍스트 이름(프로젝트 이름)
String appName = request.getContextPath();
String mappingName = "/Shopping"; // in FrontController.java file

String withFormTag = appName + mappingName;

String notWithFormTag = withFormTag + "?command=";

//out.print("컨텍스트 이름 : " + appName + "<br>");
//out.print("mappingName : " + mappingName + "<br>");
//out.print("withFormTag : " + withFormTag + "<br>");
//out.print("notWithFormTag : " + notWithFormTag + "<br>");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery section -->
<!-- bootstrap은 jquery를 기반으로 구동이 되므로 반드시 jquery 선언이 먼저 되어야 합니다. -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- bootstrap section -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">

</head>

<style>
	.alert-dismissible {
		margin: 10px;
	}
</style>
<body>

	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="<%=notWithFormTag%>">쇼핑몰</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<ul class="navbar-nav">
					
					<li class="nav-item">
						<c:if test="${whologin eq 0}">
							<a class="nav-link" href="<%=notWithFormTag%>">미로그인</a>
						</c:if>
						<c:if test="${whologin ne 0}">
							<a class="nav-link" href="<%=notWithFormTag%>">${sessionScope.loginfo.name}님</a>
						</c:if>
					</li>

					<!-- member section -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="<%=notWithFormTag%>" role="button"
						data-bs-toggle="dropdown">회원</a>
						<ul class="dropdown-menu">
							<c:if test="${whologin eq 0}">
								<li><a class="dropdown-item" href="<%=notWithFormTag%>meInsert">회원 가입</a></li>
								<li><a class="dropdown-item" href="<%=notWithFormTag%>meLogin">로그인</a></li>
							</c:if>
							<c:if test="${whologin ne 0}">
								<li><a class="dropdown-item" href="<%=notWithFormTag%>meLogout">로그 아웃</a></li>
								<li><a class="dropdown-item" href="<%=notWithFormTag%>meDetail">상세 보기</a></li>
							</c:if>
							<c:if test="${whologin eq 1}">  
								<li><a class="dropdown-item" href="<%=notWithFormTag%>meDelete">탈퇴하기</a></li>
							</c:if>
							<c:if test="${whologin eq 2}">
								<li><a class="dropdown-item" href="<%=notWithFormTag%>meList">목록 보기</a></li>
							</c:if>
						</ul></li>

					<!-- board section -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="<%=notWithFormTag%>" role="button"
						data-bs-toggle="dropdown">게시물</a>
						<ul class="dropdown-menu">
							<c:if test="${whologin != 0}">
								<li><a class="dropdown-item" href="<%=notWithFormTag%>boInsert">게시물 등록</a></li>
							</c:if>
							<li><a class="dropdown-item" href="<%=notWithFormTag%>boList">목록 보기</a></li>
						</ul></li>

					<!-- product section -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="<%=notWithFormTag%>" role="button"
						data-bs-toggle="dropdown">상품</a>
						<ul class="dropdown-menu">
							<c:if test="${whologin != 2}">
								<li><a class="dropdown-item" href="<%=notWithFormTag%>prInsert">상품 등록</a></li>
							</c:if>
							<li><a class="dropdown-item" href="<%=notWithFormTag%>prList">목록 보기</a></li>
						</ul></li>


					<!-- mall section -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown">쇼핑몰</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="<%=notWithFormTag%>maList">카트 내역 보기</a></li>
							<li><a class="dropdown-item" href="<%=notWithFormTag%>maHistory">나의 쇼핑 내역</a></li>
						</ul></li>

					<!-- view section -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown">데이터 보기</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="<%=notWithFormTag%>vwList">목록 보기</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<%-- 사용자에게 주의/경고/오류 등을 알려 주기 위한 Alert Box --%>
	<c:if test="${not empty sessionScope.alertMessage}">
		<div class="alert alert-danger alert-dismissible">
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>경고 메시지 : </strong> ${sessionScope.alertMessage}
		</div>	
	</c:if>
	
	<%-- 보여준 Alert Box의 내용을 session 영역에서 제거합니다. --%>
	<%-- session.removeAttribute("alertMessage") --%>
	<c:remove var="alertMessage" scope="session"/>
</body>
</html>