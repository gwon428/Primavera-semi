<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/reset.css" />
<link href="../../resources/css/header.css" rel="stylesheet"
	type="text/css">
<link href="../../resources/css/admin/showProgress.css" rel="stylesheet"
	type="text/css">
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/4602e82315.js"
	crossorigin="anonymous"></script>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<header>
	<nav>
		<a href="/">Primavera</a>
	</nav>
	<nav>
		<a href="#">Store</a> <a href="#">Guide</a> <a href="collectPage">PickUp</a>
		<a href="#">Board</a> <a href="myPage"><i
			class="fa-regular fa-user"></i></a>
	</nav>
</header>
<body>
<sec:authentication property="principal" var="user" />
<main>
		<form action="update_ok" method="post" id="update" name="update">
		
		<div class="left">
		<h1>수거 신청 현황 관리</h1>
		<div id="progtable">
		
			<table border=1 class="table">
				<tr>
					<th>주문번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>진행상황</th>
					
				</tr>
				
				<c:forEach items="${progress}" var="item">
					<tr>
						<td>${item.orderNum}</td>
						<td>${item.id}</td>
						<td>${item.name}</td>
						<td>${item.phone}</td>
						<td id="prog">${item.prog}</td>
			
					</tr>
				</c:forEach>
			</table>
		</div>
		</div>
		<div id="manageProgress">
		
			<table border=1>
				<tr>
					<th>주문번호</th>
					<th>진행 상황 변경</th>
				</tr>
				<tr>
					<td>
						<select name="orderNum" id="orderNum">
						<c:forEach items="${progress}" var="item">
							<option value="${item.orderNum}">${item.orderNum}</option>
							</c:forEach>
						</select>
					</td>
					<td>
						<select name="prog" id="prog">
					        <option value="신청 완료">신청 완료</option>
					        <option  value="수거 완료">수거 완료</option>
					        <option  value="수거 물품 확인">수거 물품 확인</option>
					        <option value="입금 진행중">입금 진행중</option>
					        <option  value="입금 완료">입금 완료</option>
					     </select>
					</td>
				</tr>
			</table>
			<div>
	        	<input type="button" id="btn" value="신청 현황 변경">
	      	</div>
	     </div>
	     
	</form>
</main>

	<script>
	$("#btn").click(()=>{
		$.ajax({
			type:"post",
			url:"/update_ok",
			data: $("#update").serialize(),
			
			success: function(result){
				$("#prog").html(result.prog);
				window.location.reload();
			},
			error: function(){
				console.log("에러 발생!");
			}
		})
	})
	
	
	</script>
</body>
</html>