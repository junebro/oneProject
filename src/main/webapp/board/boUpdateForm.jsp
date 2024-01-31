<%@page import="com.shopping.model.bean.Board"%>
<%@page import="com.shopping.model.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>

<%
	// 게시물 수정
	int no = 1;
	BoardDao dao = new BoardDao();
	Board bean = dao.getDataBean(no);
%>

<c:set var="bean" value="<%=bean%>"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* box model에 대한 공부가 필요합니다. */
.container {
	margin-top: 10px;
}

.input-group {
	margin: 7px;
}

.input-group-text {
	display: block;
	margin-left: auto;
	margin-right: auto;
}

#buttonset {
	margin-top: 15px;
}
/* 수정시 게시물 번호는 읽기 전용으로 사용자에게 보여줍니다. */
#boardNo1 {
	display: none; 
	visibillity: hidden;
}
</style>
<script>
	$(document).ready(function() {
	});
	
	/* 폼 유효성 검사 */
	function validCheck(){
		
		var password = $('#password').val();
		
		if(password.length < 3 || password.length > 20){
		   alert('비밀 번호는 3글자 이상 20글자 이하이어야 합니다.');
		   $('#password').focus() ;
		   return false ;
		}
		
        var subject = $('#subject').val();
        
        if(subject.length < 3 || subject.length > 20){
           alert('글 제목은 3글자 이상 20글자 이하이어야 합니다.');
           $('#subject').focus() ;
           return false ;
        }

        var contents = $('#contents').val();
        
        if(contents.length < 5 || contents.length > 30){
           alert('글 내용은 5글자 이상 30글자 이하이어야 합니다.');
           $('#contents').focus() ;
           return false ;
        }
        
        var regdate = $('#regdate').val();
        var regex = /^\d{4}[\/-][01]\d{1}[\/-][0123]\d{1}$/ ;
        var result = regex.test(regdate) ;
        
        /*if(result == false){
           alert('날짜 형식은 반드시 yyyy/mm/dd 형식 또는 yyyy-mm-dd으로 작성해 주세요.');
           $('#regdate').focus() ;
           return false ;
        }*/
	}
	
</script>

</head>
<body>
	<div class="container mt-3">
		<h2>게시물 수정</h2>
		<p>사용자들이 게시물을 등록하는 페이지입니다.</p>

		<form action="boUpdatetTo.jsp">
			<div id="boardNo" class="input-group mb-3">
				<span class="input-group-text">글번호</span> 
				<input type="text" class="form-control" id="fakeno" name="fakeno" value="${bean.no}" disabled="disabled">
				<input type="hidden" class="form-control" id="no" name="no" value="${bean.no}">
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">작성자</span> 
				<input type="text" class="form-control" id="fakeid" name="fakeid" value="${bean.id}" disabled="disabled">
				<input type="hidden" id="id" name="id" value="${bean.id}" >
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">비밀 번호</span> <input type="password"
					class="form-control" id="password" name="password">
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">글 제목</span> <input type="text"
					class="form-control" id="subject" name="subject" value="${bean.subject}">
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">글 내용</span> <input type="text"
					class="form-control" id="contents" name="contents" value="${bean.contents}">
			</div>

			<div class="input-group mb-3">
				<button type="submit" class="btn btn-primary btn_Lg" onclick="return validCheck()">수정</button>
				&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-secondary btn_Lg">초기화</button>
			</div>

		</form>
	</div>

</body>
</html>