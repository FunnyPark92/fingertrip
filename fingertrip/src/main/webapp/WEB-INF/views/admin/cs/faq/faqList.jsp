<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/adminTop.jsp"%>

<script type="text/javascript">
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
     	<li class="on"><a href="<c:url value='/admin/cs/faq/faqList.do'/>">FAQ조회</a></li>
       	<li><a href="<c:url value='/admin/cs/faq/faqWrite.do'/>">FAQ등록</a></li>
  	</ul>
	<h2>FAQ</h2>
	<%-- <form name="search" action="<c:url value='/admin/cs/faq/faqList.do'/>" method="post">
      	<input type="hidden" name="searchCondition" value="${param.searchCondition }">
	</form> --%>
	<form name="faqList" class="faqList fRight" method="get" action="<c:url value='/admin/cs/faq/faqList.do'/>"> 
		<select name="faqCategoryNo">
			<option value="1" 
				<c:if test="${param.faqCategoryNo==1}">selected</c:if>
			>결제/환불</option>
			<option value="2"
				<c:if test="${param.faqCategoryNo==2}">selected</c:if>
			>쿠폰</option>
			<option value="3"
				<c:if test="${param.faqCategoryNo==3}">selected</c:if>
			>코스/일정</option>
			<option value="4"
				<c:if test="${param.faqCategoryNo==4}">selected</c:if>
			>계정</option>
			<option value="5"
				<c:if test="${param.faqCategoryNo==5}">selected</c:if>
			>기타</option>				
		</select>
		<button>검색</button>
	 </form> 
			
			<table class="grayTh" style="margin-top:50px;">
				<tr>
					<th><input type="checkbox"></th>
					<th>번호</th>
					<th>카테고리</th>
					<th>제목</th>
					<th>관리자</th>
				</tr>
				<c:forEach var="faqCategoryNo1" items="${list}">
					<tr>
						<td><input type="checkbox" name="chk" value="${map['FAQ_NO']}"></td>
						<td>${faqCategoryNo1['FAQ_NO']}</td>
						<td>${faqCategoryNo1['FAQ_CATE_TITLE']}</td>
						<td><a href="<c:url value='/admin/cs/faq/faqDetail.do?faqNo=${faqCategoryNo1["FAQ_NO"]}'/>">${faqCategoryNo1['TITLE']}</a></td>
						<td>${faqCategoryNo1['ID']}</td>
					</tr>
				</c:forEach>
			</table>
			
            <div class="aWrap fRight">
		 		<a href="#" class="darkBorder" name="del">삭제</a>
			</div>
</section>


</body>
</html>