<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/reset.css" />
<link href="../../resources/css/header.css" rel="stylesheet"
	type="text/css">
<link href="../../resources/css/user/deleteCheck.css" rel="stylesheet"
	type="text/css">
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/4602e82315.js"
	crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>

<header>

	<nav>
		<a href="/">Primavera</a>
	</nav>
	<nav>
		<a href="#">Store</a> <a href="#">Guid</a> <a href="collectPage">PickUp</a>
		<a href="#">Board</a> <a href="myPage"><i
			class="fa-regular fa-user"></i></a>
	</nav>
</header>
<body>
	<main>
		<sec:authentication property="principal" var="user" />
		아이디 : ${user.id} <br>
		<form action="deleteCheck" method="post">
			비밀번호 : <input type="password" name="password"> <input
				type="submit" value="탈퇴">
		</form>
	</main>
</body>
</html>