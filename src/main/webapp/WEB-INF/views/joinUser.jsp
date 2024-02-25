<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원가입</h1>
<!-- 아이디 확인 눌러서 중복 아이디인지 체크하는 기능 추가, js 동작하도록 할 것 -->
	<form action="signUp" method="post" onsubmit="return validate()">
		* 아이디 : <input type="text" name="id" id="userId"><br>
		<span>첫 글자는 반드시 영문자로, 영문자, 숫자 포함하여 총 4~12자로 입력하세요.</span><br>
		* 비밀번호 :<input type="password" name="password" id="userPwd"><br>
		<span>영문자, 숫자, 특수문자 포함하여 총 8~15자로 입력하세요.</span><br>
		* 비밀번호 확인 : <input type="password" id="passwordcheck"><br>
		<span>위의 비밀번호와 일치하게 입력하세요.</span><br>
		* 이름 : <input 	type="text" name="name" id="userName"><br>
		<span>한글로만 이루어져야되며, 2글자 이상으로 입력하세요.</span><br>
		* 전화번호 : <input type="text" name="phone" id="userPhone"><br>
		<span>-를 생략한 숫자만 입력하세요.</span><br>
		* 우편번호 : <input type="text" name="postCode" id="postCode" placeholder="우편번호"><input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		* 주소 : <input type="text" name="roadAddress" id="roadAddress" placeholder="주소"><br>
		* 상세주소 : <input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소"><br>
		* 이메일 : <input type="text" name="email" id="email"><br>
		<span>이메일 형식에 맞춰서 입력하세요.</span><br>
		은행 : <select name=bankName>
			<option value="NH"> 농협 </option>
			<option value="KB"> 국민 </option>
			<option value="WOORI"> 우리 </option>
			<option value="SH"> 신한 </option>
			<option value="IBK"> 기업 </option>
			</select>
		계좌번호 : <input type="text" name="account" id="account"><br>
	<input type="submit" value="회원가입">
	</form>
	
<!-- 우편 주소 API 가져오는 것도 분리해서 연결할 것 -->	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postCode').value = data.zonecode;
                document.getElementById("roadAddress").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
 </script>
 <script type="text/javascript" src="src/main/resources/test.js"></script>
</body>
</html>