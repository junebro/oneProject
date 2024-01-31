<%@page import="com.shopping.model.bean.FillItem"%>
<%@page import="com.shopping.model.dao.FillItemDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./../common/common.jsp"%>

<%
// 라디오 버튼과 체크 박스는 데이터 베이스에서 읽어 동적으로 채웁니다.
FillItemDao fdao = new FillItemDao();
List<FillItem> genderList = fdao.getDataList("members", "gender");
List<FillItem> marriageList = fdao.getDataList("members", "marriage");
List<FillItem> hobbyList = fdao.getDataList("members", "hobby");
%>

<c:set var="genderList" value="<%=genderList%>" />
<c:set var="marriageList" value="<%=marriageList%>" />
<c:set var="hobbyList" value="<%=hobbyList%>" />


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

.radio_gender, .radio_marriage, .checkbox_hobby {
	font-size: 1.1rem;
} /* 주위 글꼴의 1.1배 */
</style>

<script>

	function validCheck() {
		
		var id = $('#id').val();      
		

		if(id.length < 4 || id.length > 10){
			alert('아이디는 4자리 이상 10자리 이하로 입력해 주세요.');
			$('#id').focus();
			return false ; /* false이면 이벤트 전파 방지 */
		}


		var name = $('#name').val();           
		if(name.length < 3 || name.length > 15){              
			$('#name').focus();
			alert('이름은 3자리 이상 15자리 이하로 입력해 주세요.');
			return false ;
		}

		var password = $('#password').val();           
		if(password.length < 5 || password.length > 12){
			alert('비밀 번호는 5자리 이상 12자리 이하로 입력해 주세요.');
			$('#password').focus();
			return false ;
		}    

		var regex = /^[a-z]\S{4,11}$/; /* 정규 표현식 */
		var result = regex.test(password) ;

		if(result == false){
			alert('비밀 번호의 첫글자는 반드시 소문자이어야 합니다.');              
			return false ;
		}

		if(password.indexOf('@') <= 0 && password.indexOf('#') <= 0 && password.indexOf('$') <= 0){
			alert('특수 문자 @#% 중에 최소 1개가 포함이 되어야 합니다.');              
			return false ;
		}

		var genderList = $('input[name="gender"]:checked') ;
		if(genderList.length == 0){
			alert('성별은 반드시 선택이 되어야 합니다.');
			return false ; 
		}

		var marriageList = $('input[name="marriage"]:checked');
		if(marriageList.lengh == 0) {
			alert('결혼 여부는 반드시 선택이 되어야 합니다.');
		return null;
		}

		/* jqueryUI 플러그인 date picker */
		var birth = $('#birth').val();
		var regex = /^\d{4}\/[01]\d{1}\/[0123]\d{1}$/ ;
		var result = regex.test(birth);

		if(result == false){
			alert('생일은 반드시 yyyy/mm/dd 형식으로 입력해 주세요.');              
			return false ;
		}       
		
		const hobbyLimit = 2;
		var marriageList = $('input[name="hobby"]:checked');
		if(hobbyList.lengh < 2) {
			alert("취미는 최소 ${hobbyLimit}개 이상 선택해 주셔야 합니다.");
			return null;
		}
	}
	
	$(document).ready(function() {
		
		$("#birth").datepicker({dateFormat:"yy/mm/dd"});
		
	});
	

</script>





</head>
<body>

	<div class="container mt-3">
		<h2>회원 가입</h2>
		<p>신규 회원이 가입하는 페이지입니다.</p>

		<form action="meInsertTo.jsp">

			<div class="input-group mb-3">
				<span class="input-group-text">아이디</span> <input type="text"
					class="form-control" id="id" name="id" value="asdf">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">이름</span> <input type="text"
					class="form-control" id="name" name="name" value="강철수">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">비밀 번호</span> <input type="text"
					class="form-control" id="password" name="password" value="asdf@123">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">성별</span>
				<div class="form-control">
					<c:forEach var="fillItem" items="${genderList}" varStatus="status">
						<label class="radio-inline radio_gender"> &nbsp;<input
							type="radio" id="gebder${status.count}" name="gender"
							value="${fillItem.engname}">&nbsp;${fillItem.korname}
						</label>
					</c:forEach>
				</div>
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">생일</span> <input type="date"
					class="form-control" id="birth" name="birth">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">결혼여부</span>
				<div class="form-control">
					<c:forEach var="fillItem" items="${marriageList}"
						varStatus="status">
						<label class="radio-inline radio_marriage"> &nbsp;<input
							type="radio" id="marriage${status.count}" name="marriage"
							value="${fillItem.engname}">&nbsp;${fillItem.korname}
						</label>
					</c:forEach>
				</div>
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">취미</span>
				<div class="form-control">
					<c:forEach var="fillItem" items="${hobbyList}" varStatus="status">
						<label class="checkbox-inline hobby_hobby"> &nbsp;<input
							type="checkbox" id="hobby${status.count}" name="hobby"
							value="${fillItem.engname}">&nbsp;${fillItem.korname}
						</label>
					</c:forEach>
				</div>
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">주소</span> <input type="text"
					class="form-control" id="address" name="address" value="마포구 거구장">
			</div>

			<div class="input-group mb-3">
				<button type="button" class="btn btn-primary"
					onclick="return validCheck();">가입</button>
				&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-secondary">초기화</button>
			</div>
		</form>
	</div>


</body>
</html>