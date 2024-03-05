<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/reset.css" />
<link href="../../resources/css/header.css" rel="stylesheet"
	type="text/css">
<link href="../../resources/css/user/allUser.css" rel="stylesheet"
	type="text/css">
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/4602e82315.js"
	crossorigin="anonymous"></script>
<title>전체 회원 보기</title>
</head>
<header>
	<nav>
		<a href="/">Primavera</a>
	</nav>
	<nav>
		<a href="#">Store</a> <a href="#">Guide</a> <a href="collectPage">PickUp</a>
		<a href="#">Board</a> <a href="myPage"><i
			class="fa-regular fa-user"></i></a>
	</nav>
</header>
<body>
	<main>
		<div id="top"></div>
		<table border="1" class="table">
			<h2>전체 회원 조회</h2>
			<hr id="underline">
			<tr>
				<th class="no">No</th>
				<th>아이디</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>우편번호</th>
				<th class="roadAddr">도로명 주소</th>
				<th>상세 주소</th>
				<th width="175">이메일</th>
				<th>은행</th>
				<th width="150">계좌번호</th>
				<th>권한</th>
			</tr>
			<c:forEach items="${list}" var="item" varStatus="status">
				<tr>
					<td class="no">${status.count}</td>
					<td>${item.id}</td>
					<td>${item.name}</td>
					<td>${item.phone}</td>
					<td>${item.postCode}</td>
					<td class="roadAddr">${item.roadAddress}</td>
					<td>${item.detailAddress}</td>
					<td width="175">${item.email}</td>
					<td>${item.bankName}</td>
					<td width="150">${item.account}</td>
					<td>${item.auth}</td>

				</tr>
			</c:forEach>
		</table>

		<div class="pagination">

			<div class="page-item ${pagingCollect.prev ? '' : 'disabled'}">
				<a class="page-link"
					href="/allUser?page=${pagingCollect.startPage-1}">Previous</a>
			</div>

			<c:forEach begin="${pagingCollect.startPage}"
				end="${pagingCollect.endPage}" var="page">
				<div class="page-item">
					<a class="page-link ${pagingCollect.page == page ? 'active' : ''}"
						href="/allUser?page=${page}">${page}</a>
				</div>
			</c:forEach>

			<div class="page-item ${pagingCollect.next ? '' : 'disabled'}">
				<a class="page-link" href="/allUser?page=${pagingCollect.endPage+1}">Next</a>
			</div>
		</div>

	</main>
</body>

</html>