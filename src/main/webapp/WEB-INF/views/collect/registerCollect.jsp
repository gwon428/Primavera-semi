<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>수거 신청 하기</h2>
	<form action="signUpCollect" method="post">
		아이디 : <input type="text" name="id"><br> 
		이름 : <input type="text" name="name"><br>
		전화번호 : <input type="text" name="phone"><br>
		우편번호 : <input type="text" name="postCode"><br>
		도로명 주소 : <input type="text" name="roadAddress"><br>
		상세 주소 : <input type="text" name="detailAddress"><br>
		수거일 : <input type="text" name="collectionDate"><br>
		공동 현관 비밀번호 : <input type="text" name="doorPwd"><br>
		요청사항 : <input type="text" name="request"><br>
		<input type="submit" value="수거 신청 하기">
	</form>
</body>
</html>