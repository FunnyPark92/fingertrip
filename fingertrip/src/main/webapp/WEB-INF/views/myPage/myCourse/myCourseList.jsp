<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/find.css"/>

<script type="text/javascript">
	$(document).ready(function(){
		$('select[name="search2"]').change(function(){
			$('form[name=frmSearch2] input[name=searchCondition2]').val($('select[name=search2] option:selected').val());
			$('form[name=frmSearch2]').submit();
		});
	});
	
	function pageFunc(currentPage){
		frmPage.currentPage.value=currentPage;
		frmPage.searchCondition2.value=frmS.search2.value;
		frmPage.searchCondition.value=frmSC.searchCondition.value;
		frmPage.searchKeyword.value=frmSC.searchKeyword.value;
		frmPage.submit();
	}
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
         
         <div class="container marginBottom100">
			<form name="frmPage" action="<c:url value='/myPage/myCourse/myCourseList.do'/>" method="post">
				<input type="hidden" name="currentPage">
				<input type="hidden" name="searchCondition2" value=${param.searchCondition2 }>
				<input type="hidden" name="searchCondition" value="${param.searchCondition }">
				<input type="hidden" name="searchKeyword" value="${param.searchKeyword }">
			</form>
			<form name="frmSearch2" action="<c:url value='/myPage/myCourse/myCourseList.do'/>" method="post">
				<input type="hidden" name="searchCondition2" value=${param.searchCondition2 }>
				<input type="hidden" name="searchCondition" value="${param.searchCondition }">
				<input type="hidden" name="searchKeyword" value="${param.searchKeyword }">
			</form>
			<div class="marginBottom20 overflowH pad10">
				<span class="colorGray float-left marginTop10">
					Showing
					<c:set var="cnt" value="0"/>
					<c:forEach var="vo" items="${list }">
						<c:set var="cnt" value="${cnt+1 }"/>
					</c:forEach>
					<c:if test="${cnt<pagingInfo.recordCountPerPage }">
						${cnt }
					</c:if>
					<c:if test="${cnt>=pagingInfo.recordCountPerPage }">
						${pagingInfo.recordCountPerPage} 
					</c:if>
					of ${pagingInfo.totalRecord }
				</span>
				<form name="frmS" class="colorGray form-inline float-right pad10">
					<select name="search2" class="form-control colorGray marginR10">
						<option value="0" class="colorGray">모든 나코짜 목록</option>
						<option value="1" class="colorGray" 
							<c:if test="${param.searchCondition2==1}">
								selected="selected"	
							</c:if>
						>하트 진행 중</option>
						<option value="2" class="colorGray"
							<c:if test="${param.searchCondition2==2}">
								selected="selected"	
							</c:if>
						>입찰 진행 중</option>
						<option value="3" class="colorGray"
							<c:if test="${param.searchCondition2==3 }">
								selected="selected"	
							</c:if>
						>입찰 성공/결제 진행 중</option>
						<option value="4" class="colorGray"
							<c:if test="${param.searchCondition2==4 }">
								selected="selected"	
							</c:if>
						>입찰 실패</option>
						<option value="5" class="colorGray"
							<c:if test="${param.searchCondition2==5}">
								selected="selected"	
							</c:if>
						>종료</option>
					</select>
				</form>
			</div>
			
			<c:if test="${!empty list}">
				<c:forEach var="map" items="${list }" >
					<div class="myList">
						<a href="#" class="decoN">
							<img class="listImg listH" alt="" src="${pageContext.request.contextPath }/upload_images/${map['THUMB_IMG']}">
							<div class="pad15 listSmDv">
								<p class="listTitle"> 
									<c:if test="${fn:length(map['TITLE'])>28 }">
										${fn:substring(map['TITLE'],0,28) }...
									</c:if>
									<c:if test="${fn:length(map['TITLE'])<=28 }">
										${map['TITLE']}
									</c:if>
								</p>
								<span>[${map['TERM'] }DAYS]</span><br>
								<span>${map['COUNTRIES'] }</span><br>
								<span>출발일: <fmt:formatDate value="${map['START_DAY']}" pattern="yyyy-MM-dd"/></span><br>
								<span class="colorBlue font-weight-bold">${map['PROGRESS_STATUS'] }</span><br>
								<span class="listTitle float-right"><img src="${pageContext.request.contextPath }/img/heart.png" class="qna">${map['HEART_COUNT'] }</span>
							</div>
						</a>
					</div>
				</c:forEach>
			</c:if>
			
			<div class="divPage clear text-center pad15 marginBottom40">
               	<c:if test="${pagingInfo.firstPage>1}">
               		<a href="#" class="decoN colorGray" onclick="pageFunc(${pagingInfo.firstPage-1})">◀</a>
               	</c:if>
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
               	<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage}">
               		<a href="#" class="decoN colorGray" onclick="pageFunc(${pagingInfo.lastPage+1})">▶</a>
               	</c:if>
			</div>	
			
			<div class="margin0 width350">
				<form name="frmSC" action="<c:url value='/myPage/myCourse/myCourseList.do'/>" method="post" class="colorGray form-inline">
					<input type="hidden" value="${param.searchCondition2 }" name="searchCondition2">
					<select name="searchCondition" class="form-control colorGray marginR10">
						<option value="title" class="colorGray" 
							<c:if test="${param.searchCondition=='title' }">
								selected="selected"	
							</c:if>
						>제목</option>
						<option value="countries" class="colorGray"
							<c:if test="${param.searchCondition=='countries' }">
								selected="selected"	
							</c:if>
						>나라</option>
						<option value="term" class="colorGray"
							<c:if test="${param.searchCondition=='term' }">
								selected="selected"	
							</c:if>
						>기간</option>
					</select>
					<input type="text" class="form-control" name="searchKeyword" value="${param.searchKeyword }">
					<input type="submit" value="검색" class="btn btn-primary marginL10">
				</form>
			</div>
			<a href="#top" title="Back to top" class="float-right colorPink listTitle">▲TOP</a>			
		</div>    
      </div>
   </div>
</div>
<%@ include file="../../inc/bottom.jsp"%>