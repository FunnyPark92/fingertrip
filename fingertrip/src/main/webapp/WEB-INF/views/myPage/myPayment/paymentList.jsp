<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../../inc/top.jsp" %>

<h2>결제 내역</h2><br>

<div class="divList">
<table class="box2">
	<caption>결제 내역</caption>
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
	    <th scope="col">결제번호</th>
		<th scope="col">결제일자</th>
		<th scope="col">코스명</th>
		<th scope="col">결제금액</th>
		<th scope="col">???</th>
		<th scope="col">???</th>
	  </tr>
	</thead> 
	<tbody>
		<c:if test="${empty list }">
			<tr>
				<td colspan="6">해당 기간의 결제 내역이 없습니다.</td>
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
