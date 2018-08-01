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
	 			<td>1</td>
	 		</tr>
	 		<tr>
	 			<th>상호명</th>
	 			<td>하나투어</td>
	 		</tr>
	 		<tr>
	 			<th>ID</th>
	 			<td>hana</td>
	 		</tr>
	 		<tr>
	 			<th>비밀번호</th>
	 			<td>qwe1234</td>
	 		</tr>
	 		<tr>
	 			<th>전화번호</th>
	 			<td>02-111-1111</td>
	 		</tr>
	 		<tr>
	 			<th>사업자 등록번호</th>
	 			<td>123-12-12345</td>
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