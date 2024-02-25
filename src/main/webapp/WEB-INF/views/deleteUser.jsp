<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="deleteUser" method="post">
		회원 탈퇴 시 본인 확인을 위해 비밀번호를 입력해주세요.<br>
		<li>아이디 : ${loginUser.id} </li>
		<li>이름 : ${loginUser.name} </li>
		<label> 비밀번호 : <input type="password" name="password"></label><br>
		<input type="submit" value="회원 탈퇴">
	</form>
</body>
</html>