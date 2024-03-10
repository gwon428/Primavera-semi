<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>아이디 찾기</h1>
	<form action="/findId" method="post">
		<div>
			이름 : <input size="15" type="text" name="name" placeholder="이름"><br>
			이메일 : <input type="text" name="email" placeholder="이메일">
		</div>
		<input type="submit" value="아이디 찾기">
	</form>
</body>
</html>