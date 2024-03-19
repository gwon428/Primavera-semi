<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원 검색 결과</h1>
	<table border=1>
		<tr id=header>
			<th>아이디</th>
			<th>제목</th>
			<th>내용</th>
		</tr>
		
		<c:forEach items="${list}" var="list">
			<tr>
				<td>${list.id}</td>
				<td>${list.title}</td>
				<td>${list.content}</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>