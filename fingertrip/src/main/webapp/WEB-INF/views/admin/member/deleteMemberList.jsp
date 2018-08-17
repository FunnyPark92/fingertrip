<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>
<script type="text/javascript">
function pageFunc(currentPage){
	page.currentPage.value=currentPage;
	page.submit();
}

</script>
<section class="admCenter marginTop40" style="text-align: center">
	<ul class="clearFix marginBottom40 lineGnb">
	    <li class="on"><a href="<c:url value='/admin/member/deleteMemberList.do'/>">탈퇴회원조회</a></li>
	    <li><a href="<c:url value='/admin/member/deleteMemberChart.do'/>">탈퇴회원분석</a></li>
	</ul>
        <form name="page" action="<c:url value='/admin/member/deleteMemberList.do'/>" method="post">
			<input type="hidden" name="currentPage">
	        <input type="hidden" name="searchCondition" value="${param.searchCondition }">
	        <input type="hidden" name="searchKeyword" value="${param.searchKeyword }"> 
        </form>
        <h2>탈퇴회원 조회</h2>
        <div class="clearFix">
        <form action="<c:url value='/admin/member/deleteMemberList.do'/>" method="post">
           	<div class="fRight">
           		<select name="searchCondition">
           			<option value="name"
           				<c:if test="${param.searchCondition=='name' }">
                					selected="selected"
                		</c:if>
           			>이름</option>
           			<option value="id"
           				<c:if test="${param.searchCondition=='id'}">
                					selected="selected"
                		</c:if>
           			>ID</option>	
           		</select>
           		<input type="text" name="searchKeyword" value="${param.searchKeyword}">
                <input type="submit" value="검색">
           </div>
           </form>
        </div>
        <form name="frmList" method="post" action="<c:url value='/admin/agency/.do'/>" >
        <table class="grayTh">
            <tr>
                <th>회원번호</th>
                <th>회원이름</th>
                <th>아이디</th>
                <th>비밀번호</th>
                <th>전화번호</th>
                <th>이메일주소</th>
                <th>회원탈퇴일시</th>
            </tr>
            <!-- 회원정보 반복 시작 -->
            <c:forEach var="vo" items="${list}">
	            <tr>
	                <td>${vo.memberNo }</td>
	                <td><a href="<c:url value='/admin/member/memberDetail.do?id=${vo.id}'/>">${vo.name }</a></td>
	                <td><a href="<c:url value='/admin/member/memberDetail.do?id=${vo.id}'/>">${vo.id }</a></td>
	                <td>${vo.password }</td>
	                <td>${vo.hp1 }-${vo.hp2 }-${vo.hp3 }</td>
	                <td>${vo.email1}@${vo.email2}</td>
	                <td>${vo.outDate }</td>
	            </tr>
            </c:forEach>
            <!-- 기업 반복 끝 -->
        </table>
        <!--</form>-->
        <!-- paging 시작 -->
        <div style="margin-left:10px">
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
         </div>
    	<div class="fRight aWrap">
	 		<a class="darkBorder" href="<c:url value='/admin/member/memberList.do'/>">일반회원목록으로</a>
	 	</div>
    </section>
</body>
</html>
