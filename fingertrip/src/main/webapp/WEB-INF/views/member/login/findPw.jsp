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

<div class="dvFindBack">
	<div class="container">
		<div class="row">
			<div class="findIpDv findColor">
				<h1 class="text-center marginBottom30 marginT30">Forgot your Password?</h1>
				<form name="frmPw" action="<c:url value='/member/login/foundPw.do'/>" method="post">
					<div  class="row">
						<div class="col-md-4 text-right dvFindId">
							<label for="id" >
								<span class="spanSize spanId"><img src="${pageContext.request.contextPath }/img/checked.png">&nbsp;&nbsp;&nbsp;ID</span>
							</label>
						</div>
						<div class="col-md-6 dvFindId">
							<input type="text" id="id" name="id" class="form-control valid" placeholder="아이디를 입력하세요">
						</div>
						<div class="col-md-2"></div>
					</div>
					<div  class="row">
						<div class="col-md-4 text-right dvFindId">
							<label for="email">
								<span class="spanSize"><img src="${pageContext.request.contextPath }/img/checked.png">&nbsp;&nbsp;&nbsp;Email</span>
							</label>
						</div>
						<div class="col-md-6 dvFindId">
							<input type="email" id="email" name="email" class="form-control valid" placeholder="이메일을 입력하세요">
						</div>
						<div class="col-md-2"></div>
					</div>
					<div class="row marginT30">
						<div class="col-md-2"></div>	
 						<div class="g-recaptcha col-md-8" data-sitekey="6LcYfmUUAAAAAG4U9XR-aJzwx3udK6wCZJuceJbW"></div>
						<div class="col-md-2"></div>	
					</div>
					<div  class="row marginT30">
						<div class="col-md-12 text-center dvFindId">
							<input type="submit" class="btn btn-outline-info btn-lg" value="SUBMIT">
						</div>
					</div>
				</form>
			</div>
			<img alt="" src="${pageContext.request.contextPath }/img/find3.jpg" class="findImg">
		</div>
	</div>
</div>

<%@ include file="../../inc/bottom.jsp"%>