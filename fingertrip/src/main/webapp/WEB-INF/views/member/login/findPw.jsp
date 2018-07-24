<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/find.css"/>
<script src='https://www.google.com/recaptcha/api.js'></script>

<script type="text/javascript">
	$(document).ready(function(){
		$('form[name=frmPw]').submit(function(){
			var bool=true;
			
			$('.valid').each(function(){
				if(!$(this).val()){
					var placeholder=$(this).prop("placeholder");
					alert(placeholder);
					bool=false;
					return false;
				}
			});
			
			if(bool){
				var v=grecaptcha.getResponse();
				if(v.length==0){
					alert("'로봇이 아닙니다'를 체크해주세요");
					bool=false;
					return false;
				}/* else if(v.length!=0){
					alert('성공!');					
				} */
			}
			return bool;
		});
	});

</script>

<div class="minHeight580">
	<div class="container findId">
		<h1 class="text-center">Forgot your Password?</h1>
		<br>
		<form name="frmPw" action="<c:url value='/member/login/foundPw.do'/>" method="post">
			<div class="row">
				<div class="col-md-4 text-right dvFindId">
					<label for="id" >
						<span class="spanSize spanId"><img src="${pageContext.request.contextPath }/img/checked.png">&nbsp;&nbsp;&nbsp;ID</span>
					</label>
				</div>
				<div class="col-md-4">
					<input type="text" id="id" name="id" class="form-control dvFindId valid" placeholder="아이디를 입력하세요">
				</div>
				<div class="col-md-4"></div>	
			</div>
			
			<div class="row">
				<div class="col-md-4 text-right dvFindId">
					<label for="email">
						<span class="spanSize"><img src="${pageContext.request.contextPath }/img/checked.png">&nbsp;&nbsp;&nbsp;Email</span>
					</label>
				</div>
				<div class="col-md-4">
					<input type="email" id="email" name="email"  class="form-control dvFindId valid" placeholder="이메일을 입력하세요">
				</div>
				<div class="col-md-4"></div>
			</div>
			<div class="row">
				<div class="col-md-4"></div>	
				<div class="g-recaptcha col-md-4 margin15" data-sitekey="6LcYfmUUAAAAAG4U9XR-aJzwx3udK6wCZJuceJbW"></div>
				<div class="col-md-4"></div>	
			</div>
			<div class="row">
				<div class="col-md-12 text-center">
					<input type="submit" class="btn btn-primary btn-lg sbmit" value="SUBMIT">
				</div>
			</div>
		</form>
	</div>
</div>
<%@ include file="../../inc/bottom.jsp"%>