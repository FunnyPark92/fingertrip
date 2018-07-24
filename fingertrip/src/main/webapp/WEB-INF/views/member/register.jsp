<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<script type="text/javascript">
$(document).ready(function(){
	$("#name").focus();
	
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
</script>

<article class="container">
  <div class="page-header">
    <h1>회원가입</h1>
  </div>
  <div class="col-md-6 col-md-offset-3">
    <form role="form" method="post" action="<c:url value='/member/insertMember.do'/>">
      <div class="form-group">
        <label for="name">이름</label>
        <input type="text" class="form-control" name="name" id="name" placeholder="이름을 입력해 주세요">
     </div>
     <div class="form-group">
       <label for="id">회원ID</label>
       <input type="text" class="form-control" name="id" id="id" placeholder="회원ID">
     </div>
     <div class="form-group">
       <label for="password">비밀번호</label>
       <input type="password" class="form-control" name="password" id="password" placeholder="비밀번호">
     </div>
     <div class="form-group">
       <label for="password2">비밀번호 확인</label>
       <input type="password" class="form-control" name="password2" id="password2" placeholder="비밀번호 확인">
     </div>
     <div class="form-group">
       <label for="gender">성별</label><br>
       <input type="radio" name="gender" value="M">남자&nbsp;&nbsp;
       <input type="radio" name="gender" value="F">여자
     </div>
     <div class="form-group" style="margin-bottom:0px">
       <label for="address">주소를 입력하세요.</label>
       <div class="input-group">
         <input type="text" class="form-control" name="address" id="address" placeholder="주소 입력">
         <span class="input-group-btn">
	       <input type="button" value="우편번호 찾기" class="btn btn-primary" class="fa fa-mail-forward spaceLeft" id="btnZipcode" title="새창열림">
         </span>
       </div>
     </div>
     <div class="form-group">
       <div class="input-group" style="width:525px" style="height:30px">
         <label for="zipcode"></label>
         <input type="text" class="form-control" style="flex:0.3" name="zipcode" id="zipcode" placeholder="우편번호">
         <label for="addressDetail"></label>
         <input type="text" class="form-control" name="addressDetail" id="addressDetail" placeholder="상세주소">
       </div>
     </div>
     <div class="form-group">
       <label for="email">이메일 입력</label>
       <div class="input-group" style="width:525px">
         <label for="email1"></label>
         <input type="text" class="form-control" name="email1" id="email1" title="이메일 앞자리">
         &nbsp;@&nbsp;
         <select name="email2" class="form-control" id="email2" title="이메일 뒷자리">
    	   <option value="naver.com">naver.com</option>
     	   <option value="hanmail.net">hanmail.net</option>
     	   <option value="gmail.com">gmail.com</option>
     	   <option value="nate.com">nate.com</option>
     	   <option value="etc">직접입력</option>
  		 </select>
  		 <input type="text" class="form-control" name="email3" id="email3" title="직접입력인 경우 이메일 뒷자리" style="visibility:hidden">
       </div>
     </div>
     <div class="form-group">
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
         <input type="text" class="form-control" name="hp2" id="hp2">
         &nbsp;-&nbsp;
         <input type="text" class="form-control" name="hp3" id="hp3">
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
       <button type="submit" class="btn btn-info">회원가입<i class="fa fa-check spaceLeft"></i></button>
       <button type="submit" class="btn btn-warning">가입취소<i class="fa fa-times spaceLeft"></i></button>
     </div>
    </form>
  </div>
</article>
       
<%@ include file="../inc/bottom.jsp"%>
  