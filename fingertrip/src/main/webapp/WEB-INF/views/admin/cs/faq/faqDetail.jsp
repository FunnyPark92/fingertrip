<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../inc/adminTop.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/find.css"/>
<style>
	#editor ol, #editor ul{
		padding-left: 30px;
	}
	#editor a{
		text-decoration: underline;
		color: blue;
	}
</style>

<script type="text/javascript">
	$(document).ready(function(){
		$('#del').click(function(){
			var confrm=confirm("삭제하시겠습니까?");
			if(confrm){
				$('form[name=frmDel]').submit();
			}
		});
	});
</script>

<section class="admCenter marginTop40">
	<ul class="clearFix marginBottom40 lineGnb">
     	<li class="on"><a href="<c:url value='/admin/cs/faq/faqList.do'/>">FAQ조회</a></li>
       	<li><a href="<c:url value='/admin/cs/faq/faqWrite.do'/>">FAQ등록</a></li>
  	</ul>
    <form name="frmDel" action="<c:url value='/admin/cs/faq/faqDetail.do'/>" method="post" enctype="multipart/form-data">
  		<h2>FAQ 상세보기</h2>
  		<input type="hidden" name="faqNo" value="${vo.faqNo }">
  		<input type="hidden" name="faqCateNo" class="cate" value="${vo.faqCategoryNo }">
            <table class="grayBor">
            	<tr class="div1st">
       				<th><label for="faqCategoryNo">분류</label></th>
       				<td>${vo.faqCateTitle }</td>
       			</tr>
       			<tr>
       				<th>제목</th>
       				<td>${vo.title }</td>
       			</tr>
       			<tr>
       				<th>내용</th>
       				<td class="minH200">
      					<div id="toolbar-container"></div>
	      				<div id="editor" name="content" class="">
					        <p>${vo.content }</p>
					    </div>
       				</td>
       			</tr>
         	</table>
	       	<input type="hidden" name="content">
	       
       		<div class="divLast aWrap">
       			<a href="<c:url value='/admin/cs/faq/faqList.do'/>" class="darkBorder">목록</a>
       			<a href="<c:url value='/admin/cs/faq/faqEdit.do?faqNo=${vo.faqNo }'/>" class="lightGray">수정</a>
       			<!-- <a id="del" class="darkGray" onclick="go()">삭제</a> -->
            </div>
        </form>
    </section>

