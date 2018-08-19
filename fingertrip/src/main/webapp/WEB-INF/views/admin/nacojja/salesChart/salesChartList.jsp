<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/adminTop.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/find.css"/>
<section class="admCenter marginTop40" style="text-align: center">
	<ul class="clearFix marginBottom40 lineGnb">
	    <li><a href="<c:url value='/admin/nacojja/coupon/couponList.do'/>">회원혜택관리</a></li>
	    <li><a href="<c:url value='/admin/nacojja/bid/bidList.do'/>">기업입찰조회</a></li>
	    <li><a href="<c:url value='/admin/nacojja/nacojjaList.do'/>">나코짜전체관리</a></li>
	    <li class="on"><a href="<c:url value='/admin/salesChart.do'/>">상품매출분석</a></li>
	</ul>
	
			<div id="container" style="width:100%; height:400px;" class="marginBottom100"></div>
        	<table id="datatable" class="marginBottom70 width350 grayTh" style="display:none;">
	 		<thead>
		 		<tr>
		 			<th></th>
		 			<th>월별 결제수익 현황</th>
		 		</tr>
	 		</thead>
	 		<tbody>
	 			<c:set var="i" value="0"/>
	 			<c:forEach items="${listR }" var="vo">
		 			<tr>
		 				<th>${i+1}월</th>
		 				<td>${listC[i] }</td>
		 			</tr>
		 			<c:set var="i" value="${i+1}"/>
	 			</c:forEach>
	 		</tbody>
	 	</table>
     
	 	<div id="container2" class="marginBottom100"></div>

	 	<script>
	 	Highcharts.chart('container', {
	 	    data: {
	 	        table: 'datatable'
	 	    },
	 	    chart: {
	 	        type: 'column'
	 	    },
	 	    title: {
	 	        text: '월별 매출 통계'
	 	    },
	 	    yAxis: {
	 	        allowDecimals: false,
	 	        title: {
	 	            text: '매출금액'
	 	        }
	 	    },
	 	    tooltip: {
	 	        formatter: function () {
	 	            return '<b>' + this.point.name + '</b><br/>' +
	 	                this.point.y + '원';
	 	        }
	 	    }
	 	});   
   	</script>
    </section>
</body>
</html>