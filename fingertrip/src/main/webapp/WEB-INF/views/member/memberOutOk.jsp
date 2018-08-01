<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/find.css"/>

<div class="container margin80">
	<div class="row">
				
		<!-- 서브메뉴 -->
        <div class="col-lg-3">
            <h3>마이페이지</h3>
            <div class="list-group">
                <a href="<c:url value='/member/memberEdit.do'/>" class="list-group-item">회원 정보 수정</a>
                <a href="<c:url value='/member/memberOut.do'/>" class="list-group-item active">회원 탈퇴</a>
                <a href="<c:url value='/myPage/myWrite/myWriteList.do'/>" class="list-group-item">내가 쓴 글</a>
                <a href="<c:url value='/myPage/myCourse/myCourseList.do'/>" class="list-group-item">내가 찜한 코스</a>
                <a href="<c:url value='/myPage/myCoupon/couponList.do'/>" class="list-group-item">쿠폰</a>
                <a href="<c:url value='/myPage/myPayment/paymentList.do'/>" class="list-group-item">결제확인</a>
                <a href="<c:url value='/myPage/myHeart/heartList.do'/>" class="list-group-item">하트</a>
            </div>
        </div>

        <!-- 서브컨텐츠 -->
        <div class="col-lg-9">
        	<h2>회원 탈퇴</h2>
			<br>
        	<hr class="marginBottom50">
	         	<div class="marginBottom10 text-center">
	         		<img class="imgSize" src="${pageContext.request.contextPath }/img/greenChecked.png">
	         		<h3 class="marginTop20">회원탈퇴가 <span class="colorBlue">완료되었습니다.</span></h3>
				</div>
				<hr class="marginTop50 marginBottom50">
				<div class="text-center">
	         		<h5>그 동안 FingerTrip 서비스를 이용해 주셔서 감사합니다.</h5>
	         		<p>보다 나은 서비스로 다시 찾아 뵙겠습니다.</p>
	         		<a href='<c:url value='/index.do'/>' class="btn btn-warning btn-lg marginTop20">FingerTrip 메인 화면</a>
				</div>
        </div>
	</div>
</div>
<%@ include file="../inc/bottom.jsp"%>