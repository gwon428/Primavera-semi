<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" href="../../../resources/css/reset.css" />
<link rel="stylesheet" href="../../../resources/css/header.css" />
<link rel="stylesheet" href="../../../resources/css/collect.css" />
<script src="https://kit.fontawesome.com/4602e82315.js" crossorigin="anonymous"></script>
</head>

<body>
	<main>
	<div class="header-blackbox"></div>
		<header>
			<nav>
				<a href="index.jsp">Primavera</a>
			</nav>
			<nav>
				<a href="#">Store</a> 
				<a href="#">Guid</a> 
				<a href="collectPage">PickUp</a> 
				<a href="#">Board</a> 
				<a href="myPage"><i class="fa-regular fa-user" id="mypage"></i></a>
			</nav>
		</header>
	
	
		<section id="top">
			<div class="blackbox"></div>
			<div class="top-content">
				<h2>Pick Up</h2>
			</div>
		</section>

		<section id="main">
			<div class="main">
				<div id="i-contents">
					<i class="fa-solid fa-chevron-left" id="direc"></i>
					<div id="contents">
						<div class="image-content">
							<div class="card" style="width: 18rem;">
								<img src="../../../resources/images/main1.jpg" id="main1"
									class="card-img-top" alt="...">
								<div class="card-body">
									<p class="card-text">Ready</p>
								</div>
							</div>

						</div>
						<div class="image-content">
							<div class="card" style="width: 18rem;">
								<img src="../../../resources/images/main5.jpg" id="main2"
									class="card-img-top" alt="...">
								<div class="card-body">
									<p class="card-text">Pick Up</p>
								</div>
							</div>

						</div>
						<div class="image-content">
							<div class="card" style="width: 18rem;">
								<img src="../../../resources/images/main3.jpg" id="main3"
									class="card-img-top" alt="...">
								<div class="card-body">
									<p class="card-text">Check</p>
								</div>
							</div>

						</div>
						<div class="image-content">
							<div class="card" style="width: 18rem;">
								<img src="../../../resources/images/main4.jpg" id="main4"
									class="card-img-top" alt="...">
								<div class="card-body">
									<p class="card-text">Cash</p>
								</div>
							</div>
						</div>

					</div>
					<i class="fa-solid fa-chevron-right" id="direc"></i>
				</div>
				<a href="registerCollect" id="registerPage">Pick Up</a>
			</div>
		</section>

	</main>

	<script src="../../../resources/js/collect.js"></script>
</body>
</html>
