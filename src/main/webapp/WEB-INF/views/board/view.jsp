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
<title>게시물 정보</title>
<link rel="stylesheet" href="../../../resources/css/reset.css" />
<link rel="stylesheet" href="../../../resources/css/header.css" />
<link href="../../resources/css/review/view.css" rel="stylesheet"
	type="text/css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous" />
<script src="https://kit.fontawesome.com/4602e82315.js"
	crossorigin="anonymous"></script>
</head>
<body class="main">
	<div class="container">
		<h1>Review</h1>
		<form action="/update" method="post" enctype="multipart/form-data">
			<input type="hidden" name="no" value="${vo.no}"> <input
				type="hidden" name="url" value="${vo.url}">
			<div class="form-group">
				<a href="/upload/${vo.url}" download> <img
					src="/upload/${vo.url}" />
				</a>

			</div>
			<div class="form-group">
				<label>Title</label> <input class="form-control" name="title"
					value="${vo.title}"> <br />
				<textarea class="form-control" rows="10" name="content"
					style="resize: none;">${vo.content}</textarea>
			</div>
			<a href="/board/list" class="btn btn-success">글목록</a>
			<c:if test="${vo.id == currentUserId}">
				<button type="submit" class="btn btn-outline-info">수정</button>
				<a class="btn btn-outline-danger" href="/delete?no=${vo.no}">삭제</a>
			</c:if>
		</form>
	</div>
</body>
</html>