<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec"
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
<h1>회원 정보 수정</h1>
<form action="updateUser" method="post" onsubmit="return validate()">
<p> 기본 정보 </p>
<p> 아이디 : ${user.id} </p>
<input type="hidden" name="id" value="${user.id}">
<p> 비밀번호 : <input type="password" name="password" id="userPwd" placeholder="수정할 비밀번호 혹은 기존 비밀번호"></p>
<p> 비밀번호 확인 : <input type="password" name="password" id="pwdCheck">
<p> 이름 : <input type="text" name="name" id="userName" value="${user.name}"></p>
<p> 휴대폰 번호 : <input type="text" name="phone" id="userPhone" value="${user.phone}"></p>
<p> 이메일 : <input type="text" name="email" id="email" value="${user.email}"></p>
<input type="submit" value="수정">
</form>
<script type="text/javascript" src="../../resources/js/updateregExp.js"></script>
</body>
</html>