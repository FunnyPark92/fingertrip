<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/find.css"/>

<div class="minHeight580">
	<div class="container findId">
		<h1 class="text-center">Forgot your Passward?</h1>
		<br>
		<form class="row" action="<c:url value='/member/login/foundPw.do'/>" method="post">
			<div class="col-md-3"></div>
			<div class="col-md-1">
				<label for="id" >
					<img src="${pageContext.request.contextPath }/img/checked.png">&nbsp;&nbsp;&nbsp;ID
				</label>
			</div>
			<div class="col-md-4">
				<input type="text" id="id" class="form-control" placeholder="아이디를 입력하세요">
			</div>
			<div class="col-md-4"></div>
			
			<div class="col-md-4 text-right">
				<label for="email">
					<img src="${pageContext.request.contextPath }/img/checked.png">&nbsp;&nbsp;&nbsp;Email
				</label>
			</div>
			<div class="col-md-4">
				<input type="text" id="email" class="form-control" placeholder="이메일을 입력하세요">
			</div>
			<div class="col-md-4"></div>
			
			<div class="col-md-12 text-center">
				<input type="submit" class="btn btn-primary btn-lg" value="SUBMIT">
				<!-- submit하면 alert으로 메일 전송 알림 알려주세요 --> 
			</div>
		</form>
	</div>
</div>
<%@ include file="../../inc/bottom.jsp"%>