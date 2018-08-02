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
                <a href="<c:url value='/myPage/myCoupon/couponList.do'/>" class="list-group-item active">쿠폰</a>
                <a href="<c:url value='/myPage/myPayment/paymentList.do'/>" class="list-group-item">결제확인</a>
                <a href="<c:url value='/myPage/myHeart/heartList.do'/>" class="list-group-item">하트</a>
            </div>
        </div>

        <!-- 서브컨텐츠 -->
        <div class="col-lg-9">
			<h3>쿠폰 내역</h3><br>
			<table class="table table-condensed" style="text-align: center">
				
				<colgroup>
					<col style="width:11%" />
					<col style="width:20%" />
					<col style="width:35%" />
					<col style="width:15%" />
					<col style="width:19%" />
				</colgroup>
				<thead>
				  <tr>
				    <th scope="col">쿠폰번호</th>
					<th scope="col">쿠폰이름</th>
					<th scope="col">코스명</th>
					<th scope="col">회원이름</th>
					<th scope="col">유효기간</th>
				  </tr>
				</thead>
				<tbody>
					<c:if test="${empty list }">
						<tr>
							<td colspan="5">쿠폰 보유 내역이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty list }">
					
						<!-- 반복 시작 -->
						<c:forEach var="map" items="${list}">
							<tr>
								<td>${map['COUPON_NO'] }</td>
								<td>${map['COUPON_NAME'] }</td>
								<td><a href="#" style="color: #4169e1">${map['TITLE'] }</a></td>
								<td>${map['NAME'] }</td>
								<td><fmt:formatDate value="${map['END_DAY']}" pattern="yyyy-MM-dd" /></td>
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
