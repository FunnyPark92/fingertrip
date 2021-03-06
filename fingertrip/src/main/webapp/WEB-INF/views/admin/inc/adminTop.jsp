<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!DOCTYPE html >
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Finger Trip</title>
    
    <link href="${pageContext.request.contextPath}/css/normalize.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
    
    <%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css"> --%>
  <%--   <script src="${pageContext.request.contextPath }/js/jquery-ui.min.js"></script> --%>
     <script src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
     
     <!-- ckEditor -->
    <script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
    <!-- highCharts -->
    <script src="${pageContext.request.contextPath}/highcharts/highcharts.js"></script>
    <script src="${pageContext.request.contextPath}/highcharts/data.js"></script>
    <script src="${pageContext.request.contextPath}/highcharts/export-data.js"></script>
    <script src="${pageContext.request.contextPath}/highcharts/exporting.js"></script>
    <script src="${pageContext.request.contextPath}/highcharts/series-label.js"></script>
<style type="text/css">

</style>
     
     
</head>

<body>
	
 <h1>핑거트립 관리자 페이지</h1>
    <header>
        <nav class="admCenter">
        	<div class="subMenu">
        		<c:if test="${!empty sessionScope.adminid}">
	        		<a href="<c:url value='/admin/adminLogout.do'/>">로그아웃</a> ㅣ
        		</c:if>
        		<c:if test="${empty sessionScope.adminid}">
	        		<a href="<c:url value='/admin/adminLogout.do'/>">로그인</a> ㅣ
        		</c:if>
	        	<a href="<c:url value='/index.do'/>">홈으로</a>
        	</div>
        	
            <ul class="clearFix">
                <li><a href="<c:url value='/admin/nacojja/coupon/couponList.do'/>">나코짜관리</a></li>
                <li><a href="<c:url value='/admin/member/memberList.do'/>">개인회원관리</a></li>
                <li><a href="<c:url value='/admin/agency/agencyList.do'/>">기업회원관리</a></li>
                <%-- <li><a href="<c:url value='/admin/admin/adminList.do'/>">관리자회원관리</a></li> --%>
                <li><a href="<c:url value='/admin/cs/notice/noticeList.do'/>">공지사항</a></li>
                <li><a href="<c:url value='/cs/QnA/qna.do?aNo=1'/>">Q&amp;A</a></li>
                <li><a href="<c:url value='/admin/cs/faq/faqList.do'/>">FAQ</a></li>
            </ul>
        </nav>
    </header>