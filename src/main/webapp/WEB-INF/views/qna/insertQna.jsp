<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../../resources/css/reset.css" />
<link rel="stylesheet" href="../../../resources/css/qna/insertQna.css" />
 
<link rel="stylesheet" href="../../../resources/css/header.css" />
 
<script src="https://kit.fontawesome.com/4602e82315.js"
	crossorigin="anonymous"></script>
</head>
<body>
<sec:authentication property="principal" var="user" />
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
	<div id="main">
		<h1>Q&A 등록</h1>
	<div class="container">
		<form action="insertQna" method="post" enctype="multipart/form-data" id="insertQna" name="insertQna" onsubmit="return validate()">
		<div id="id_orderNum">
			<div class="form-group" id="id">
				<label>*아이디</label> <input class="form-control" name="id" id="id_input" value="${user.id}" readonly>
			</div>
			<!-- 
			<div class="form-group" id="orderNum">
				<label>*주문번호</label> <input class="form-control" name="orderNum" id="orderNum_input">
			</div>  -->
			</div>
			<div class="form-group" id="title">
				<label>*제목</label> <input class="form-control" name="title" id="title_input">
			</div>
			<div class="form-group" id="content">
				<label>*내용</label>
				<textarea class="form-control" row="10" name="content" id="content_input"></textarea>
			</div>
			<div class="form-group" id="img">
				<div id="img_input">
				<label for="file" id="photo">photo</label> 
				
				<input class="form-control"
					type="file" id="file" name="file" accept="image/*" onchange="imgShow(event);" onclick="labelText();"hidden>
					<div id="image_container">
					</div>
					</div>
			</div>
			<div class="btn">
			<button type="submit" class="btn_final" id="btn_insert">등 록</button>
			<button value="목록" class="btn_final" id="btn_list"><a href="listQna" id="listQna">취 소</a></button>
			</div>
		</form>
	</div>
	</div>
	<script src="../../../resources/js/qna/insertQna.js"></script>

</body>
</html>