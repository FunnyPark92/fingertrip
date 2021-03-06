<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../inc/top.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/find.css"/>

<div class="container margin80">
	<div class="row">
		<!-- 서브메뉴 -->
        <div class="col-lg-3">
            <h3>마이페이지</h3>
            <div class="list-group">
                <a href="<c:url value='/agencyPage/bidList.do'/>" class="list-group-item active">입찰한 목록</a>
                <a href="<c:url value='/agencyPage/myWriteList.do'/>" class="list-group-item">내가 쓴 글</a>
            </div>
        </div>

        <!-- 서브컨텐츠 -->
        <div class="col-lg-9">
			<h3>입찰한 목록</h3><br>
			<table class="table table-condensed" style="text-align: center">
				<colgroup>
					<col style="width:15%" />
					<col style="width:20%" />
					<col style="width:20%" />
					<col style="width:15%" />
					<col style="width:15%" />
					<col style="width:20%" />
				</colgroup>
				<thead>
				  <tr>
				    <th scope="col">입찰번호</th>
				    <th scope="col">코스제목</th>
					<th scope="col">입찰가</th>
					<th scope="col">입찰시점</th>
					<th scope="col">입찰종료일</th>
					<th scope="col">입찰결과</th>
				  </tr>
				</thead>
				<tbody>
					<c:if test="${empty list }">
						<tr>
							<td colspan="6">입찰 내역이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty list }">
						<!-- 반복 시작 -->
						<c:forEach var="map" items="${list}">
							<tr>
								<td>${map['BID_NO'] }</td>
								<td>
									<a href="<c:url value='/nacojja/nacojjaDetail.do?courseNo=${map["COURSE_NO"] }'/>" style="color: #007bff">
										${map['TITLE'] }
									</a>
								</td>
								<td><fmt:formatNumber value="${map['BID_PRICE'] }" pattern="#,###" />원</td>
								<td>${map['BID_DAY'] }</td>
								<td style="color: red;">${map['BID_END_DAY'] }</td>
								<td>${map['BID_STATUS'] }</td>
							</tr>
						</c:forEach>
						<!-- 반복 끝 -->
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
</div>

<%@ include file="../inc/bottom.jsp" %>
