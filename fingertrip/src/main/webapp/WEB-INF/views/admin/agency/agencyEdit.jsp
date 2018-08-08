<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>
<style type="text/css">
 .message,.message2{ display: none;
 		   font-size: 12px;
 		   color: red;}
</style>
<script type="text/javascript" src="<c:url value='/js/member.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/travelAgency.js'/>"></script>
<script type="text/javascript">

$(document).ready(function(){
	var hp = "${vo.hp}";
	var hpSplit = hp.split('-');
	$('.hp').each(function(idx,item){
		$(this).val(hpSplit[idx]);
	});
	var lc = "${vo.licenseNo}";
	var lcSplit = lc.split('-');
	$('.lc').each(function(idx,item){
		$(this).val(lcSplit[idx]);			
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
					}else if("${vo.name}" == $('#name').val()){
						$('.message2').html("기존 아이디입니다.");
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
	
	$('#check').click(function(){
		var licNo = $('#licenseNo1').val()+ "-" + $('#licenseNo2').val() + "-" + $('#licenseNo3').val()
		$.ajax({
			url:"<c:url value='/admin/agency/checkLc.do'/>",
			type:"post",
			data:{licenseNo:licNo},
			success:function(res){
				if(res){
					if(!validate_userHp1($('#licenseNo1').val()) || !validate_license2($('#licenseNo2').val()) || !validate_license3($('#licenseNo3').val())){
						alert("형식에 맞춰 입력해주세요 ex) 123-12-12345");
						$('#checkId3').val("N");
					}else{
						$('#check').val("사용가능");
						$('#checkId3').val("Y");
					}
				}else{
					if("${vo.licenseNo}"==licNo){
						$('#check').val("사용가능");
						$('#checkId3').val("Y");
					}else{
						alert("이미 해당 사업자 번호가 존재합니다.")
						$('#check').val("중복검사");
						$('#checkId3').val("N");
					}
					
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


	 <form name="frm1" method="post" action="<c:url value='/admin/agency/agencyEdit.do'/>" class="agencyWrite">
		<fieldset>
			<legend>기업회원 정보 수정</legend>
			<input type="hidden" name="travelAgencyNo" value="${vo.travelAgencyNo}">
			<div class="div1st">
				<label for="name">상호명</label> <input type="text" name="name"
					id="name" class="valid" style="ime-mode: active" value="${vo.name }"><span class="message2"></span>
			</div>
			<div>
				<label for="userid">ID</label> <input type="text" name="id" value="${vo.id}" readonly="readonly">&nbsp;
				<span class="message"></span>
			</div>
			<div>
				<label for="password">비밀번호</label> <input type="password" class="pwd" name="password">
				<label for="password2">비밀번호 확인</label> <input type="password" class="pwd2" name="password2">
			</div>
			<div class="div3">
				<label for="hp1">전화번호</label>&nbsp;
				<input type="text" name="hp1" id="hp1" class="hp" maxlength="3"
					title="휴대폰 첫번째자리">
				 - <input type="text" name="hp2" id="hp2" class="hp"  maxlength="4"
					title="휴대폰 가운데자리">- <input type="text"
					name="hp3" id="hp3" class="hp" maxlength="4" title="휴대폰 뒷자리">
					<input type="hidden" id="hp" name="hp">
			</div>
			
			<div class="div3">
				<label for="licenseNo">사업자 등록번호</label> 
				<input type="text" name="licenseNo1" id="licenseNo1" maxlength="3" title="사업자등록번호 첫번째" class="width_80 valid lc" placeholder="000"> - 
				<input type="text" name="licenseNo2" id="licenseNo2" maxlength="2" title="사업자등록번호 두번째" class="width_80 valid lc" placeholder="00"> -
				<input type="text" name="licenseNo3" id="licenseNo3" maxlength="5" title="사업자등록번호 마지막" class="width_80 valid lc" placeholder="00000">
				<input type="button" id="check" value="중복검사">
				<input type="hidden" name="licenseNo" id="licenseNo">
			</div>
			
			<div class="divLast aWrap fRight">
				<a href="<c:url value='/admin/agency/agencyList.do'/>" class="darkBorder">목록</a>
				<input type="submit" id="wr_submit" class="wr_edit" value="수정">
			</div>
			<input type="hidden" id="checkId2" value="Y">
			<input type="hidden" id="checkId3" value="N">
		</fieldset>
	</form>
</section>


</body>
</html>