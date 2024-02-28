<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>

<link rel="stylesheet" href="../../../resources/css/reset.css" />
<link rel="stylesheet" href="../../../resources/css/register.css" />
<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"
		defer>
	</script>
	<script src="../../../resources/js/registerCollectDaum.js"></script>
</head>
<body>
	<form action="signUpCollect" method="post" id="pickUp">

		<h2>Primavera</h2>
		<div id="pickUpTable">
			<!-- 아이디에 value값(로그인 아이디 불러오기)/ readonly 예정-->
			<div class="id">
				<p>아이디</p>
				<input type="text" name="id" id="id" />
			</div>
			<div class="name">
				<p>이름</p>
				<input type="text" name="name" required />
			</div>
			<div class="phone">
				<p>전화번호</p>
				<input type="text" name="phone" required />
			</div>

			<div class="addr">
				<p>주소</p>
				<input type="text" name="postCode" id="postCode" placeholder="우편번호"
					size="15" required /> <input type="button"
					onclick="daumPostCode()" value="우편번호 찾기" /> <input type="text"
					name="roadAddress" id="roadAddress" placeholder="주소" size="40"
					required /> <input type="text" name="detailAddress"
					id="detailAddress" placeholder="상세 주소" size="40" required />
			</div>

			<div class="collectDate">
				<p>수거일</p>
				<input type="date" name="collectionDate" max="2025-12-31"
					min="2024-02-22" required />
			</div>
			<div>
				<p>공동 현관 비밀번호</p>
				<textarea name="doorPwd" id="doorPwd" cols="50" rows="2"
					placeholder="공동 현관 비밀 번호가 필요한 경우, 입력해주세요"></textarea>
			</div>
			<div>
				<p>요청사항</p>
				<textarea name="request" id="request" cols="50" rows="10"
					placeholder="요청사항을 있으신 경우, 입력해주세요"></textarea>
			</div>
		</div>

		<div id="agree">
			<p>
				* 수거 신청을 위해 <a href="#pop_info_1" class="btn_open"> 이용약관 </a> 및 <a
					href="#pop_info_2" class="btn_open">개인정보 수집 </a>에 동의합니다.
			</p>
			<input type="radio" name="agree" id="agree" required />네, 동의합니다.
		</div>
		<div>
			<button type="submit" id="button" onclick="showAlert()">수거
				신청 하기</button>
		</div>
	
		<div id="pop_info_1" class="pop_wrap">
			<div class="pop_inner">
				<p class="dsc">
				<h3>이용약관</h3>
				<hr>
				<strong>제 1조 목적</strong><br> 이 약관은 프리마베라 (이하 “회사”라 합니다)이 제공하는
				프리마베라(Primavera)서비스 (이하 “서비스”라 합니다)와 관련하여 회사와 이용 고객 간에 서비스의 이용조건 및
				절차, 회사와 회원 간의 권리, 의무 및 기타 필요한 사항을 규정함을 목적으로 합니다.<br>
				<br> <strong>제2조 용어의 정의</strong><br> 이 약관에서 사용하는 용어의 정의는
				다음과 같습니다.<br> 1. 서비스라 함은 회사가 제공하는 의류 수거, 구매, 판매에 이르는 전반적인 서비스를
				모두 포괄합니다. 서비스는 구현되는 장치나 단말기(PC, TV, 휴대형 단말기 등의 각종 유무선 장치를 포함하며 이에
				한정되지 않음)와 상관 없이 웹(Web)·앱(App) 등의 제반 서비스를 의미합니다.<br> 2. “회원”이라
				함은 회사의 서비스에 접속하여 이 약관과 개인정보처리방침에 따라 회사와 이용계약을 체결하고 회원 등록을 한 고객으로서
				회사가 제공하는 서비스를 지속적으로 이용할 수 있는 고객을 의미합니다.<br> 3. “비회원”이라 함은 회원으로
				가입하지 않고 회사가 제공하는 서비스를 이용하는 고객을 의미합니다.<br>

				</p>
				<button type="button" class="btn_close">닫기</button>
			</div>
		</div>

		<div id="pop_info_2" class="pop_wrap">
			<div class="pop_inner">
				<p class="dsc">
				<h3>개인정보처리방침</h3>
				<hr>
				"주식회사 프리마베라”(이하 '회사')는 「개인정보 보호법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」에 따라
				이용자의 개인정보 보호 및 권익을 보호하고 개인정보와 관련한 이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은
				처리방침을 두고 있습니다. ‘회사’는 개인정보처리방침을 개정하는 경우 ‘회사’가 서비스하는 어플리케이션 및 웹사이트(이하
				‘서비스’라 합니다)의 공지사항, 또는 개별 공지를 통하여 해당 내용을 공유합니다.<br>
				<br> <strong>제1조 (개인정보의 처리목적)</strong><br> 1. 회사는 개인정보를
				다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적 이외의 용도로는 사용되지 않으며 이용 목적이 변경될 시에는
				사전동의를 구합니다.<br> 1) 서비스 회원 가입 및 관리 : 회원 가입의사 확인, 회원제 서비스 제공에 따른
				본인 식별·인증, 회원자격 유지·관리, 제한적 본인 확인 제도 시행에 따른 본인확인, 서비스 부정이용 방지, 비인가
				사용방지, 만14세 미만 아동 개인정보 수집 시 법정대리인 동의 여부 확인, 카카오 및 네이버 서비스를 이용한 회원가입,
				서비스 제공 및 계약의 이행, 약관변경 등의 고지를 위한 연락, 서비스 이용 및 상담, 문의 및 후기 등 원활한 의사소통
				경로 확보, 본인의사 확인 및 민원 등의 고충 처리, 분쟁 조정을 위한 기록 보존, ....<br>

				</p>
				<button type="button" class="btn_close" >닫기</button>
			</div>
		</div>

	</form>
	
	<script src="../../../resources/js/register.js"></script>
	<script>
		function showAlert() {
			alert("수거 신청에\n 성공하였습니다.");
		}
	</script>

</body>
</html>
