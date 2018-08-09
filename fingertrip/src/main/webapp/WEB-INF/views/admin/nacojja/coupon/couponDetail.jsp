<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/adminTop.jsp"%>
	<section class="admCenter marginTop40">
		<ul class="clearFix marginBottom40 lineGnb">
		    <li class="on"><a href="<c:url value='/admin/nacojja/coupon/couponList.do'/>">회원혜택관리</a></li>
		    <li><a href="<c:url value='/admin/nacojja/bid/bidList.do'/>">기업입찰조회</a></li>
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
	 			<th>여행날짜</th>
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
	 			<th>작성자</th>
	 			<td>
	 				ID: ${map['ID'] } / NAME: ${map['NAME'] } 
	 				<input type="hidden" value="${map['COURSE_NO'] }">
	 				<input type="submit" value="1+1쿠폰 제공">
	 			</td>
	 		</tr>	
		</table>
		
		<form action="" method="post">
			<input type="hidden" value="${map['COURSE_NO'] }">
			<table class="grayTh">
	            <tr>
	                <th scope="col" style="width:10%; text-align: center">회원번호</th>
	                <th scope="col" style="width:25%; text-align: center">이름</th>
	                <th scope="col" style="width:25%; text-align: center">아이디</th>
	                <th scope="col" style="width:40%; text-align: center">쿠폰</th>
	            </tr>
	            <!-- 반복 시작 -->
	            <c:forEach var="map2" items="${list}">
		            <tr style="text-align: center">
		                <td>${map2['MEMBER_NO']}</td>
		                <td>${map2['NAME']}</td>
		                <td>${map2['ID']}</td>
		                <td>${map2['COUPON_NAME']}</td>
		            </tr>
	            </c:forEach>
	            <!-- 반복 끝 -->
	        </table>
	        <div class="clearFix">
		        <div class="fRight">
			        <select name="searchCondition">
		     			<option value="0">쿠폰선택</option>
		     			<c:forEach var="vo" items="${cList }">
		     				<c:if test="${vo.couponNo>1 }">
			     				<option value="${vo.couponNo }"
			     				<c:if test="${param.searchCondition==vo.couponNo }">
			     					selected="selected"
			     				</c:if>
			     				>${vo.couponName }</option>
	     					</c:if>
		     			</c:forEach>
			     	</select>
		     		<input type="submit" value="쿠폰제공">
		     	</div>	
	     	</div>
	     		
		</form>
	</section>

