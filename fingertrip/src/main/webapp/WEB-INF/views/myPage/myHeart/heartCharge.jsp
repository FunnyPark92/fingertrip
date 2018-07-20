<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css">


<section class="container board marginTop80 marginBottom80 minheight600">
	<script>
		$(document).ready(function(){
			$('#spinner').spinner();
		});
	</script>
	
	
	<!-- <form name="heartCharge"> -->
	<p>
	<label for="spinner">충전 갯수</label>
	<input id="spinner" name="value"/>
	</p>
</section>






<%@ include file="../../inc/bottom.jsp" %>