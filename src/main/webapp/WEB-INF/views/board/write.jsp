<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 작성</title>
</head>
<body>
    <h1>게시글 작성</h1>
    <form action="${pageContext.request.contextPath}/board/write" method="post">
        제목: <input type="text" name="title"><br>
        내용: <textarea name="content"></textarea><br>
        <input type="submit" value="작성 완료">
    </form>
</body>
</html>