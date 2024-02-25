<%@page import="com.semi.model.vo.User"%>
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
<h1>회원 관리</h1>

	<ul>
	<% User user = (User) session.getAttribute("loginUser"); %>
	<c:choose>
		<c:when test="${empty loginUser}">
		<li><a href="joinUser">회원가입</a></li>
		<li><a href="login">로그인</a>
		</c:when>
		
		<c:when test="${loginUser.auth}.equals('관리자')">
		<li><a href="showAll">전체회원보기</a></li>
		</c:when>
		
		<c:otherwise>
		<li><a href="myPage">마이페이지</a></li>
		</c:otherwise>
		</c:choose>
	</ul>
</body>
</html>