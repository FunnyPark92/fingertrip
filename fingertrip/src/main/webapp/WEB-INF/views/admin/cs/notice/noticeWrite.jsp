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
		$('form[name=frmCk]').submit(function(){
			if($('input[name=title]').val()<1){
				alert('제목을 입력하세요');
				$('input[name=title]').focus();
				return false;
			}else if($('div[name=content]').text().length<1){
				alert('내용을 입력하세요');
				$('div[name=content]').focus();
				return false;
			}else if($('input[name=fileCnt]').val()!="Y"){
				alert('파일 개수를 확인하세요');
				return false;
			}else{
				var confrm=confirm("공지사항을 등록하시겠습니까?");
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
		
		$('input[type=file]').on("change", function(){
			var form = $('form')[0];
        	var formData = new FormData(form);
            $.ajax({
	            url: "<c:url value='/admin/cs/notice/noticeFSize.do'/>",
            	processData: false,
                contentType: false,
	            data: formData,
	            type: 'POST',
	            success: function(result){
	                if(result>5){
	                	$('input[name=fileCnt]').val("N");
	           			alert("파일은 최대 5개까지 등록 가능합니다.");
	                }else{
	                	$('input[name=fileCnt]').val("Y");
	                }
	            },
	            error:function(xhr, status, error){
	 				alert("error: "+error);
	 			} 
           	});
		});
	});
</script>
<section class="admCenter marginTop40">
	<ul class="clearFix marginBottom40 lineGnb">
     	<li><a href="<c:url value='/admin/cs/notice/noticeList.do'/>">공지사항조회</a></li>
       	<li class="on"><a href="<c:url value='/admin/cs/notice/noticeWrite.do'/>">공지사항등록</a></li>
  	</ul>
    <form name="frmCk" id="frmCk" action="<c:url value='/admin/cs/notice/noticeWrite.do'/>" method="post" enctype="multipart/form-data">
  		<h2>공지사항 등록</h2>
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
       				</td>
       			</tr>
            	<tr>
     				<th>파일</th>
     				<td>
     					<input type="file" name="upfile" multiple="multiple">
     					<br>
     					<span class="warn">※ 파일은 최대 5개까지 등록 가능합니다.</span>
        				<input type="hidden" id="hidFile" name="hidFile">
        				<input type="hidden" id="fileCnt" name="fileCnt" value="Y">
     				</td>
     			</tr>		
         	</table>
	     	
       		<div class="divLast">
       			<input type="submit" class="btn btn-info float-right " value="등록">
            </div>
        </form>
    </section>

