<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<style type="text/css">
	.heartC{
	    border:2px solid #ddd;
		margin-top:60px;
		padding: 30xp;
	}
	.heartImg{
		margin: 20px 0 20px 20px;
		border:2px solid #ddd;
		width: 152px;
		height: 121px;
		float: left;
	}
	.heartText{
		margin: 20px 20px 20px 0;
		border:2px solid #ddd;
		float: left;
		width:360px;
		height: 121px;
		border-left: none;
	}
	.heartEtc{
	   	margin: 20px 20px 20px 0;
		border:2px solid #ddd;
		float: left;
		width:910px;
		height: 120px;
		border-left: none;
	}
	.divA{position: relative;
			}
	.btnA{position: absolute;}

</style>


	



<section class="minheight600">
	<div class="container heartC">
		<h1 class="text-center">하트 충전하기</h1>
		<hr>
	
		<div class="heartImg">
			<img alt="하트이미지" src="<c:url value='/img/heart2-s.PNG'/> ">
		</div>
		<div class="heartText text-center divA">
			<span>하트 <strong>10</strong>개</span><button type="button" class="btn btn-primary btnA">구매하기</button>
		 </div>
		
		<div class="heartImg">
			<img alt="하트이미지" src="<c:url value='/img/heart2-s.PNG'/>">
		</div>
		<div class="heartText text-center">하트 20개</div>
		<div class="heartImg">
			<img alt="하트이미지" src="<c:url value='/img/heart2-s.PNG'/> ">
		</div>
		<div class="heartText text-center">하트 30개</div>
		<div class="heartImg">
			<img alt="하트이미지" src="<c:url value='/img/heart2-s.PNG'/> ">
		</div>
		<div class="heartText text-center">하트 40개</div>
		<div class="heartImg">
			<img alt="하트이미지" src="<c:url value='/img/heart2-s.PNG'/> ">
		</div>
		<div class="heartText text-center">하트 50개</div>
		<div class="heartImg">
			<img alt="하트이미지" src="<c:url value='/img/heart2-s.PNG'/> ">
		</div>
		<div class="heartText text-center">하트 100개</div>
		<div class="heartImg">
			<img alt="하트이미지" src="<c:url value='/img/heart2-s.PNG'/> ">
		</div>
		<div class="heartEtc text-center">기타</div>
		<div style="clear: both;"></div>

    </div>
</section>







<%@ include file="../../inc/bottom.jsp" %>





