<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/find.css"/>

<script type="text/javascript">
	$(document).ready(function(){
		$('select[name="search1"]').change(function(){
			$('form[name=frmHid] input[name=searchCondition2]').val($('select[name=search1] option:selected').val());
			$('form[name=frmHid]').submit();
		});
	});
</script>

	<div class="subBg subBgNaco">
		<p>나코짜 목록</p>
		<div class="subBgBlack"></div>
	</div>
	<div class="container marginBottom100">
			<form name="frmHid" action="<c:url value='/nacojja/nacojjaList.do'/>" method="post">
				<input type="hidden" name="searchCondition2">
			</form>
			<div class="marginBottom20 overflowH pad10">
				<span class="colorGray float-left marginTop10">Showing 12 of 17 results</span>
				<form action="" method="post" class="colorGray form-inline float-right pad10">
					<select name="listCount" class="form-control colorGray marginR10">
						<option value="" class="colorGray">LIST</option>
						<option value="12" class="colorGray">12</option>
						<option value="16" class="colorGray">16</option>
						<option value="20" class="colorGray">20</option>
					</select>
				</form>
				<form action="<c:url value='/nacojja/nacojjaList.do'/>" method="post" class="colorGray form-inline float-right pad10">
					<select name="search1" class="form-control colorGray marginR10">
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
					<div class="listDv">
						<a href="#" class="decoN">
							<img class="listImg" alt="" src="${pageContext.request.contextPath }/img/${map['THUMB_IMG']}">
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
			
			<div class="margin0 width500">
				<form action="<c:url value='/nacojja/nacojjaList.do'/>" method="post" class="colorGray form-inline pad10">
					<input type="hidden" name="searchCondition2" value="${param.searchCondition2 }">
					<select name="searchCondition" class="form-control colorGray marginR10">
						<option value="title" class="colorGray">제목</option>
						<option value="countries" class="colorGray">나라</option>
						<option value="term" class="colorGray">기간</option>
					</select>
					<input type="text" class="form-control" name="searchKeyword">
					<input type="submit" value="검색" class="btn btn-primary marginL10">
				</form>
			</div>			
	</div>

<%@ include file="../inc/bottom.jsp"%>