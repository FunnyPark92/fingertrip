<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/heartChargeC.css">

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var IMP = window.IMP;
		IMP.init('imp72373641');
		
		var price=0;
		$('.btnC').each(function(idx, item){
			$(this).click(function(){
				price += $(this).val()*1;
				$('#resultCharge').val(price);
				$('#payment').text(price * 1100 + " 원");
			});
		});
		
		$(".btn").click(function(){
			//alert($(this).prev().val());
			//alert("기타: " + $("#resultCharge").val() * 1100);
			$("#etcHeartCnt").val($("#resultCharge").val());
			$("#etcAmount").val($("#resultCharge").val() * 1100);
			
			IMP.request_pay({
			    pg : 'uplus',
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명: 하트 ' + $(this).parent().find(":first").val() + "개 결제",
			    amount : $(this).prev().val(),
			    buyer_email : '${memberVo.email1}@${memberVo.email2}',
			    buyer_name : '${memberVo.name}',
			    buyer_tel : '${memberVo.hp1}-${memberVo.hp2}-${memberVo.hp3}',
			    buyer_addr : '${memberVo.address} ${memberVo.addressDetail}',
			    buyer_postcode : '${memberVo.zipcode}',
			    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			}, function(rsp) {
			    if (rsp.success) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			});
		});
		
	});
</script>

<section class="minheight600">
	<div class="container heartC">
		<h1 class="text-center">하트 충전하기</h1>
		<hr>
	
		<div class="heartImg">
			<img alt="하트이미지" src="<c:url value='/img/heart2-s.PNG'/> ">
		</div>
		<div class="heartText text-center divA">
			<input type="hidden" value="1">
			<div class="area text-right">
				<span>하트 <strong>1</strong>개</span><br>
				<span class="price">
					<fmt:formatNumber value="1100" pattern="#,###" />
				</span>원
			</div>
			<input type="hidden" value="1100">
			<button type="button" class="btn btn-primary btnA btn-lg">구매하기</button>
		 </div>
		
		<div class="heartImg">
			<img alt="하트이미지" src="<c:url value='/img/heart2-s.PNG'/>">
		</div>
		<div class="heartText text-center divA">
			<input type="hidden" value="3">
			<div class="area text-right">
				<span>하트 <strong>3</strong>개</span><br>
				<span class="price">3,200원</span>
			</div>
			<input type="hidden" value="3200">
			<button type="button" class="btn btn-primary btnA btn-lg">구매하기</button>
		 </div>
		 
		<div class="heartImg">
			<img alt="하트이미지" src="<c:url value='/img/heart2-s.PNG'/> ">
		</div>
		<div class="heartText text-center divA">
			<input type="hidden" value="5">
			<div class="area text-right">
				<span>하트 <strong>5</strong>개</span><br>
				<span class="price">5,500원</span>
			</div>
			<input type="hidden" value="5500">
			<button type="button" class="btn btn-primary btnA btn-lg">구매하기</button>
		 </div>
		 
		<div class="heartImg">
			<img alt="하트이미지" src="<c:url value='/img/heart2-s.PNG'/> ">
		</div>
		<div class="heartText text-center divA">
			<input type="hidden" value="10">
			<div class="area text-right">
				<span>하트 <strong>10</strong>개</span><br>
				<span class="price">10,000원</span>
			</div>
			<input type="hidden" value="10000">
			<button type="button" class="btn btn-primary btnA btn-lg">구매하기</button>
		 </div>
		 
		<div class="heartImg">
			<img alt="하트이미지" src="<c:url value='/img/heart2-s.PNG'/> ">
		</div>
		<div class="heartText text-center divA">
			<input type="hidden" value="30">
			<div class="area text-right">
				<span>하트 <strong>30</strong>개</span><br>
				<span class="price">30,000원</span>
			</div>
			<input type="hidden" value="30000">
			<button type="button" class="btn btn-primary btnA btn-lg">구매하기</button>
		 </div>
		 
		<div class="heartImg">
			<img alt="하트이미지" src="<c:url value='/img/heart2-s.PNG'/> ">
		</div>
		<div class="heartText text-center divA">
			<input type="hidden" value="50">
			<div class="area text-right">
				<span>하트 <strong>50</strong>개</span><br>
				<span class="price">50,000원</span>
			</div>
			<input type="hidden" value="50000">
			<button type="button" class="btn btn-primary btnA btn-lg">구매하기</button>
		 </div>
		 
		<div class="heartImg">
			<img alt="하트이미지" src="<c:url value='/img/heart2-s.PNG'/> ">
		</div>
		<div class="heartEtc divA">
			<input type="hidden" id="etcHeartCnt">
			<div class="areaEtc text-right">
				<span class="etcSpan">기타 : &nbsp;</span>
				<input type="text" style="dispaly:inline-block;" class="etcInput" id="resultCharge">
				<!-- <button type="button" class="btn btn-info btn-sm etcBtn1 btnC" id="btn1" value="1">1 개</button> -->
			</div>
			<!-- <div class="etcBtnWrap">
				<button type="button" class="btn btn-info btn-sm etcBtn2 btnC" value="3">3 개</button>
				<button type="button" class="btn btn-info btn-sm etcBtn2 btnC" value="5">5 개</button>
				<button type="button" class="btn btn-info btn-sm etcBtn2 btnC" value="10">10 개</button>
				<button type="button" class="btn btn-info btn-sm etcBtn2 btnC" value="50">50 개</button>
			</div> -->
			<input type="hidden" id="etcAmount">
			<button type="button" class="btn btn-danger btn-lg etcBtn">구매하기</button>
			<span class="spanCharge" style="display: block;">결제 금액 : <strong id="payment"></strong></span>
		</div>
			
		<div style="clear: both;"></div>

    </div>
</section>


<%-- <%@ include file="../../inc/bottom.jsp" %> --%>