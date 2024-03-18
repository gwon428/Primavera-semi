<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../../resources/css/reset.css" />
<link rel="stylesheet" href="../../../resources/css/header.css" />
<link rel="stylesheet" href="../../../resources/css/review/view.css" />
<script src="https://kit.fontawesome.com/4602e82315.js"
	crossorigin="anonymous"></script>
</head>

<body class="main">
	<header>
		<nav>
			<a href="/">Primavera</a>
		</nav>
		<nav>
			<a href="/map/mainMap">Store</a> <a href="#">Guide</a> <a
				href="/collectPage">PickUp</a> <a href="/list">Board</a> <span>
				<a href="/review/list">Review</a> <a href="listQna">Q & A</a> <a
				href="/notice/list">Notice</a>
			</span> <a href="/myPage"><i class="fa-regular fa-user"></i></a>
		</nav>
	</header>
	<div class="container">
		<h1>Review</h1>
		<form action="/updatereview" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="no" value="${vo.no}"> <input
				type="hidden" name="url" value="${vo.url}">

			<c:if test="${not empty vo.url}">
				<div class="form-image">
					<a href="/upload/review/${vo.url}" download><img
						src="/upload/review/${vo.url}" /></a>
				</div>
			</c:if>

			<div class="form-group">
				<label>제목</label> <input
					class="form-control ${vo.id != currentUserId ? 'read-only' : ''}"
					name="title" value="${vo.title}"
					${vo.id != currentUserId ? 'readonly' : ''}>
			</div>

			<div class="form-group">
				<label>별점</label>
				<div class="star-rating">
					<c:forEach begin="1" end="5" var="i">
						<i class="${i <= vo.rating ? 'fas' : 'far'} fa-star"
							data-rating="${i}"></i>
						<input type="hidden" name="rating" id="rating-input" value="1">
					</c:forEach>
				</div>
			</div>

			<div class="form-group">
				<label>내용</label>
				<textarea
					class="form-control ${vo.id != currentUserId ? 'read-only' : ''}"
					rows="10" name="content"
					${vo.id != currentUserId ? 'readonly' : ''}>${vo.content}</textarea>
			</div>

			<a href="/review/list" class="btn-list">글목록</a>
			<c:if test="${vo.id == currentUserId}">
				<button type="submit" class="btn-info">수정</button>
			</c:if>
			<sec:authorize
				access="hasAuthority('ADMIN') or ${vo.id == currentUserId}">
				<a class="btn-delete" href="/deletereview?no=${vo.no}">삭제</a>
			</sec:authorize>
		</form>
	</div>

	<script>
        document.addEventListener("DOMContentLoaded", function() {
            const stars = document.querySelectorAll(".star-rating i");
            const readOnly = "${vo.id != currentUserId}" === "true";

            stars.forEach((star, index) => {
                if (readOnly) {
                    star.style.cursor = 'default';
                } else {
                    star.addEventListener("click", () => {
                        const rating = index + 1;
                        document.getElementById("rating-input").value = rating;
                        updateStars(rating);
                    });
                }
            });

            function updateStars(rating) {
                stars.forEach((star, index) => {
                    star.classList.remove(index < rating ? "far" : "fas");
                    star.classList.add(index < rating ? "fas" : "far");
                });
            }
        });
    </script>
</body>
</html>