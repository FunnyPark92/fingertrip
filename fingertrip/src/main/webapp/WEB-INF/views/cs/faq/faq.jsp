<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>

<script>
$(document).ready(function(){
	$(".accordion").accordion({"heightStyle":"content"});
	
	
	
	$(".faqTabNav>li").click(function(){
		var a=$(this).val();
		$("input[name=faqCategoryNo]").val(a);
		$(".faqList").submit();
	});

});
</script>


<section class="container faq marginTop80 marginBottom80 minheight600">
	<div class="row">

		<!-- 서브메뉴 -->
		<div class="col-lg-3">
			<h3>고객센터</h3>
			<div class="list-group">
				<a href="<c:url value='/cs/notice/noticeList.do'/>"
					class="list-group-item ">공지사항</a> <a
					href="<c:url value='/cs/QnA/qna.do'/> " class="list-group-item">Q&amp;A</a>
				<a href="<c:url value='/cs/faq/faq.do'/> "
					class="list-group-item active">FAQ</a>
			</div>
		</div>

		<!-- 서브컨텐츠 -->
		<div class="col-lg-9">
			<form name="faqList" class="faqList" method="get"
				action="<c:url value='/cs/faq/faq.do'/>">
				<input name="faqCategoryNo" type="hidden">
			</form>
			
			<h4>FAQ</h4>
			<ul class="faqTabNav clearFix">
				<li value="1"
					<c:if test="${param.faqCategoryNo==1 }">
						class="gray"
					</c:if>
				>결제/환불</li>
				<li value="2"
					<c:if test="${param.faqCategoryNo==2 }">
						class="gray"
					</c:if>
				>쿠폰</li>
				<li value="3"
					<c:if test="${param.faqCategoryNo==3 }">
						class="gray"
					</c:if>
				>코스/일정</li>
				<li value="4"
					<c:if test="${param.faqCategoryNo==4 }">
						class="gray"
					</c:if>
				>계정</li>
				<li value="5"
					<c:if test="${param.faqCategoryNo==5 }">
						class="gray"
					</c:if>
				>기타</li>
			</ul>
			
			
			
			<div class="accordion">
				<c:forEach var="faqCategoryNo1" items="${list}">
					<p>${faqCategoryNo1.title}</p>
					<div>
						<p>${faqCategoryNo1.content}</p>
					</div>
				</c:forEach>
			</div>

		</div>

	</div>
</section>





<%@ include file="../../inc/bottom.jsp"%>