<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/find.css"/>

<style type="text/css">
	.hidden{
		visibility:hidden;
		margin: 15px 0;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('#editor').click(function(){
 			 $(this).find('p').html("");
		})
		
		$('form[name=frmCk]').submit(function(){
			if($('input[name=title]').val()<1){
				alert('제목을 입력하세요');
				return false;
			}else if($('input[name=content]').val()<1){
				alert('내용을 입력하세요');
				return false;
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
            	<form name="frmCk" action="<c:url value='/cs/notice/noticeWrite.do'/>" method="post">
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
				    <div id="editor">
				        <p>This is the initial editor content.</p>
				    </div>

				    <script>
				        DecoupledEditor
				            .create( document.querySelector( '#editor' ) )
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
            		<div class="margin0 marginT30 overflowH width150">
	                    <a href="<c:url value='/cs/notice/noticeList.do'/>" class="btn btn btn-warning float-right marginL10">목록</a>
            			<input type="submit" class="btn btn-info float-right " value="등록">
	                </div>
            	</form>
                
            </div>
    
        </div>
    </section>

<%@ include file="../../inc/bottom.jsp"%>