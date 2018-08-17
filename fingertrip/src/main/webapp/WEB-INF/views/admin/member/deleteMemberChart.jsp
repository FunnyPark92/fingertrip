<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/find.css"/>
<section class="admCenter marginTop40" style="text-align: center">
	<ul class="clearFix marginBottom40 lineGnb">
	    <li><a href="<c:url value='/admin/member/deleteMemberList.do'/>">탈퇴회원조회</a></li>
	    <li class="on"><a href="<c:url value='/admin/member/deleteMemberChart.do'/>">탈퇴회원분석</a></li>
	</ul>
	 	
	 	<div id="container" style="width:100%; height:400px;"></div>
	 	
	 	<table id="datatable" class="marginBottom70 width350 grayTh">
	 		<thead>
		 		<tr>
		 			<th></th>
		 			<th>탈퇴회원</th>
		 		</tr>
	 		</thead>
	 		<tbody>
	 			<c:set var="i" value="0"/>
	 			<c:forEach items="${listR }" var="vo">
		 			<tr>
		 				<th>${vo.outReason }</th>
		 				<td>${listC[i] }</td>
		 			</tr>
		 			<c:set var="i" value="${i+1}"/>
	 			</c:forEach>
	 		</tbody>
	 	</table>
	 	
	 	<script>
	 	Highcharts.chart('container', {
	 	    data: {
	 	        table: 'datatable'
	 	    },
	 	    chart: {
	 	        type: 'column'
	 	    },
	 	    title: {
	 	        text: '회원탈퇴분석'
	 	    },
	 	    yAxis: {
	 	        allowDecimals: false,
	 	        title: {
	 	            text: '탈퇴회원수'
	 	        }
	 	    },
	 	    tooltip: {
	 	        formatter: function () {
	 	            return '<b>' + this.point.name + '</b><br/>' +
	 	                this.point.y + '명';
	 	        }
	 	    }
	 	});
	 	
	 	</script>
    </section>
</body>
</html>
