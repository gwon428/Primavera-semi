<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="stylesheet" href="../../../resources/css/reset.css" />
    <link rel="stylesheet" href="../../../resources/css/collect.css" />
  </head>
  <body>
    <main>
      <section id="top">
        <div class="blackbox"></div>
        <div class="top-content">
          <h2>Pick Up</h2>
        </div>
      </section>

      <section id="heading1">
        <h3>Heading 1</h3>
        <section class="heading-content">
          <div class="heading-contents">
            <img
              src="../../../resources/images/heading1.jpg"
              id="heading1Image"
            />
            <p id="content1">
              Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ipsa
              eveniet neque nulla dignissimos ab? Quasi, tenetur maiores.
              Veritatis fuga repudiandae repellendus dolorem id, at sit mollitia
              ex ducimus minus praesentium.
            </p>
          </div>
        </section>
      </section>

      <section id="heading2">
        <h3>Heading 2</h3>
        <section class="heading-content">
          <div class="heading-contents">
            <p id="content2">
              Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ipsa
              eveniet neque nulla dignissimos ab? Quasi, tenetur maiores.
              Veritatis fuga repudiandae repellendus dolorem id, at sit mollitia
              ex ducimus minus praesentium.
            </p>
            <img
              src="../../../resources/images/heading2.jpg"
              id="heading2Image"
            />
          </div>
        </section>
      </section>

      <section id="heading3">
        <h3>Heading 3</h3>
        <section class="heading-content">
          <!--   <a href="showAllCollect">전체 수거 신청 정보 보기</a> -->
          <a href="registerCollect" id="registerPage">수거 신청 하기</a>
        </section>
      </section>
    </main>
  </body>
</html>
