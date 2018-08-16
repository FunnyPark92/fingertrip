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
		var cate=$('.cate').val();
		$('.cateSelc').val(cate);
		
		
		$('form[name=frmCk]').submit(function(){
			if($('input[name=title]').val()<1){
				alert('제목을 입력하세요');
				$('input[name=title]').focus();
				return false;
			}else if($('div[name=content]').text().length<1){
				alert('내용을 입력하세요');
				$('div[name=content]').focus();
				return false;
			}else{
				var confrm=confirm("공지사항을 수정하시겠습니까?");
				if(!confrm) {
					$('div[name=content]').focus();
					return false;
				} 
			}
			$('input[name=content]').val($('#editor').html());
			if($('input[type=file]').val()<1){
				$('#hidFile').val("N");
			}
		});
		
	});
</script>
<section class="admCenter marginTop40">
	<ul class="clearFix marginBottom40 lineGnb">
     	<li class="on"><a href="<c:url value='/admin/cs/faq/faqList.do'/>">FAQ조회</a></li>
       	<li><a href="<c:url value='/admin/cs/faq/faqWrite.do'/>">FAQ등록</a></li>
  	</ul>
    <form name="frmCk" action="<c:url value='/admin/cs/faq/faqEdit.do'/>" method="post" enctype="multipart/form-data">
  		<h2>공지사항 수정</h2>
  		<input type="hidden" name="faqNo" value="${vo.faqNo }">
  		<input type="hidden" name="faqCategoryNo1" class="cate" value="${vo.faqCategoryNo }">
            <table class="grayBor">
            	<tr class="div1st">
       				<th><label for="faqCategoryNo">분류</label></th>
       				<td>
       					<select name="faqCategoryNo" class="cateSelc">
							<option value="1">결제/환불</option>
							<option value="2">쿠폰</option>
							<option value="3">상품</option>
							<option value="4">계정</option>
							<option value="5">기타</option>				
						</select> 
       				</td>
       			</tr>
       			<tr>
       				<th>제목</th>
       				<td><input type="text" name="title" value="${vo.title }" style="width:100%;"></td>
       			</tr>
       			<tr>
       				<th>내용</th>
       				<td>
      					<div id="toolbar-container"></div>
	      				<div id="editor" name="content" class="">
					        <p>${vo.content }</p>
					    </div>
       				</td>
       			</tr>
         	</table>
	     	<script>
		        DecoupledEditor
		            .create( document.querySelector( '#editor' ),{
		            	removePlugins: ['Insert image'],
		                toolbar: [ 'Heading','|','fontSize', 'fontFamily','|', 'bold', 'italic', 'Underline', 'Strikethrough', 'Highlight', '|', 'alignment', '|', 'numberedList', 'bulletedList', '|', 'Link', 'blockQuote', '|', 'Undo', 'Redo' ]
		            } )
		            .then( editor => {
		                const toolbarContainer = document.querySelector( '#toolbar-container' );
		
		                toolbarContainer.appendChild( editor.ui.view.toolbar.element );
		            } )
		            .catch( error => {
		                console.error( error );
		            } );
	    	</script>
	       	<input type="hidden" name="content">
	       
          		<hr>
       		<div class="divLast">
       			<input type="submit" class="btn btn-info float-right " value="수정">
            </div>
        </form>
    </section>

