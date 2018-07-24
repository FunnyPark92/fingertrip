<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/find.css"/>

<div class="minHeight580">
	<div class="container findId">
		<h1 class="text-center">Found your ID!</h1>
		<br>
		<div class="row">
			<div class="col-md-5 text-right">
				<p>
					<span class="spanSize">
						<img src="${pageContext.request.contextPath }/img/checked.png">&nbsp;&nbsp;&nbsp;Name
					</span>
				</p>
			</div>
			<div class="col-md-7">
					<span class="spanSize">${vo.name }</span>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-5 text-right">
				<p>
					<span class="spanSize">
						<img src="${pageContext.request.contextPath }/img/checked.png">&nbsp;&nbsp;&nbsp;Email
					</span>
				</p>
			</div>
			<div class="col-md-7">
					<span class="spanSize">${vo.email1 }@${vo.email2 }</span>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-5 text-right">
				<p>
					<span class="spanSize spanId">
						<img src="${pageContext.request.contextPath }/img/checked.png">&nbsp;&nbsp;&nbsp;ID
					</span>
				</p>
			</div>
			<div class="col-md-7">
					<span class="spanSize">${vo.id }</span>
			</div>	
		</div>
		
		<div class="row">		
			<div class="col-md-12 text-center">
				<a href='<c:url value='/member/login/login.do'/>' class="btn btn-primary btn-lg sbmit">로그인</a>
				<a href='<c:url value='/member/login/findPw.do'/>' class="btn btn-danger btn-lg sbmit">비밀번호 찾기</a>
			</div>
		</div>	
	</div>
</div>
<%@ include file="../../inc/bottom.jsp"%>