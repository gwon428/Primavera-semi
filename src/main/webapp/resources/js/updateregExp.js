function pwdCheck(){
	const regExp = /^[!-~]{8,15}$/;
	return regExp.test(userPwd.value);
}

function pwdCheck2(){
	return userPwd.value === pwdCheck.value;
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

function validate(){
	if(!pwdCheck()){
		userPwd.focus();
		return false;
	} else if (!pwdCheck2()){
		pwdCheck.focus();
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