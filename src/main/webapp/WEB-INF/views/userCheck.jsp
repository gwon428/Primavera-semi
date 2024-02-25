<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="pwdCheck" method="post">
개인 정보 보호를 위해 기존 비밀번호를 한 번 더 입력해주세요.<br>
<label>아이디 :${loginUser.id} </label>
<label>기존 비밀번호 : <input type="password" name="password"> </label><br>
<input type="submit" value="비밀번호 확인">
</form>
</body>
</html>