<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/find.css"/>

<script type="text/javascript">
	$(document).ready(function(){
		$('form[name=frmId]').submit(function(){
			if($('#name').val()<1){
				alert('이름을 입력해주세요');
				return false;
			}else if($('#email').val()<1){
				alert('이메일을 입력해주세요');
				return false;
			}
		});
	});
</script>

<div class="minHeight580">
	<div class="container findId">
		<h1 class="text-center">Forgot your ID?</h1>
		<br>
		<form name="frmId" action="<c:url value='/member/login/foundId.do'/>" method="post">
			<div  class="row">
				<div class="col-md-4 text-right dvFindId">
					<label for="name" >
						<span class="spanSize"><img src="${pageContext.request.contextPath }/img/checked.png">&nbsp;&nbsp;&nbsp;Name</span>
					</label>
				</div>
				<div class="col-md-4 dvFindId">
					<input type="text" id="name" name="name" class="form-control" placeholder="이름을 입력하세요">
				</div>
				<div class="col-md-4"></div>
			</div>
			<div  class="row">
				<div class="col-md-4 text-right dvFindId">
					<label for="email">
						<span class="spanSize"><img src="${pageContext.request.contextPath }/img/checked.png">&nbsp;&nbsp;&nbsp;Email</span>
					</label>
				</div>
				<div class="col-md-4 dvFindId">
					<input type="text" id="email" name="email" class="form-control" placeholder="이메일을 입력하세요">
				</div>
				<div class="col-md-4"></div>
			</div>
			<div  class="row">
				<div class="col-md-12 text-center dvFindId">
					<input type="submit" class="btn btn-primary btn-lg sbmit" value="SUBMIT">
				</div>
			</div>
		</form>
	</div>
</div>
<%@ include file="../../inc/bottom.jsp"%>