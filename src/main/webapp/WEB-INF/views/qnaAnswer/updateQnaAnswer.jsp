<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
		<h1>게시물 수정</h1>
		<form action="/updateAnswer" method="post" enctype="multipart/form-data">
			<input type="hidden" name="qnaNum" value="${qnaAnswer.qnaNum}">
			<input type="hidden" name="url" value="${qnaAnswer.url}">
			
			<div class="form-group">
				<label>Content</label>
				<textarea class="form-control" row="10" name="content" style="resize:none;">${qnaAnswer.content}</textarea>
				<a href="/upload/${qnaAnswer.url}" download><img src="/upload/${qnaAnswer.url}"/></a>
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