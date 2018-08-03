<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/find.css"/>

<script type="text/javascript">
	$(document).ready(function(){
		$('form[name=frmCk]').submit(function(){
			if($('input[name=title]').val()<1){
				alert('제목을 입력하세요');
				$('input[name=title]').focus();
				return false;
			}else if($('div[name=content]').text().length<1){
				alert('내용을 입력하세요');
				$('div[name=content]').focus();
				return false;
			}else if($('input[type=file]').val()<1){
				alert("파일을 등록해주세요");
				$('input[type=file]').focus();
				return false;
			}else{
				var confrm=confirm("이 내용을 입력하시겠습니까?");
				if(!confrm) {
					$('div[name=content]').focus();
					return false;
				} 
			}
			$('input[name=content]').val($('#editor').html());
		});
	});
</script>
<section class="container board marginTop80 marginBottom80 minheight600">
        <div class="row">
           <!-- 서브메뉴 -->
            <div class="col-lg-3">
                <h3>고객센터</h3>
                <div class="list-group">
                    <a href="<c:url value='/cs/notice/noticeList.do'/> " class="list-group-item active">공지사항</a>
                    <a href="<c:url value='/cs/QnA/qna.do'/> " class="list-group-item">Q&amp;A</a>
                    <a href="<c:url value='/cs/faq/faq.do'/> " class="list-group-item">FAQ</a>
                </div>
            </div>
    
     		<!-- 서브컨텐츠 -->
            <div class="col-lg-9">
            	<form name="frmCk" action="<c:url value='/cs/notice/noticeWrite.do'/>" method="post" enctype="multipart/form-data">
            		<hr>
            		<div class="row">
            			<label class="col-md-3 font-weight-bold marginTB12 text-center">제목</label>
            			<input type="text" class="form-control col-md-8" name="title">
            			<div class="col-md-1"></div>
            		</div>
            		<hr>
				    
				    <!-- <!-- The toolbar will be rendered in this container. -->
    				<div id="toolbar-container"></div>

				    <!-- This container will become the editable. -->
				    <div id="editor" name="content">
				        <p>공지사항을 입력하세요.</p>
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
			        <hr>
			        <div>
			            <input type="file" name="upfile" multiple="multiple" class="btn btn-outline-secondary">
			        </div>
            		<hr>
            		<div class="margin0 marginT30 overflowH width150">
	                    <a href="<c:url value='/cs/notice/noticeList.do'/>" class="btn btn btn-warning float-right marginL10">목록</a>
            			<input type="submit" class="btn btn-info float-right " value="등록">
	                </div>
            	</form>
                
            </div>
    
        </div>
    </section>

<%@ include file="../../inc/bottom.jsp"%>