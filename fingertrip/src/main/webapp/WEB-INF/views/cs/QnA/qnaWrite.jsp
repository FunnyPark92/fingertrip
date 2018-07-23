<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>
<style>
.form-control{
	width:600px;
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
});
</script>

<br><br>
<div class="container margin80">
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
       <!-- QnA글 쓰기 -->
       <fieldset>
   		<legend><h3>QnA작성하기</h3></legend>
   			<div>
        		<input type ="Button" id="sc" class="btn btn-success" value="비밀글쓰기"/>
        		<input type ="Button" id="pu" class="btn btn-success" value="공개글쓰기"/>
        	</div>
        	<div id="pwd">
            	<label for="pwd">비밀번호</label>
            	<input type="password" class="form-control" id="pwd" name="pwd" style="width:100px"/>
            </div>
        	<div>
            	<label for="title">제목</label>
            	<input type="text" class="form-control" id="title" name="title"  />
            </div>
        	<div>
            	<label for="name">작성자</label>
            	<input type="text" class="form-control" id="name" name="name" />
            </div>
        	<div>  
           		<label for="content">내용</label>        
          		<textarea id="content" class="form-control" name="content" rows="12" cols="40"></textarea>
        	</div>
        	<div>
            	<label for="upfile">첨부파일</label>
            	<input type="file" class="form-control" id="upfile" name="upfile" />(최대 2M)
        	</div>
        	<div class="form-group text-right">
            	<input type = "submit" class="btn btn-info" value="등록"/>
            	<input type = "Button" class="btn btn-warning" value="글목록"  onclick="location.href='<c:url value="/cs/QnA/qna.do" />'" />         
            </div>
        
   	  </fieldset>
   </div>
</div>
<%@ include file="../../inc/bottom.jsp"%>