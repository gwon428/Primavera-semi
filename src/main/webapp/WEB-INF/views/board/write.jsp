<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 등록</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style>
h1 {
	margin-top: 70px;
}

.form-group {
	margin: 20px 0;
}

.star-rating i {
	cursor: pointer;
	color: #ccc;
}

.star-rating i.fas {
	color: #f39c12;
}
</style>
</head>
<body>
	<div class="container">
		<h1>게시물 등록</h1>
		<form action="/board/write" method="post"
			enctype="multipart/form-data">
			<div class="form-group">
				<label>Title</label> <input class="form-control" name="title">
			</div>
			<div class="form-group">
				<label>Rating</label>
				<div id="rating" class="star-rating">
					<i class="far fa-star" data-rating="1"></i> <i class="far fa-star"
						data-rating="2"></i> <i class="far fa-star" data-rating="3"></i> <i
						class="far fa-star" data-rating="4"></i> <i class="far fa-star"
						data-rating="5"></i> <input type="hidden" name="rating"
						id="rating-input">
				</div>
			</div>
			<div class="form-group">
				<label>Content</label>
				<textarea class="form-control" rows="10" name="content"></textarea>
			</div>
			<div class="form-group">
				<label for="file">Add File</label> <input class="form-control"
					type="file" id="file" name="file" accept="image/*">
			</div>
			<button type="submit" class="btn btn-outline-warning">글쓰기</button>
		</form>
	</div>

	<script>
    document.addEventListener("DOMContentLoaded", function() {
      const stars = document.querySelectorAll("#rating i");
      stars.forEach((star, index) => {
        star.addEventListener("click", () => {
          document.getElementById("rating-input").value = index + 1;  // 별점 저장
          updateStars(index + 1);
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
</body>
</html>
