<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/reset.css" />
<link href="../../resources/css/header.css" rel="stylesheet"
	type="text/css">
<link href="../../resources/css/user/loginFail.css" rel="stylesheet"
	type="text/css">
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/4602e82315.js"
	crossorigin="anonymous"></script>
</head>
<header>

	<nav>
		<a href="/">Primavera</a>
	</nav>
	<nav>
		<a href="#">Store</a> <a href="#">Guid</a> <a href="collectPage">PickUp</a>
		<a href="#">Board</a> <a href="myPage"><i class="fa-regular fa-user"></i></a>
	</nav>
</header>
<body>
<main>
${requestScope.loginFailMsg}
<a href="/myPage"> 로그인 </a>
</main>
</body>
</html>