<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<link rel="stylesheet" href="/resources/css/reset.css" />
				<link href="../../resources/css/header.css" rel="stylesheet" type="text/css">
				<link href="../../resources/css/user/myPage.css" rel="stylesheet" type="text/css">
				<script src="https://kit.fontawesome.com/4602e82315.js" crossorigin="anonymous"></script>
				<title>Insert title here</title>
			</head>
			<header>
      <nav>
        <a href="/">Primavera</a>
      </nav>
      <nav>
        <a href="mainMap">Store</a>
        <a href="#">Guide</a>
        <a href="collectPage">PickUp</a>
        <a href="list">Board</a>
        <span>
          <a href="/board/list">Review</a>
          <a href="listQna">Q & A</a>
          <a href="/notice/list">Notice</a>
        </span>
        <a href="myPage"><i class="fa-regular fa-user"></i></a>
      </nav>
    </header>

			<body>
				<sec:authentication property="principal" var="user" />
				<c:choose>
				
				
					<c:when test="${user == 'anonymousUser'}">
						<main>
							<section id="background">
							</section>
							
							<a href="/" class="loginformlogo">Primavera</a>
							<form action="/login" method="post" class="loginform">
								<div class="idpwd">
									<div class="mb-3 row">
										<label><i class="fa-regular fa-user"></i></label>
										<div class="col-sm-10">
											<input size="15" type="text" name="username" placeholder="아이디">
										</div>
									</div>
									<div class="mb-3 row">
										<label for="staticEmail" class="col-sm-2 col-form-label"><i
											class="fa-solid fa-lock"></i></label>
										<div class="col-sm-10">
											<input type="password" name="password" placeholder="비밀번호">
										</div>
									</div>
				
								</div>
						
								<!-- 	<input size="15" type="text" name="username" placeholder="아이디">
									<input type="password" name="password" placeholder="비밀번호">
								 -->
								<input type="submit" value="로그인" class="loginbutton">
							</form>

							<div id="anonymousUserMenu">
								<a href="findId">아이디 찾기</a>
								<span> | </span>
								<a href="changePwd">비밀번호 찾기</a>
								<span> | </span>
								<a href="register">회원가입</a>
							</div>
						</main>
					</c:when>
					
					
					<c:otherwise>
						<c:if test="${user.auth == 'ADMIN'}">
							<section id="Adbackground">
								<div id="background-blackbox"></div>
							</section>
							<div id="Login">
								<input type="hidden" id="auth" value="<c:out value=" ${user.auth}" />">
								<div id="logo">
									<div class="logobox">Primavera</div>
								</div>
								<div id="Menu">
									<div id="MenuOne">
										<a href="notice/list">공지 게시판 관리</a> <a href="listQna">Q&A 게시판 관리</a> <a
											href="allUser">전체 회원 조회</a>
									</div>
									<div id="MenuTwo">
										<a href="showProgress">progress 관리</a>
										<a href="showAllCollect">수거 신청 현황</a>
										<a href="/logout">로그아웃</a>
									</div>
								</div>
							</div>

						</c:if>
						<c:if test="${user.auth == 'MEMBER'}">
							<section id="Userbackground">
								<div id="background-blackbox"></div>
							</section>
							<div id="Login">
								<input type="hidden" id="auth" value="<c:out value=" ${user.auth}" />">
								<div id="logo">
									<div class="logobox">Primavera</div>
								</div>

								<div id="Menu">
									<div id="MenuOne">
										<a href="showReview">내가 적은 후기</a>
										<a href="showQna">내 Q&A</a>
										<a href="showCollect">진행상황</a>
									</div>
									<div id="MenuTwo">
										<a href="updateUser">회원 정보 수정</a>
										<a href="deleteUser">회원 탈퇴</a>
										<a href="/logout">로그아웃</a>
									</div>
								</div>
							</div>
						</c:if>
					</c:otherwise>
				</c:choose>
			</body>

			</html>