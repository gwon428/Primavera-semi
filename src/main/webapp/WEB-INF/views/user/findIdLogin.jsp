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
<link href="../../resources/css/user/findIdLogin.css" rel="stylesheet"
	type="text/css">
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/4602e82315.js"
	crossorigin="anonymous"></script>
<title>Primavera</title>
</head>
<header>
	<nav>
		<a href="/">Primavera</a>
	</nav>
	<nav>
		<a href="#">Store</a> <a href="#">Guide</a> <a href="collectPage">PickUp</a>
		<a href="/review/list">Board</a> <a href="myPage"><i
			class="fa-regular fa-user"></i></a>
	</nav>
</header>
<body>
	<main>
		<h1 class="logo">Primavera</h1>
		<form action="/login" method="post"  class="loginform">
			<div class="idpwd">
				<div class="mb-3 row">
					<label><i class="fa-regular fa-user"></i></label>
					<div class="col-sm-10">
						<input type="text" name="username" value="${id}" placeholder="아이디" />
					</div>
				</div>
				<div class="mb-3 row">
					<label for="staticEmail" class="col-sm-2 col-form-label"><i class="fa-solid fa-lock"></i></label>
						<div class="col-sm-10">
							<input type="password" name="password" placeholder="비밀번호" />
						</div>
					</div>
			</div>
			<input type="submit" value="Login" class="loginbutton">
		</form>
	</main>
</body>
</html>