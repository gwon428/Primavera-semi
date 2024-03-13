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
<title>게시물 정보</title>
<link rel="stylesheet" href="../../../resources/css/reset.css" />
<link rel="stylesheet" href="../../../resources/css/header.css" />
<link href="../../resources/css/review/view.css" rel="stylesheet"
	type="text/css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous" />
<script src="https://kit.fontawesome.com/4602e82315.js"
	crossorigin="anonymous"></script>

</head>

<body class="main">
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
				<label>Title</label> <input
					class="form-control ${vo.id != currentUserId ? 'read-only' : ''}"
					name="title" value="${vo.title}"
					${vo.id != currentUserId ? 'readonly' : ''}>
			</div>

			<div class="form-group">
				<label>Rating</label>
				<div class="star-rating">
					<c:forEach begin="1" end="5" var="i">
						<i class="${i <= vo.rating ? 'fas' : 'far'} fa-star"
							data-rating="${i}"></i>
						<input type="hidden" name="rating" id="rating-input" value="1">						
					</c:forEach>
				</div>
			</div>

			<div class="form-group">
				<label>Content</label>
				<textarea
					class="form-control ${vo.id != currentUserId ? 'read-only' : ''}"
					rows="10" name="content"
					${vo.id != currentUserId ? 'readonly' : ''}>${vo.content}</textarea>
			</div>

			<a href="/board/list" class="btn btn-success">글목록</a>
			<c:if test="${vo.id == currentUserId}">
				<button type="submit" class="btn btn-info">수정</button>
			</c:if>
			<sec:authorize
				access="hasAuthority('ADMIN') or ${vo.id == currentUserId}">
				<a class="btn btn-danger" href="/deletereview?no=${vo.no}">삭제</a>
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