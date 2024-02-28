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
	<c:choose>
		<c:when test="${user == 'anonymousUser'}">
			<h1>로그인</h1>
			<form action="/login" method="post">
				* 아이디 : <input type="text" name="username"><br>
				* 비밀번호 : <input type="password" name="password"><br>
				<input type="submit" value="로그인">
			</form>
			<ul>
				<li><a href="findPwd">비밀번호 찾기</a></li>
				<li><a href="findId">아이디 찾기</a></li>
				<li><a href="register">회원가입</a></li>
			</ul>
		</c:when>
		<c:otherwise>
			user : ${user.id}
			<ul>
				<li><a href="update">회원 정보 수정</a></li>
				<li><a href="review">내가 적은 후기</a></li>
				<li><a href="qna">내 Q&A</a></li>
				<li><a href="progress">진행상황</a></li>
				<li><a href="deleteUser">회원 탈퇴</a></li>
				<li><a href="/logout">로그아웃</a></li>
			</ul>
		</c:otherwise>
	</c:choose>
</body>
</html>