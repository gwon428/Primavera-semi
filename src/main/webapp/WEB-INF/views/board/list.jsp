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
<title>글 목록</title>
<link rel="stylesheet" href="../../../resources/css/reset.css" />
<link rel="stylesheet" href="../../../resources/css/header.css" />
<link href="../../resources/css/review/list.css" rel="stylesheet"
	type="text/css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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
				<a href="#">Store</a> <a href="#">Guide</a> <a href="/collectPage">PickUp</a>
				<a href="/board/list">Board</a> <a href="/myPage"><i
					class="fa-regular fa-user"></i></a>
			</nav>
		</header>
		<section id="neck">
			<div class="cover"></div>
		</section>
		<div class="container">
			<div class="header1">
				<h1>REVIEW</h1>
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
							<td><c:if test="${not empty board.url}">
									<img
										src="${pageContext.request.contextPath}/upload/${board.url}"
										width="100" height="100" />
								</c:if></td>
							<td>${status.count}</td>
							<td><a href="/board/view?no=${board.no}">${board.title}</a></td>
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
			<div class="writebtn">
				<c:if test="${isLoggedIn}">
					<a href="/board/write" class="btn btn-warning">글쓰기</a>
				</c:if>
			</div>
			<nav>
				<ul class="pagination">
					<!-- 이전 페이지 버튼 -->
					<li class="page-item ${paging.prev ? '' : 'disabled'}"><a
						class="page-link" href="/board/list?page=${paging.startPage - 1}">Previous</a>
					</li>

					<!-- 페이지 번호 버튼 -->
					<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
						var="page">
						<li class="page-item ${paging.page == page ? 'active' : ''}">
							<a class="page-link" href="/board/list?page=${page}">${page}</a>
						</li>
					</c:forEach>

					<!-- 다음 페이지 그룹 버튼 -->
					<li class="page-item ${paging.next ? '' : 'disabled'}"><a
						class="page-link" href="/board/list?page=${paging.endPage + 1}">Next</a>
					</li>
				</ul>
			</nav>
		</div>
	</main>
</body>
</html>
