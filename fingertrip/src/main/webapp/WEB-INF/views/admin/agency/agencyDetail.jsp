<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>
<section class="admCenter marginTop40">
        <ul class="clearFix marginBottom40 lineGnb">
            <li class="on"><a href="<c:url value='/admin/agency/agencyList.do'/>">기업회원조회</a></li>
            <li><a href="<c:url value='/admin/agency/agencyWrite.do'/>">기업회원가입</a></li>
        </ul>


	 	<table class="grayBor">
	 		<tr>
	 			<th>번호</th>
	 			<td>${vo.travelAgencyNo }</td>
	 		</tr>
	 		<tr>
	 			<th>상호명</th>
	 			<td>${vo.name }</td>
	 		</tr>
	 		<tr>
	 			<th>ID</th>
	 			<td>${vo.id }</td>
	 		</tr>
	 		<tr>
	 			<th>비밀번호</th>
	 			<td>${vo.password }</td>
	 		</tr>
	 		<tr>
	 			<th>전화번호</th>
	 			<td>${vo.hp }</td>
	 		</tr>
	 		<tr>
	 			<th>사업자 등록번호</th>
	 			<td>${vo.licenseNo}</td>
	 		</tr>
	 	</table>
	 	
	 	<div class="fRight aWrap">
	 		<a class="darkBorder" href="<c:url value='/admin/agency/agencyList.do'/>">목록</a>
	 		<a class="lightGray" href="<c:url value='/admin/agency/agencyEdit.do'/>">수정</a>
	 		<a class="darkGray" href="">삭제</a>
	 	</div>
</section>


</body>
</html>