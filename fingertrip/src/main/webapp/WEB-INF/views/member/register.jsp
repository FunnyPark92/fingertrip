<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<style type="text/css">
 .message{ display: none;
 		   font-size: 12px;
 		   color: red;}
}

.divId{`
	width: 600px;
}
</style>

<script type="text/javascript" src="<c:url value='/js/member.js'/>"></script>
<script type="text/javascript">
$(document).ready(function(){
	var result="";
	
	$("#btnJoin").click(function(){
		var bool=true;
		
		$(".valid").each(function(idx, item){
			if ($(this).val() == "etc") {
				if($("#email3").val().length < 1) {
					$("#email3").focus();
					$("#email3").siblings("div").text($("#email3").prev().text() + "을 입력해 주세요.");
					bool=false;
					return false;
				}
			}else{
				if($(this).val().length < 1) {
					$(this).focus();
					$(this).siblings("div").text($(this).prev().text() + "을 입력해 주세요.");
					bool=false;
					return false;
			}
		}
			
		if(bool){
				if(!validate_username($('#name').val())){
					alert("이름은 한글 2~10글자만 입력가능합니다.")
					$('#name').focus();
					bool=false;
				 }else if(!validate_userid($('#id').val())){
					alert("아이디는 알파벳이나 숫자 또는 특수기호인_만 가능합니다.");
					$('#id').focus();
					bool=false;
				}else if($('#password').val()!=$('#password2').val()){
					alert("비밀번호가 일치하지 않습니다.")
					$('#password').focus();
					bool=false;
				}
		 	}
			return bool;
		}); //정규식 끝
		if($('#checkId').val()=='N'){
			bool=false;
			alert(result);
		}
		return bool;
	});  //Click 이벤트
	
	$('#id').keyup(function(){
		if(validate_userid($(this).val()) && $(this).val().length>=2){
			$.ajax({
				url:"<c:url value='/member/ajaxUserCheckId.do'/>",
				type:"get",
				data:{id:$(this).val()},
				success:function(res){
					if(res){
						$('.message').html("사용 가능합니다.");
						$('.message').show();
						$('#checkId').val('Y');
					}else{
						$('.message').html("해당 아이디가 이미 존재합니다.");
						$('.message').show();
						$('#checkId').val('N');
						result="해당 아이디가 이미 존재합니다.";
					}
				},
				error:function(xhr,status,error){
					alert("error : "+ error);
				}
			});
		}else if($(this).val().length<2){
			$('.message').html("아이디는 2자리 이상!");
			$('.message').show();
			$('#checkId').val('N');
			result ="아이디는 2자리 이상이여야 합니다.";
		}
		
	});
	
	
});
</script>

<article class="container">
  <div class="page-header">
    <h1>회원가입</h1>
  </div>
  <div class="col-md-6 col-md-offset-3">
    <form role="form" name="frmRegi" method="post" action="<c:url value='/member/insertMember.do'/>">
      <div class="form-group">
      	<span style="color: red">*</span>
        <label for="name">이름</label>
        <input type="text" class="form-control valid" name="name" id="name" placeholder="한글 2~10 글자로 입력해주세요" autocomplete="off">
        <div class="mandatory"></div>
      </div>
     
     <div class="form-group">
     	<span style="color: red">*</span>
       <label for="id">회원ID</label>
       <input type="text" class="form-control valid divId" name="id" id="id" placeholder="영문 혹은 숫자로만 입력해주세요" autocomplete="off">
       <span class="message"></span>
       <div class="mandatory"></div>
     </div>
     
     <div class="form-group">
     	<span style="color: red">*</span>
       <label for="password">비밀번호</label>
       <input type="password" class="form-control valid" name="password" id="password" placeholder="비밀번호" autocomplete="off">
       <div class="mandatory"></div>
     </div>
     
     <div class="form-group">
     	<span style="color: red">*</span>
       <label for="password2">비밀번호 확인</label>
       <input type="password" class="form-control valid" name="password2" id="password2" placeholder="비밀번호 확인" autocomplete="off">
       <div class="mandatory"></div>
     </div>
     
     <div class="form-group">
        <span style="color: red">*</span>
        <label for="gender">성별</label>
        <input type="hidden" class="valid"><br>
        <input type="radio" name="gender" value="M">남자&nbsp;&nbsp;
        <input type="radio" name="gender" value="F">여자
        <div class="mandatory"></div>
      </div>
     
     <div class="form-group" style="margin-bottom:0px">
       <label for="address">주소를 입력하세요.</label>
       <div class="input-group">
         <input type="text" class="form-control" name="address" id="address" placeholder="주소 입력" readonly="readonly" autocomplete="off">
         <span class="input-group-btn">
	       <input type="button" value="주소 검색" class="btn btn-primary" class="fa fa-mail-forward spaceLeft" id="btnZipcode" title="새창열림">
         </span>
       </div>
     </div>
     
     <div class="form-group">
       <div class="input-group" style="width:525px" style="height:30px">
         <label for="zipcode"></label>
         <input type="text" class="form-control" style="flex:0.3" name="zipcode" id="zipcode" placeholder="우편번호" readonly="readonly">
         <label for="addressDetail"></label>
         <input type="text" class="form-control" name="addressDetail" id="addressDetail" placeholder="상세주소">
       </div>
     </div>
     
     <div class="form-group emailWrap">
     	<span style="color: red">*</span>
       <label for="hp1">휴대폰 번호 입력</label>
       <div class="input-group" style="width:525px">
         <select name="hp1" id="hp1" title="휴대폰 앞자리" class="form-control">
           <option value="010">010</option>
           <option value="011">011</option>
           <option value="016">016</option>
           <option value="017">017</option>
           <option value="018">018</option>
           <option value="019">019</option>
  		 </select>
  		 &nbsp;-&nbsp;
  		 <label for="email3" hidden="">휴대폰 중간자리</label>
         <input type="text" class="form-control valid" name="hp2" id="hp2" maxlength="4">
         &nbsp;-&nbsp;
         <label for="email3" hidden="">휴대폰 뒷자리</label>
         <input type="text" class="form-control valid" name="hp3" id="hp3" maxlength="4" >
         <div class="mandatory"></div>
       </div>
     </div>
     
     <div class="form-group emailWrap">
     	<span style="color: red">*</span>
       <label for="email">이메일 입력</label>
       <div class="input-group" style="width:525px">
         <label for="email1" hidden="">이메일</label>
         <input type="text" class="form-control valid" name="email1" id="email1" title="이메일 앞자리">
         &nbsp;@&nbsp;
         <select name="email2" class="form-control valid" id="email2" title="이메일 뒷자리">
    	   <option value="naver.com">naver.com</option>
     	   <option value="hanmail.net">hanmail.net</option>
     	   <option value="gmail.com">gmail.com</option>
     	   <option value="nate.com">nate.com</option>
     	   <option value="etc">직접입력</option>
  		 </select> &nbsp;
  		 <label for="email3" hidden="">도메인</label>
  		 <input type="text" class="form-control" name="email3" id="email3" title="직접입력인 경우 이메일 뒷자리" style="visibility:hidden">
  		 <br>
  		 <div class="mandatory"></div>
       </div>
     </div>
     
     <div class="form-group">
       <label>스팸메일수신 동의</label>
       <div data-toggle="buttons">
         <label class="btn btn-primary active">
           <span class="fa fa-check"></span>
           <input type="checkbox" name="mailAgreement" id="mailAgreement" autocomplete="off" checked>
         </label>
         <span>메일수신에 동의합니다.</span>
       </div>
     </div>
     <div class="form-group text-center">
       <input type="submit" class="btn btn-info" id="btnJoin" value="회원가입"><i class="fa fa-check spaceLeft"></i>
     </div>
    </form>
  </div>
  <input type="hidden" id="checkId">
</article>
       
<%@ include file="../inc/bottom.jsp"%>
  