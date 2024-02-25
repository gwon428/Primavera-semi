<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="updateUser" method="post">
		아이디 : ${loginUser.id}<br>
		<label>변경할 비밀번호 : <input type="password" name="password"> </label><br>
		<input type="submit" value="로그인">
	</form>
</body>
</html>