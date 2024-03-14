<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<sec:authentication property="principal" var="user" />
<div id="main">
		<h1>Answer 등록</h1>
	<div class="container">
		<form action="insertAnswer" method="post" enctype="multipart/form-data" id="insertAnswer" name="insertAnswer" onsubmit="return validate()">
		<div id="id_orderNum">
			<div class="insertAnswer">
				<label>*아이디</label> <input class="id" name="id" id="id" value="${user.id}" readonly>
			</div>
			 
			<div class="insertAnswer">
				<label>*질문번호</label> <input class="qnaNum" name="qnaNum" id="qnaNum" value="${qna}">
			</div>  
			</div>
			<div class="insertAnswer">
				<label>*내용</label>
				<textarea class="content" row="10" name="content" id="content"></textarea>
			</div>
			<div class="insertAnswer" id="img">
				<div id="img_input">
				<label for="file" id="photo">photo</label> 
				
				<input class="insertAnswer"
					type="file" id="file" name="file" accept="image/*" onchange="imgShow(event);" onclick="labelText();">
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