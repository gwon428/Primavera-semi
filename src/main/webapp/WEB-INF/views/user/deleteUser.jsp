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
<form action="deleteUser" method="post" onsubmit="return validate()">
	아이디 : ${user.id}
	<br>
	<!-- <input name="password" id="userPwd" value="${user.password}"> -->
	비밀번호 : <input type="password" name="pwdCheck" id="pwdCheck">
	<input type="submit" value="탈퇴">
</form>
<script>
function pwdCheck(){
	const regExp = /^[!-~]{8,15}$/;
	return regExp.test(userPwd.value);
}

function pwdCheck2(){
	return userPwd.value === pwdCheck.value;
}

function validate(){
	if(!pwdCheck()){
		userPwd.focus();
		return false;
	} else if(!pwdCheck2()){
		passwordcheck.focus();
		return false;
	}
	return true;
}
</script>
</body>
</html>