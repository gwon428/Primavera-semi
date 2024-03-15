<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../../resources/css/reset.css" />
<link rel="stylesheet" href="../../../resources/css/notice/view.css" />
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
	<div class="header-blackbox"></div>
	<header>
		<nav>
			<a href="/">Primavera</a>
		</nav>
		<nav>
			<a href="/map/mainMap">Store</a> <a href="#">Guide</a> <a
				href="collectPage">PickUp</a> <a href="list">Board</a> <span>
				<a href="/board/list">Board</a> <a href="/listQna">Q & A</a> <a
				href="/notice/list">Notice</a>
			</span> <a href="myPage"><i class="fa-regular fa-user"></i></a>
		</nav>
	</header>
	<div class="container">
		<h1>게시물 정보</h1>
		<form action="updateNotice" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="noticeNum" value="${vo.noticeNum}">
			<input type="hidden" name="url" value="${vo.url}">
			<div class="form-group" id="title">
				<label>title</label> <input class="form-control" name="title"
					value="${vo.title}" id="title_input">
			</div>
			<div class="form-group" id="context">
				<label>content</label>
				<textarea class="form-control" row="10" name="content"
					style="resize: none;" id="content_input">${vo.content}</textarea>
				<a href="/upload/${vo.url}" download> <!-- <img src="/upload/notice/${vo.url}" /> -->
				</a>
			</div>
			<!--  다운로드 가능  -->
			<div class="form-group" id="file">
				<label for="file">파일 업로드</label> <input class="form-control"
					type="file" id="file" name="file" accept="image/*">
			</div>
			<div class="type">
				<button type="submit" class="btn btn-outline-warning">수정</button>
				<a class="btn btn-outline-danger"
					href="/notice/deleteNotice?noticeNum=${vo.noticeNum}">삭제</a>
			</div>
		</form>
	</div>
</body>
</html>