<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../inc/top.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/find.css"/>

<script type="text/javascript">
function pageFunc(currentPage){
	page.currentPage.value=currentPage;
	page.submit();
}
</script>
<div class="container margin80">
	<div class="row">
		<!-- 서브메뉴 -->
        <div class="col-lg-3">
            <h3>마이페이지</h3>
            <div class="list-group">
                <a href="<c:url value='/agencyPage/bidList.do'/>" class="list-group-item">입찰한 목록</a>
                <a href="<c:url value='/agencyPage/myWriteList.do'/>" class="list-group-item active">내가 쓴 글</a>
            </div>
        </div>
        <div>
        	<form name="page" action="<c:url value='/agencyPage/myWriteList.do'/>" method="post">
	    		<input type="hidden" name="currentPage">
	        	<input type="hidden" name="searchCondition" value="${param.searchCondition }">
	        	<input type="hidden" name="searchKeyword" value="${param.searchKeyword }">
        	</form>
        </div>
        <!-- 서브컨텐츠 -->
        <div class="col-lg-9">
			<h3>내가 쓴 QnA</h3><br>
			<table class="table table-condensed" style="text-align: center">
				<colgroup>
					<col style="width:11%" />
					<col style="width:34%" />
					<col style="width:35%" />
					<col style="width:20%" />
				</colgroup>
				<thead>
				  <tr>
				    <th scope="col">번호</th>
				    <th scope="col">제목</th>
					<th scope="col">조회수</th>
					<th scope="col">등록일</th>
				  </tr>
				</thead>
				<tbody>
				   <c:if test="${!empty list}">
	                    <!-- 내가 쓴 QnA 반복문 시작 -->
	                    <c:forEach var="vo" items="${list}">
	                        <tr>
	                            <td scope="row" class="text-center">${vo.qnaNo }</td>
	                            <td>
		                            <a href="<c:url value='/cs/QnA/countUpdate.do?qnaNo=${vo.qnaNo }'/>">
			                            <!--제목이 긴 경우 일부만 보여주기 -->
			                            <c:if test="${fn:length(vo.title)>25}">
			                            	${fn:substring(vo.title,0,25) }...
			                            </c:if>
			                            <c:if test="${fn:length(vo.title)<=25}">
			                            	${vo.title }
			                            </c:if>
		                            </a>
	                            </td>
	                            <td class="text-center">${vo.readCount }</td>
	                            <td class="text-center"><fmt:formatDate value="${vo.regDate }" pattern="yyyy-MM-dd hh:mm"/></td>
	                        </tr>
	                     </c:forEach>
                     </c:if>
				</tbody>
			</table>
				<div class="width500 margin0 marginT30" style="margin-left:400px;">
              	   	<c:if test="${pagingInfo.firstPage>1 }">
                		<a href="#" class="decoN colorBlue" onclick="pageFunc(${pagingInfo.firstPage-1})">◀</a>
                	</c:if>
                	<c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">
						<c:choose>
							<c:when test="${i==pagingInfo.currentPage }">
								<span class="colorBlue font-weight-bold" >${i }</span>
							</c:when>
							<c:otherwise>
								<span><a href="#" class="decoN colorGray" onclick="pageFunc(${i})">${i }</a></span>
							</c:otherwise>
						</c:choose>
                	</c:forEach>
                	<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
                		<a href="#" class="decoN colorBlue" onclick="pageFunc(${pagingInfo.lastPage+1})">▶</a>
                	</c:if>
                </div>	
                <div class="width500 margin0 marginT30" style="margin-center:550px;">
                	<form action="<c:url value='/agencyPage/myWriteList.do'/>" method="post" class="overflowH">
                		<select name="searchCondition" class="float-left form-control w-25">
                			<option value="title"
                				<c:if test="${param.searchCondition=='title' }">
                					selected="selected"
                				</c:if>
                			>제목</option>
                			<option value="content"
                				<c:if test="${param.searchCondition=='content' }">
                					selected="selected"
                				</c:if>
                			>내용</option>
                		</select>
                		<input type="text" name="searchKeyword" class="float-left form-control w-50" value="${param.searchKeyword }">
                		<input type="submit" value="검색" class="btn btn-info float-left marginL10">
                	</form>
                </div>	
		</div>
	</div>
</div>

<%@ include file="../inc/bottom.jsp" %>
