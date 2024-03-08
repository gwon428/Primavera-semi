<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@taglib uri="http://www.springframework.org/tags"
prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
  <body>
    <h2>등록한 글 내용 확인</h2>

    
    <div name="title" id="title" >제목 : ${qna.title}</div>
    <div id="content" name="cotent">내용 : ${qna.content}</div>
    <div id="writeDate" name="writeDate" >작성일자 
    <fmt:formatDate value="${qna.writeDate}"
								pattern="yyyy-MM-dd HH:mm" />
    </div>
    <div id="url" name="url">사진 : <img src="/upload/qna/${qna.url}"/></div>
    
    <button value="수정" id="btn"><a href="updateQna" id="updateQna">수정</a></button>
    <button value="삭제" id="btndelete"><a href="/deleteQna?qnaNum=${qna.qnaNum}" id="deleteQna">삭제</a></button>
  </body>
</html>
