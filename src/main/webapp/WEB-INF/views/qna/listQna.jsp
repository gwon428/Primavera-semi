<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous" />
 -->
<link rel="stylesheet" href="../../../resources/css/reset.css" />
<link rel="stylesheet" href="../../../resources/css/header.css" />
<link rel="stylesheet" href="../../../resources/css/qna/listQna.css" />
<script src="https://kit.fontawesome.com/4602e82315.js"
	crossorigin="anonymous"></script>


</head>
<body>
	<sec:authentication property="principal" var="user" />
	
		<div class="header-blackbox"></div>
		<header>
			<nav>
				<a href="index.jsp">Primavera</a>
			</nav>
			<nav>
				<a href="#">Store</a> <a href="#">Guid</a> <a href="collectPage">PickUp</a>
				<a href="/board/list">Board</a> <a href="myPage"><i
					class="fa-regular fa-user" id="mypage"></i></a>
			</nav>
		</header>
		<section id="top">
			<div class="blackbox"></div>
			<div class="top-content">
				<h2>Q&A</h2>
			</div>
		</section>
		<!-- -----------------------------------main----------------------------- -->
		<div class="main">
			<div class="container">
				<div class="header">
					<h1>Q&A</h1>
					<c:choose>
						<c:when test="${user == 'anonymousUser'}">
							<a href="../mypage" 
								id="writeQna">Q&A등록</a>
						</c:when>
						<c:otherwise>
							<a href="/writeQna" id="writeQna">Q&A등록</a>
						</c:otherwise>
					</c:choose>

				</div>
				<table class="table">
					<thead>
						<tr>
							<th>질문번호</th>
							<th>제목</th>
							<th>아이디</th>
							<th>작성일</th>
							<th>답변상태</th>
						</tr>
					</thead>
					<tbody>
						<!--  현재 주소에 있는 거 긁어서 같이 넘기고,거기서 계속 넘기면 다시 유지해서 올 수 있음 -->
						<c:forEach items="${list}" var="item" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td><a href="/viewQna?qnaNum=${item.qnaNum}">${item.title}</a></td>
								<td>${item.id}</td>
								<td><fmt:formatDate value="${item.writeDate}"
										pattern="yy-MM-dd" /></td>
								<td>${item.status}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<nav id="paging">
				<ul class="pagination">
					<li class="page-item ${paging.prev ? '' : 'disabled'}"><a
						class="page-link" href="/listQna?page=${paging.startPage - 1}">Previous</a>
					</li>

					<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
						var="page">
						<li class="page-item"><a
							class="page-link ${paging.page== page ? 'active' : ''} "
							href="/listQna?page=${page}" id="page_num">${page}</a></li>
					</c:forEach>

					<li class="page-item ${paging.next ? '' : 'disabled'}"><a
						class="page-link" href="/listQna?page=${paging.endPage + 1}">Next</a></li>
				</ul>
			</nav>

		</div>
</body>
</html>