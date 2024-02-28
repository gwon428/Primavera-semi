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
<link href="../../resources/css/user/myPage.css" rel="stylesheet"
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
	<sec:authentication property="principal" var="user" />
	<c:choose>
		<c:when test="${user == 'anonymousUser'}">
			<main>
				<h1>로그인</h1>
				<form action="/login" method="post" id="login">
					<div class="input">
						<input size="15" type="text" name="username" placeholder="아이디"><br>
						<input type="password" name="password" placeholder="비밀번호"><br>
					</div>
					<input type="submit" value="로그인" id="button">
				</form>

				<div id="emptyLogin">
					<a href="findPwd">비밀번호 찾기 | </a> <a href="findId">아이디 찾기 | </a> <a
						href="register">회원가입</a>
				</div>
			</main>
		</c:when>
		<c:otherwise>
			<div id="adminLogin">
				<c:if test="${user.auth == 'ADMIN'}">

					<ul>
						<li><a href="notice">공지 게시판 관리</a></li>
						<li><a href="qna">Q&A 게시판 관리</a></li>
						<li><a href="allUser">전체 회원 조회</a></li>
						<li><a href="progressManager">progress 관리</a></li>
						<li><a href="progressManager">수거 신청 현황</a></li>
						<li><a href="/logout">로그아웃</a></li>
					</ul>
				</c:if>
			</div>
			<div id="memberLogin">
				<c:if test="${user.auth == 'MEMBER'}">
					<ul>
						<li><a href="update">회원 정보 수정</a></li>
						<li><a href="review">내가 적은 후기</a></li>
						<li><a href="qna">내 Q&A</a></li>
						<li><a href="progress">진행상황</a></li>
						<li><a href="deleteUser">회원 탈퇴</a></li>
						<li><a href="/logout">로그아웃</a></li>
					</ul>
				</c:if>
			</div>
		</c:otherwise>
	</c:choose>
</body>

</html>