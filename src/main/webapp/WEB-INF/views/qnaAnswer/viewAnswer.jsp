<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<div>
		<span>Primavera 답변</span>
		<input id="qnaNum" value="${qna.qnaNum}" hidden>
		<div name="qnaNum" id="qnaNum">${qnaAnswer.qnaNum}</div>
		<div name="id" id="id">${qnaAnswer.id}</div>
		<div id="answerDate" name="answerDate">
		
			<fmt:formatDate value="${qnaAnswer.answerDate}" pattern="yy-MM-dd HH:ss" />
		</div>
		<div id="content" name="content">${qnaAnswer.content}</div>
	</div>
</body>
</html>



