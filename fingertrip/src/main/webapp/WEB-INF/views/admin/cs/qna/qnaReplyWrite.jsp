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
	
</script>
<section  class="admCenter marginTop40">
<h2>질문내용</h2>
<p class="grayBor">${vo.content}</p>


</section>
<section class="admCenter marginTop40">
    <form name="frmCk" id="frmCk" action="<c:url value='/admin/cs/QnA/qnAReplyWrite.do'/>" method="post" enctype="multipart/form-data">
  		<h2>답변등록</h2>
            <table class="grayBor">
       			<tr class="div1st">
       				<th>제목</th>
       				<td><input type="text" name="title"></td>
       			</tr>
       			<tr>
       				<th>내용</th>
       				<td>
      					<div id="toolbar-container"></div>
	      				<div id="editor" name="content">
					        <p>답변을 입력하세요.</p>
					    </div>
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
       				</td>
       			</tr>
            	<tr>
     				<th>파일</th>
     				<td>
     					<input type="file" name="upfile" multiple="multiple">
     					<br>
     					<span class="warn">※ 파일은 최대 5개까지 등록 가능합니다.</span>
        				<input type="hidden" id="hidFile" name="hidFile">
        				<input type="hidden" id="fileCnt" name="fileCnt">
     				</td>
     			</tr>		
         	</table>
	     	
       		<div class="divLast">
       			<input type="submit" class="btn btn-info float-right " value="등록">
       			<input type="hidden" id="fileCnt" name="fileCnt">
            </div>
        </form>
    </section>

