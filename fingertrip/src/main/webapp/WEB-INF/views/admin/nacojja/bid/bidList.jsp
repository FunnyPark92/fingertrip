<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/adminTop.jsp"%>
<script type="text/javascript">
function pageFunc(currentPage){
	page.currentPage.value=currentPage;
	page.submit();
}
$(document).ready(function(){
	$('select[name="searchCondition"]').change(function(){
		$('form[name=search] input[name=searchCondition]').val($('select[name=searchCondition] option:selected').val());
		$('form[name=search]').submit();
	});
});
</script>

<section class="admCenter marginTop40" style="text-align: center">
	<ul class="clearFix marginBottom40 lineGnb">
	    <li ><a href="#">회원혜택관리</a></li>
	    <li class="on"><a href="<c:url value='/admin/nacojja/bid/bidList.do'/>">기업입찰조회</a></li>
	    <li><a href="#">나코짜전체관리</a></li>
	    <li><a href="#">상품매출분석</a></li>
	</ul>
    <!-- 페이징 처리를 위한 div -->
    <form name="page" action="<c:url value='/admin/nacojja/bid/bidList.do'/>" method="post">
		<input type="hidden" name="currentPage">
      	<input type="hidden" name="searchCondition" value="${param.searchCondition }">
	</form>
    <form name="search" action="<c:url value='/admin/nacojja/bid/bidList.do'/>" method="post">
      	<input type="hidden" name="searchCondition" value="${param.searchCondition }">
	</form>
	<h2>기업 입찰 조회</h2>
      
	<div class="clearFix">
    	<div class="fRight">
        	<select name="searchCondition">
	        	<option value="0">모든 목록</option>
				<option value="2"
					<c:if test="${param.searchCondition==2}">
						selected="selected"	
					</c:if>
				>입찰 진행 중</option>
				<option value="3"
					<c:if test="${param.searchCondition==3 }">
						selected="selected"	
					</c:if>
				>입찰 성공/결제 진행 중</option>
				<option value="4"
					<c:if test="${param.searchCondition==4 }">
						selected="selected"	
					</c:if>
				>입찰 실패</option>
       		</select>
		</div>
	</div>
        
    <form name="frmList" method="post" action="<c:url value='/admin/nacojja/bid/bidList.do'/>" >
        <table class="grayTh">
            <tr>
                <th scope="col" style="width:4%; text-align: center"><input type="checkbox" name="chkAll"/></th>
                <th scope="col" style="width:10%; text-align: center">나코짜번호</th>
                <th scope="col" style="width:40%; text-align: center">제목</th>
                <th scope="col" style="width:15%; text-align: center">입찰 시작일</th>
                <th scope="col" style="width:15%; text-align: center">입찰 종료일</th>
                <th scope="col" style="width:16%; text-align: center">진행상태</th>
            </tr>
            <!-- 반복 시작 -->
            <c:forEach var="map" items="${list}">
	            <tr style="text-align: center">
	                <td><input type="checkbox" name="chk" value="${map['COURSE_NO'] }"></td>
	                <td>${map['COURSE_NO']}</td>
	                <td><a href='<c:url value="/admin/nacojja/bid/bidDetail.do?courseNo=${map['COURSE_NO']}"/>'>
	                	<c:if test="${fn:length(map['TITLE'])>25 }">
							${fn:substring(map['TITLE'],0,25) }...
						</c:if>
						<c:if test="${fn:length(map['TITLE'])<=25 }">
							${map['TITLE']}
						</c:if>
	                </a></td>
	                <td><fmt:formatDate value="${map['BID_START_DAY']}" pattern="yyyy-MM-dd"/></td>
	                <td><fmt:formatDate value="${map['BID_END_DAY']}" pattern="yyyy-MM-dd"/></td>
	                <td>${map['PROGRESS_STATUS']}</td>
	            </tr>
            </c:forEach>
            <!-- 반복 끝 -->
        </table>
        
        <!-- paging 시작 -->
        <c:if test="${pagingInfo.firstPage>1 }">
        	<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">◀</a>
        </c:if>
        <c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">
			<c:choose>
				<c:when test="${i==pagingInfo.currentPage }">
					<span>${i }</span>
				</c:when>
				<c:otherwise>
					<span><a href="#" onclick="pageFunc(${i})">${i }</a></span>
				</c:otherwise>
			</c:choose>
        </c:forEach>
        <c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
           <a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">▶</a>
        </c:if>
        <!-- <div class="aWrap fRight">
        	<input type="submit" class="darkBorder" id="delete" value="삭제"/>
        </div> -->
        </form>
    </section>


</body>
</html>