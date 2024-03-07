// 아이디 중복 확인
let idDupCheck = false; // true가 되면 ID 사용 불가!
let idCheck = false;
let pwdCheck = false;
let pwdCheck2 = false;
let nameCheck = false;
let phoneCheck = false;
let emailCheck = false;
			
$('#userId').keyup(() => {
	const id = $('#userId').val();
	$.ajax({
		type: "post",
		url: "/check",
		data: "id=" + id,

		success: function (result) {
			if (result) {
				$('#idCheckresult').text("ID 사용 불가").css("color", "red");
				idDupCheck = true;
			} else {
				$('#idCheckresult').text("ID 사용 가능").css("color", "green");
				idDupCheck = false;
			}
		}
	})
})

// 아이디 정규표현식
$('#userId').keyup((e) =>{
	 let id=$(e.target).val(); 

	const regExp = /^[A-Za-z][A-Za-z0-9]{3,11}$/;
	
	if(regExp.test(id) || id === ""){
		$('#idreg').text("");
	} else {
		$('#idreg').text("첫 글자는 반드시 영문자로, 영문자, 숫자 포함하여 총 4~12자로 입력하세요.").css("color", "red");
		idCheck = true;
	}
});


// 비밀번호 정규표현식
$('#userPwd').keyup((e) =>{
	 let pwd =$(e.target).val(); 

	const regExp = /^[!-~]{8,15}$/;
	
	if(regExp.test(pwd) || pwd === ""){
		$('#pwdreg').text("");
	} else {
		$('#pwdreg').text("영문자, 숫자, 특수문자 포함하여 총 8~15자로 입력하세요.").css("color", "red");
		pwdCheck = true;
	}
});


// 비밀번호 확인
$('#passwordcheck').keyup((e) =>{
	let pwd = $('#userPwd').val();
	let pwdCheck = $(e.target).val();
	
	console.log($('#pwdcheckreg'));

	if((pwd === pwdCheck) || pwdCheck === "") {
		$('#pwdcheckreg').text("");
	} else {
		$('#pwdcheckreg').text("위의 비밀번호와 일치하게 입력하세요.").css("color", "red");
		pwdCheck2 = true;
	}
});

// 이름 정규표현식
$('#userName').keyup((e) => {
	let name = $('#userName').val();
	
	const regExp = /^[가-힣]{2,}$/;
	
	if(regExp.test(name) || name === ""){
		$('#namereg').text("");
	} else {
		$('#namereg').text("한글로만 이루어져야되며, 2글자 이상으로 입력하세요.").css("color", "red");
		nameCheck = true;
	}
});

// 전화번호 정규표현식
$('#userPhone').keyup((e) => {
	let phone = $('#userPhone').val();
	
	const regExp = /^01(0|1|[6-9])[0-9]{3,4}[0-9]{4}$/;
	
	if(regExp.test(phone) || phone === ""){
		$('#phonereg').text("");
	} else {
		$('#phonereg').text("휴대폰 번호를 입력하세요.").css("color", "red");
		phoneCheck = true;
	}
});

// 이메일 정규표현식
$('#email').keyup((e) => {
	let email = $('#email').val();
	
	const regExp = /^\w+@\w+\.\w+$/;
	
	if(regExp.test(email) || email === ""){
		$('#emailreg').text("");
	} else {
		$('#emailreg').text("이메일 형식에 맞춰서 입력하세요.").css("color", "red");
		emailCheck = true;
	}
});

function validate(){
	if(idCheck){
		userId.focus();
		return false;
	} else if (idDupCheck){
		userId.focus();
		return false;
	}else if(pwdCheck){
		userPwd.focus();
		return false;
	} else if(pwdCheck2){
		passwordcheck.focus();
		return false;
	} else if (nameCheck){
		userName.focus();
		return false;
	} else if (phoneCheck){
		userPhone.focus();
		return false;
	} else if(emailCheck){
		email.focus();
		return false;
	}
	return true;
}
