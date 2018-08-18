<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/find.css"/>

<script type="text/javascript">
$(document).ready(function(){
	$('#del').click(function(){
		if(confirm("삭제하시겠습니까?")){
			return true;
		}else{
			return false;
		}
	});
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
                               	<c:choose>
                    			<c:when test="${vo.delFlag=='Y'}">
                    					삭제된 글입니다.
                    			</c:when>
                    			<c:otherwise>
                               	<p>${vo.content}</p>
                               		<c:if test="${!empty listImg }">
										<c:set value="0" var="i"/>
										<c:forEach var="img" items="${listImg}">
											<img alt="" src="${pageContext.request.contextPath }/upload_images/${img}" class="maxH500">
										<c:set value="${i+1 }" var="i"/>
										</c:forEach>
									</c:if>
								</c:otherwise>
                    			</c:choose>
                            </div>
                        </td>
                    </tr>
                </table>
                <div>
                <div>
                	<table class="table tableBorder">
                		<c:if test="${!empty voUp}">
                		<tr class="pwck1">
                			<th><img class="prev" alt="윗글" src="${pageContext.request.contextPath }/img/up.png">윗글</th>
                			<td><a href='<c:url value="/cs/QnA/countUpdate.do?qnaNo=${voUp.qnaNo}"/>'>${voUp.title }</a></td>
                			<td>${voUp.name}</td>
                			<td><fmt:formatDate value="${voUp.regDate}" pattern="yyyy-MM-dd hh:mm"/></td>
                		</tr>
                		<tr class="hid">
                        	<td colspan="4"> 	
                        	<!-- 윗글 비밀번호 확인을 위한 값 -->
                        	<form name="passck" method="post" action="<c:url value='/cs/QnA/passck.do'/>">
                        		<span>비밀글 입니다. 비밀번호를 입력해주세요.<br>
                        		<input type="password" class="form-control" class="password" name="pwd" placeholder="4자리" style="width:100px; display:inline-block;" /> 
                        		<input type="submit" class="ckpassword" class="btn btn-success" style="margin-bottom:3px;" value="확인"/></span>
                        		<input type="hidden" name="qnaNo" value="${voUp.qnaNo}">
                        	</form>	
                        	<td>
                        </tr>   
                        </c:if>
                        <c:if test="${!empty voDw}">
                		<tr class="pwck2">
                			<th><img class="prev" alt="아랫글" src="${pageContext.request.contextPath }/img/down.png">아랫글</th>
                			<td><a href='<c:url value="/cs/QnA/countUpdate.do?qnaNo=${voDw.qnaNo}"/>'>${voDw.title }</a></td>
                			<td>${voDw.name }</td>
                			<td><fmt:formatDate value="${voDw.regDate}" pattern="yyyy-MM-dd hh:mm"/></td>
                		</tr>
                		<tr class="hid">
                        	<td colspan="4">
                        	<!-- 아랫글 비밀번호 확인을 위한 값 -->
                        	<form name="passck" method="post" action="<c:url value='/cs/QnA/passck.do'/>">
                        		<span>비밀글 입니다. 비밀번호를 입력해주세요.<br>
                        		<input type="password" class="form-control" class="password" name="pwd" placeholder="4자리" style="width:100px; display:inline-block;" /> 
                        		<input type="submit" class="ckpassword" class="btn btn-success" style="margin-bottom:3px;" value="확인"/></span>
                        		<input type="hidden" name="qnaNo" value="${voDw.qnaNo}">
                        	</form>	
                        	<td>
                        </tr>   
                    </c:if>
                	</table>
                	<div class="fRight">
                		<c:if test="${!empty agencyid}">
                			<a class="btn btn-success" href="<c:url value='/cs/QnA/reply.do?qnaNo=${vo.qnaNo}'/>">답변하기(기업전용)</a>
 						</c:if>
 						<!-- 혹시나 관리자 아이디와 일반회원 아이디가 같은 경우를 대비해 step으로도 처리, 삭제한 글은 삭제버튼 뜨지 않게 -->
 						<c:if test="${vo.memberNo==memberNo&&vo.step==0&&vo.delFlag!='Y'}">
                			<a class="btn btn-success" id="del" href="<c:url value='/cs/QnADelete.do?qnaNo=${vo.qnaNo}'/>">삭제</a>
 						</c:if>
                    	<a href="<c:url value='/cs/QnA/qna.do'/>" class="btn btn btn-warning">목록</a>
                    </div>
                </div>
            </div>
    		<!-- 비밀번호 유무 비교에 필요한 값들 -->
	        <input type="hidden" class="pass1" name="pass1" value="${voUp.password}">
	        <input type="hidden" class="pass2" name="pass2" value="${voDw.password}">
        </div>
       </div>
    </section>

<%@ include file="../../inc/bottom.jsp"%>