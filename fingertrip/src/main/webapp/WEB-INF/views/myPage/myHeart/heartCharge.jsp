<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/heartCharge.css">


	



	<section class="minheight600">
		<div class="container heartC">
			<h1 class="text-center">하트 충전하기</h1>
			<hr>
		
			<div class="heartImg">
				<img alt="하트이미지" src="<c:url value='/img/heart2-s.PNG'/> ">
			</div>
			<div class="heartText text-center divA">
			<div class="area text-right">
					<span>하트 <strong>1</strong>개</span><br>
					<span class="price">1,100원</span>
				</div>
				<button type="button" class="btn btn-primary btnA btn-lg">구매하기</button>
			 </div>
			
			<div class="heartImg">
				<img alt="하트이미지" src="<c:url value='/img/heart2-s.PNG'/>">
			</div>
			<div class="heartText text-center divA">
			<div class="area text-right">
					<span>하트 <strong>3</strong>개</span><br>
					<span class="price">3,200원</span>
				</div>
				<button type="button" class="btn btn-primary btnA btn-lg">구매하기</button>
			 </div>
			<div class="heartImg">
				<img alt="하트이미지" src="<c:url value='/img/heart2-s.PNG'/> ">
			</div>
			<div class="heartText text-center divA">
			<div class="area text-right">
					<span>하트 <strong>5</strong>개</span><br>
					<span class="price">5,500원</span>
				</div>
				<button type="button" class="btn btn-primary btnA btn-lg">구매하기</button>
			 </div>
			<div class="heartImg">
				<img alt="하트이미지" src="<c:url value='/img/heart2-s.PNG'/> ">
			</div>
			<div class="heartText text-center divA">
			<div class="area text-right">
					<span>하트 <strong>10</strong>개</span><br>
					<span class="price">10,000원</span>
				</div>
				<button type="button" class="btn btn-primary btnA btn-lg">구매하기</button>
			 </div>
			<div class="heartImg">
				<img alt="하트이미지" src="<c:url value='/img/heart2-s.PNG'/> ">
			</div>
			<div class="heartText text-center divA">
				<div class="area text-right">
					<span>하트 <strong>30</strong>개</span><br>
					<span class="price">30,000원</span>
				</div>
				<button type="button" class="btn btn-primary btnA btn-lg">구매하기</button>
			 </div>
			<div class="heartImg">
				<img alt="하트이미지" src="<c:url value='/img/heart2-s.PNG'/> ">
			</div>
			<div class="heartText text-center divA">
				<div class="area text-right">
					<span>하트 <strong>50</strong>개</span><br>
					<span class="price">50,000원</span>
				</div>
				<button type="button" class="btn btn-primary btnA btn-lg">구매하기</button>
			 </div>
			<div class="heartImg">
				<img alt="하트이미지" src="<c:url value='/img/heart2-s.PNG'/> ">
			</div>
			<div class="heartEtc divA">
				<div class="areaEtc text-right">
					<span class="etcSpan">기타 : &nbsp </span> <input type="text" style="dispaly:inline-block;" class="etcInput">
					<button type="button" class="btn btn-info btn-sm etcBtn1">1 개</button>
				</div>
				<div class="etcBtnWrap">
					<button type="button" class="btn btn-info btn-sm etcBtn2">3 개</button>
					<button type="button" class="btn btn-info btn-sm etcBtn2">5 개</button>
					<button type="button" class="btn btn-info btn-sm etcBtn2">10 개</button>
					<button type="button" class="btn btn-info btn-sm etcBtn2">50 개</button>
				</div>
				<button type="button" class="btn btn-danger btn-lg etcBtn">구매하기</button>
				<span class="spanCharge">결제 금액 :</span>
			</div>
				
			<div style="clear: both;"></div>
	
	    </div>
	</section>






<%@ include file="../../inc/bottom.jsp" %>





