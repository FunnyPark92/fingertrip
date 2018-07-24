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
                <a href="#" class="list-group-item">내가 쓴 글</a>
                <a href="<c:url value='/myPage/myCourse/myCourseList.do'/>" class="list-group-item">내가 찜한 코스</a>
                <a href="<c:url value='/myPage/myCoupon/couponList.do'/>" class="list-group-item">쿠폰</a>
                <a href="<c:url value='/myPage/myPayment/paymentList.do'/>" class="list-group-item active">결제확인</a>
                <a href="<c:url value='/myPage/myHeart/heartList.do'/>" class="list-group-item">하트</a>
            </div>
        </div>

        <!-- 서브컨텐츠 -->
        <div class="col-lg-9">
			<h2>결제 내역</h2><br>
			<table class="box2">
				<caption>결제 내역</caption>
				<colgroup>
					<col style="width:9%" />
					<col style="width:12%" />
					<col style="width:40%" />
					<col style="width:12%" />
					<col style="width:12%" />	
					<col style="width:14%" />
				</colgroup>
				<thead>
				  <tr>
				    <th scope="col">결제번호</th>
					<th scope="col">결제일자</th>
					<th scope="col">코스명</th>
					<th scope="col">결제금액</th>
					<th scope="col">???</th>
					<th scope="col">???</th>
				  </tr>
				</thead> 
				<tbody>
					<c:if test="${empty list }">
						<tr>
							<td colspan="6">해당 기간의 결제 내역이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty list }">
						<!-- 반복 시작 -->
						
						<!-- 반복 끝 -->
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
</div>

<%@ include file="../../inc/bottom.jsp" %>
