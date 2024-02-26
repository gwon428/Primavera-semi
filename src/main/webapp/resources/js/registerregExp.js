function idCheck(){
	const regExp = /^[A-Za-z][A-Za-z0-9]{3,11}$/;
	return regExp.test(userId.value);
}

function pwdCheck(){
	const regExp = /^[!-~]{8,15}$/;
	return regExp.test(userPwd.value);
}

function pwdCheck2(){
	return userPwd.value === passwordcheck.value;
}

function nameCheck(){
	const regExp = /^[가-힣]{2,}$/;
	return regExp.test(userName.value);
}

function phoneCheck(){
	const regExp = /^01([0|1|6|7|8|9]-?([0-9]{3,4})-?[0-9]{4})$/;
	return regExp.test(userPhone.value);
}

function emailCheck(){
	const regExp = /^\w+@\w+\.\w+$/;
	return regExp.test(email.value);
}

function inputHandler(e, check, message){
	if(check){
		e.target.nextElementSibling.style.color="green";
		e.target.nextElementSibling.innerHTML = "OK!";
	} else {
		e.target.nextElementSibling.style.color="red";
		e.target.nextElementSibling.innerHTML = message;
	}
}

userId.addEventListener("input", function(e){
	inputHandler(e, idCheck(), "첫 글자는 반드시 영문자로, 영문자, 숫자 포함하여 총 4~12자로 입력하세요.");
});

userPwd.addEventListener("input", function(e){
	inputHandler(e, pwdCheck(), "영문자, 숫자, 특수문자 포함하여 총 8~15자로 입력하세요.");
});

passwordcheck.addEventListener("input", function(e){
	inputHandler(e, pwdCheck2(), "위의 비밀번호와 일치하게 입력하세요.");
});

userName.addEventListener("input", function(e){
	inputHandler(e, nameCheck(), "한글로만 이루어져야되며, 2글자 이상으로 입력하세요.");
});

userPhone.addEventListener("input", function(e){
	inputHandler(e, phoneCheck(), "-를 생략한 숫자만 입력하세요.");
});

email.addEventListener("input", function(e){
	inputHandler(e, emailCheck(), "이메일 형식에 맞춰서 입력하세요.");
});

function validate(){
	if(!idCheck()){
		userId.focus();
		return false;
	} else if(!pwdCheck()){
		userPwd.focus();
		return false;
	} else if(!pwdCheck2()){
		passwordcheck.focus();
		return false;
	} else if (!nameCheck()){
		userName.focus();
		return false;
	} else if (!phoneCheck()){
		userPhone.focus();
		return false;
	} else if(!emailCheck()){
		email.focus();
		return false;
	}
	return true;
}