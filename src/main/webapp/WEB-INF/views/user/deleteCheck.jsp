<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<sec:authentication property="principal" var="user" />
${user}
	아이디 : ${user.id}
	<br>
	<form action="deleteCheck" method="post">
	비밀번호 : <input type="password" name="password">
	<input type="submit" value="탈퇴">
	</form>
</body>
</html>