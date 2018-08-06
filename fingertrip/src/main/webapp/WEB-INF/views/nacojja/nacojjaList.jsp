<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/find.css"/>

<script type="text/javascript">
	$(document).ready(function(){
		$('select[name="search2"]').change(function(){
			$('form[name=frmSearch2] input[name=searchCondition2]').val($('select[name=search2] option:selected').val());
			$('form[name=frmSearch2] input[name=recordCountPerPage]').val($('select[name=recordCountPerPage] option:selected').val());
			$('form[name=frmSearch2]').submit();
		});
		$('select[name="recordCountPerPage"]').change(function(){
			$('form[name=frmSearch2] input[name=searchCondition2]').val($('select[name=search2] option:selected').val());
			$('form[name=frmSearch2] input[name=recordCountPerPage]').val($('select[name=recordCountPerPage] option:selected').val());
			$('form[name=frmSearch2]').submit();
		});
	});
	
	function pageFunc(currentPage){
		frmPage.currentPage.value=currentPage;
		frmPage.recordCountPerPage.value=frmSearch1.recordCountPerPage.value;
		frmPage.submit();
	}
</script>

	<div class="subBg subBgNaco">
		<p>나코짜 목록</p>
		<div class="subBgBlack"></div>
	</div>
	<div class="container marginBottom100">
			<form name="frmPage" action="<c:url value='/nacojja/nacojjaList.do'/>" method="post">
				<input type="hidden" name="currentPage">
				<input type="hidden" name="searchCondition2" value=${param.searchCondition2 }>
				<input type="hidden" name="recordCountPerPage" value=${param.recordCountPerPage }>
				<input type="hidden" name="searchCondition" value="${param.searchCondition }">
				<input type="hidden" name="searchKeyword" value="${param.searchKeyword }">
			</form>
			<form name="frmSearch2" action="<c:url value='/nacojja/nacojjaList.do'/>" method="post">
				<input type="hidden" name="searchCondition2" value=${param.searchCondition2 }>
				<input type="hidden" name="recordCountPerPage" value=${param.recordCountPerPage }>
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
				<form name="frmSearch1" class="colorGray form-inline float-right pad10">
					<select name="recordCountPerPage" class="form-control colorGray marginR10">
						<option value="0" class="colorGray" selected="selected">LIST</option>
						<option value="16" class="colorGray"
							<c:if test="${param.recordCountPerPage==16}">
								selected="selected"	
							</c:if>
						>16</option>
						<option value="20" class="colorGray"
							<c:if test="${param.recordCountPerPage==20}">
								selected="selected"	
							</c:if>
						>20</option>
					</select>
				</form>
				<div class="colorGray form-inline float-right pad10">
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
				</div>
			</div>
			
			<c:if test="${!empty list}">
				<c:forEach var="map" items="${list }" >
					<div class="listDv">
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
			
			<div class="margin0 width350">
				<form action="<c:url value='/nacojja/nacojjaList.do'/>" method="post" class="colorGray form-inline">
					<input type="hidden" value="${param.searchCondition2 }" name="searchCondition2">
					<input type="hidden" value="${param.recordCountPerPage }" name="recordCountPerPage">
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

<%@ include file="../inc/bottom.jsp"%>