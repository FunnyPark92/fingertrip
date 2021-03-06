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
	
	function pageFunc(currentPage){
		frmPage.currentPage.value=currentPage;
		frmPage.submit();
	}
</script>
	
<!-- 페이징 처리를 위한 form -->
<form name="frmPage" method="post" action="<c:url value='/myPage/myHeart/heartList.do'/>">
	<input type="hidden" name="currentPage">
</form>

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
        
        <!-- 서브컨텐츠 -->
        <div class="col-lg-9">
			<h2>하트 내역</h2><br>
			<span style="position: absolute; top: 40px; left: 550px;">
				${memberVo.name }님이 보유중인 하트는 <b style="color: blue;">${memberVo.heartCount }</b>개 입니다.
			</span>
			<table class="table table-condensed" style="text-align: center">
				<colgroup>
					<col style="width:20%" />
					<col style="width:10%" />
					<col style="width:40%" />
					<col style="width:30%" />
				</colgroup>
				<thead>
				  <tr>
				    <th scope="col">하트내역 번호</th>
					<th scope="col">개수</th>
					<th scope="col">충전/적립/사용 상태</th>
					<th scope="col">충전/적립/사용일</th>
				  </tr>
				</thead> 
				<tbody>
					<c:if test="${empty hlVoList }">
						<tr>
							<td colspan="4">하트 충전/적립/사용 내역이 없습니다.</td>
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
							<c:if test="${map['STATUS'] == '코스등록' }">
								<tr style="color: red">
									<th scope="col">${map['HEART_LIST_NO'] }</th>
									<th scope="col">-1</th>
									<th scope="col">코스 등록에 사용</th>
									<th scope="col">${map['REGDATE'] }</th>
								</tr>
							</c:if>
							<c:if test="${map['STATUS'] == '하트' }">
								<tr style="color: red">
									<th scope="col">${map['HEART_LIST_NO'] }</th>
									<th scope="col">-1</th>
									<th scope="col">코스에 하트 누르기</th>
									<th scope="col">${map['REGDATE'] }</th>
								</tr>
							</c:if>
							<c:if test="${map['STATUS'] == '장기미접속' }">
								<tr style="color: green;">
									<th scope="col">${map['HEART_LIST_NO'] }</th>
									<th scope="col">+1</th>
									<th scope="col">장기 미접속자 혜택</th>
									<th scope="col">${map['HEART_CHARGE_DAY'] }</th>
								</tr>
							</c:if>
						</c:forEach>
						<!-- 반복 끝 -->
					</c:if>
				</tbody>
			</table>
			
			<!-- 페이지 번호 추가 -->		
			<div class="divPage clear text-center pad15 marginBottom40">
				<!-- 이전 블럭으로 이동 -->
               	<c:if test="${pagingInfo.firstPage>1}">
               		<a href="#" class="decoN colorGray" onclick="pageFunc(${pagingInfo.firstPage-1})">◀</a>
               	</c:if>
               	
               	<!-- [1][2][3][4][5][6][7][8][9][10] -->
               	<c:forEach var="i" begin="${pagingInfo.firstPage}" end="${pagingInfo.lastPage}">
					<c:choose>
						<c:when test="${i==pagingInfo.currentPage}">
							<span class="colorBlue font-weight-bold">${i}</span>
						</c:when>
						<c:otherwise>
							<span><a href="#" class="decoN colorGray" onclick="pageFunc(${i})">${i}</a></span>
						</c:otherwise>
					</c:choose>
               	</c:forEach>
               	
               	<!-- 다음 블럭으로 이동 -->
               	<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage}">
               		<a href="#" class="decoN colorGray" onclick="pageFunc(${pagingInfo.lastPage+1})">▶</a>
               	</c:if>
			</div>	
            <!--  페이지 번호 끝 -->
			
			<button type="button" class="btn btn-warning text-center" id="btn1">하트 충전하기</button> 
		</div>
	</div>
</div>

<%@ include file="../../inc/bottom.jsp" %>
