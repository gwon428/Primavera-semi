<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../../resources/css/reset.css" />
<link rel="stylesheet" href="../../../resources/css/header.css" />
<link rel="stylesheet" href="../../../resources/css/qna/insertQna.css" />

<script src="https://kit.fontawesome.com/4602e82315.js"
	crossorigin="anonymous"></script>
</head>
<body>
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

	<!-- -----------------------------------main----------------------------- -->
	<div class="container">
		<h1>QnA 등록</h1>
		<form action="insertQna" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label>Id</label> <input class="form-control" name="id">
			</div>
			<div class="form-group">
				<label>주문번호</label> <input class="form-control" name="orderNum">
			</div>
			<div class="form-group">
				<label>Title</label> <input class="form-control" name="title">
			</div>
			<div class="form-group">
				<label>Content</label>
				<textarea class="form-control" row="10" name="content"></textarea>
			</div>
			<div class="form-group">
				<label for="file">Add File</label> <input class="form-control"
					type="file" id="file" name="file" accept="image/*">
			</div>
			<button type="submit" class="btn btn-outline-warning">등록</button>
		</form>
	</div>
</body>
</html>