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
<script src="https://kit.fontawesome.com/4602e82315.js"
	crossorigin="anonymous"></script>
<title>Insert title here</title>
<style>
@font-face {
	font-family: "Cafe24Oneprettynight";
	src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Oneprettynight.woff") format("woff");
	font-style: normal;
}
<!-- 내용 --> 
@import url('https://fonts.googleapis.com/css2?family=Raleway:wght@400;800&display=swap');

* {
  box-sizing:border-box;
}
body {
  background:#ddd;
  font-family:"Raleway";
}
.tabs {
  position:absolute;
  top:50%;
  left:50%;
  transform:translate(-50%,-50%);
  width:680px;
  height:360px;
  padding:30px 20px;
  background:#f5f5f5;
  box-shadow:5px 5px 10px 5px #ccc;
  overflow:hidden;
}
.tabs .tab-header {
  float:left;
  width:220px;
  height:100%;
  border-right:1px solid #ccc;
  padding:50px 0px;
  font-family: "Cafe24Oneprettynight";
}
.tabs .tab-header > div {
  height:50px;
  line-height:50px;
  font-size:16px;
  font-weight:600;
  color:#888;
  cursor:pointer;
  padding-left:10px;
}
.tabs .tab-header > div:hover,
.tabs .tab-header > div.active {
  color:#00acee;
}
.tabs .tab-header div i {
  display:inline-block;
  margin-left:10px;
  margin-right:5px;
}
.tabs .tab-content {
  position:relative;
  height:100%;
  overflow:hidden;
  font-family: "Cafe24Oneprettynight";
}
.tabs .tab-content > div > i {
  display:inline-block;
  width:50px;
  height:50px;
  background:#555;
  color:#f5f5f5;
  font-size:25px;
  font-weight:600;
  text-align:center;
  line-height:50px;
  border-radius:50%;
}
.tabs .tab-content > div {
  position:absolute;
  text-align:center;
  padding:40px 20px;
  top:-200%;
  transition:all 500ms ease-in-out;
}
.tabs .tab-content > div.active {
  top:0px;
}

.tabs .tab-indicator {
  position:absolute;
  width:4px;
  height:50px;
  background:#00acee;
  left:228px;
  top:80px;
  transition:all 500ms ease-in-out;
}

<!-- 버튼 -->
button.dark {
	 --background: #2f3545;
	 --shadow: 0 2px 8px -1px rgba(21, 25, 36, .32);
	 --shadow-hover: 0 4px 20px -2px rgba(21, 25, 36, .5);
}
 button.white {
	 --background: #fff;
	 --text: #275efe;
	 --shadow: 0 2px 8px -1px rgba(18, 22, 33, .04);
	 --shadow-hover: 0 4px 20px -2px rgba(18, 22, 33, .12);
}
 button.fast {
	 --duration: 0.32s;
}
 button {
	 
	 --text: #fff;
	 --font-size: 16px;
	 --duration: 0.44s;
	 --move-hover: -4px;
	 --shadow: 0 2px 8px -1px rgba(39, 94, 254, .32);
	 --shadow-hover: 0 4px 20px -2px rgba(39, 94, 254, .5);
	 --font-shadow: var(--font-size);
	 padding: 16px 32px;
	 font-family: 'Roboto';
	 font-weight: 500;
	 line-height: var(--font-size);
	 border-radius: 24px;
	 display: block;
	 outline: none;
	 appearance: none;
	 border: none;
	 text-decoration: none;
	 font-size: var(--font-size);
	 letter-spacing: 0.5px;
	 background: var(--background);
	 color: var(--text);
	 box-shadow: var(--shadow);
	 transform: translateY(var(--y)) translateZ(0);
	 transition: transform var(--duration) ease, box-shadow var(--duration) ease;
}
button#updateBtn{
	--background: #93b19a;
}
button.dark{
	--background: black;	
}

 button div {
	 display: flex;
	 overflow: hidden;
	 text-shadow: 0 var(--font-shadow) 0 var(--text);
}
 button div span {
	 display: block;
	 backface-visibility: hidden;
	 font-style: normal;
	 transition: transform var(--duration) ease;
	 transform: translateY(var(--m)) translateZ(0);
}
 button div span:nth-child(1) {
	 transition-delay: 0.05s;
}
 button div span:nth-child(2) {
	 transition-delay: 0.1s;
}
 button div span:nth-child(3) {
	 transition-delay: 0.15s;
}
 button div span:nth-child(4) {
	 transition-delay: 0.2s;
}
 button div span:nth-child(5) {
	 transition-delay: 0.25s;
}
 button div span:nth-child(6) {
	 transition-delay: 0.3s;
}
 button div span:nth-child(7) {
	 transition-delay: 0.35s;
}
 button div span:nth-child(8) {
	 transition-delay: 0.4s;
}
 button div span:nth-child(9) {
	 transition-delay: 0.45s;
}
 button div span:nth-child(10) {
	 transition-delay: 0.5s;
}
 button div span:nth-child(11) {
	 transition-delay: 0.55s;
}
 button:hover {
	 --y: var(--move-hover);
	 --shadow: var(--shadow-hover);
}
 button:hover span {
	 --m: calc(var(--font-size) * -1);
}
 button.reverse {
	 --font-shadow: calc(var(--font-size) * -1);
}
 button.reverse:hover span {
	 --m: calc(var(--font-size));
}
 html {
	 box-sizing: border-box;
	 -webkit-font-smoothing: antialiased;
}
 * {
	 box-sizing: inherit;
}
 *:before, *:after {
	 box-sizing: inherit;
}
 body {
	 min-height: 100vh;
	 display: flex;
	 font-family: 'Roboto', Arial;
	 justify-content: center;
	 align-items: center;
	 background: #e4ecfa;
}
 body .button-list {
	 display: flex;
	 	
}
 body .button-list button {
 	font-family: "Cafe24Oneprettynight";
	 margin: 0 12px;
}
 body .dribbble {
	 position: fixed;
	 display: block;
	 right: 20px;
	 bottom: 20px;
}
 body .dribbble img {
	 display: block;
	 height: 28px;
}
#contents{
	display:flex;
	flex-direction:column;
	position:absolute;
}

#btn{
	position: absolute;
    top: 227px;
    left: -125px;
}
</style>
</head>

<body>
<!-- 내용 -->
<div id="contents">
<div class="tabs">
  <div class="tab-header">
    <div class="active">
      <i class="fa fa-code"></i> 아이디, 이름, 전화번호
    </div>
    <div>
      <i class="fa fa-pencil-square"></i> 주소
    </div>
    <div>
      <i class="fa fa-bar-chart"></i> 수거일, 수거 신청 무게
    </div>
    <div>
      <i class="fa fa-envelope"></i> 공동 현관 비밀번호,<br> 요청사항 
    </div>
  </div>
  <div class="tab-indicator"></div>
  <div class="tab-content">
    
    <div class="active">
      <i class="fa fa-code"></i>
      <h2>아이디</h2>
      <p>${collect.id}</p>
      <h2>이름</h2>
      <p>${collect.name}</p>
      <h2>전화번호</h2>
      <p>${collect.phone}</p>
    </div>
    
    <div>
      <i class="fa fa-pencil-square"></i>
      <h2>우편번호</h2>
      <p>${collect.postCode}</p>
      <h2>주소</h2>
      <p>${collect.roadAddress}</p>
      <h2>상세주소</h2>
      <p>${collect.detailAddress}</p>
    </div>
    
    <div>
      <i class="fa fa-bar-chart"></i>
      <h2>수거일</h2>
      <p>${collect.collectionDate}</p>
      <h2>수거 신청 무게</h2>
      <p>${collect.kg}</p>
      
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
			<button class="reverse dark">신청 취소</button>
		</div>
		
		<!-- dribbble -->
		<a class="dribbble" href="https://dribbble.com/shots/7441241-Button-Hover-Effects" target="_blank">
			<img src="https://cdn.dribbble.com/assets/dribbble-ball-mark-2bd45f09c2fb58dbbfb44766d5d1d07c5a12972d602ef8b32204d28fa3dda554.svg" alt="">
		</a>
	</div>
</div>
<!-- 내용 -->	
<script>
function _class(name){
	  return document.getElementsByClassName(name);
	}

	let tabPanes = _class("tab-header")[0].getElementsByTagName("div");

	for(let i=0;i<tabPanes.length;i++){
	  tabPanes[i].addEventListener("click",function(){
	    _class("tab-header")[0].getElementsByClassName("active")[0].classList.remove("active");
	    tabPanes[i].classList.add("active");
	    
	    _class("tab-indicator")[0].style.top = `calc(80px + ${i*50}px)`;
	    
	    _class("tab-content")[0].getElementsByClassName("active")[0].classList.remove("active");
	    _class("tab-content")[0].getElementsByTagName("div")[i].classList.add("active");
	    
	  });
	}
</script>
<!-- 버튼 -->	
<script>
document.querySelectorAll('button').forEach(button => button.innerHTML = '<div><span>' + button.textContent.trim().split('').join('</span><span>') + '</span></div>');
</script>
</body>
</html>