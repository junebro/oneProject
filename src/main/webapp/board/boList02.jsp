<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.shopping.model.bean.Board"%>
<%@page import="com.shopping.model.dao.BoardDao"%>

<%@ include file="./../common/common.jsp"%>

<%
	BoardDao dao = new BoardDao();	
	List<Board> dataList = dao.getDataList02();
%>

<c:set var="dataList" value="<%=dataList%>" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.rounded-pill{opacity: 0.7;}
</style>
</head>
<body>
	<div class="container mt-3">
		<h2>게시물 목록</h2>
		<p>사용자들이 작성한 게시물 목록을 보여 주는 페이지입니다.</p>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>글번호</th>
					<th>작성자</th>
					<th>글제목</th>
					<th>글내용</th>
					<th>조회수</th>
					<th>작성 일자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bean" items="${dataList}"  > 
				<tr>
					<td align="center">${bean.no}</td>
					<td>${bean.id}</td>
					<td>
						<c:forEach var="i" begin="1" end="${bean.depth}"  step="1">
							<span class="badge rounded-pill bg-secondary">re</span>
						</c:forEach>
						${bean.subject}
					</td>
					<td>${bean.contents}</td>
					<td>
						<c:if test="${bean.readhit >= 20}">
							<span class="badge rounded-pill bg-primary">
								${bean.readhit}
							</span>
						</c:if>
						
						<c:if test="${bean.readhit < 20}">
							<span class="badge rounded-pill bg-danger">
								${bean.readhit}
							</span>
						</c:if>						
					</td>
					<td>${bean.regdate}</td>
				</tr>				
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>