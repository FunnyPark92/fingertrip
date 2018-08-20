<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/find.css"/>
<section class="admCenter marginTop40" style="text-align: center">
	<ul class="clearFix marginBottom40 lineGnb">
	    <li><a href="<c:url value='/admin/member/memberList.do'/>">개인회원조회</a></li>
	    <li class="on"><a href="<c:url value='/admin/member/memberChart.do'/>">개인회원분석</a></li>
	</ul>

		<div id="container3" class="marginBottom100"></div>
	 	<div id="container2" class="marginBottom100"></div>
	 	<div id="container" style="width:100%; height:400px;" class="marginBottom100"></div>
	 	
	 	<table id="datatable" class="marginBottom70 width350 grayTh" style="display:none;">
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
	 	        text: '회원 탈퇴 원인 분석'
	 	    },
	 	    yAxis: {
	 	        allowDecimals: false,
	 	        title: {
	 	            text: '탈퇴회원 수'
	 	        }
	 	    },
	 	    tooltip: {
	 	        formatter: function () {
	 	            return '<b>' + this.point.name + '</b><br/>' +
	 	                this.point.y + '명';
	 	        }
	 	    }
	 	});
	 	
	 	var chart = Highcharts.chart('container2', {
	 	    chart: {
	 	        type: 'column'
	 	    },
	 	    title: {
	 	        text: '회원 수 비교 분석'
	 	    },
	 	    legend: {
	 	        align: 'right',
	 	        verticalAlign: 'middle',
	 	        layout: 'vertical'
	 	    },
	 	    xAxis: {
	 	        categories: ['회원 수 비교'],
	 	        labels: {
	 	            x: -10
	 	        }
	 	    },
	 	    yAxis: {
	 	        allowDecimals: false,
	 	        title: {
	 	            text: '회원 수'
	 	        }
	 	    },
	 	    series: [{
	 	        name: '전체 회원 수',
	 	        data: [${cntAll}]
	 	    }, {
	 	        name: '이번 달 신규 회원 수',
	 	        data: [${cntJoin}]
	 	    }, {
	 	        name: '이번 달 탈퇴 회원 수',
	 	        data: [${cntOut}]
	 	    }],
	 	});
	 	
	 	Highcharts.chart('container3', {
	 	    title: {
	 	        text: '일주일간 방문자 수 비교'
	 	    },
	 	    yAxis: {
	 	        title: {
	 	            text: '방문자 수'
	 	        }
	 	    },
	 	    legend: {
	 	        layout: 'vertical',
	 	        align: 'right',
	 	        verticalAlign: 'middle'
	 	    },
	 	   xAxis: {
	 	        categories: [
	 	        	<c:forEach items="${listV }" var="vo" varStatus="status">
	 	        		<fmt:formatDate value="${vo.visitorToday}" pattern="yyyy-MM-dd"/>
		 		 		<c:if test="${!status.last }">,</c:if>
	 		 		</c:forEach>
	 	        ]
	 	    },
	 	    series: [{
	 	        name: '방문자 수',
	 	        data: [
	 	        	<c:forEach items="${listV }" var="vo" varStatus="status">
		 		 		${vo.visitorCount}
		 		 		<c:if test="${!status.last }">,</c:if>
	 		 		</c:forEach>
	 	        ]
	 	    }],
	 	});
	 	</script>
	 	
    </section>
</body>
</html>
