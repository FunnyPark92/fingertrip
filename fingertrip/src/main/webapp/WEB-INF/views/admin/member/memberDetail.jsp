<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>
<script type="text/javascript">
	function approval(event)
	{	
		if(confirm(['개인회원을 탈퇴시킬경우 되돌릴 수 없습니다. 그래도 진행하시겠습니까?'])){
			location.href="<c:url value='/admin/member/memberdelete.do?memberNo=${vo.memberNo}'/>";
			return true;
		}else{
			return false;
		}		
	}
</script>

<section class="admCenter marginTop40">
		<c:if test="${!empty list}">
      	<h2 class="admCenter marginTop40" style="text-align: center">탈퇴회원 상세보기</h2>
      	</c:if>
      	<c:if test="${empty list}">
      	<h2 class="admCenter marginTop40" style="text-align: center">일반 회원 상세보기</h2>
      	</c:if>
      	
	 	<table class="grayBor">
	 		<c:if test="${!empty list}">
			<c:forEach var="map" items="${list }" >
	 		<tr style="color:red">
	 			<th style="color:red">탈퇴일시</th>
	 			<td>${vo.outDate}</td>
	 		</tr>	
	 		<tr style="color:red">
	 			<th style="color:red">탈퇴사유</th>
	 			<td>${map['OUT_REASON']}</td>
	 		</tr>	
	 		</c:forEach>
	 		</c:if>		
	 		<tr>
	 			<th>회원번호</th>
	 			<td>${vo.memberNo }</td>
	 		</tr>
	 		<tr>
	 			<th>회원이름</th>
	 			<td>${vo.name }</td>
	 		</tr>
	 		<tr>
	 			<th>ID</th>
	 			<td>${vo.id }</td>
	 		</tr>
	 		<tr>
	 			<th>성별</th>
	 			<td>${vo.gender}</td>
	 		</tr>
	 		
	 		<tr>
	 			<th>비밀번호</th>
	 			<td>${vo.password }</td>
	 		</tr>
	 		<tr>
	 			<th>전화번호</th>
	 			<td>${vo.hp1}-${vo.hp2}-${vo.hp3}</td>
	 		</tr>
	 		<tr>
	 			<th>이메일</th>
	 			<td>${vo.email1}@${vo.email2}</td>
	 		</tr>
	 		<tr>
	 			<th>우편번호</th>
	 			<td>${vo.zipcode}</td>
	 		</tr>
	 		<tr>
	 			<th>주소</th>
	 			<td>${vo.address}</td>
	 		</tr>
	 		<tr>
	 			<th>상세주소</th>
	 			<td>${vo.addressDetail}</td>
	 		</tr>
	 		<tr>
	 			<th>하트보유수</th>
	 			<td>${vo.heartCount}</td>
	 		</tr>
	 		<tr>
	 			<th>메일수신동의여부</th>
	 			<td>${vo.mailAgreement}</td>
	 		</tr>
	 		<tr>
	 			<th>최근접속시간</th>
	 			<td>${vo.joinDate}</td>
	 		</tr>	
	 	</table>
	 	<div class="fRight aWrap">
	 		<c:if test="${empty list}">
	 		<a class="darkBorder" href="<c:url value='/admin/member/memberList.do'/>">목록</a>
	 		<a id="del" class="darkGray" onclick="approval()" href="#">탈퇴</a>
	 		</c:if>
	 		<c:if test="${!empty list}">
	 		<a class="darkBorder" href="<c:url value='/admin/member/deleteMemberList.do'/>">목록</a>
	 		</c:if>
	 	</div>
</section>
</body>
</html>