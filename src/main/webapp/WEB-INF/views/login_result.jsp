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

	<c:choose>
		<c:when test="${not empty loginUser}">
		<!-- 정보 가져오는지 확인 차 임시로 만들었삽니다 -->
			<h1>로그인 정보</h1>
			<ul>
				<li>아이디 : ${loginUser.id}</li>
				<li>비밀번호 : ${loginUser.password}</li>
				<li>이름 : ${loginUser.name}</li>
			</ul>
			<a href="index.jsp">첫 페이지로 이동</a>
		</c:when>
		<c:otherwise>
			<h2>로그인 실패..! 다시 로그인 해주세요</h2>
			<a href="login">첫 페이지로 이동</a>
		</c:otherwise>
	</c:choose>
</body>
</html>