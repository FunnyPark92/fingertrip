

$(document).ready(function(){
	
	
	$("#btnZipcode").click(function(){
		//우편번호 찾기
		window.open('/finger/zipcode/zipcode.do', 'zipcode', 
				'width=500, height=550, left=0, top=0, location=yes, resizable=yes');
	});

});

function validate_username(uname){
	var pattern = new RegExp(/^[가-힣]{2,10}$/g);
	return pattern.test(uname);
}

function validate_userid(uid){
	var pattern = new RegExp(/^[a-zA-Z0-9_]+$/g);
	return pattern.test(uid);
}
function validate_userPwd(uPwd){
	var pattern = new RegExp(/^[a-zA-Z]+[a-zA-Z0-9]{7,13}$/g);
	return pattern.test(uPwd);
}
function validate_userHp(hp){
	var pattern = new RegExp(/^[0-9]{3,4}$/g);
	return pattern.test(hp);
}
function validate_userHp2(hp){
	var pattern = new RegExp(/^[0-9]{4}$/g);
	return pattern.test(hp);
}




















