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
                <a href="<c:url value='/agencyPage/bidList.do'/>" class="list-group-item">입찰한 목록</a>
                <a href="<c:url value='/agencyPage/myWriteList.do'/>" class="list-group-item active">내가 쓴 글</a>
            </div>
        </div>
        <!-- 서브컨텐츠 -->
        <div class="col-lg-9">
			<h3>내가 쓴 글</h3><br>
			<table class="table table-condensed" style="text-align: center">
				<colgroup>
					<col style="width:11%" />
					<col style="width:39%" />
					<col style="width:35%" />
					<col style="width:15%" />
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
			
				</tbody>
			</table>
		</div>
	</div>
</div>

<%@ include file="../inc/bottom.jsp" %>
