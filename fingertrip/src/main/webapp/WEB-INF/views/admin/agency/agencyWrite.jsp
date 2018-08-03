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
		
		$('#check').click(function(){
			/* window.open("<c:url value='/admin/agency/licenseCheck.do'/>","licenseCheck",'width=400, height=400, left=0, top=0, location=yes, resizable=yes'); */
			$.ajax({
				url:"<c:url value='/admin/agency/checkLc.do'/>",
				type:"post",
				data:{licenseNo:$('#licenseNo1').val()+ "-" + $('#licenseNo2').val() + "-" + $('#licenseNo3').val()},
				success:function(res){
					if(res){
						$('#check').val("사용가능");
						$('#checkId3').val("Y");
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
					<input type="hidden" id="hp" name="hp">
			</div>
			
			<div class="div3">
				<label for="licenseNo">사업자 등록번호</label> 
				<input type="text" name="licenseNo1" id="licenseNo1" maxlength="3" title="사업자등록번호 첫번째" class="width_80 valid" placeholder="000"> - 
				<input type="text" name="licenseNo2" id="licenseNo2" maxlength="2" title="사업자등록번호 두번째" class="width_80 valid" placeholder="00"> -
				<input type="text" name="licenseNo3" id="licenseNo3" maxlength="5" title="사업자등록번호 마지막" class="width_80 valid" placeholder="00000">
				<input type="button" id="check" value="중복검사">
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