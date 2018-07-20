<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/find.css"/>

<div class="container margin80">
	<div class="row">
				
		<!-- 서브메뉴 -->
        <div class="col-lg-3">
            <h3>마이페이지</h3>
            <div class="list-group">
                <a href="#" class="list-group-item">회원 정보 수정</a>
                <a href="#" class="list-group-item">회원 탈퇴</a>
                <a href="#" class="list-group-item">내가 쓴 글</a>
                <a href="#" class="list-group-item active">내가 찜한 코스</a>
                <a href="#" class="list-group-item">쿠폰</a>
                <a href="#" class="list-group-item">결제확인</a>
                <a href="#" class="list-group-item">하트</a>
            </div>
        </div>

        <!-- 서브컨텐츠 -->
        <div class="col-lg-9">
        	<h2>회원 탈퇴</h2>
			<br>
			<br>
			<span class="fontBold spanId">회원탈퇴 사유</span>
			<span class="colorGray">※ 남겨 주신 정보를 바탕으로 더 나은 서비스를 제공해 드리기 위해 노력하겠습니다.</span>
        	<hr class="marginBottom50">
        	<form action='<c:url value='/member/memberOutOk.do'/>' method="post">
	         	<div class="row marginBottom10">
	         		<span class="col-md-2"></span>
	 				<span class="col-md-2 dvFindId">회원 아이디</span>
					<span class="col-md-8 dvFindId">suyun</span>
				</div>

				<div class="row">
	         		<span class="col-md-2"></span>
	 				<span class="col-md-2 dvFindId">탈퇴 사유</span>
		          	<select class="form-control col-md-5">
		          		<option>서비스 불만족</option>
		          		<option>재가입</option>
		          		<option>개인정보 보호문제</option>
		          		<option>자주 이용하지 않음</option>
		          		<option>원하는 서비스 모두 이용함</option>
		          		<option>회원간의 트러블</option>
		          		<option>군입대 영장</option>
		          		<option>지구온난화</option>
		          		<option>외계인의 침입</option>
		          	</select>
				</div>
				
				<hr class="marginTB">
	         	<div class="row">
	         		<div class="col-md-12 text-center">
		         		<input type="submit" class="btn btn-danger btn-lg" value="회원탈퇴">
	         		</div>
	         	</div>
        	</form>
        </div>
	</div>
</div>
<%@ include file="../../inc/bottom.jsp"%>