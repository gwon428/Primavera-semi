<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<sec:authentication property="principal" var="user" />
<h2>회원용 진행상황 페이지용</h2>
	<table border=1>
		<tr>
			<th>주문번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>진행상황</th>
		</tr>
		
		<c:forEach items="${list}" var="item">
			<tr>
				<td>${item.orderNum}</td>
				<td>${item.id}</td>
				<td>${item.name}</td>
				<td>${item.phone}</td>
				<td>${item.prog}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>