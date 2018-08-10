<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../inc/top.jsp" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/find.css"/>

<script type="text/javascript">
	$(document).ready(function(){
		$('#btn1').click(function(){
			//location.href="<c:url value='/myPage/myHeart/heartCharge.do'/>";  
			window.open("<c:url value='/myPage/myHeart/heartCharge.do'/>", "heartCharge",
					"width=1000, height=750, left=0, top=0, location=yes, resizable=yes");
		});
	}); 
</script>
	
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
                <a href="<c:url value='/myPage/myPayment/paymentList.do'/>" class="list-group-item">결제확인</a>
                <a href="<c:url value='/myPage/myHeart/heartList.do'/>" class="list-group-item active">하트</a>
            </div>
        </div>
        
        <!-- 서브메뉴 -->
        <div class="col-lg-9">
			<div class="container">
			<h2>하트 내역</h2><br>
			<table class="box2">
				<caption>하트 내역</caption>
				<colgroup>
					<col style="width:20%" />
					<col style="width:12%" />
					<col style="width:40%" />
					<col style="width:30%" />
					<col style="width:12%" />	
					<col style="width:14%" />
				</colgroup>
				<thead>
				  <tr>
				    <th scope="col">하트내역 번호</th>
					<th scope="col">개수</th>
					<th scope="col">충전/사용 상태</th>
					<th scope="col">구매/사용일</th>
				  </tr>
				</thead> 
				<tbody>
					<c:if test="${empty hlVoList }">
						<tr>
							<td colspan="6">해당 기간의 하트 충전/사용 내역이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty hlVoList }">
						<!-- 반복 시작 -->
						<c:forEach var="map" items="${hlVoList }">
							<c:if test="${map['STATUS'] == '충전' }">
								<tr style="color: green;">
									<th scope="col">${map['HEART_LIST_NO'] }</th>
									<th scope="col">+${map['HEART_CHARGE_COUNT'] }</th>
									<th scope="col">충전</th>
									<th scope="col">${map['HEART_CHARGE_DAY'] }</th>
								</tr>
							</c:if>
							<c:if test="${map['STATUS'] == '사용' }">
								<tr style="color: red">
									<th scope="col">${map['HEART_LIST_NO'] }</th>
									<th scope="col">-1</th>
									<th scope="col">코스 등록에 사용</th>
									<th scope="col">${map['REGDATE'] }</th>
								</tr>
							</c:if>
						</c:forEach>
						<!-- 반복 끝 -->
					</c:if>
				</tbody>
			</table>
			</div>
				<button type="button" class="btn btn-warning text-center" id="btn1">하트 충전하기</button> 
			</div>
	</div>
</div>

<%@ include file="../../inc/bottom.jsp" %>
