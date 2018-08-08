<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/adminTop.jsp"%>
<script type="text/javascript">
	function pageFunc(currentPage){
		frmHid.currentPage.value=currentPage;
		frmHid.submit();
	}
	$(document).ready(function(){
		$('a[name=del]').click(function(){
			var count=0;
			$('input[name=chk]').each(function(){
				if($(this).is(':checked')){
					count++;
				}
			});
			if(count==0){
				alert('삭제할 공지사항을 선택해주세요');
				return false;
			}else{
				$('form[name=frmDel]').submit();
			}
		});
	});
	
	function allChecked(bool){
		$('input[name=chk]').prop('checked',bool);
	}
</script>

<section class="admCenter marginTop40" style="text-align: center">
	<ul class="clearFix marginBottom40 lineGnb">
     	<li class="on"><a href="<c:url value='/admin/cs/faq/faqList.do'/>">faq조회</a></li>
       	<li><a href="<c:url value='/admin/cs/faq/faqWrite.do'/>">faq등록</a></li>
  	</ul>
	<h2>FAQ</h2>
	<form name="faqList" class="faqList" method="get" action="<c:url value='/admin/cs/faq/faqList.do'/>">
		<input name="faqCategoryNo" type="hidden">
	</form>
			
			
			<%-- <h4>FAQ</h4>
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
				>상품</li>
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
			 --%>
			<table class="grayTh">
				<tr>
					<th><input type="checkbox"></th>
					<th>번호</th>
					<th>카테고리</th>
					<th>제목</th>
					<th>내용</th>
					<th>관리자</th>
				</tr>
				<tr>
					<c:forEach var="faqCategoryNo1" items="${list}">
						<td><input type="checkbox"></td>
						<td>${faqCategoryNo1.faqNo}</td>
						<td>${faqCategoryNo1.faqCateTitle}</td>
						<td><a href="">${faqCategoryNo1.title}</a></td>
						<td>${faqCategoryNo1.content}</td>
						<td>${faqCategoryNo1.id}</td>
					</c:forEach>
				</tr>
			</table>
			
                
</section>


</body>
</html>