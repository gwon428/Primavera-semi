<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" href="../../../resources/css/reset.css" />
<link rel="stylesheet" href="../../../resources/css/header.css" />
<link rel="stylesheet" href="../../../resources/css/qna/viewQna.css" />
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
		<div id="top_title">
			<span id="qna">Q&A</span>
			<div name="title" id="title">${qna.title}</div>
		</div>
		<div id="text_button">
			<div id="id_writeDate">
				<div name="id" id="id">${qna.id}</div>
				<div id="writeDate" name="writeDate">
					<fmt:formatDate value="${qna.writeDate}" pattern="yy-MM-dd HH:ss" />
				</div>
			</div>

			<div id="button">
			<c:choose>
				<c:when test="${user == 'anonymousUser'||(qna.id != user.id&&user.auth!='ADMIN')}">
				<button value="목록" id="btnlist">
					<a href="listQna" id="listQna">목록</a>
				</button>
				</c:when>
				<c:otherwise>
				<c:if test="${user.auth == 'ADMIN'}">
				<button value="목록" id="btnlist">
					<a href="listQna" id="listQna">목록</a>
				</button>
				<button value="수정" id="btnupdate">
					<a href="updateQna" id="updateQna">수정</a>
				</button>
				<button value="삭제" id="btndelete">
					<a href="/deleteQna?qnaNum=${qna.qnaNum}" id="deleteQna">삭제</a>
				</button>
				<button value="댓글" id="btnAnswer">
					<a href="writeAnswer?qnaNum=${qna.qnaNum}" id="AnswerQna">댓글</a>
				</button>
				</c:if>
				<c:if test="${qna.id == user.id}">
				<button value="목록" id="btnlist">
					<a href="listQna" id="listQna">목록</a>
				</button>
				<button value="수정" id="btnupdate">
					<a href="updateQna" id="updateQna">수정</a>
				</button>
				<button value="삭제" id="btndelete">
					<a href="/deleteQna?qnaNum=${qna.qnaNum}" id="deleteQna">삭제</a>
				</button>
				</c:if>
				</c:otherwise>
			</c:choose>	
			</div>
		</div>
		<div id="content" name="content">${qna.content}</div>
		<div id="url" name="url">
			<img src="/upload/qna/${qna.url}" />
		</div>
		
	<c:choose>
		<c:when test="${user == 'anonymousUser'}">
		</c:when>
		<c:otherwise>
		<c:if test="${user.auth == 'ADMIN'}">
	<div id="qnaAnswer">
		<jsp:include page="/WEB-INF/views/qnaAnswer/viewAnswer.jsp"></jsp:include>
	</div>
		</c:if>
		</c:otherwise>
	</c:choose>
	 
	</div>
</body>
</html>
