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
                        <th>글번호</th>
                        <td>${list[1]['qnaNo']}</td>
                    </tr>
                    <tr>
                        <th>제목</th>
                        <td>${list[1]['title']}</td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td>${list[1]['name']}</td>
                    </tr>
                    <tr>
                        <th>등록일</th>
                        <td><fmt:formatDate value="${list[1]['regDate']}" pattern="yyyy-MM-dd hh:mm"/></td>
                    </tr>
                    <tr>
                        <th>조회수</th>
                        <td>${list[1]['readCount']}</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="minheight300">
                            	<p class="font-italic font-weight-bold"><img class="qna" src="${pageContext.request.contextPath }/img/question.png">Question</p>
                               	<br>
                               	<p>${list[1]['content']}</p>
                            </div>
                        </td>
                    </tr>
                </table>
                <c:set var="vo" value="${list[1]}"/>
                <div>
                	<table class="table tableBorder">
                		<tr class="pwck1">
                			<th><img class="prev" alt="이전글" src="${pageContext.request.contextPath }/img/up.png">이전글</th>
                			<td><a href='<c:url value="/cs/QnA/countUpdate.do?qnaNo=${vo.qnaNo+1}"/>'>${list[2]['title']}</a></td>
                			<td>${list[2]['name']}</td>
                			<td>${list[2]['regDate']}</td>
                		</tr>
                		<tr class="hid">
                        	<td colspan="4">
                        	<!-- 이전글 비밀번호 확인을 위한 값 -->
                        	<form name="passck" method="post" action="<c:url value='/cs/QnA/passck.do'/>">
                        		<span>비밀글 입니다. 비밀번호를 입력해주세요.<br>
                        		<input type="password" class="form-control" class="password" name="pwd" placeholder="4자리" style="width:100px; display:inline-block;" /> 
                        		<input type="submit" class="ckpassword" class="btn btn-success" style="margin-bottom:3px;" value="확인"/></span>
                        		<input type="hidden" name="qnaNo" value="${vo.groupNo+1}">
                        	</form>	
                        	<td>
                        </tr>   
                		<tr class="pwck2">
                			<th><img class="prev" alt="다음글" src="${pageContext.request.contextPath }/img/down.png">다음글</th>
                			<td><a href='<c:url value="/cs/QnA/countUpdate.do?qnaNo=${vo.groupNo-1}"/>'>${list[0]['title']}</a></td>
                			<td>${list[0]['name']}</td>
                			<td>${list[0]['regDate']}</td>
                		</tr>
                		<tr class="hid">
                        	<td colspan="4">
                        	<!-- 다음글 비밀번호 확인을 위한 값 -->
                        	<form name="passck" method="post" action="<c:url value='/cs/QnA/passck.do'/>">
                        		<span>비밀글 입니다. 비밀번호를 입력해주세요.<br>
                        		<input type="password" class="form-control" class="password" name="pwd" placeholder="4자리" style="width:100px; display:inline-block;" /> 
                        		<input type="submit" class="ckpassword" class="btn btn-success" style="margin-bottom:3px;" value="확인"/></span>
                        		<input type="hidden" name="qnaNo" value="${vo.qnaNo-1}">
                        	</form>	
                        	<td>
                        </tr>   
                	</table>
                	<div class="fRight">
                		<!-- 기업로그인 완료되면 if문 처리 해야함, 세션받아서 처리 메모장이 코드 있음 -->
                		<a class="btn btn-primary" href="<c:url value='/cs/QnA/reply.do?qnaNo=${vo.qnaNo}'/>">답변하기</a>
                    	<a href="<c:url value='/cs/QnA/qna.do'/>" class="btn btn btn-warning">목록</a>
                    </div>
                </div>
            </div>
    		<!-- 비밀번호 유무 비교에 필요한 값들 -->
	        <input type="hidden" class="pass1" name="pass1" value="${list[2]['password']}">
	        <input type="hidden" class="pass2" name="pass1" value="${list[0]['password']}">		
        </div>
    </section>

<%@ include file="../../inc/bottom.jsp"%>