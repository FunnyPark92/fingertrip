<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<style>
  .spanGray{
  color: #6c757d; 
  font-size:1.3em;
  }
</style>
<script type="text/javascript" src="<c:url value='/js/member.js'/>"></script>
<script>
 $(document).ready(function(){
	 
	$('#btnEdit').click(function(){
		var bool = true;
		
		if($('#password').val()!=$('#password2').val()){
			alert("비밀번호가 일치하지 않습니다.");
			bool = false;
		}else if(!validate_userPwd($('#password').val())){
		alert("비밀번호는 영문자로 시작하는 8~14자 영문,숫자 조합으로 입력해주세요");
		bool = false;
		}else if(!validate_userHp($('#hp2').val()),!validate_userHp($('#hp3').val())){
			alert("휴대폰 번호를 숫자로 입력해주세요");
			bool=false;
		}
		return bool;
	});
	
	$('#btnCancel').click(function(){
		history.back();
	});
 });
 


</script>


	
    <br>
    <article class="container">
	 	<div class="page-header">
          <h2>회원정보수정</h2>
        </div><br>
    <div class="col-md-6 col-md-offset-3">
     <form role="form" name="frmRegi" method="post" action="<c:url value='/member/memberEditOk.do'/>">
	 	<div class="form-group">
            <label for="username">이름</label><br>
            <span class="spanGray">username</span>
        </div>
	 	
	 	<div class="form-group">
         	<label for="userid">회원아이디</label><br>
            <span class="spanGray" >userid</span>
        </div>
	 
		<div class="form-group">
         	<label for="useremail">회원이메일</label><br>
            <span class="spanGray">useremail</span>
        </div>
        
        <div class="form-group">
       		<label for="password">비밀번호</label>
       		<input type="password" class="form-control valid" name="password" id="password" placeholder="영문과 숫자 조합으로 입력" autocomplete="off">
     	</div>
     	<div class="form-group">
       		<label for="password2">비밀번호 확인</label>
       		<input type="password" class="form-control valid" name="password2" id="password2" placeholder="영문과 숫자 조합으로 입력" autocomplete="off">
        </div>
        
        <div class="form-group" style="margin-bottom:0px">
       		<label for="address">주소를 입력하세요.</label>
       	</div>
       	<div class="input-group">
        	<input type="text" class="form-control" name="address" id="address">
         	<span class="input-group-btn">
	        <input type="Button" value="우편번호 찾기" class="btn btn-primary" class="fa fa-mail-forward spaceLeft" id="btnZipcode" title="새창열림">
            </span>
        </div>
        <div class="form-group">
       		<div class="input-group" style="width:525px" style="height:30px">
         		<label for="zipcode"></label>
         		<input type="text" class="form-control" style="flex:0.3" name="zipcode" id="zipcode">
         		<label for="addressDetail"></label>
         		<input type="text" class="form-control" name="addressDetail" id="addressDetail">
       		</div>
    	</div>
    	    <div class="form-group">
       			<label for="hp1">휴대폰 번호 입력</label>
       			<div class="input-group" style="width:525px">
         			<select name="hp1" id="hp1" title="휴대폰 앞자리" class="form-control" >
           				<option value="010">010</option>
           				<option value="011">011</option>
           				<option value="016">016</option>
           				<option value="017">017</option>
           				<option value="018">018</option>
          				<option value="019">019</option>
  					</select>
  		 			&nbsp;-&nbsp;
         			<input type="text" class="form-control valid" name="hp2" id="hp2" maxlength="4">
         			&nbsp;-&nbsp;
         			<input type="text" class="form-control valid" name="hp3" id="hp3" maxlength="4">
     		    </div>
        </div>
        <div class="form-group text-center">
       		<button type="submit" class="btn btn-info" id="btnEdit" >회원정보수정<i class="fa fa-check spaceLeft"></i></button>
       		<button type="button" class="btn btn-warning" id="btnCancel">취소하기<i class="fa fa-times spaceLeft"></i></button>
     	</div>
     </form>
	 </div>
	 </article>
<%@ include file="../inc/bottom.jsp"%>
  
