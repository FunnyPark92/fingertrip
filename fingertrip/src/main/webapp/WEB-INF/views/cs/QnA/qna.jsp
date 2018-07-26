<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../inc/top.jsp"%>

<script type="text/javascript">
  $(document).ready(function(){
	  $(".hid").hide();
	  var pass;
	    $(".pwck").click(function(){
	    	     pass=$(".pass").val();
	   	 		 alert(pass);
	   	 	
	   	 	if(pass!=""){	 
	    	$(".hid").hide();
	    	$(this).next().show();
	    	return false;
	   	 	}
	    });	 
	    $(".ckpassword").click(function(){
	    	var ch=$(".password").val();
	    	alert(ch);
	    });
	  });
</script>
<style>

</style>

<section class="container board marginTop80 marginBottom80 minheight600">
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
           <!-- 서브컨텐츠 -->
            <div class="col-lg-9">
                <table class="table table-hover tableBorder">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col" style="width:5%"></th>
                            <th scope="col" style="width:45%">제목</th>
                            <th scope="col" style="width:15%">작성자</th>
                            <th scope="col" style="width:26%">등록일</th>
                            <th scope="col" style="width:9%">조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:if test="${!empty list}">
                    <!-- QnA리스트 내용 반목분 시작 -->
                    <c:forEach var="vo" items="${list}">
                        <tr class="pwck" >
                            <th scope="row">${vo.qnaNo }</th>
                            <td><a href="<c:url value='/cs/QnA/countUpdate.do?qnaNo=${vo.qnaNo }'/>">
                            <!--제목이 긴 경우 일부만 보여주기 -->
                            <c:if test="${fn:length(vo.title)>25}">
                            	${fn:substring(vo.title,0,20) }...
                            </c:if>
                            <c:if test="${fn:length(vo.title)<=25}">
                            	${vo.title }
                            </c:if>
                            </a></td>
                            <td>${vo.name }</td>
                            <td><fmt:formatDate value="${vo.regDate}" pattern="yyyy-MM-dd hh:mm"/></td>
                            <td>${vo.readCount}</td>
                        </tr>
                        <tr class="hid">
                        	<td colspan="4">
                        		<span>비밀글 입니다. 비밀번호 4자리를 입력해주세요.<br>
                        		<input type="password" class="form-control" class="password" name="pwd" placeholder="4자리" style="width:100px; display:inline-block;" /> 
                        		<input type="button" class="ckpassword" class="btn btn-success" style="margin-bottom:3px;" value="확인"/></span>
                        	<td>
                        </tr>   
                        <!-- 비밀번호 비교에 필요한 값들 -->
	    				<input type="hidden" class="pass" name="pass" value="${vo.password}">
                     </c:forEach>
                     </c:if>
                    </tbody>
                </table>
              
                <div class="width500 marginT50 paddingL100">
                   <form name="" action="<c:url value='/cs/QnA/board.do'/>" method="post" class="overflowH">
                      <select class="float-left form-control w-25">
                         <option value="title">제목</option>
                         <option value="content">내용</option>
                      </select>
                      <input type="text" class="float-left form-control w-50">
                      <input type="submit" value="검색" class="btn btn-info float-left marginL10">
                   </form>
                </div> 
            </div>
        </div>
        <div class="form-group text-right">
	                <a class="btn btn-primary" style="color:#fff;" href="<c:url value='/cs/QnA/qnaWrite.do'/>">글쓰기</a>
	    </div>
    </section>

 <%@ include file="../../inc/bottom.jsp"%>