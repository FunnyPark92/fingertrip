	$(document).ready(function(){
		
		$(wr_submit).click(function(){
			var bool = true;
			$('.valid').each(function(idx,item){
				if($(this).val().length<1 || $(this).val() =='' ){
					alert($(this).siblings("label").text()+" 를(을) 입력해주세요");
					$(this).focus();
					bool = false;
			}
				return false;
			});//valid 유효성 검사
			
			if(bool){
				if($('#password').val()!=$('#password2').val()){
					alert("비밀번호가 일치하지 않습니다.");
					bool = false;
				}else if(!validate_userPwd($('#password').val())){
					alert("비밀번호는 영문자로 시작하는 8~14자 영문,숫자 조합으로 입력해 주세요");
					bool = false;
				}else if(!validate_userHp1($('#hp1').val())){
					alert("휴대폰 첫 번째 자리는 숫자 3자리로 입력해주세요");
					bool = false;
				}else if(!validate_userHp2($('#hp2').val())){
					alert("휴대폰 중간 번호를 숫자 3~4로 입력해주세요");
					bool=false;
				}else if(!validate_userHp3($('#hp3').val())){
					alert("휴대폰 마지막 번호를 숫자 4개로 입력해주세요");
					bool=false;
				}
			}
			if(bool){
				if(!validate_userHp1($('#licenseNo1').val()) || !validate_license2($('#licenseNo2').val()) || !validate_license3($('#licenseNo3').val())){
					alert("사업자 등록번호는  000-00-00000 형식을 숫자로 입력해주세요");
					bool = false;
				}else{
					var	licenseNo = $('#licenseNo1').val()+ "-" + $('#licenseNo2').val() + "-" + $('#licenseNo3').val();
					$('#licenseNo').val(licenseNo);
					
					var hp = $('#hp1').val()+"-"+$('#hp2').val()+"-"+$('#hp3').val();
					$('#hp').val(hp);
				}
			}
			if(bool){
				if($('#checkId').val()=="N"){
					alert("아이디 중복검사를 완료해주세요");
					bool=false;
				}else if($('#checkId2').val()=="N"){
					bool=false;
				}else if($('#checkId3').val()=="N"){
					alert("사업자 번호 중복검사를 완료해주세요")
					bool=false;
				}
			}
			return bool;
		});// click 이벤트
		
		
		
	});
