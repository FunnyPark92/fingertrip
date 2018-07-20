<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../../inc/top.jsp" %>

<div class="container">
<h2>쿠폰 내역</h2><br>
<table class="box2">
	<caption>쿠폰 내역</caption>
	<colgroup>
		<col style="width:9%" />
		<col style="width:12%" />
		<col style="width:40%" />
		<col style="width:12%" />
		<col style="width:12%" />	
		<col style="width:14%" />
	</colgroup>
	<thead>
	  <tr>
	    <th scope="col">쿠폰번호</th>
		<th scope="col">쿠폰이름</th>
		<th scope="col">기한?</th>
		<th scope="col">???</th>
		<th scope="col">???</th>
		<th scope="col">???</th>
	  </tr>
	</thead> 
	<tbody>
		<c:if test="${empty list }">
			<tr>
				<td colspan="6">쿠폰 보유 내역이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${!empty list }">
			<!-- 반복 시작 -->
			
			<!-- 반복 끝 -->
		</c:if>
	</tbody>
</table>
</div>

<%@ include file="../../inc/bottom.jsp" %>
