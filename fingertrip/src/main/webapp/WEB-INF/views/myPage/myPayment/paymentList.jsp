<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../../inc/top.jsp" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/find.css"/>

<div class="container margin80">
	<div class="row">
		<!-- 서브메뉴 -->
        <div class="col-lg-3">
            <h3>마이페이지</h3>
            <div class="list-group">
                <a href="<c:url value='/member/memberEdit.do'/>" class="list-group-item">회원 정보 수정</a>
                <a href="<c:url value='/member/memberOut.do'/>" class="list-group-item">회원 탈퇴</a>
                <a href="<c:url value='/myPage/myWrite/myWriteList.do'/>" class="list-group-item">내가 쓴 글</a>
                <a href="<c:url value='/myPage/myCourse/myCourseList.do'/>" class="list-group-item">내가 찜한 코스</a>
                <a href="<c:url value='/myPage/myCoupon/couponList.do'/>" class="list-group-item">쿠폰</a>
                <a href="<c:url value='/myPage/myPayment/paymentList.do'/>" class="list-group-item active">결제확인</a>
                <a href="<c:url value='/myPage/myHeart/heartList.do'/>" class="list-group-item">하트</a>
            </div>
        </div>

        <!-- 서브컨텐츠 -->
        <div class="col-lg-9">
			<h2>결제 내역</h2><br>
			<table class="table table-condensed" style="text-align: center">
				<colgroup>
					<col style="width:11%" />
					<col style="width:30%" />
					<col style="width:13%" />
					<col style="width:20%" />	
					<col style="width:25%" />
				</colgroup>
				<thead>
				  <tr>
				    <th scope="col">결제번호</th>
					<th scope="col">코스명</th>
					<th scope="col">결제금액</th>
					<th scope="col">여행일정</th>
					<th scope="col">결제일자</th>
				  </tr>
				</thead> 
				<tbody>
					<c:if test="${empty list }">
						<tr>
							<td colspan="6">결제 내역이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty list }">
						<!-- 반복 시작 -->
						<c:forEach var="map" items="${list}">
							<tr style="color: red">
								<td>${map['PAYMENT_NO']}</td>
								<td>${map['TITLE']}</td>
								<td>${map['WIN_BID_PRICE']}</td>
								<td>${map['TRAVELSTART']}</td>
								<td>${map['PAYMENT_DATE']}</td>
							</tr>
						</c:forEach>
						<!-- 반복 끝 -->
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
</div>

<%@ include file="../../inc/bottom.jsp" %>
