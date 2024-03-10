<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/reset.css" />
<link href="../../resources/css/header.css" rel="stylesheet"
	type="text/css">
<link href="../../resources/css/user/allUser.css" rel="stylesheet"
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
		<a href="#">Store</a> <a href="#">Guide</a> <a href="collectPage">PickUp</a>
		<a href="#">Board</a> <a href="myPage"><i
			class="fa-regular fa-user"></i></a>
	</nav>
</header>
<body>
<sec:authentication property="principal" var="user" />
<!-- 회원용 수거 신청 진행 상황 페이지 -->
<h2>진행 상황</h2>
	<table border=1>
		<tr>
			<th>주문번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>진행상황</th>
		</tr>
		
		<c:forEach items="${list}" var="item">
			<tr>
				<td>${item.orderNum}</td>
				<td>${item.id}</td>
				<td>${item.name}</td>
				<td>${item.phone}</td>
				<td>${item.prog}</td>
			</tr>
		</c:forEach>
	</table>
	<ul class="pagination">
			<li class="page-item ${paging.prev ? '' : 'disabled'}"><c:choose>
					<c:when test="${paging.startPage == 1}">
						<a class="page-link"
							href="/showCollect?page=${paging.startPage=1}">Previous</a>
					</c:when>
					<c:otherwise>
						<a class="page-link"
							href="/showCollect?page=${paging.startPage-1}">Previous</a>
					</c:otherwise>
				</c:choose></li>

			<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
				var="page">
				<li class="page-item"><a
					class="page-link ${paging.page== page ? 'active' : ''} "
					href="/showCollect?page=${page}">${page}</a></li>
			</c:forEach>

			<li class="page-item ${paging.next ? '' : 'disabled'}"><c:choose>
					<c:when test="${paging.endPage < 10}">
						<a class="page-link"
							href="/showCollect?page=${paging.endPage=paging.endPage}">Next</a>
					</c:when>
					<c:otherwise>
						<a class="page-link"
							href="/showCollect?page=${paging.endPage + 1}">Next</a>
					</c:otherwise>
				</c:choose></li>
		</ul>
</body>
</html>