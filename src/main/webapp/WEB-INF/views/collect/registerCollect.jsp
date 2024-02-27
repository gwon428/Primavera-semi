<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="../../../resources/css/reset.css" />
<link rel="stylesheet" href="../../../resources/css/register.css" />
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"
	defer></script>
<script src="../../../resources/js/registerCollectDaum.js"></script>


</head>
<body>

		<form action="signUpCollect" method="post" id="pickUp">
			<h2>Primavera</h2>
			<div id="pickUpTable">
				<!-- 아이디에 value값(로그인 아이디 불러오기)/ readonly 예정-->
				<div class="id">
					<p>아이디</p>
					<input type="text" name="id" id="id">
				</div>
				<div>
					<p>이름</p>
					<input type="text" name="name" required>
				</div>
				<div>
					<p>전화번호</p>
					<input type="text" name="phone" required>
				</div>

				<div>
					<p>주소</p>
					<input type="text" name="postCode" id="postCode"
						placeholder="우편번호" size=15 required> <input type="button"
						onclick="daumPostCode()" value="우편번호 찾기">
				
					<input type="text" name="roadAddress" id="roadAddress"
						placeholder="주소" size=40 required>
				
					<input type="text" name="detailAddress" id="detailAddress"
						placeholder="상세 주소" size=40 required>
				</div>

				<div>
					<p>수거일</p>
					<input type="date" name="collectionDate" max="2025-12-31"
						min="2024-02-22" required>
				</div>
				<div>
					<p>공동 현관 비밀번호</p>
					<textarea name="doorPwd" id="doorPwd" cols="50" rows="2"
							placeholder="공동 현관 비밀 번호가 필요한 경우, 입력해주세요"></textarea>
				</div>
				<div>
					<p>요청사항</p>
					<textarea name="request" id="request" cols="50" rows="10"
							 placeholder="요청사항을 있으신 경우, 입력해주세요"></textarea>
				</div>
			</div>

				<div id="agree">
					<p> * 수거 신청을 위해 
					<u class="cursor-pointer">
					<span>이용약관</span>
					</u>
					및 
					<u class="cursor-pointer"><span>개인정보 수집</span>
					</u>에 동의합니다.</p>
					<input type="radio" name="agree" id="agree" required>네, 동의합니다.
				</div>
				<div>
					<input type="submit" value="수거 신청 하기" id="button">
				</div>
		</form>
	

	<script src="../../../resources/js/register.js"></script>
</body>
</html>