<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>
<style type="text/css">
 .message,.message2{ display: none;
 		   font-size: 12px;
 		   color: red;}
</style>
<script type="text/javascript" src="<c:url value='/js/Validation.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
	
		$('#wr_submit').click(function(){
			var bool = true;
			
			var	licenseNo = $('#licenseNo1').val()+ "-" + $('#licenseNo2').val() + "-" + $('#licenseNo3').val();
			$('#licenseNo').val(licenseNo);
			var hp = $('#hp1').val()+"-"+$('#hp2').val()+"-"+$('#hp3').val();
			$('#hp').val(hp);
			
			/* $(this).siblings("label").text()+" 를(을) 입력해주세요" */
			$('.valid').each(function(idx,item){
				if($(this).val().length<1){
					alert($(this).parent().find(':first').text()+" 를(을) 입력해주세요");
					$(this).focus();
					bool = false;
					return false;//each 빠지기
					}
			});//valid 유효성 검사
			
		 	if(bool){
				if(!validate_userPwd($('#password').val())){
					alert("비밀번호는 영문자로 시작하는 8~14자 영문,숫자 조합으로 입력해 주세요");
					bool = false;
				}else if($('#password').val()!=$('#password2').val()){
					alert("비밀번호가 일치하지 않습니다.");
					bool = false;
				}else if(!validate_userHp1($('#hp1').val())){
					alert("휴대폰 첫 번째 자리는 숫자 3자리로 입력해주세요");
					bool = false;
				}else if(!validate_userHp2($('#hp2').val())){
					alert("휴대폰 중간 번호를 숫자 3~4로 입력해주세요");
					bool = false;
				}else if(!validate_userHp3($('#hp3').val())){
					alert("휴대폰 마지막 번호를 숫자 4개로 입력해주세요");
					bool = false;
				}else if(!validate_userHp1($('#licenseNo1').val()) || !validate_license2($('#licenseNo2').val()) || !validate_license3($('#licenseNo3').val())){
					alert("사업자 등록번호는  000-00-00000 형식을 숫자로 입력해주세요");
					bool = false;
				}
			}
		 	
			if(bool){
				if($('#checkId2').val()=="N"){
					alert("상호명 중복검사를 완료해주세요")
					bool=false;
				}else if($('#checkId').val()=="N"){
					alert("아이디 중복검사를 완료해주세요");
					bool=false;
				}else if($('#checkId3').val()=="N"){
					alert("사업자 번호 중복검사를 완료해주세요")
					$('#check').val("중복검사");
					bool=false;
				}
			}
			
			if(bool){
				if(confirm("이대로 진행하시겠습니까?")){
					bool=true;
				}else{
					bool=false;
				}
			}
			alert(bool);
			return bool;
		});	//click 

		$('#id').keyup(function(){
			if($(this).val().length < 2){
				$('.message').html("아이디는 2자리 이상이어야 합니다.");
				$('.message').show();
				$('#checkId').val("N");
			}else{
				$.ajax({
					url:"<c:url value='/admin/adminIdCheck.do'/>",
					type:"post",
					data:{id:$(this).val()},
					success:function(res){
						if(res){
							$('.message').html("사용 가능합니다.");
							$('.message').show();
							$('#checkId').val("Y");
						}else{
							$('.message').html("이미 해당 아이디가 사용중입니다.");
							$('.message').show();
							$('#checkId').val("N");
						}
					},
					error:function(xhr,status,error){
						alert("error : " + error +status +xhr);
					}
				});
			}
		});
		
		$('#name').keyup(function(){
			if($(this).val().length < 2){
				$('.message2').html("상호명은 2자리 이상이어야 합니다.");
				$('.message2').show();
				$('#checkId2').val("N");
			}else{
				$.ajax({
					url:"<c:url value='/admin/adminNameCheck.do'/>",
					type:"post",
					data:{name:$(this).val()},
					success:function(res){
						if(res){
							$('.message2').html("사용 가능합니다.");
							$('.message2').show();
							$('#checkId2').val("Y");
						}else{
							$('.message2').html("이미 해당 상호명이 이미 존재합니다.");
							$('.message2').show();
							$('#checkId2').val("N");
						}
					},
					error:function(xhr,status,error){
						alert("error : " + error +status +xhr);
					}
				});
			}
		});

		$('#licenseMessage').click(function(){
			$('.lc').prop("readonly",null);
			$('.lc').css("background-color","white");
			$('#licenseMessage').prop("type","hidden");
			$('#check').val("중복검사");
			$('#checkId3').val("N");
		});
		
		$('#check').click(function(){
			$.ajax({
				url:"<c:url value='/admin/agency/checkLc.do'/>",
				type:"post",
				data:{licenseNo:$('#licenseNo1').val()+ "-" + $('#licenseNo2').val() + "-" + $('#licenseNo3').val()},
				success:function(res){
					if(res){
						if(!validate_userHp1($('#licenseNo1').val()) || !validate_license2($('#licenseNo2').val()) || !validate_license3($('#licenseNo3').val())){
							alert("형식에 맞춰 입력해주세요 ex) 123-12-12345");
							$('#checkId3').val("N");
						}else{
						 	$('#check').val("사용가능");
						 	$('#licenseMessage').prop("type","button");
						 	$('.lc').prop("readonly","readonly");
						 	$('.lc').css("background-color","gray");
							$('#checkId3').val("Y");
						}
					}else{
						alert("이미 해당 사업자 번호가 존재합니다.")
						$('#check').val("중복검사");
						$('#checkId3').val("N");
					}
				},
				error:function(xhr,status,error){
					alert("error : " + error +status +xhr);
				}
			});
		}); 
	});

</script>



<section class="admCenter marginTop40">
        <ul class="clearFix marginBottom40 lineGnb">
            <li><a href="<c:url value='/admin/agency/agencyList.do'/>">기업회원조회</a></li>
            <li class="on"><a href="<c:url value='/admin/agency/agencyWrite.do'/>">기업회원가입</a></li>
        </ul>


	 <form name="frm1" method="post" action="<c:url value='/admin/agency/agencyRegister.do'/>" class="agencyWrite">
		<fieldset>
			<legend>기업회원 가입</legend>
			<div class="div1st">
				<label for="name">상호명</label> <input type="text" name="name"
					id="name" class="valid" style="ime-mode: active"><span class="message2"></span>
			</div>
			<div>
				<label for="userid">ID</label> <input type="text" name="id" id="id" class="valid">&nbsp;
				<span class="message"></span>
			</div>
			<div>
				<label for="password">비밀번호</label> <input type="password" name="password" id="password" >
				<label for="password2">비밀번호 확인</label> <input type="password" name="password2" id="password2">
			</div>
			<div class="div3">
				<label for="hp1">전화번호</label>&nbsp;
				<input type="text" name="hp1" id="hp1" maxlength="3"
					title="휴대폰 첫번째자리">
				 - <input type="text" name="hp2" id="hp2" maxlength="4"
					title="휴대폰 가운데자리">- <input type="text"
					name="hp3" id="hp3" maxlength="4" title="휴대폰 뒷자리">
					<input type="hidden" id="hp" name="hp">
			</div>
			
			<div class="div3">
				<label for="licenseNo">사업자 등록번호</label> 
				<input type="text" name="licenseNo1" id="licenseNo1" class="lc" maxlength="3" title="사업자등록번호 첫번째" class="width_80" placeholder="000"> - 
				<input type="text" name="licenseNo2" id="licenseNo2" class="lc" maxlength="2" title="사업자등록번호 두번째" class="width_80" placeholder="00"> -
				<input type="text" name="licenseNo3" id="licenseNo3" class="lc" maxlength="5" title="사업자등록번호 마지막" class="width_80" placeholder="00000">
				<input type="button" id="check" value="중복검사">
				<input type="hidden" id="licenseMessage" value="중복검사">
				<input type="hidden" name="licenseNo" id="licenseNo">
			</div>
			<div class="divLast">
				<input type="submit" id="wr_submit" value="회원가입">
			</div>
			 <input type="hidden" id="checkId" value="N">
			 <input type="hidden" id="checkId2" value="N">
			 <input type="hidden" id="checkId3" value="N">
		</fieldset>
		
	</form>
</section>


</body>
</html>