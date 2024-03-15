<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 목록</title>
<link rel="stylesheet" href="../../../resources/css/reset.css" />
<link rel="stylesheet" href="../../../resources/css/header.css" />
<link href="../../resources/css/review/list.css" rel="stylesheet"
	type="text/css">
<script src="https://kit.fontawesome.com/4602e82315.js"
	crossorigin="anonymous"></script>
</head>

<body class="main">
	<main>
		<header>
			<nav>
				<a href="/">Primavera</a>
			</nav>
			<nav>
				<a href="#">Store</a> <a href="#">Guid</a> <a href="collectPage">PickUp</a>
				<a href="list">Board</a> <span> <a href="/board/list">Review</a>
					<a href="listQna">Q & A</a> <a href="notice/list">Notice</a>
				</span> <a href="myPage"><i class="fa-regular fa-user" id="mypage"></i></a>
			</nav>
		</header>

		<div class="word">
			<h1 class="h1">REVIEW</h1>
		</div>

		<section id="neck">
			<div class="cover"></div>
		</section>
		<div class="container">
			<div class="header">
			<div class="cover"></div>
				<h1>REVIEW</h1>				
					<c:if test="${isLoggedIn}">
						<a href="/board/write" id="writebtn">리뷰 작성</a>
					</c:if>
				
			</div>
			<table class="table">
				<thead>
					<tr>
						<th>PHOTO</th>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>별점</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="board" varStatus="status">
						<tr>
							<td class="image-cell"><c:if test="${not empty board.url}">
									<img
										src="${pageContext.request.contextPath}/upload/review/${board.url}"
										width="150" height="150" />
								</c:if></td>
							<td>${paging.total - (paging.page - 1) * 10 - status.index}</td>
							<td><a class="review-link" href="/board/view?no=${board.no}">${board.title}</a></td>
							<td>${board.id}</td>
							<td>
								<div class="star-rating">
									<c:forEach begin="1" end="5" var="i">
										<i
											class="${i <= board.rating ? 'fas fa-star' : 'far fa-star'}"></i>
									</c:forEach>
								</div>
							</td>
							<td><fmt:formatDate value="${board.date}"
									pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
			<nav>
				<ul class="pagination">
					<li class="page-item ${paging.prev ? '' : 'disabled'}"><a
						class="page-link" href="/board/list?page=${paging.startPage - 1}">Previous</a>
					</li>

					<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
						var="page">
						<li class="page-item ${paging.page == page ? 'active' : ''}">
							<a class="page-link" href="/board/list?page=${page}">${page}</a>
						</li>
					</c:forEach>

					<li class="page-item ${paging.next ? '' : 'disabled'}"><a
						class="page-link" href="/board/list?page=${paging.endPage + 1}">Next</a>
					</li>
				</ul>
			</nav>
		</div>
	</main>
</body>
</html>