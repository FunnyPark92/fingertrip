<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/find.css"/>

<div class="minHeight580">
	<div class="container findId">
		<h1 class="text-center">Forgot your Password?</h1>
		<br>
		<form action="<c:url value='/member/login/foundPw.do'/>" method="post">
			<div class="row">
				<div class="col-md-4 text-right dvFindId">
					<label for="id" >
						<span class="spanSize spanId"><img src="${pageContext.request.contextPath }/img/checked.png">&nbsp;&nbsp;&nbsp;ID</span>
					</label>
				</div>
				<div class="col-md-4">
					<input type="text" id="id" class="form-control dvFindId" placeholder="아이디를 입력하세요">
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
					<input type="text" id="email" class="form-control dvFindId" placeholder="이메일을 입력하세요">
				</div>
				<div class="col-md-4"></div>
			</div>
			
			<div class="row">
				<div class="col-md-12 text-center">
					<input type="submit" class="btn btn-primary btn-lg sbmit" value="SUBMIT">
					<!-- submit하면 alert으로 메일 전송 알림 알려주세요 --> 
				</div>
			</div>
		</form>
	</div>
</div>
<%@ include file="../../inc/bottom.jsp"%>