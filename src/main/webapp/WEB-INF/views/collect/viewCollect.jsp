<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 
<link rel="stylesheet" href="/resources/css/reset.css" />
<link href="../../resources/css/header.css" rel="stylesheet"
	type="text/css">
	 -->
<link href="../../resources/css/collect/viewCollect.css" rel="stylesheet"
	type="text/css">
<script src="https://kit.fontawesome.com/4602e82315.js"
	crossorigin="anonymous"></script>
<title>Insert title here</title>

</head>

<body>
<!-- 내용 -->
<div id="contents">
<div class="tabs">
  <div class="tab-header">
    <div class="active">
       <i class="fa-solid fa-user"></i> 아이디, 이름, 전화번호
    </div>
    <div>
      <i class="fa-solid fa-location-dot"></i> 주소
    </div>
    <div>
      <i class="fa-regular fa-clipboard"></i> 수거일, 수거 신청 무게
    </div>
    <div>
      <i class="fa fa-envelope"></i> 공동 현관 비밀번호, 요청사항 
    </div>
  </div>
  <div class="tab-indicator"></div>
  <div class="tab-content">
    
    <div class="active">
      <i class="fa-solid fa-user"></i>
     <!-- 
       <div id="user">
	      <div id="id_name">
		      <h2>아이디</h2>
		      <p>${collect.id}</p>
		      <h2>이름</h2>
		      <p>${collect.name}</p>
	      </div>
	      <div>
		      <h2>전화번호</h2>
		      <p>${collect.phone}</p>
	     </div>
     </div>
      -->
     <h2>아이디</h2>
		      <p>${collect.id}</p>
		      <h2>이름</h2>
		      <p>${collect.name}</p>
    <h2>전화번호</h2>
		      <p>${collect.phone}</p>
    </div>
    
    <div>
      <i class="fa-solid fa-location-dot"></i>
      <h2>우편번호</h2>
      <p>${collect.postCode}</p>
      <h2>주소</h2>
      <p>${collect.roadAddress}</p>
      <h2>상세주소</h2>
      <p>${collect.detailAddress}</p>
    </div>
    
    <div>
      <i class="fa-regular fa-clipboard"></i>
      <h2>수거일</h2>
      <p>${collect.collectionDate}</p>
      <h2>수거 신청 무게</h2>
      <p>${collect.kg} kg</p>
      
    </div>
    
    <div>
      <i class="fa fa-envelope"></i>
      <h2>공동 현관 비밀번호</h2>
      <c:choose>
	      <c:when test="${collect.doorPwd == ''}">
	      	<p>*미기입</p>
	      </c:when>
	      <c:otherwise>
	      	<p>${collect.doorPwd}</p>
	      </c:otherwise>
      </c:choose>
      <h2>요청사항</h2>
      <c:choose>
      	<c:when test="${collect.request == ''}">
      		<p>*미기입</p>
      	</c:when>
      	<c:otherwise>
      		 <p>${collect.request}</p>
      	</c:otherwise>
      </c:choose>
    </div>
    
  </div>
</div>
<!-- 버튼 -->
	<div id="btn">
		<div class="button-list">
			<button id="updateBtn">신청 사항 변경</button>
			<button class="reverse dark">
				<a href="/deleteCollect?orderNum=${collect.orderNum}" id="deleteCollect">신청 취소</a>
			</button>
		</div>
		
		<!-- dribbble -->
		<a class="dribbble" href="https://dribbble.com/shots/7441241-Button-Hover-Effects" target="_blank">
			<img src="https://cdn.dribbble.com/assets/dribbble-ball-mark-2bd45f09c2fb58dbbfb44766d5d1d07c5a12972d602ef8b32204d28fa3dda554.svg" alt="">
		</a>
	</div>
</div>
<!-- 내용 -->	
<script src="../../../resources/js/collect/viewCollect.js"></script>
<!-- 버튼 -->	
<script>
document.querySelectorAll('button').forEach(button => button.innerHTML = '<div><span>' + button.textContent.trim().split('').join('</span><span>') + '</span></div>');
</script>
</body>
</html>