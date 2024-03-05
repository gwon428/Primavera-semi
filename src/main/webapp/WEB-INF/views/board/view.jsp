<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<style>
h1 {
	margin-top: 70px;
}

.form-group {
	margin: 20px 0;
}

img {
	width: 200px;
}
</style>
</head>
<body>
	<div class="container">
		<h1>게시물 정보</h1>
		<form action="/update" method="post" enctype="multipart/form-data">
			<input type="hidden" name="no" value="${vo.no}"> <input
				type="hidden" name="url" value="${vo.url}">
			<div class="form-group">
				<label>Title</label> <input class="form-control" name="title"
					value="${vo.title}">
			</div>
			<div class="form-group">
				<a href="/upload/${vo.url}" download><img
					src="/upload/${vo.url}" /></a>
				<textarea class="form-control" row="10" name="content"
					style="resize: none;">${vo.content}</textarea>
			</div>
			<c:if test="${vo.id == currentUserId}">
				<!-- 로그인한 사용자의 아이디와 게시물 작성자 아이디가 일치하는 경우에만 버튼 표시 -->
				<button type="submit" class="btn btn-outline-warning">수정</button>
				<a class="btn btn-outline-danger" href="/delete?no=${vo.no}">삭제</a>
			</c:if>
		</form>
	</div>
</body>
</html>