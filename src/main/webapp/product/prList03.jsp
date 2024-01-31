<%@page import="com.shopping.model.bean.Product"%>
<%@page import="com.shopping.model.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./../common/common.jsp"%>

<%
	ProductDao dao = new ProductDao();
	int beginRow = 1 ;
	int endRow = 6 ;
	List<Product> dataList = dao.getDataList(beginRow, endRow);
%>

<c:set var="dataList" value="<%=dataList%>" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.container {
	margin-top: 10px;
}

/* table 셀의 수평 정렬을 가운데로 지정합니다. */
.card {
	margin-left: auto;
	margin-right: auto;
}

.card-img-top {
	width: 300px;
	height: 300px;
}

.removeUnderLine {
	text-decoration: none;
}
</style>
</head>
<body>
	<div class="container mt-3">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<h2>상품 목록</h2>
				<p>고객들이 구매하고자 하는 상품 목록을 보여 주는 페이지입니다.</p>
				<table class="table table-borderless">
					<thead>
					</thead>
					<tbody>
						<c:set var="columnSu" value="3" />
						<c:forEach var="bean" items="${dataList}" varStatus="status">
							<c:if test="${status.index mod columnSu == 0}">
								<tr>
							</c:if>
							<td>
								<div class="card" style="width: 300px">
									<a class="removeUnderLine"
										href="https://www.naver.com?pnum=${bean.pnum}"> <img
										class="card-img-top" src="./../image/${bean.image01}"
										alt="${bean.name}">
										<div class="card-body">
											<h4 class="card-title">${bean.name}</h4>
											<p class="card-text">
												<span data-bs-toggle="popover" 
													title="${bean.name}" 
													data-bs-trigger="hover"
													data-bs-content="${bean.contents}"> 
													<c:if
														test="${fn:length(bean.contents) >= 10}">
														${fn:substring(bean.contents, 0, 10)}...
													</c:if>
												</span>

												<c:if test="${fn:length(bean.contents) < 10}">
													${bean.contents}
												</c:if>
											</p>
											<a href="#" class="btn btn-primary">수정</a>
										</div>
									</a>
								</div>
							</td>
							<c:if test="${status.index mod columnSu == (columnSu-1)}">
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="col-sm-2"></div>
		</div>



	</div>
</body>
<script>
	$(document).ready(function(){		
		var popoverTriggerList = [].slice.call(document
				.querySelectorAll('[data-bs-toggle="popover"]'))
		var popoverList = popoverTriggerList.map(function(popoverTriggerEl) {
			return new bootstrap.Popover(popoverTriggerEl)
		})		
	});
</script>
</html>