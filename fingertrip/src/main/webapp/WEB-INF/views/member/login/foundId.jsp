<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/find.css"/>

<div class="dvFindBack">
	<div class="container">
		<div class="row">
			<div class="findIpDv findColor">
				<h1 class="text-center marginBottom50 marginTop70">Found your ID!</h1>
					<div  class="row">
						<div class="col-md-4 text-right dvFindId">
							<span class="spanSize"><img src="${pageContext.request.contextPath }/img/checked.png">&nbsp;&nbsp;&nbsp;Name</span>
						</div>
						<div class="col-md-6 dvFindId">
							<span class="spanSize">${vo.name }</span>
						</div>
						<div class="col-md-2"></div>
					</div>
					<div  class="row">
						<div class="col-md-4 text-right dvFindId">
							<span class="spanSize"><img src="${pageContext.request.contextPath }/img/checked.png">&nbsp;&nbsp;&nbsp;Email</span>
						</div>
						<div class="col-md-6 dvFindId">
							<span class="spanSize">${vo.email1 }@${vo.email2 }</span>
						</div>
						<div class="col-md-2"></div>
					</div>
					<div  class="row">
						<div class="col-md-4 text-right dvFindId">
							<span class="spanSize spanId"><img src="${pageContext.request.contextPath }/img/checked.png">&nbsp;&nbsp;&nbsp;ID</span>
						</div>
						<div class="col-md-6 dvFindId">
							<span class="spanSize">${vo.id }</span>
						</div>
						<div class="col-md-2"></div>
					</div>
					<div  class="row">
						<div class="col-md-12 text-center dvFindId">
							<a href='<c:url value='/member/login/login.do'/>' class="btn btn-lg sbmit btn-outline-info">Login</a>
							<a href='<c:url value='/member/login/findPw.do'/>' class="btn btn-lg sbmit btn-outline-primary marginL10">Forgot Password?</a>
						</div>
					</div>
			</div>
			<img alt="" src="${pageContext.request.contextPath }/img/find2.jpg" class="findImg">
		</div>
	</div>
</div>

<%@ include file="../../inc/bottom.jsp"%>
