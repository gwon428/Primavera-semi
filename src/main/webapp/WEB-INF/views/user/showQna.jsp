<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<h2>내가 쓴 qna 보기</h2>
		<table border=1 class="table">
			<tr>
				<th>질문번호</th>
					<th>제목</th>
					<th>아이디</th>
					<th>작성일</th>
					<th>답변상태</th>
			</tr>

			<c:forEach items="${list}" var="item">
				<tr>
				<td class="no">${status.count + paging.pageSize * (paging.page-1)}</td>
					 <td><a href="/viewQna?qnaNum=${item.qnaNum}">${item.title}</a></td>
					 <td>${item.id}</td>
					 <td><fmt:formatDate value="${item.writeDate}" pattern="yyyy-MM-dd HH:mm" /></td>
						<td>${item.status}</td>
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