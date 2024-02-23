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
	<h2>전체 수거 신청 정보 보기</h2>
	<table border=1>
		<tr>
			<th>주문번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>우편번호</th>
			<th>도로명 주소</th>
			<th>상세 주소</th>
			<th>수거일</th>
			<th>공동 현관 비밀번호</th>
			<th>요청사항</th>
		</tr>
		
		<c:forEach items="${list}" var="item">
			<tr>
				<td>${item.orderNum}</td>
				<td>${item.id}</td>
				<td>${item.name}</td>
				<td>${item.phone}</td>
				<td>${item.postCode}</td>
				<td>${item.roadAddress}</td>
				<td>${item.detailAddress}</td>
				<td>${item.collectionDate}</td>
				<td>${item.doorPwd}</td>
				<td>${item.request}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>