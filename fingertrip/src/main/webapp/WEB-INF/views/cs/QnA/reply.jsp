<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>
<style>
.form-control{
	width:600px;
}
</style>

<script type="text/javascript">
	function send(form){
		if(form.title.value==""){
			alert('제목을 입력하세요');
			form.title.focus();
			return false;
		}else if(form.content.value==""){
			alert('내용을 입력하세요.');
			form.content.focus();
			return false;
		}		
		return true;
	}

</script>
<br><br>
<div class="container margin80">
<form name="replyWrite" method="post" action="<c:url value='/cs/QnA/reply.do'/>" onsubmit="return send(this)">
	<div class="row">
	   <!-- 서브메뉴 -->
            <div class="col-lg-3">
                <h3>고객센터</h3>
                <div class="list-group">
                    <a href="<c:url value='/cs/notice/board.do'/> " class="list-group-item ">공지사항</a>
                    <a href="<c:url value='/cs/QnA/qna.do'/> " class="list-group-item active">Q&amp;A</a>
                    <a href="<c:url value='/cs/faq/faq.do'/> " class="list-group-item">FAQ</a>
                </div>
            </div>
       <!-- QnA답변 쓰기 -->
       <fieldset>
   		<legend><h3>QnA답변쓰기</h3></legend>
   			<!-- 답변등록할때 필요한 값들 -->
   			<input type="hidden" name="qnaNo" value="${vo.qnaNo}">
   			<input type="hidden" name="password" value="${vo.password}">
   			<input type="hidden" name="travelAgencyNo" value="${vo.travelAgencyNo}">
   			<input type="hidden" name="adminNo" value="${vo.adminNo}">
   			<input type="hidden" name="travelAgencyNo" value="${vo.memberNo}">
   			
   		    <div class="minheight300">
               	<p class="font-italic font-weight-bold" style="margin-bottom:3px;"><img class="qna" src="${pageContext.request.contextPath }/img/question.png" style="width:25px;">Question</p>
                <p style="margin-bottom:0px;">작성자:${vo.name}</p>
                <p style="margin-bottom:0px;">제  목:${vo.title}</p>
                <p style="margin-bottom:0px;">내  용:${vo.content}</p>
            </div>
            <div>
            	<label for="title">답변자</label>
            	<input type="text" class="form-control" id="name" name="name"  />
            </div>
        	<div>
            	<label for="title">답변제목</label>
            	<input type="text" class="form-control" id="title" name="title"  />
            </div>
        	<div>  
           		<label for="content">답변내용</label>        
          		<textarea id="content" class="form-control" name="content" rows="12" cols="40"></textarea>
        	</div>
    		<br>
        	<div class="form-group text-right">
            	<input type = "submit" class="btn btn-info" value="답변등록"/>
            	<input type = "Button" class="btn btn-warning" value="글목록"  onclick="location.href='<c:url value="/cs/QnA/qna.do" />'" />         
            </div>
   	  </fieldset>
   </div>
</form>
</div>
<%@ include file="../../inc/bottom.jsp"%>