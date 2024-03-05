<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<link rel="stylesheet" href="/resources/css/reset.css" />
		<link href="../../resources/css/header.css" rel="stylesheet" type="text/css">
		<link href="../../resources/css/user/registerUser.css" rel="stylesheet" type="text/css">

		<meta charset="UTF-8">
		<script src="https://kit.fontawesome.com/4602e82315.js" crossorigin="anonymous"></script>
		<title>Insert title here</title>
	</head>
	<header>
		<nav>
			<a href="/">Primavera</a>
		</nav>
		<nav>
			<a href="#">Store</a> <a href="#">Guide</a> <a href="collectPage">PickUp</a>
			<a href="#">Board</a> <a href="myPage"><i class="fa-regular fa-user"></i></a>
		</nav>
	</header>

	<body>

		<h1>회원가입</h1>
		<form action="register" method="post" onsubmit="return validate()">
		<div id="regist">
			<div id="registerOne">
				<p>아이디</p>
				<input type="text" name="id" id="userId" required><span></span>
				<p>비밀번호</p>
				<input type="password" name="password" id="userPwd" required><span></span>
				<p>비밀번호 확인</p>
				<input type="password" id="passwordcheck" required><span></span>
				<p>이름</p>
				<input type="text" name="name" id="userName" required><span></span>
				<p> 휴대폰번호</p>
				<input type="text" name="phone" id="userPhone" required"><span></span>
			</div>
			<div id="registerTwo">
				<p>우편번호</p>
				<div class="addr">
					<div class="addrPost">
					<input type="text" name="postCode" id="postCode" placeholder="우편번호">
					<input type="button" onclick="DaumPostcode()" value="우편번호 찾기">
					</div>
					<input type="text" name="roadAddress" id="roadAddress" placeholder="주소"">
					<input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소" >
					<p></p>
				</div>
				<p>이메일</p>
				<input type="text" name="email" id="email" required><span></span>
				<p>은행</p>
					<select name=bankName>
						<option value="NH">농협</option>
						<option value="KB">국민</option>
						<option value="WOORI">우리</option>
						<option value="SH">신한</option>
						<option value="IBK">기업</option>
						<option value="kakao">카카오</option>
						<option value="HANA">하나</option>
					</select>
				<p>계좌번호</p>
				<input type="text" name="account" id="account"><br>
			</div>
		</div>
		<div id="submit">
		<input type="submit" value="회원가입" id="button">
		</div>
		
		</form>

		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script type="text/javascript" src="../../resources/js/registerAddress.js"></script>
		<script type="text/javascript" src="../../resources/js/registerregExp.js"></script>
	</body>

	</html>