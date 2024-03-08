<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
</head>
<style>
h1 {
	margin-top: 70px;
}

.form-group {
	margin: 20px 0;
}
</style>
</head>
<body>
	<div class="container">
		<h1>게시물 등록</h1>
		<form action="/notice/write" method="post"
			enctype="multipart/form-data">
			<div class="form-group">
				<label>제목</label> <input class="form-control" name="title">
			</div>
			<div class="form-group">
				<label>내용</label>
				<textarea class="form-control" row="10" name="content"></textarea>
			</div>
			<div class="form-group">
				<label for="file">파일 업로드</label> <input class="form-control"
					type="file" id="file" name="file" accept="image/*">
			</div>
			<button type="submit" class="btn btn-outline-warning">등록</button>
		</form>
	</div>
</body>
</html>