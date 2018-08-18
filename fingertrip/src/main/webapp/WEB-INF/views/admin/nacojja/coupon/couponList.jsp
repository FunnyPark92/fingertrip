<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/adminTop.jsp"%>
<script type="text/javascript">
	function pageFunc(currentPage){
		frmHid.currentPage.value=currentPage;
		frmHid.submit();
	}
</script>

<section class="admCenter marginTop40" style="text-align: center">
	<ul class="clearFix marginBottom40 lineGnb">
	    <li class="on"><a href="<c:url value='/admin/nacojja/coupon/couponList.do'/>">회원혜택관리</a></li>
	    <li><a href="<c:url value='/admin/nacojja/bid/bidList.do'/>">기업입찰조회</a></li>
	    <li><a href="<c:url value='/admin/nacojja/nacojjaList.do'/>">나코짜전체관리</a></li>
	    <li><a href="#">상품매출분석</a></li>
	</ul>
	<h2>회원 혜택 관리</h2>
	<div class="clearFix">
		<div class="fRight">
			<form action="<c:url value='/admin/nacojja/coupon/couponList.do'/>" method="post">
		    	<select name="searchCondition">
	     			<option value="title"
	     				<c:if test="${param.searchCondition=='title' }">
	     					selected="selected"
	     				</c:if>
	     			>제목</option>
	     			<option value="start_day"
	     				<c:if test="${param.searchCondition=='start_day' }">
	     					selected="selected"
	     				</c:if>
	     			>출발일</option>
		     	</select>
	     		<input type="text" name="searchKeyword" value="${param.searchKeyword }">
	     		<input type="submit" value="검색" >
			</form>
		</div>
	</div>
   	<div>
   		<form name="frmHid" action="<c:url value='/admin/nacojja/coupon/couponList.do'/>" method="post">
    		<input type="hidden" name="currentPage">
    		<input type="hidden" name="searchCondition" value="${param.searchCondition }">
    		<input type="hidden" name="searchKeyword" value="${param.searchKeyword }">
   		</form>
   	</div>
   	
    <table class="grayTh" style="width: 90%; float:left;">
        <tr>
            <th scope="col" style="width:15%; text-align: center">나코짜번호</th>
            <th scope="col" style="width:50%; text-align: center">제목</th>
            <th scope="col" style="width:20%; text-align: center">여행날짜</th>
            <th scope="col" style="width:15%; text-align: center">하트수</th>
        </tr>
        <c:if test="${!empty list}">
         	<!-- 쿠폰 반복문 시작 -->
          	<c:forEach var="vo" items="${list}">
              <tr style="text-align: center">
                  <td scope="row" class="text-center">${vo.courseNo}</td>
                  <td>
                   <a href="<c:url value='/admin/nacojja/coupon/couponDetail.do?courseNo=${vo.courseNo}'/>">
                    <!--제목이 긴 경우 일부만 보여주기 -->
                    <c:if test="${fn:length(vo.title)>30}">
                    	${fn:substring(vo.title,0,30) }...
                    </c:if>
                    <c:if test="${fn:length(vo.title)<=30}">
                    	${vo.title}
                    </c:if>
                   </a>
                  </td>
                  <td class="text-center">${vo.startDay } ~ ${vo.endDay }</td>
                  <td class="text-center">${vo.heartCount }</td>
              </tr>
           	</c:forEach>
       </c:if>
    </table>
    <table class="grayTh" style="width:  10%;">
        <tr>
            <th scope="col" style="width:10%; text-align: center">완료</th>
        </tr>
         	<!-- 완료 반복문 시작 -->
           	<c:forEach var="cpVo" items="${cpList }">
           	 <tr style="text-align: center">
           		<td scope="row" class="text-center">${cpVo }</td>
              </tr>
           	</c:forEach>
    </table>
	<div>
	 		<c:if test="${pagingInfo.firstPage>1 }">
				<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">◀</a>
			</c:if>
			<c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">
				<c:choose>
					<c:when test="${i==pagingInfo.currentPage }">
						<span >${i }</span>
					</c:when>
					<c:otherwise>
						<span><a href="#" onclick="pageFunc(${i})">${i }</a></span>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
				<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">▶</a>
			</c:if>
	</div>
</section>
</body>
</html>