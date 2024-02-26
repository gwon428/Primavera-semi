<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원 정보 수정</h1>
<form action="updateUser" method="post">
<p> 기본 정보 </p>
<p> 아이디 : ${user.id} </p>
<p> 비밀번호 : <input type="password" name="password" value="${user.password}"></p>
<p> 이름 : <input type="text" name="name" value="${user.name}"></p>
<p> 휴대폰 번호 : <input type="text" name="phone" value="${user.phone}"></p>
<p> 이메일 : <input type="text" name="email" value="${user.email}"></p>
<input type="submit" value="수정">
</form>
</body>
</html>