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
                <a href="<c:url value='/member/memberEdit.do'/>" class="list-group-item">회원 정보 수정</a>
                <a href="<c:url value='/member/memberOut.do'/>" class="list-group-item">회원 탈퇴</a>
                <a href="#" class="list-group-item">내가 쓴 글</a>
                <a href="<c:url value='/myPage/myCourse/myCourseList.do'/>" class="list-group-item active">내가 찜한 코스</a>
                <a href="<c:url value='/myPage/myCoupon/couponList.do'/>" class="list-group-item">쿠폰</a>
                <a href="<c:url value='/myPage/myPayment/paymentList.do'/>" class="list-group-item">결제확인</a>
                <a href="<c:url value='/myPage/myHeart/heartList.do'/>" class="list-group-item">하트</a>
            </div>
        </div>

        <!-- 서브컨텐츠 -->
        <div class="col-lg-9">
			<h2 id="top">내가 찜한 코스</h2>
			<hr class="marginTop30 marginBottom30">
			
			<div class="marginBottom20 overflowH pad10">
				<span class="colorGray float-left marginTop10">Showing 9 of 17 results</span>
				<form action="" method="post" class="colorGray form-inline float-right">
					<select name="searchCondition" class="form-control colorGray">
						<option value="" class="colorGray">모든 나코짜 목록</option>
						<option value="1" class="colorGray">하트 진행 중</option>
						<option value="2" class="colorGray">입찰 진행 중</option>
						<option value="3" class="colorGray">입찰 성공/결제 진행 중</option>
						<option value="4" class="colorGray">입찰 실패</option>
						<option value="5" class="colorGray">종료</option>
					</select>
				</form>
			</div>
			
			<form name="frmPage" method="post" action="<c:url value='/myPage/myCourse/myCourseList.do'/>">
				<input type="hidden" name="currentPage" >
				<input type="hidden" name="searchCondition" value="${param.searchCondition}">	
			</form>
			
			<%-- <c:if test="${!empty list}"> --%>
				<c:forEach begin="1" end="9"><%--  var="vo" items="${list }" --%>
					<div class="listDv">
						<a href="">
							<img class="listImg" alt="" src="${pageContext.request.contextPath }/img/EiffelDay.jpg">
							<div class="pad15 listSmDv">
								<p class="listTitle"> [3색매력]알찬일정,동화같은 서유럽3국8일(프랑스/스위스/이탈리아)</p>
								<span class="colorGreen">[6박 8일]</span><br>
								<span class="colorOrange">출발일: 2018-08-11</span><br>
								<span class="colorRed">하트 진행 중</span>
							</div>
						</a>
					</div>
				</c:forEach>
			<%-- </c:if> --%>
			
			<div class="divPage clear text-center pad15">
				<!-- 페이지 번호 추가 -->		
				<!-- 이전 블럭으로 이동 -->
				<%-- <c:if test="${pageVo.firstPage>1 }">
					<a href="#" onclick="pageFunc(${pageVo.firstPage-1})"> --%>
					<a href="">
						<span class="colorGray">◀</span>
					</a>		
				<%-- </c:if> --%>
				
				<!-- [1][2][3][4][5][6][7][8][9][10] -->
				<%-- <c:forEach var="i" begin="${pageVo.firstPage }" end="${pageVo.lastPage}"> --%>
				<c:forEach var="i" begin="1" end="3">
					<%-- <c:if test="${i==pageVo.currentPage }"> --%>
					<c:if test="${i==1 }">
						<span class="listSmDv">${i}</span>
					</c:if>
					<%-- <c:if test="${i!=pageVo.currentPage }"> --%>
					<c:if test="${i!=1}">
						<a href="#" class="colorGray">${i }</a>
					</c:if>
				</c:forEach>
					
				<!-- 다음 블럭으로 이동 -->
			<%-- 	<c:if test="${pageVo.lastPage<pageVo.totalPage }">
					<a href="#" onclick="pageFunc(${pageVo.lastPage+1})"> --%>
					<a href="">
						<span class="colorGray">▶</span>
					</a>	
				<%-- </c:if> --%>
				<!--  페이지 번호 끝 -->
				<a href="#top" title="Back to top" class="float-right colorPink listTitle">▲TOP</a>
			</div>		

		</div>
	</div>
</div>
<%@ include file="../../inc/bottom.jsp"%>