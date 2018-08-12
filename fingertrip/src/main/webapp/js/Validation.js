
	function validate_userPwd(uPwd){
		var pattern = new RegExp(/^[a-zA-Z]+[a-zA-Z0-9]{7,13}$/g);
		return pattern.test(uPwd);
	}
	function validate_username(uname){
		var pattern = new RegExp(/^[가-힣]{2,10}$/g);
		return pattern.test(uname);
	}
	function validate_userid(uid){
		var pattern = new RegExp(/^[a-zA-Z0-9_]+$/g);
		return pattern.test(uid);
	}
	/*function validate_userPwd(uPwd){
		var pattern = new RegExp(/^[a-zA-Z]+[a-zA-Z0-9]{7,13}$/g);
		return pattern.test(uPwd);
	}*/
	function validate_userPwd(uPwd){
		var pattern = new RegExp(/^(?=.*[0-9]+)[a-zA-Z][a-zA-Z0-9]{7,13}$/g);
		return pattern.test(uPwd);
	}
	function validate_userHp1(hp){
		var pattern = new RegExp(/^[0-9]{3}$/g);
		return pattern.test(hp);
	}
	function validate_userHp2(hp){
		var pattern = new RegExp(/^[0-9]{3,4}$/g);
		return pattern.test(hp);
	}
	function validate_userHp3(hp){
		var pattern = new RegExp(/^[0-9]{4}$/g);
		return pattern.test(hp);
	}

	function validate_license2(lc2){
		var pattern = new RegExp(/^[0-9]{2}$/g);
		return pattern.test(lc2);
	}
	function validate_license3(lc3){
		var pattern = new RegExp(/^[0-9]{5}$/g);
		return pattern.test(lc3);
	}
