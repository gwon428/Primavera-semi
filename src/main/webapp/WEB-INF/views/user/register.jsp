<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원가입</h1>
	<form action="register" method="post" onsubmit="return validate()">
		* 아이디 : <input type="text" name="id" id="userId"><br>
		<span>첫 글자는 반드시 영문자로, 영문자, 숫자 포함하여 총 4~12자로 입력하세요.</span><br>
		* 비밀번호 : <input type="password" name="password" id="userPwd"><br>
		<span>영문자, 숫자, 특수문자 포함하여 총 8~15자로 입력하세요.</span><br>
		* 비밀번호 확인 : <input type="password" id="passwordcheck"><br>
		<span>위의 비밀번호와 일치하게 입력하세요.</span><br>
		* 이름 : <input 	type="text" name="name" id="userName"><br>
		<span>한글로만 이루어져야되며, 2글자 이상으로 입력하세요.</span><br>
		* 전화번호 : <input type="text" name="phone" id="userPhone"><br>
		<span>-를 생략한 숫자만 입력하세요.</span><br>
		* 우편번호 : <input type="text" name="postCode" id="postCode" placeholder="우편번호"><input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		* 주소 : <input type="text" name="roadAddress" id="roadAddress" placeholder="주소"><br>
		* 상세주소 : <input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소"><br>
		* 이메일 : <input type="text" name="email" id="email"><br>
		<span>이메일 형식에 맞춰서 입력하세요.</span><br>
		은행 : <select name=bankName>
			<option value="NH"> 농협 </option>
			<option value="KB"> 국민 </option>
			<option value="WOORI"> 우리 </option>
			<option value="SH"> 신한 </option>
			<option value="IBK"> 기업 </option>
			</select>
		계좌번호 : <input type="text" name="account" id="account"><br>
		<!-- 
		<select name=auth>
		<option value="ADMIN">관리자</option>
		<option value="MEMBER">회원</option>
		</select>
		 -->
	<input type="submit" value="회원가입">
	</form>
	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="../../resources/js/registerAddress.js"></script>
<script type="text/javascript" src="../../resources/js/registerregExp.js"></script>
</body>
</html>