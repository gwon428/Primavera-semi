<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../../resources/css/reset.css" />
    <link rel="stylesheet" href="../../../resources/css/header.css" />
    <link
      rel="stylesheet"
      href="../../../resources/css/qnaAnswer/updateQnaAnswer.css"
    />
    <script src="https://kit.fontawesome.com/4602e82315.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="header-blackbox"></div>
    <header>
      <nav>
        <a href="#">Primavera</a>
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
<!-- -----------------------------------main----------------------------- -->
<div id="main">
      <div id="allContent">
        <div class="qnaAll">
          <div class="back_black"></div>
          <div id="qna_content">
            <h1>Q&A 질문</h1>
            <session id="contents">
              <div name="id" id="id">
                <label>회원 아이디</label>
                <input value="${qnaView.id}" readonly />
              </div>
              <div name="qnaNum" id="qnaNum">
                <label>질문 번호</label>
                <input value="${qnaView.qnaNum}" readonly />
              </div>
              <div name="title" id="title">
                <label>제목</label><br>
                <textarea>${qnaView.title}</textarea>
              </div>
              <div id="content" name="content">
                <label>내용</label><br>
                <textarea>${qnaView.content}</textarea>
              </div>
              <c:choose>
                <c:when test="${qnaView.url != null}">
                  <div id="url" name="url">
                    <img src="/upload/qna/${qnaView.url}" />
                  </div>
                </c:when>
              </c:choose>
            </session>
          </div>
        </div>
<!-- -----------------qnaAnswer 수정 파트----------------------------- -->

<div class="qnaAnswerUpdate">
		<h1>답변 수정</h1>
		<form action="/updateAnswer" method="post" enctype="multipart/form-data">
			<input type="hidden" name="qnaNum" value="${qnaAnswer.qnaNum}">
			<input type="hidden" name="url" value="${qnaAnswer.url}">
			
			<div class="updateAnswer">
				<label>*내용</label>
				<br>
				<textarea id="content" row="10" name="content" style="resize:none;">${qnaAnswer.content}</textarea>
				<br>
				<a href="/upload/${qnaAnswer.url}" download><img src="/upload/${qnaAnswer.url}"/></a>
			</div>
			<div class="updateAnswer">
				<label for="file">photo</label>
				<input class="form-control" type="file" id="file" name="file" accept="image/*">
			</div>
			<div>

			</div>
			 <div id="answerUpdateButton">
			<button type="submit" class="btn_update" id="btn_update">수정</button>
			 </div>
		</form>
	</div>
	</div>
</div>
</body>
</html>