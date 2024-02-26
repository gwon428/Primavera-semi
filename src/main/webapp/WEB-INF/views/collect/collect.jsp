<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="stylesheet" href="../../../resources/css/reset.css" />
    <link rel="stylesheet" href="../../../resources/css/collect.css" />

    <script
      src="https://kit.fontawesome.com/4602e82315.js"
      crossorigin="anonymous"
    ></script>
    <script>
     const navIcons = document.querySelectorAll("i");
     const aList = document.querySelectorAll(".image-content");

     navIcons[0].addEventListener("click", function(){
      aList.forEach((img)=>{
        img.classList.remove("header-main-bottom-right");
      });
     });
     
      navIcons[1].addEventListener("click", function () {
        aList.forEach((a) => {
          img.classList.add("header-main-bottom-right");
        });
      });
    </script>
  </head>
  <body>
    <main>
      <div id="top">
        <div class="blackbox"></div>
        <div class="top-content">
          <h2>Pick Up</h2>
        </div>
      </div>

      <section id="heading1">
        <div class="heading-content">
          <div class="heading-contents">
            <div id="contents">
              <i class="fa-solid fa-chevron-left" id="di"></i>
              <div class="image-content">
                <img src="../../../resources/images/heading1.jpg" id="main1" />
                <p>내용1</p>
              </div>
              <div class="image-content">
                <img src="../../../resources/images/heading2.jpg" id="main2" />
                <p>내용2</p>
              </div>
              <div class="image-content">
                <img src="../../../resources/images/heading1.jpg" id="main3" />
                <p>내용3</p>
              </div>
             
              <i class="fa-solid fa-chevron-right" id="di"></i>
            </div>
            <!--   <a href="showAllCollect">전체 수거 신청 정보 보기</a> -->
            <a href="registerCollect" id="registerPage">수거 신청</a>
          </div>
        </div>
      </section>
    </main>
  </body>
</html>
