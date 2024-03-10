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
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous" />
</head>
<body>
	<div class="container">
		<div class="header">
			<h1>List Page</h1>
			<a href="/notice/write" class="btn btn-outline-warning">게시글 등록</a>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>내용</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${noticeList}" var="notice" varStatus="status">
					<tr>
						<td>${status.count + paging.pageSize * (paging.page-1)}</td>
						<th><a
							href="/notice/noticeView?noticeNum=${notice.noticeNum}">${notice.title}</a></th>
						<td>${notice.content}</td>
						<td><fmt:formatDate value="${notice.writeDate}"
								pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<nav>
			<ul class="pagination">
				<li class="page-item ${paging.prev ? '' : 'disabled' }"><a
					class="page-link" href="/notice/list?page=${paging.startPage - 1}">Previous</a></li>

				<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
					var="page">
					<li class="page-item"><a
						class="page-link ${page == page ? 'active' : ''}"
						href="/notice/list?page=${page}">${page}</a></li>
				</c:forEach>

				<li class="page-item ${paging.next ? '' : 'disabled'}"><a
					class="page-link" href="/notice/list?page=${paging.endPage + 1}">Next</a></li>
			</ul>
		</nav>
	</div>
</body>
</html>