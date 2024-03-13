<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
      crossorigin="anonymous"
    />
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
		<h1>게시물 수정</h1>
		<form action="/updateQna" method="post" enctype="multipart/form-data">
			<input type="hidden" name="qnaNum" value="${qna.qnaNum}">
			<input type="hidden" name="url" value="${qna.url}">
			<div class="form-group">
				<label>Title</label>
				<input class="form-control" name="title" value="${qna.title}">
			</div>
			<div class="form-group">
				<label>Content</label>
				<textarea class="form-control" row="10" name="content" style="resize:none;">${qna.content}</textarea>
				<a href="/upload/${qna.url}" download><img src="/upload/${qna.url}"/></a>
			</div>
			<div class="form-group">
				<label for="file">사진 첨부</label>
				<input class="form-control" type="file" id="file" name="file" accept="image/*">
			</div>
			<div>
			

			</div>
			<button type="submit" class="btn btn-outline-warning">수정</button>
			
		</form>
	</div>
	<script>
	
	let today = new Date();   

	$("#writeDate").val(today);
	
	</script>
</body>
</html>