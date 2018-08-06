<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/find.css"/>

<script type="text/javascript">
	function pageFunc(currentPage){
		frmHid.currentPage.value=currentPage;
		frmHid.submit();
	}
</script>

<section class="container board marginTop80 marginBottom80 minheight600">
        <div class="row">

           <!-- 서브메뉴 -->
            <div class="col-lg-3">
                <h3>고객센터</h3>
                <div class="list-group">
                    <a href="<c:url value='/cs/notice/noticeList.do'/> " class="list-group-item active">공지사항</a>
                    <a href="<c:url value='/cs/QnA/qna.do'/> " class="list-group-item">Q&amp;A</a>
                    <a href="<c:url value='/cs/faq/faq.do'/> " class="list-group-item">FAQ</a>
                </div>
            </div>
    
           <!-- 서브컨텐츠 -->
            <div class="col-lg-9">
            	<div>
            		<form name="frmHid" action="<c:url value='/cs/notice/noticeList.do'/>" method="post">
	            		<input type="hidden" name="currentPage">
	            		<input type="hidden" name="searchCondition" value="${param.searchCondition }">
	            		<input type="hidden" name="searchKeyword" value="${param.searchKeyword }">
            		</form>
            	</div>
            	
                <table class="table table-hover tableBorder">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col" style="width:10%" class="text-center">번호</th>
                            <th scope="col" style="width:50%" class="text-center">제목</th>
                            <th scope="col" style="width:10%" class="text-center">조회수</th>
                            <th scope="col" style="width:30%" class="text-center">등록일</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:if test="${!empty list}">
                    	<form name="frmDel" action="<c:url value='/cs/notice/deleteMulti.do'/>" method="post">
	                    	<!-- 공지사항 반복문 시작 -->
		                    <c:forEach var="map" items="${list}">
		                        <tr>
		                            <td scope="row" class="text-center">${map['NOTICE_NO']}</td>
		                            <td>
			                            <a href="<c:url value='/cs/notice/countUpdate.do?noticeNo=${map["NOTICE_NO"]}'/>">
				                            <!--제목이 긴 경우 일부만 보여주기 -->
				                            <c:if test="${fn:length(map['TITLE'])>25}">
				                            	${fn:substring(map['TITLE'],0,25) }...
				                            </c:if>
				                            <c:if test="${fn:length(map['TITLE'])<=25}">
				                            	${map['TITLE']}
				                            </c:if>
			                            </a>
		                            </td>
		                            <td class="text-center">${map['READ_COUNT'] }</td>
		                            <td class="text-center"><fmt:formatDate value="${map['REG_DATE']  }" pattern="yyyy-MM-dd"/></td>
		                        </tr>
		                     </c:forEach>
	                     </form>
                     </c:if>
                    </tbody>
                </table>
                <div class="margin0 width150 marginT30">
                	<c:if test="${pagingInfo.firstPage>1 }">
                		<a href="#" class="decoN colorGray" onclick="pageFunc(${pagingInfo.firstPage-1})">◀</a>
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
                		<a href="#" class="decoN colorGray" onclick="pageFunc(${pagingInfo.lastPage+1})">▶</a>
                	</c:if>
	           	</div>
                <div class="width500 margin0 marginT30">
                	<form action="<c:url value='/cs/notice/noticeList.do'/>" method="post" class="overflowH">
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
    </section>

 <%@ include file="../../inc/bottom.jsp"%>