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
			alert('첨부파일을 확인해 주세요.(최대5개)(이미지파일만 첨부가능)');
			return false;
		}else{
			var confrm=confirm("답변을 등록하시겠습니까?");
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
	$('input[name=fileCnt]').val("Y");	
	$('input[type=file]').on("change", function(){
		var form = $('form')[0];
    	var formData = new FormData(form);
        $.ajax({
            url: "<c:url value='/admin/cs/QnA/QnAFileSize.do'/>",
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
        $.ajax({
            url: "<c:url value='/admin/cs/QnA/QnAFileKind.do'/>",
        	processData: false,
            contentType: false,
            data: formData,
            type: 'POST',
            success: function(result){
                if(result==1){
                	$('input[name=fileCnt]').val("N");
           			alert("이미지 파일만 첨부할 수 있습니다.(jpg,png,gif)");
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
<section  class="admCenter marginTop40">
<h2>질문내용</h2>
<p class="grayBor"/>${vo.content}
	<c:if test="${!empty listImg }">
		<c:set value="0" var="i"/>
		<c:forEach var="img" items="${listImg}">
			<img alt="" src="${pageContext.request.contextPath }/upload_pds/${img}" class="maxH500">
			<c:set value="${i+1 }" var="i"/>
		</c:forEach>
	</c:if>
</section>
<section class="admCenter marginTop40">
    <form name="frmCk" id="frmCk" action="<c:url value='/admin/cs/QnA/qnAReplyWrite.do'/>" method="post" enctype="multipart/form-data">
    <!-- 답변 등록에 필요한 값들 -->
    <input type="hidden" name="qnaNo" value="${vo.qnaNo}">
   	<input type="hidden" name="password" value="${vo.password}">
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
	      				<div id="editor" name="content"></div>
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
     					<input id="file" type="file" name="upfile" multiple="multiple">
     					<br>
     					<span class="warn">※ 파일은 최대 5개까지 등록 가능합니다.</span><br>	
     					<span class="warn">※ 이미지 파일만 등록이 가능합니다.(jpg,png,gif) </span>	
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

