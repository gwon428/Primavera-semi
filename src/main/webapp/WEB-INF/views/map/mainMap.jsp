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
<link rel="stylesheet" href="../../../resources/css/map/mainMap.css" />
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
					href="/collectPage">PickUp</a> <a href="list">Board</a> <span>
					<a href="/review/list">Review</a> <a href="/listQna">Q & A</a> <a
					href="/notice/list">Notice</a>
				</span> <a href="/myPage"><i class="fa-regular fa-user"></i></a>
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
		    var mapContainer = document.getElementById('map'),
		        mapOption = {
		            center: new kakao.maps.LatLng(37.5519, 126.9918),
		            level: 9
		        };
		    var map = new kakao.maps.Map(mapContainer, mapOption);
		    var markers = [
		        { position: new kakao.maps.LatLng(37.49781, 127.13338), content: '<div class="wrap">'
					+ '    <div class="info">'
					+ '        <div class="title">'
					+ '            프리마베라 1호점'
					+ '            '
					+ '        </div>'
					+ '        <div class="body">'
					+ '            <div class="img">'
					+ '                <img src="../../../resources/images/wallet.jpg" width="73" height="70">'
					+ '           </div>'
					+ '            <div class="desc">'
					+ '                <div class="ellipsis">서울특별시 송파구 첨단로 242</div>'
					+ '                <div class="ellipsis"><a href="https://map.kakao.com/link/to/프리마베라 1호점,37.49781, 127.13338" target="_blank">1호점 가는길</a></div>'
					+ '                <div>070-1312-1454</div>'
					+ '            </div>' + '        </div>' + '    </div>'
					+ '</div>' },
		        { position: new kakao.maps.LatLng(37.574524, 127.03965), content: '<div class="wrap">'
					+ '    <div class="info">'
					+ '        <div class="title">'
					+ '            프리마베라 2호점'
					+ '            '
					+ '        </div>'
					+ '        <div class="body">'
					+ '            <div class="img">'
					+ '                <img src="../../../resources/images/clothes.jpg" width="73" height="70">'
					+ '           </div>'
					+ '            <div class="desc">'
					+ '                <div class="ellipsis">서울특별시 동대문구 첨단로 242</div>'
					+ '                <div class="ellipsis"><a href="https://map.kakao.com/link/to/프리마베라 2호점,37.574524, 127.03965" target="_blank">2호점 가는길</a></div>'
					+ '                <div>070-1712-3764</div>'
					+ '            </div>' + '        </div>' + '    </div>'
					+ '</div>' },
		        { position: new kakao.maps.LatLng(37.495472, 126.887536), content: '<div class="wrap">'
					+ '    <div class="info">'
					+ '        <div class="title">'
					+ '            프리마베라 3호점'
					+ '            '
					+ '        </div>'
					+ '        <div class="body">'
					+ '            <div class="img">'
					+ '                <img src="../../../resources/images/bag.jpg" width="73" height="70">'
					+ '           </div>'
					+ '            <div class="desc">'
					+ '                <div class="ellipsis">서울특별시 구로구 첨단로 242</div>'
					+ '                <div class="ellipsis"><a href="https://map.kakao.com/link/to/프리마베라 3호점,37.495472, 126.887536" target="_blank">3호점 가는길</a></div>'
					+ '                <div>070-4512-1214</div>'
					+ '            </div>' + '        </div>' + '    </div>'
					+ '</div>' }
		    ];
		    markers.forEach(function(markerInfo, index) {
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: markerInfo.position
		        });
					
					// 마커 위에 커스텀오버레이를 표시			
					var overlay = new kakao.maps.CustomOverlay({
			            content: markerInfo.content,
			            map: map,
			            position: marker.getPosition()
			        });
			        overlay.setMap(null);
			        daum.maps.event.addListener(marker, 'mouseover', function() {
			        	overlay.setMap(map);			        	
			        });
			        
			     /* 	daum.maps.event.addListener(marker, 'mouseout', function() {
			     		overlay.setMap(null);
			        }); */
			    });
			    function closeOverlay(overlay) {
			        overlay.setMap(null);
			    }
				 // 지도에 확대 축소 컨트롤을 생성한다
				var zoomControl = new kakao.maps.ZoomControl();

				// 지도의 우측에 확대 축소 컨트롤을 추가한다
				map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
			
			    
	</script>

		<script>
			document.addEventListener("DOMContentLoaded", function() {
			    var observer = new IntersectionObserver(function(entries) {
			        entries.forEach(entry => {
			            if(entry.isIntersecting) {
			                entry.target.classList.add('animate');
			            }
			        });
			    });
			   
			    document.querySelectorAll('.image-text-wrapper').forEach(item => {
			        observer.observe(item);
			    });
			  
			    var mapElement = document.querySelector('#map');
			    observer.observe(mapElement);
			});
		</script>


	</main>
</body>
</html>