<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/adminTop.jsp"%>
<script type="text/javascript">
	function approval(event)
	{	
		if(confirm(['코스를 삭제할 경우 되돌릴 수 없습니다. 그래도 진행하시겠습니까?'])){
			location.href="<c:url value='삭제하는 곳으로 보내야 겄지?memberNo=${vo.memberNo}'/>";
			return true;
		}else{
			return false;
		}		
	}
</script>
<section class="admCenter marginTop40">
      	<h2 class="admCenter marginTop40" style="text-align: center">나코짜 상세보기</h2>
	 	<table class="grayBor">
	 		<tr>
	 			<th>나코짜번호</th>
	 			<td>${map['COURSE_NO']}</td>
	 		</tr>	
	 		<tr>
	 			<th>작성자</th>
	 			<td>${map['NAME']}</td>
	 		</tr>	
	 		<tr>
	 			<th>제목</th>
	 			<td>${map['TITLE']}</td>
	 		</tr>
	 		<tr>
	 			<th>여행기간</th>
	 			<td>
	 				<fmt:formatDate value="${map['START_DAY']}" pattern="yyyy-MM-dd"/> ~  
					<fmt:formatDate value="${map['END_DAY']}" pattern="yyyy-MM-dd"/> 
	 			</td>
	 		</tr>
	 		<tr>
	 			<th>대표이미지</th>
	 			<td>
	 			<c:if test="${!empty listImg }">
				<c:set value="0" var="i"/>
					<c:forEach var="img" items="${listImg}">
						<img alt="" src="${pageContext.request.contextPath }/upload_images/${img}" class="maxH500">
						<c:set value="${i+1 }" var="i"/>
					</c:forEach>
				</c:if>
	 			</td>
	 		</tr>
	 		<tr>
	 			<th>하트수</th>
	 			<td>${map['HEART_COUNT']}</td>
	 		</tr>
	 		<tr>
	 			<th>올린날짜</th>
	 			<td>${map['REGDATE']}</td>
	 		</tr>
	 		<tr>
	 			<th>진행상태</th>
	 			<td>${map['PROGRESS_STATUS']}</td>
	 		</tr>
	 		 <tr>
	 			<th>주요여행지 목록</th>
	 			<td>
	 			<c:if test="${!empty list}">
	 				<c:forEach var="vo" items="${list}">
	 				${vo.travelSpot}(${vo.spotAddress})
	 				<br>
	 				</c:forEach>
	 			</c:if>
	 			</td>
	 		</tr>
	 	</table>
	 	<div class="fRight aWrap">
	 		<a class="darkBorder" href="<c:url value='/admin/nacojja/nacojjaList.do'/>">목록</a>
	 		<a id="del" class="darkGray" onclick="approval()" href="#">삭제</a>
	 	</div>
</section>
</body>
</html>