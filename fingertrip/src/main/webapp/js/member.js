

$(document).ready(function(){
	$(".valid").each(function(idx, item){
		$(this).blur(function(){
			if ($(this).val().length < 1) {
				$(this).siblings("div").text($(this).prev().text() + "을 입력해 주세요.");
				
				return false;
			} else {
				$(this).siblings("div").text("");
			}
		});
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
	
	
	$("#email2").change(function(){
		if ($(this).val() == "etc") {
			$("#email3").css("visibility", "visible");
			$("#email3").val("");
			$("#email3").focus();
		} else {
			$("#email3").css("visibility", "hidden");
		}
	});
	
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
