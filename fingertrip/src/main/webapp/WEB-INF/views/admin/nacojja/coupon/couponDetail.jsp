<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/adminTop.jsp"%>
<script>
	$(document).ready(function(){
		$('form[name=frmCp]').submit(function(){
			var cpNo=$('select[name=searchCondition] option:selected').val();
			$('form[name=frmCp] input[name=couponNo]').val(cpNo);
			this.submit();
		});
	});
</script>
	<section class="admCenter marginTop40">
		<ul class="clearFix marginBottom40 lineGnb">
		    <li class="on"><a href="<c:url value='/admin/nacojja/coupon/couponList.do'/>">회원혜택관리</a></li>
		    <li><a href="<c:url value='/admin/nacojja/bid/bidList.do'/>">기업입찰조회</a></li>
		    <li><a href="<c:url value='/admin/nacojja/nacojjaList.do'/>">나코짜전체관리</a></li>
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
			<c:forEach var="map1" items="${list1 }">
	 		<tr>
	 			<th>작성자</th>
	 			<td>
 					NAME: ${map1['NAME'] } / ID: ${map1['ID']}
	 			</td>
	 		</tr>	
	 		<tr>
	 			<th>작성자 쿠폰</th>
	 			<td>
		 			<form action="<c:url value='/admin/nacojja/coupon/offerCoupon.do'/>" method="post">
		 				<input name="courseNo" type="hidden" value="${map1['COURSE_NO'] }">
		 				<input name="memberNo" type="hidden" value="${map1['MEMBER_NO'] }">
		 				<input name="couponNo" type="hidden" value="1">
		 				<c:if test="${empty map1['COUPON_NAME'] }">
		 					<input type="submit" value="1+1쿠폰 제공">
						</c:if>
		 				<c:if test="${!empty map1['COUPON_NAME'] }">
		 					${map1['COUPON_NAME'] } 제공 완료
						</c:if>
					</form>
	 			</td>
	 		</tr>	
			</c:forEach>
		</table>
		
		<form name="frmCp" action="<c:url value='/admin/nacojja/coupon/offerCoupon.do'/>" method="post">
			<table class="grayTh">
	            <tr>
	                <th scope="col" style="width:10%; text-align: center">회원번호</th>
	                <th scope="col" style="width:25%; text-align: center">이름</th>
	                <th scope="col" style="width:25%; text-align: center">아이디</th>
	                <th scope="col" style="width:40%; text-align: center">쿠폰</th>
	            </tr>
	            <!-- 반복 시작 -->
	            <c:set var="couponName"/>
	            <c:forEach var="map2" items="${list2}">
	            	<input name="courseNo" type="hidden" value="${map2['COURSE_NO'] }">
	            	<input name="memberNo" type="hidden" value="${map2['MEMBER_NO'] }">
	            	<input name="couponNo" type="hidden">
		            <tr style="text-align: center">
		                <td>${map2['MEMBER_NO']}</td>
		                <td>${map2['NAME']}</td>
		                <td>${map2['ID']}</td>
		                <td>${map2['COUPON_NAME']}  제공 완료</td>
		            </tr>
		            <c:set var="couponName" value="${map2['COUPON_NAME']}"/>
	            </c:forEach>
	            <!-- 반복 끝 -->
	        </table>
	        
	        <div class="clearFix">
		        <div class="fRight">
			        <c:if test="${empty couponName }">
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
		     		</c:if>
		     	</div>	
	     	</div>
		</form>
	</section>

