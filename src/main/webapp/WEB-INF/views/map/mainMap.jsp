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
<title>지도</title>
<link rel="stylesheet" href="../../../resources/css/reset.css" />
<link rel="stylesheet" href="../../../resources/css/header.css" />
<link href="../../resources/css/map/mainMap.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="https://kit.fontawesome.com/4602e82315.js"
	crossorigin="anonymous"></script>
</head>
<body class="main">
	<main>
		<header>
			<nav>
				<a href="/">Primavera</a>
			</nav>
			<nav>
				<a href="/map/mainMap">Store</a> <a href="#">Guide</a> <a
					href="/collectPage">PickUp</a> <a href="/board/list">Board</a> <a
					href="/myPage"><i class="fa-regular fa-user"></i></a>
			</nav>
		</header>

		<div class="word">
			<h1 class="h1">Store</h1>
		</div>

		<section id="neck">
			<div class="cover"></div>
		</section>

		<div class="image-text-container">
			<div class="image-text-wrapper">
				<img src="../../../resources/images/wallet.jpg" alt="Wallet">
				<div class="text-section">
					<h1>WALLET</h1><br>
					<p>------------------------------------------------</p><br>
					<p>버려지는 옷감들을 업사이클링해 만든 지갑</p>
				</div>
			</div>
			<div class="image-text-wrapper">
				<img src="../../../resources/images/clothes.jpg" alt="Clothes">
				<div class="text-section">
					<h1>CLOTHES</h1><br>
					<p>------------------------------------------------</p><br>
					<p>버려지는 옷감들을 업사이클링해 만든 옷</p>
				</div>
			</div>
			<div class="image-text-wrapper">
				<img src="../../../resources/images/bag.jpg" alt="Bag">
				<div class="text-section">
					<h1>BACKPACK</h1><br>
					<p>------------------------------------------------</p><br>
					<p>버려지는 옷감들을 업사이클링해 만든 가방</p>
				</div>
			</div>
		</div>

		<div id="map" style="width: 800px; height: 600px;"></div>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=04b7f22e5edf17d8f2ce411e6eb1f006"></script>
		<script>
			var container = document.getElementById('map');
			var options = {
				center : new kakao.maps.LatLng(37.5003, 127.0363),
				level : 3
			};
			var map = new kakao.maps.Map(container, options);
		</script>
	</main>
</body>
</html>