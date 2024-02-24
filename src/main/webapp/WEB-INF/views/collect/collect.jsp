<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{
	margin:0;
	border:0;
}
section{
	height:100vh;
}
#top{
	background-image : url(../../../resources/images/top-background.jpg);
	background-size : cover;
	background-position : center;
	height : 100vh;
	width : 100%;
}
.blackbox{
	width : 100%;
	height : 100%;
	background-color : rgba(0, 0, 0, 0.5);
}
.top-content{
	width:100%;
	height:100%;
	position:absolute;
	top:0;
	left:0;
	color:white;
	display:flex;
	flex-direction:column;
	justify-content:center;
	padding-left:40px;
}
h2{
	font-size:4rem;
	color:white;
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
		        <p>
		          Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ipsa eveniet
		          neque nulla dignissimos ab? Quasi, tenetur maiores. Veritatis fuga
		          repudiandae repellendus dolorem id, at sit mollitia ex ducimus minus
		          praesentium.
		        </p>
      		</section>
      		<section id="heading2">
	      		<h3>Heading 2</h3>
		        <p>
		          Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ipsa eveniet
		          neque nulla dignissimos ab? Quasi, tenetur maiores. Veritatis fuga
		          repudiandae repellendus dolorem id, at sit mollitia ex ducimus minus
		          praesentium.
		        </p>
      		</section>
      		<section id="heading3">
	      		<h3>Heading 3</h3>
		        <p>
		          Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ipsa eveniet
		          neque nulla dignissimos ab? Quasi, tenetur maiores. Veritatis fuga
		          repudiandae repellendus dolorem id, at sit mollitia ex ducimus minus
		          praesentium.
		        </p>
      		</section>
      		<section id="heading4">
				<ul>
					<li><a href="showAllCollect">전체 수거 신청 정보 보기</a></li>
					<li><a href="registerCollect" id="registerPage">수거 신청 하기</a></li>
				</ul>
			</section>
      	
	</main>
</body>
</html>