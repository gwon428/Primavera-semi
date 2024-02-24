<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js" defer></script>
<script>	
	function daumPostCode() {
		  new daum.Postcode({
		    oncomplete: function (data) {
		      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		      // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		      var addr = ""; // 주소 변수
		      var extraAddr = ""; // 참고항목 변수

		      //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		      if (data.userSelectedType === "R") {
		        // 사용자가 도로명 주소를 선택했을 경우
		        addr = data.roadAddress;
		      } else {
		        // 사용자가 지번 주소를 선택했을 경우(J)
		        addr = data.jibunAddress;
		      }

		      // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		/*      if (data.userSelectedType === "R") {
		        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		        if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
	          extraAddr += data.bname;
		        }
		        // 건물명이 있고, 공동주택일 경우 추가한다.
		        if (data.buildingName !== "" && data.apartment === "Y") {
		          extraAddr +=
		            extraAddr !== "" ? ", " + data.buildingName : data.buildingName;
		        }
		        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		        if (extraAddr !== "") {
		          extraAddr = " (" + extraAddr + ")";
		        }
		        // 조합된 참고항목을 해당 필드에 넣는다.
		        document.getElementById("sample6_extraAddress").value = extraAddr;
		      }
		      else {
		        document.getElementById("sample6_extraAddress").value = "";
		      }
		      */

		      // 우편번호와 주소 정보를 해당 필드에 넣는다.
		      document.getElementById("postCode").value = data.zonecode;
		      document.getElementById("roadAddress").value = addr;
		      // 커서를 상세주소 필드로 이동한다.
		      document.getElementById("detailAddress").focus();
		    },
		  }).open();
		}
	
	</script>

</head>
<body>
	<h2>수거 신청 하기</h2>
	<form action="signUpCollect" method="post">
	<table border=2>
		<tr>
			<!-- 아이디에 value값(로그인 아이디 불러오기)/ readonly 예정-->
			<th>아이디</th>
			<td><input type="text" name="id" id="id"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" required></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="phone" required></td>
		</tr>
		<tr>
			<th rowspan="3">주소</th>
			<td><input type="text" name="postCode" id="postCode" placeholder="우편번호" size=15 required>
			<input type="button" onclick="daumPostCode()" value="우편번호 찾기"></td>
		</tr>
		<tr>
			<td><input type="text" name="roadAddress" id="roadAddress" placeholder="주소" size=40 required></td>
		</tr>
		<tr>
			<td><input type="text" name="detailAddress" id="detailAddress" placeholder="상세 주소" size=40 required></td>
		</tr>
		<tr>
			<th>수거일</th>
			<td><input type="date" name="collectionDate" max="2025-12-31" min="2024-02-22" required></td>
		</tr>
		<tr>
			<th>공동 현관 비밀번호</th>
			<td><textarea name="doorPwd" id="doorPwd" cols="30" rows="2" style="resize:none" placeholder="공동 현관 비밀 번호가 필요한 경우, 입력해주세요"></textarea></td>
		</tr>
		<tr>
			<th>요청사항</th>
			<td><textarea name="request" id="request" cols="30" rows="10" style="resize:none" placeholder="요청사항을 있으신 경우, 입력해주세요"></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<span> * 수거 신청을 위해 </span><strong><u>이용약관</u></strong> <span>및</span> <strong><u>개인정보 수집</u></strong><span>에 동의합니다.</span><br>
				<input type="radio" name="agree" id="agree" required>네, 동의합니다.</input>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="수거 신청 하기">
			</td>
		</tr>
	</table>
	</form>
	
</body>
</html>