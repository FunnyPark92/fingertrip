<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>

<script type="text/javascript" src="<c:url value='/js/member.js'/>"></script>
<script type="text/javascript">

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
				if(!validate_userid($('#id').val())){
					alert("아이디는 알파벳이나 숫자 또는 특수기호인_만 가능합니다.");
					bool = false;
				}else if($('#password').val()!=$('#password2').val()){
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
					alert("사업자 등록번호는 000-00-00000 형식을 숫자로 입력해주세요");
					
					bool = false;
				}else{
					var	licenseNo = $('#licenseNo1').val()+ "-" + $('#licenseNo2').val() + "-" + $('#licenseNo3').val();
					$('#licenseNo').val(licenseNo);
					
				}
			}
			alert(bool);
			return bool;
		});// click 이벤트
		
		
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
					id="name" class="valid" style="ime-mode: active">
			</div>
			<div>
				<label for="userid">ID</label> <input type="text" name="id" id="id" class="valid">&nbsp;
				<span class="message"></span>
			</div>
			<div>
				<label for="password">비밀번호</label> <input type="password" class="valid" name="password" id="password" >
				<label for="password2">비밀번호 확인</label> <input type="password" name="password2" id="password2">
			</div>
			<div class="div3">
				<label for="hp1">전화번호</label>&nbsp;
				<input type="text" name="hp1" id="hp1" maxlength="3"
					title="휴대폰 첫번째자리">
				 - <input type="text" name="hp2" id="hp2" maxlength="4"
					title="휴대폰 가운데자리">- <input type="text"
					name="hp3" id="hp3" maxlength="4" title="휴대폰 뒷자리">
			</div>
			
			<div class="div3">
				<label for="licenseNo">사업자 등록번호</label> 
				<input type="text" name="licenseNo1" id="licenseNo1" maxlength="3" title="사업자등록번호 첫번째" class="width_80 valid" placeholder="000"> - 
				<input type="text" name="licenseNo2" id="licenseNo2" maxlength="2" title="사업자등록번호 두번째" class="width_80 valid" placeholder="00"> -
				<input type="text" name="licenseNo3" id="licenseNo3" maxlength="5" title="사업자등록번호 마지막" class="width_80 valid" placeholder="00000">
				<input type="hidden" name="licenseNo" id="licenseNo">
			</div>
			<div class="divLast">
				<input type="submit" id="wr_submit" value="회원가입">
			</div>
		</fieldset>
	</form>
</section>


</body>
</html>