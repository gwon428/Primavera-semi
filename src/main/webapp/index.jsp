<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html lang="en">

	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="/resources/css/reset.css" />

		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
			integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
			crossorigin="anonymous"></script>

		<link rel="stylesheet" href="/resources/css/front.css" />
		<script src="https://kit.fontawesome.com/4602e82315.js" crossorigin="anonymous"></script>
		<title>Document</title>
	</head>

	<body>
		<div class="header-blackbox"></div>
		<header>
			<nav>
				<a href="#">Primavera</a>
			</nav>
			<nav>
				<a href="#">Store</a> <a href="#">Guid</a> <a href="collectPage">PickUp</a> <a href="#">Board</a> <a
					href="myPage"><i class="fa-regular fa-user"></i></a>
			</nav>
		</header>
		<main>
			<section id="section1">
				<div>
					<video src="/resources/images/production_id_4919750 (1080p).mp4" id="background_video"
						preload="auto" autoplay="autoplay" loop="loop" muted="muted" volume="0"></video>
				</div>
				<div class="directivity">
					<h1 class="h1">We are walking with</h1>
					<h1 class="h2">the environment</h1>
					<a href="collectPage">
						<h1>Pick Up ></h1>
					</a>
				</div>
				<nav>
					<a href="#section1"><i class="fa-solid fa-seedling"></i></a> <a href="#section2"><i
							class="fa-solid fa-leaf"></i></a> <a href="#section3"><i
							class="fa-solid fa-tree"></i></i></a> <a href="#section4"><i
							class="fa-solid fa-mountain-sun"></i></a>
				</nav>
			</section>

			<section id="section2">
				<div id="carouselExampleFade" class="carousel slide carousel-fade">
					<div class="carousel-inner">
						<div class="carousel-item active" id="container3">
							<h1>Company_introduce</h1>
							<p>"Primavera"는 이탈리아어로 "진정한 봄"으로 새로운 생명의 시작과 자연의 활기를 가지는 의미가지며
								기후변화와 지구 온난화로 인한 피해를 줄일수 있는 방법을 모색하다 탄소 배출량을 줄일수있는 폐의류를 재사용하는
								업사이클링을 시작하게 되었다 현 시점의 환경과 자연을 원모습을 되찾기위해 우리는 지금도 걷고있다</p>
							<img src="/resources/images/front_img.jpg" class="" alt="...">
						</div>

						<div class="carousel-item" id="container3">
							<h1>Work_introduce</h1>
							<p>일상이나 기업에서 버려지는 폐의류를 수거하여 분류한뒤 재사용가능한 의류들의 섬유들을 추출하여 새로운 의류를
								만들며 추출이 불가능한 의류들은 업사이클링 제품으로 재탄생시켜 오프라인 매장에 판매중이다.</p>
							<img src="/resources/images/Work_introduce.jpg" class="" alt="...">
						</div>
					</div>
					<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade"
						data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade"
						data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</section>
			<section id="section3">
				<div class="container1">
					<h1>User_Guid</h1>
					<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
						Architecto modi a deleniti commodi, eligendi, unde, molestias saepe
						quas minima cupiditate nam. Veritatis officia a magni sequi itaque
						quibusdam, consectetur minus? Lorem ipsum dolor sit amet
						consectetur, adipisicing elit. Dolor, culpa dicta exercitationem
						nobis enim quo perferendis non libero incidunt ad, aspernatur</p>
					<a href="#"> > You want more details, don't you?</a>
				</div>
				<p></p>
				<div class="container2">
					<h1>Map</h1>
					<a href="#"><img src="/resources/images/map.PNG" alt=""></a>
				</div>
				<div class="Floor">
					<p>Details of user</p>
					<p>guides and maps</p>
				</div>
			</section>
			<section id="section4" class="category">
				<p></p>
				<div>
					<a href="myPage">Login</a>
				</div>
			</section>
		</main>
		<footer>
			<div class="footer top">
				<li>CONTACT</li>
				<div class="company information">
					<p>
						phone : XXX-XXX-XXXX <br> email : xxxxxxxxx@naver.com <br>
						본사 : 서울 강남구 테헤란로14길 6 [6층] <br> 오프라인 스토어 : 서울 중구 남대문로 120 대일빌딩
						2층, 3층 <br>
					</p>
				</div>
				<div id="information">
					<div class="personal">
						<a href="">이용약관 개인정보처리방침</a>
					</div>
					<div class="SNS">
						<a href="https://www.instagram.com/"><i class="fa-brands fa-instagram"></i></a> <a
							href="https://www.facebook.com/?locale=ko_KR"><i class="fa-brands fa-facebook"></i></a> <a
							href="https://www.youtube.com/"><i class="fa-brands fa-youtube"></i></a> <a href=""><i
								class="fa-solid fa-paperclip"></i></a>
					</div>
				</div>
			</div>
		</footer>
	</body>

	</html>