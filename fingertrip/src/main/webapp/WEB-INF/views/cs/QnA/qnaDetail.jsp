<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../../inc/top.jsp"%>

<script type="text/javascript">
$(document).ready(function(){
	$(".hid").hide();
		var pass1="";
		var pass2="";
	$(".pwck1").click(function(){
		pass1=$(".pass1").val();
		if(pass1!==""){	 
			$(".hid").hide();
			$(this).next().show();
			return false;
		}
	});
	$(".pwck2").click(function(){
		pass2=$(".pass2").val();
		if(pass2!==""){	 
			$(".hid").hide();
			$(this).next().show();
			return false;
		}	 
	});	        
	});		  
</script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/find.css"/>
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
                <table class="table tableBorder">
                	<tr>
                	<c:if test="${vo.step==0}">
                        <th>글번호</th>
                    </c:if>
                        <td>${vo.qnaNo }</td>
                    </tr>
                    <tr>
                        <th>제목</th>
                        <td>${vo.title }</td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td>${vo.name }</td>
                    </tr>
                    <tr>
                        <th>등록일</th>
                        <td><fmt:formatDate value="${vo.regDate}" pattern="yyyy-MM-dd hh:mm"/></td>
                    </tr>
                    <tr>
                        <th>조회수</th>
                        <td>${vo.readCount}</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="minheight300">
                           	 <c:if test="${vo.step==0}">
                            	<p class="font-italic font-weight-bold"><img class="qna" src="${pageContext.request.contextPath }/img/question.png">Question</p>
                             </c:if>
                             <c:if test="${vo.step!=0}">
                             	<p class="font-italic font-weight-bold"><img class="qna" src="${pageContext.request.contextPath }/img/answer.png">Answer</p>
                             </c:if>	
                               	<br>
                               	<p>${vo.content}</p>
                            </div>
                        </td>
                    </tr>
                </table>
                <div>
                <div>
                    <c:set var="vo2" value="${list[1]}"/>     
                    <c:set var="vo1" value="${list[0]}"/>  
                	<table class="table tableBorder">
                		<c:if test="${vo.step==0}">
                		<tr class="pwck1">
                			<th><img class="prev" alt="다음글" src="${pageContext.request.contextPath }/img/up.png">다음글</th>
                			<td><a href='<c:url value="/cs/QnA/countUpdate.do?qnaNo=${vo2.qnaNo}"/>'>${vo2.title }</a></td>
                			<td>${vo2.name }</td>
                			<td><fmt:formatDate value="${vo2.regDate}" pattern="yyyy-MM-dd hh:mm"/></td>
                		</tr>
                		<tr class="hid">
                        	<td colspan="4"> 	
                        	<!-- 다음글 비밀번호 확인을 위한 값 -->
                        	<form name="passck" method="post" action="<c:url value='/cs/QnA/passck.do'/>">
                        		<span>비밀글 입니다. 비밀번호를 입력해주세요.<br>
                        		<input type="password" class="form-control" class="password" name="pwd" placeholder="4자리" style="width:100px; display:inline-block;" /> 
                        		<input type="submit" class="ckpassword" class="btn btn-success" style="margin-bottom:3px;" value="확인"/></span>
                        		<input type="hidden" name="qnaNo" value="${vo2.qnaNo}">
                        	</form>	
                        	<td>
                        </tr>   
                		<tr class="pwck2">
                			<th><img class="prev" alt="이전글" src="${pageContext.request.contextPath }/img/down.png">이전글</th>
                			<td><a href='<c:url value="/cs/QnA/countUpdate.do?qnaNo=${vo1.qnaNo}"/>'>${vo1.title }</a></td>
                			<td>${vo1.name}</td>
                			<td><fmt:formatDate value="${vo1.regDate}" pattern="yyyy-MM-dd hh:mm"/></td>
                		</tr>
                		<tr class="hid">
                        	<td colspan="4">
                        	<!-- 이전글 비밀번호 확인을 위한 값 -->
                        	<form name="passck" method="post" action="<c:url value='/cs/QnA/passck.do'/>">
                        		<span>비밀글 입니다. 비밀번호를 입력해주세요.<br>
                        		<input type="password" class="form-control" class="password" name="pwd" placeholder="4자리" style="width:100px; display:inline-block;" /> 
                        		<input type="submit" class="ckpassword" class="btn btn-success" style="margin-bottom:3px;" value="확인"/></span>
                        		<input type="hidden" name="qnaNo" value="${vo1.qnaNo}">
                        	</form>	
                        	<td>
                        </tr>   
                    </c:if>
                	</table>
                	<div class="fRight">
                		<!-- 기업로그인 완료되면 if문 처리 해야함, 세션받아서 처리 메모장이 코드 있음 -->
                		<a class="btn btn-primary" href="<c:url value='/cs/QnA/reply.do?qnaNo=${vo.qnaNo}'/>">답변하기</a>
                    	<a href="<c:url value='/cs/QnA/qna.do'/>" class="btn btn btn-warning">목록</a>
                    </div>
                </div>
            </div>
    		<!-- 비밀번호 유무 비교에 필요한 값들 -->
	        <input type="hidden" class="pass1" name="pass1" value="${vo2.password}">
	        <input type="hidden" class="pass2" name="pass2" value="${vo1.password}">		
        </div>
       </div>
    </section>

<%@ include file="../../inc/bottom.jsp"%>