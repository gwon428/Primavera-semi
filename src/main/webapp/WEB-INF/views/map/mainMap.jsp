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
					<h1>WALLET</h1>
					<br>
					<p>------------------------------------------------</p>
					<br>
					<p>버려지는 옷감들을 업사이클링해 만든 지갑</p>
				</div>
			</div>
			<div class="image-text-wrapper">
				<img src="../../../resources/images/clothes.jpg" alt="Clothes">
				<div class="text-section">
					<h1>CLOTHES</h1>
					<br>
					<p>------------------------------------------------</p>
					<br>
					<p>버려지는 옷감들을 업사이클링해 만든 옷</p>
				</div>
			</div>
			<div class="image-text-wrapper">
				<img src="../../../resources/images/bag.jpg" alt="Bag">
				<div class="text-section">
					<h1>BACKPACK</h1>
					<br>
					<p>------------------------------------------------</p>
					<br>
					<p>버려지는 옷감들을 업사이클링해 만든 가방</p>
				</div>
			</div>
		</div>

		<div id="map" style="width: 800px; height: 600px;"></div>

		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=04b7f22e5edf17d8f2ce411e6eb1f006"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
			mapOption = {
				center : new kakao.maps.LatLng(37.49968, 127.0359), // 지도의 중심좌표
				level : 9
			// 지도의 확대 레벨
			};

			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

			// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
			var positions = [ {
				content : '<div>프리마베라 1호점</div>',
				latlng : new kakao.maps.LatLng(37.50153, 127.0355)
			}, {
				content : '<div>프리마베라 2호점</div>',
				latlng : new kakao.maps.LatLng(37.574524, 127.03965)
			}, {
				content : '<div>프리마베라 3호점</div>',
				latlng : new kakao.maps.LatLng(37.526436, 126.896004)
			} ];

			for (var i = 0; i < positions.length; i++) {
				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
					map : map, // 마커를 표시할 지도
					position : positions[i].latlng
				// 마커의 위치
				});

				// 마커에 표시할 인포윈도우를 생성합니다 
				var infowindow = new kakao.maps.InfoWindow({
					content : positions[i].content
				// 인포윈도우에 표시할 내용
				});

				// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
				// 이벤트 리스너로는 클로저를 만들어 등록합니다 
				// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
				kakao.maps.event.addListener(marker, 'mouseover',
						makeOverListener(map, marker, infowindow));
				kakao.maps.event.addListener(marker, 'mouseout',
						makeOutListener(infowindow));
			}

			// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
			function makeOverListener(map, marker, infowindow) {
				return function() {
					infowindow.open(map, marker);
				};
			}

			// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
			function makeOutListener(infowindow) {
				return function() {
					infowindow.close();
				};
			}
		</script>
	</main>
</body>
</html>