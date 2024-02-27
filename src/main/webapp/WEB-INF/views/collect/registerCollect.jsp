<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="../../../resources/css/reset.css" />
<link rel="stylesheet" href="../../../resources/css/register.css"/>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js" defer></script>
<script src="../../../resources/js/registerCollectDaum.js"></script>


</head>
<body>
	
	<div id="register">
	<form action="signUpCollect" method="post" id="pickUp">
	<table border=2 id="pickUpTable">
	<div class= "grid grid-cols-1 lg:grid-cols-2 lg:gap-28 inputInfo" >
	<div id="left">
	<!-- 아이디에 value값(로그인 아이디 불러오기)/ readonly 예정-->
		<tr>	
			<th>아이디</th>
			<td><input type="text" name="id" id="id"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" required></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="phone" required></td>
		</tr>
		<tr>
			<th rowspan="3">주소</th>
			<td><input type="text" name="postCode" id="postCode" placeholder="우편번호" size=15 required>
			<input type="button" onclick="daumPostCode()" value="우편번호 찾기"></td>
		</tr>
		<tr>
			<td><input type="text" name="roadAddress" id="roadAddress" placeholder="주소" size=40 required></td>
		</tr>
		<tr>
			<td><input type="text" name="detailAddress" id="detailAddress" placeholder="상세 주소" size=40 required></td>
		</tr>
	</div>
	<div id="right">
		<tr>
			<th>수거일</th>
			<td><input type="date" name="collectionDate" max="2025-12-31" min="2024-02-22" required></td>
		</tr>
		<tr>
			<th>공동 현관 비밀번호</th>
			<td><textarea name="doorPwd" id="doorPwd" cols="30" rows="2" style="resize:none" placeholder="공동 현관 비밀 번호가 필요한 경우, 입력해주세요"></textarea></td>
		</tr>
		<tr>
			<th>요청사항</th>
			<td><textarea name="request" id="request" cols="30" rows="10" style="resize:none" placeholder="요청사항을 있으신 경우, 입력해주세요"></textarea></td>
		</tr>
	</div>
		<tr>
			<td colspan="2">
				<span> * 수거 신청을 위해 </span><strong><u>이용약관</u></strong> <span>및</span> <strong><u>개인정보 수집</u></strong><span>에 동의합니다.</span><br>
				<input type="radio" name="agree" id="agree" required>네, 동의합니다.</input>
			</td>
		</tr>
		</div>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="수거 신청 하기">
			</td>
		</tr>
	</table>
	</form>
	</div>
	<script src="../../../resources/js/register.js"></script>
</body>
</html>