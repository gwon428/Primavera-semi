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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
<sec:authentication property="principal" var="user" />
<form action="updateCheck" method="post">
	아이디 : ${user.id}
	<br>
	비밀번호 : <input type="password" name="password">
	<input type="submit" value="수정">
</form>
</body>
</html>