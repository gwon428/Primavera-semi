<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<body>
<div>
	<h2>전체 수거 신청 정보 보기</h2>
	<table border=1 class="table">
		<tr>
			<th scope="col">주문번호</th>
			<th scope="col">아이디</th>
			<th scope="col">이름</th>
			<th scope="col">전화번호</th>
			<th scope="col">우편번호</th>
			<th scope="col">도로명 주소</th>
			<th scope="col">상세 주소</th>
			<th scope="col">수거일</th>
			<th scope="col">공동 현관 비밀번호</th>
			<th scope="col">요청사항</th>
			<th scope="col">수거 신청 무게</th>
			<th scope="col">금액</th>
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
				<td>${item.kg}</td>
				<td>${item.kg*400}</td>
			</tr>
		</c:forEach>
	</table>
	<ul class="pagination">
		
			<li class="page-item ${pagingCollect.prev ? '' : 'disabled'}"><a class="page-link" href="/showAllCollect?page=${pagingCollect.startPage-1}">Previous</a>
			</li>
			
			<c:forEach begin="${pagingCollect.startPage}" end="${pagingCollect.endPage}" var="page">
				<li class="page-item"><a class="page-link ${pagingCollect.page == page ? 'active' : ''}" href="/showAllCollect?page=${page}">${page}</a></li>
			</c:forEach>
			
			<li class="page-item ${pagingCollect.next ? '' : 'disabled'}"><a class="page-link"href="/showAllCollect?page=${pagingCollect.endPage+1}">Next</a></li>
		</ul>
		</div>
</body>
</html>