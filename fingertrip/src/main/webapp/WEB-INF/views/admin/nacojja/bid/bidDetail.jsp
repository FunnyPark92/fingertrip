<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/adminTop.jsp"%>
	<section class="admCenter marginTop40">
		<ul class="clearFix marginBottom40 lineGnb">
		    <li ><a href="#">회원혜택관리</a></li>
		    <li class="on"><a href="<c:url value='/admin/nacojja/bid/bidList.do'/>">기업입찰조회</a></li>
		    <li><a href="#">나코짜전체관리</a></li>
		    <li><a href="#">상품매출분석</a></li>
		</ul>
		<table class="grayBor">
			<tr>
	 			<th>제목</th>
	 			<td>
					${map['TITLE']}
				</td>
	 		</tr>
	 		<tr>
	 			<th>여행 기간</th>
	 			<td>
					<fmt:formatDate value="${map['START_DAY']}" pattern="yyyy-MM-dd"/> ~  
					<fmt:formatDate value="${map['END_DAY']}" pattern="yyyy-MM-dd"/> 
				</td>
	 		</tr>
	 		<tr>
	 			<th>하트수</th>
	 			<td>
					${map['HEART_COUNT']}
				</td>
	 		</tr>
	 		<tr>
	 			<th>진행상태</th>
	 			<td>
	 				${map['PROGRESS_STATUS']}
	 			</td>
	 		</tr>	
			<tr>
	 			<th>입찰 기간</th>
	 			<td>
	 				<fmt:formatDate value="${map['BID_START_DAY'] }" pattern="yyyy-MM-dd"/> ~  
					<fmt:formatDate value="${map['BID_END_DAY']}" pattern="yyyy-MM-dd"/> 
	 			</td>
	 		</tr>
		</table>
		
		<form action="" method="post">
			<table class="grayTh">
	            <tr>
	                <th scope="col" style="width:5%; text-align: center"><input type="checkbox" name="chkAll"/></th>
	                <th scope="col" style="width:15%; text-align: center">여행사</th>
	                <th scope="col" style="width:10%; text-align: center">입찰가</th>
	                <th scope="col" style="width:13%; text-align: center">입찰시점</th>
	                <th scope="col" style="width:13%; text-align: center">여행출발일1</th>
	                <th scope="col" style="width:13%; text-align: center">여행출발일2</th>
	                <th scope="col" style="width:13%; text-align: center">여행출발일3</th>
	                <th scope="col" style="width:13%; text-align: center">여행출발일4</th>
	                <th scope="col" style="width:5%; text-align: center">낙찰</th>
	            </tr>
	            <!-- 반복 시작 -->
	            <c:forEach var="map2" items="${list}">
		            <tr style="text-align: center">
		                <td><input type="checkbox" name="chk" value="${map2['BID_NO']}"></td>
		                <td>${map2['NAME']}</td>
		                <td><fmt:formatNumber value="${map2['BID_PRICE']}" pattern="#,###"/> 원</td>
		                <td><fmt:formatDate value="${map2['BID_DAY']}" pattern="yyyy-MM-dd"/></td>
		                <td><fmt:formatDate value="${map2['TRIP_START_DAY1']}" pattern="yyyy-MM-dd"/></td>
		                <td><fmt:formatDate value="${map2['TRIP_START_DAY2']}" pattern="yyyy-MM-dd"/></td>
		                <td><fmt:formatDate value="${map2['TRIP_START_DAY3']}" pattern="yyyy-MM-dd"/></td>
		                <td><fmt:formatDate value="${map2['TRIP_START_DAY4']}" pattern="yyyy-MM-dd"/></td>
		                <td>
			                <c:if test="${!empty map2['WIN_BID_NO'] }">
			                	낙찰
			                </c:if>
		               	</td>
		            </tr>
	            </c:forEach>
	            <!-- 반복 끝 -->
	        </table>
	        
	        <c:if test="${!empty map2['WIN_BID_NO'] }">
		        <div class="aWrap fRight">
		        	<input type="submit" class="darkBorder" value="입찰 선정">
		        </div>
	        </c:if>
		</form>
	</section>

