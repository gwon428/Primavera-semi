<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<div>
		<h2>내가 쓴 후기</h2>
		<table border=1 class="table">
			<tr>
				<th scope="col">제목</th>
				<th scope="col">내용</th>
				<th scope="col">주문번호</th>
				<th scope="col">작성날짜</th>
			</tr>

			<c:forEach items="${list}" var="item">
				<tr>
					<td>${item.title}</td>
					<td>${item.content}</td>
					<td>${item.orderNum}</td>
					<td>${item.date}</td>
				</tr>
			</c:forEach>
		</table>
		<ul class="pagination">
			<li class="page-item ${paging.prev ? '' : 'disabled'}"><c:choose>
					<c:when test="${paging.startPage == 1}">
						<a class="page-link"
							href="/showReview?page=${paging.startPage=1}">Previous</a>
					</c:when>
					<c:otherwise>
						<a class="page-link"
							href="/showReview?page=${paging.startPage-1}">Previous</a>
					</c:otherwise>
				</c:choose></li>

			<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
				var="page">
				<li class="page-item"><a
					class="page-link ${paging.page== page ? 'active' : ''} "
					href="/showReview?page=${page}">${page}</a></li>
			</c:forEach>

			<li class="page-item ${paging.next ? '' : 'disabled'}"><c:choose>
					<c:when test="${paging.endPage < 10}">
						<a class="page-link"
							href="/showReview?page=${paging.endPage=paging.endPage}">Next</a>
					</c:when>
					<c:otherwise>
						<a class="page-link"
							href="/showReview?page=${paging.endPage + 1}">Next</a>
					</c:otherwise>
				</c:choose></li>
		</ul>
	</div>
</body>
</html>