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
		<form action="updateNotice" method="post" enctype="multipart/form-data">
			<input type="hidden" name="noticeNum" value="${vo.noticeNum}"> 
			
			<input type="hidden" name="url" value="${vo.url}">
			<div class="form-group">
			<label>제목</label> 
			<input class="form-control" name="title" value="${vo.title}">
			</div>
			<div class="form-group">
			<label>내용</label>
			<textarea class="form-control" row="10" name="content" style="resize: none;">${vo.content}</textarea>
			<a href="/upload/${vo.url}" download>
			<!-- <img src="/upload/notice/${vo.url}" /> --> </a>
			</div>
			<!--  다운로드 가능  -->
			<div class="form-group">
				<label for="file">파일 업로드</label> 
				<input class="form-control" type="file" id="file" name="file" accept="image/*">
			</div>
			<button type="submit" class="btn btn-outline-warning">수정</button>
			<a class="btn btn-outline-danger" href="/notice/delete?no=${vo.noticeNum}">삭제</a>
		</form>
	</div>

</body>
</html>