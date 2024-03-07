<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
<sec:authentication property="principal" var="user" />
<h2>관리자용 수거 신청 진행 상황 페이지용</h2>
<form action="update_ok" method="post" id="update" name="update">
	<table border=1>
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
	<table border=1>
		<tr>
			<th>아이디</th>
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
	</form>
	
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