<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 목록</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous" />
</head>
<body>
	<div class="container">
		<div class="header">
			<h1>글 목록</h1>
			<c:if test="${isLoggedIn}">
				<a href="/board/write" class="btn btn-outline-warning">글쓰기</a>
			</c:if>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>PHOTO</th>
					<th>#번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>별점</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="board" varStatus="status">
					<tr>
						<td><img
							src="${pageContext.request.contextPath}/upload/${board.url}"
							width="100" height="100" /></td>
						<td>${status.count}</td>
						<td><a href="/board/view?no=${board.no}">${board.title}</a></td>
						<td>${board.id}</td>
						<td>${board.rating}</td>
						<td><fmt:formatDate value="${board.date}"
								pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<nav aria-label="Page navigation">
			<ul class="pagination">
				<c:forEach begin="1" end="${totalPages}" var="i">
					<li class="page-item ${currentPage == i ? 'active' : ''}"><a
						class="page-link" href="/board/list?page=${i}&size=${size}">${i}</a>
					</li>
				</c:forEach>
			</ul>
		</nav>
	</div>
</body>
</html>

