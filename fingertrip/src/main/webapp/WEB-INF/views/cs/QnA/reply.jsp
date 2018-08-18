<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/find.css"/>
<style>
#editor ol, #editor ul{
	padding-left: 30px;
	}
#editor a{
	text-decoration: underline;
	color: blue;
	}
#editor {
	min-height: 300px;
	border: 1px solid #ced4da;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
  $("#pwd").hide();  
  $("#pu").hide();
  
  $("#sc").click(function(){
	  $("#pwd").show();  
	  $("#sc").hide();
	  $("#pu").show();
  });
  $("#pu").click(function(){
	  $("#pwd").hide();  
	  $("#pu").hide();
	  $("#sc").show();
  });
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

<br><br>
<div class="container margin80">
	<div class="row">
	   <!-- 서브메뉴 -->
            <div class="col-lg-3">
                <h3>고객센터</h3>
                <div class="list-group">
                    <a href="<c:url value='/cs/notice/noticeList.do'/>" class="list-group-item ">공지사항</a>
                    <a href="<c:url value='/cs/QnA/qna.do'/> " class="list-group-item active">Q&amp;A</a>
                    <a href="<c:url value='/cs/faq/faq.do'/> " class="list-group-item">FAQ</a>
                </div>
            </div>
       <!-- QnA기업 답변 쓰기 -->
       <section class="admCenter marginTop40">
    	<form name="frmCk" id="frmCk" action="<c:url value='/cs/QnA/reply.do'/>" method="post" enctype="multipart/form-data">
    		    <!-- 답변 등록에 필요한 값들 -->
    			<input type="hidden" name="qnaNo" value="${vo.qnaNo}">
   				<input type="hidden" name="password" value="${vo.password}">
   		<h3>QnA 답변작성하기(기업전용)</h3>
   			<div class="minheight300">
               	<p class="font-italic font-weight-bold" style="margin-bottom:3px;"><img class="qna" src="${pageContext.request.contextPath }/img/question.png" style="width:25px;">Question</p>
                <p style="margin-bottom:0px;">작성자:${vo.name}</p>
                <p style="margin-bottom:0px;">제  목:${vo.title}</p>
                <p style="margin-bottom:0px;">내  용:${vo.content}</p>
                <c:if test="${!empty listImg }">
				<c:set value="0" var="i"/>
					<c:forEach var="img" items="${listImg}">
						<img alt="" src="${pageContext.request.contextPath }/upload_images/${img}" class="maxH500">
					<c:set value="${i+1 }" var="i"/>
					</c:forEach>
				</c:if>
            </div>
            	<p class="font-italic font-weight-bold"><img class="qna" src="${pageContext.request.contextPath }/img/answer.png">Answer</p>
        	<div>
            	<label for="title">답변제목</label>
            	<input type="text" class="form-control" id="title" name="title"  />
            </div>
        	<div>  
           		<label for="content">답변내용</label>    
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
        	</div>
        	<div>
            	<input id="file" type="file" name="upfile" multiple="multiple"><br>
     			<span class="warn">※ 파일은 최대 5개까지 등록 가능합니다.</span><br>	
     			<span class="warn">※ 이미지 파일만 등록이 가능합니다.(jpg,png,gif) </span>	
        		<input type="hidden" class="form-control" id="hidFile" name="hidFile">
        		<input type="hidden" class="form-control" id="fileCnt" name="fileCnt">
          
        	</div>
        	<div class="form-group text-right" class="divLast">
       			<input type="submit" class="btn btn-success" value="답변등록">
       			<input type = "Button" class="btn btn-warning" value="글목록"  onclick="location.href='<c:url value="/cs/QnA/qna.do"/>'" />
       			<input type="hidden" id="fileCnt" name="fileCnt">    
            </div>
   	 </form>
    </section>
   </div>
</div>
<%@ include file="../../inc/bottom.jsp"%>