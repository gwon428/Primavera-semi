<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../../resources/css/reset.css" />
<link href="../../resources/css/review/write.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="https://kit.fontawesome.com/4602e82315.js" crossorigin="anonymous"></script>
</head>
<body class="main">
    <main>
        <div class="container">
            <h1>Review</h1>
            <form id="reviewForm" action="/board/write" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label>Title</label> 
                    <input class="form-control" name="title" id="title">
                </div>
                <div class="form-group">
                    <label>Rating</label>
                    <div id="rating" class="star-rating">
                        <i class="fas fa-star" data-rating="1"></i>
                        <i class="far fa-star" data-rating="2"></i>
                        <i class="far fa-star" data-rating="3"></i>
                        <i class="far fa-star" data-rating="4"></i>
                        <i class="far fa-star" data-rating="5"></i>
                        <input type="hidden" name="rating" id="rating-input" value="1">
                    </div>
                </div>
                <div class="form-group">
                    <label>Content</label>
                    <textarea class="form-control" rows="10" name="content" id="content"></textarea>
                </div>
                <div class="form-group">
                    <label for="file">Add File</label>
                    <input class="form-control" type="file" id="file" name="file" accept="image/*">
                </div>
                <div class="writebtn">
                    <button type="button" class="btn btn-warning" onclick="validateForm()">글쓰기</button>
                </div>
            </form>
        </div>

        <script>
            function validateForm() {
                var title = document.getElementById("title").value;
                var content = document.getElementById("content").value;
                if (!title && !content) {
                    alert("제목과 내용이 입력되지 않았습니다.");
                } else if (!title) {
                    alert("제목이 입력되지 않았습니다.");
                } else if (!content) {
                    alert("내용이 입력되지 않았습니다.");
                } else {
                    document.getElementById("reviewForm").submit();
                }
            }
        </script>

        <script>
            document.addEventListener("DOMContentLoaded", function() {
                const stars = document.querySelectorAll("#rating i");
                updateStars(1);
                
                stars.forEach((star, index) => {
                    star.addEventListener("click", () => {
                        const rating = index + 1;
                        document.getElementById("rating-input").value = rating;
                        updateStars(rating);
                    });
                });
                
                function updateStars(rating) {
                    stars.forEach((star, index) => {
                        if (index < rating) {
                            star.classList.remove("far");
                            star.classList.add("fas");
                        } else {
                            star.classList.remove("fas");
                            star.classList.add("far");
                        }
                    });
                }
            });
        </script>
    </main>
</body>
</html>