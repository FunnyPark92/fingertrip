<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../inc/top.jsp"%>

<script type="text/javascript">
function pageFunc(currentPage){
	page.currentPage.value=currentPage;
	page.submit();
}
  $(document).ready(function(){
	  $(".hid").hide();
	  var pass="";
	    $(".pwck").click(function(){
	    	     pass=$(this).next().val();
	   	 	if(pass!==""){	 
	    	$(".hid").hide();
	    	$(this).next().next().show();
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
           <!-- 페이징 처리를 위한 div -->
            <div>
            	<form name="page" action="<c:url value='/cs/QnA/qna.do'/>" method="post">
	            	<input type="hidden" name="currentPage">
	            	<input type="hidden" name="searchCondition" value="${param.searchCondition }">
	            	<input type="hidden" name="searchKeyword" value="${param.searchKeyword }">
            	</form>
            </div>
           <!-- 서브컨텐츠 -->
            <div class="col-lg-9">
                <h4>Q&A</h4>
                <table class="table table-hover tableBorder">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col" style="width:10%"  class="text-left">번호</th>
                            <th scope="col" style="width:40%" class="text-center">제목</th>
                            <th scope="col" style="width:15%" class="text-left">작성자</th>
                            <th scope="col" style="width:25%" class="text-left">등록일</th>
                            <th scope="col" style="width:10%"  class="text-center">조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:if test="${!empty list}">
                    <!-- QnA리스트 내용 반목분 시작 -->
                    <c:forEach var="vo" items="${list}">
                        <tr class="pwck" >
                            <th scope="row">
                            	<c:if test="${vo.step==0}">
                            ${vo.qnaNo }
                            	</c:if>
                            </th>
                            <td><a href="<c:url value='/cs/QnA/countUpdate.do?qnaNo=${vo.qnaNo }'/>">
                            <!-- 삭제 원본글인 경우 삭제된 글로 처리하기 -->
                            <c:choose>
                            	<c:when test="${vo.delFlag=='Y'}">
                            		<span style="color:gray; font-size:1.0em">
                            		<c:if test="${vo.step>0 }">
                            		<c:forEach var="i" begin="1" end="${vo.step }">
                            			&nbsp;
                            		</c:forEach>
                            		<img src="${pageContext.request.contextPath }/img/re.gif">
                            		</c:if>
                            		삭제된 글입니다.
                            		</span>   
                         		</c:when>
                            <c:otherwise>
                            <!-- 답변글인 경우 re이미지 표시하기 -->
                            	<c:if test="${vo.step>0 }">
                            		<c:forEach var="i" begin="1" end="${vo.step }">
                            			&nbsp;
                            		</c:forEach>
                            		<img src="${pageContext.request.contextPath }/img/re.gif">
                            	</c:if>
                            <!--제목이 긴 경우 일부만 보여주기 -->
                           	    <c:if test="${fn:length(vo.title)>25}">
                            	    ${fn:substring(vo.title,0,20) }...
                                </c:if>
                                   <c:if test="${fn:length(vo.title)<=25}">
                            	    ${vo.title }
                                </c:if>
                                </c:otherwise>
                                </c:choose>
                            </a>
                            </td>
                            <td>${vo.name }</td>
                            <td><fmt:formatDate value="${vo.regDate}" pattern="yyyy-MM-dd hh:mm"/></td>
                            <td class="text-center">${vo.readCount}</td>
                        </tr>
                        <!-- 비밀번호 유무 비교에 필요한 값들 -->
                       	<c:if test="${vo.delFlag=='N'}"><!-- 삭제된 글은 비밀번호 확인 없이 삭제된 글이라는 상세보기 가능 -->
                       		<c:if test="${empty agencyid}"><!-- 기업회원일 경우 비밀번호 입력 없이 QnA상세보기 가능 -->
	    						<input type="hidden" class="pass" name="pass" value="${vo.password}">
                       			 	<tr class="hid">
                        				<td colspan="4">
                        				<form name="passck" method="post" action="<c:url value='/cs/QnA/passck.do'/>">
                        				<span>비밀글 입니다. 비밀번호를 입력해주세요.<br>
                        				<input type="password" class="form-control" class="password" name="pwd" placeholder="4자리" style="width:100px; display:inline-block;" /> 
                        				<input type="submit" class="ckpassword" class="btn btn-success" style="margin-bottom:3px;" value="확인"/></span>
                        				<input type="hidden" name="qnaNo" value="${vo.qnaNo}">
                        				</form>	
                        				<td>
                      			  </tr>   
                      	  </c:if>
                        </c:if>
                     </c:forEach>
                     </c:if>
                    </tbody>
                </table>
                <div class="width500 margin0 marginT30" style="margin-left:400px;">
              	   	<c:if test="${pagingInfo.firstPage>1 }">
                		<a href="#" class="decoN colorBlue" onclick="pageFunc(${pagingInfo.firstPage-1})">◀</a>
                	</c:if>
                	<c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">
						<c:choose>
							<c:when test="${i==pagingInfo.currentPage }">
								<span class="colorBlue font-weight-bold" >${i }</span>
							</c:when>
							<c:otherwise>
								<span><a href="#" class="decoN colorGray" onclick="pageFunc(${i})">${i }</a></span>
							</c:otherwise>
						</c:choose>
                	</c:forEach>
                	<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
                		<a href="#" class="decoN colorBlue" onclick="pageFunc(${pagingInfo.lastPage+1})">▶</a>
                	</c:if>
                </div>	
          </div>
                 <div class="width500 margin0 marginT30" style="margin-left:550px;">
                	<form action="<c:url value='/cs/QnA/qna.do'/>" method="post" class="overflowH">
                		<select name="searchCondition" class="float-left form-control w-25">
                			<option value="title"
                				<c:if test="${param.searchCondition=='title' }">
                					selected="selected"
                				</c:if>
                			>제목</option>
                			<option value="content"
                				<c:if test="${param.searchCondition=='content' }">
                					selected="selected"
                				</c:if>
                			>내용</option>
                		</select>
                		<input type="text" name="searchKeyword" class="float-left form-control w-50" value="${param.searchKeyword }">
                		<input type="submit" value="검색" class="btn btn-info float-left marginL10">
                	</form>
                </div>
   </div>
   <div class="form-group text-right">
	   <a class="btn btn-primary" style="color:#fff;" href="<c:url value='/cs/QnA/qnaWrite.do'/>">글쓰기</a>
   </div>
</section>

 <%@ include file="../../inc/bottom.jsp"%>