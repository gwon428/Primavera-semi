<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<!DOCTYPE html>
			<html>

			<head>
				<link href="../../resources/css/myPage.css" rel="stylesheet" type="text/css">
				<meta charset="UTF-8">
				<title>Insert title here</title>
			</head>

<body>
	<sec:authentication property="principal" var="user" />
	<c:choose>
		<c:when test="${user == 'anonymousUser'}">
			<main>
				<h1>로그인</h1>
				<form action="/login" method="post" id="login">
					<div>
						아이디 <input size="15" type="text" name="username"><br>
						비밀번호 <input type="password" name="password"><br>
					</div>
					<input type="submit" value="로그인" id="button">
				</form>
			</main>
			<div id="anonymousUser">
				<a href="findPwd">비밀번호 찾기</a> <a href="findId">아이디 찾기</a> <a
					href="register">회원가입</a>
			</div>
		</c:when>
		<c:otherwise>
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
		</c:otherwise>
	</c:choose>
</body>

</html>