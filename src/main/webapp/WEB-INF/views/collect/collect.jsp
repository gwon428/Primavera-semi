<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <style>
      * {
        margin: 0;
        border: 0;
      }
      section {
        height: 100vh;
      }
      #top {
        background-image: url(../../../resources/images/top-background.jpg);
        background-size: cover;
        background-position: center;
        height: 100vh;
        width: 103%;
      }
      .blackbox {
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
      }
      .top-content {
        width: 100%;
        height: 100%;
        position: absolute;
        top: 0;
        left: 0;
        color: white;
        display: flex;
        flex-direction: column;
        justify-content: center;
        padding-left: 40px;
      }
      h2 {
        font-size: 4rem;
        color: white;
      }
      div.heading-contents {
        display: flex;
        align-items: center;
        justify-content: center;
      }

      #heading1Image,
      #heading2Image {
        width: 500px;
        height: 350px;
        margin-top: 50px;
        margin-left: 50px;
      }

      .heading-contents p {
        display: flex;
        align-items: center;
      }

      #content1 {
        margin-left: 50px;
      }

      #content2 {
        margin-left: 50px;
        margin-right: 50px;
      }

      .heading-content {
        display: flex;
        justify-content: center;
        align-items: center;
      }

      #registerPage {
        background-color: black;
        width: 300px;
        height: 60px;
        color: white;
        text-decoration: none;
        font-size: 1.5rem;
        font-weight: bolder;
        border-radius: 45%;
        display: flex;
        justify-content: center;
        align-items: center;
      }
    </style>
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
