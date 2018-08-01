
$(document).ready(function(){
	
	
	$("#btnZipcode").click(function(){
		//우편번호 찾기
		window.open('/finger/zipcode/zipcode.do', 'zipcode', 
				'width=500, height=550, left=0, top=0, location=yes, resizable=yes');
	});
	
	$("#email2").change(function(){
		if ($(this).val() == "etc") {
			$("#email3").css("visibility", "visible");
			$("#email3").val("");
			$("#email3").focus();
		} else {
			$("#email3").css("visibility", "hidden");
		}
	});
	
	$("#email3").blur(function(){
		if ($(this).val().length < 1) {
			$(this).siblings("div").text($("#email3").prev().text() + "을 입력해 주세요.");
			
			return false;
		} else {
			$(this).siblings("div").text("");
		}
	});
	
	$("input[name=gender]").click(function(){
		$(this).siblings("input[type=hidden]").val($(this).val());
	});
	
	$("input[name=gender]").blur(function(){
		$(this).siblings("div").text("");
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




















