<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../../inc/top.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/find.css"/>

<script type="text/javascript">

function pageFunc1(currentPage){
	page.currentPage.value=currentPage;
	page.submit();
    }

function pageFunc2(currentPage){
	page.currentPageforCourse.value=currentPage;
	
	page.submit();
    }
</script>

<section class="container board marginTop80 marginBottom80 minheight600">
	<div class="container margin80">
		<div class="row">
			<!-- 서브메뉴 -->
	        <div class="col-lg-3">
	            <h3>마이페이지</h3>
	            <div class="list-group">
	                <a href="<c:url value='/member/memberEdit.do'/>" class="list-group-item">회원 정보 수정</a>
	                <a href="<c:url value='/member/memberOut.do'/>" class="list-group-item">회원 탈퇴</a>
	                <a href="<c:url value='/myPage/myWrite/myWriteList.do'/>" class="list-group-item active">내가 쓴 글</a>
	                <a href="<c:url value='/myPage/myCourse/myCourseList.do'/>" class="list-group-item">내가 찜한 코스</a>
	                <a href="<c:url value='/myPage/myCoupon/couponList.do'/>" class="list-group-item">쿠폰</a>
	                <a href="<c:url value='/myPage/myPayment/paymentList.do'/>" class="list-group-item">결제확인</a>
	                <a href="<c:url value='/myPage/myHeart/heartList.do'/>" class="list-group-item">하트</a>
	            </div>
	        </div>
	         <!-- 서브컨텐츠1 내가 쓴 QnA -->
            <div class="col-lg-9">
                <h5>내가 작성한 QnA</h5>
            	<div>
            		<form name="page" action="<c:url value='/myPage/myWrite/myWriteList.do'/>" method="post">
	            		<input type="hidden" name="currentPage" value="${QnAcur}">
	            	    <input type="hidden" name="currentPageforCourse" value="${param.currentPageforCourse }">
            		</form>
            	</div>
                <table class="table table-hover tableBorder">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col" style="width:10%" class="text-center">번호</th>
                            <th scope="col" style="width:55%" class="text-center">제목</th>
                            <th scope="col" style="width:10%" class="text-center">조회수</th>
                            <th scope="col" style="width:25%" class="text-center">등록일</th>
                        </tr>
                    </thead>
                    <tbody>
                      <c:if test="${!empty QnAlist}">
	                    <!-- 내가 쓴 QnA 반복문 시작 -->
	                    <c:forEach var="vo" items="${QnAlist}">
	                        <tr>
	                            <td scope="row" class="text-center">${vo.qnaNo }</td>
	                            <td>
		                            <a href="<c:url value='/cs/QnA/countUpdate.do?qnaNo=${vo.qnaNo }'/>">
			                            <!--제목이 긴 경우 일부만 보여주기 -->
			                            <c:if test="${fn:length(vo.title)>25}">
			                            	${fn:substring(vo.title,0,25) }...
			                            </c:if>
			                            <c:if test="${fn:length(vo.title)<=25}">
			                            	${vo.title }
			                            </c:if>
		                            </a>
	                            </td>
	                            <td class="text-center">${vo.readCount }</td>
	                            <td class="text-center"><fmt:formatDate value="${vo.regDate }" pattern="yyyy-MM-dd hh:mm"/></td>
	                        </tr>
	                     </c:forEach>
                     </c:if>
                   </tbody>
                </table>
                <div>
	                <div class="margin0 width150 marginT30">
	                	<c:if test="${pagingInfoQnA.firstPage>1 }">
	                	<a href="#" class="decoN colorGray" onclick="pageFunc1(${pagingInfoQnA.firstPage-1})">◀</a>
	                	</c:if>
	                	<c:forEach var="i" begin="${pagingInfoQnA.firstPage }" end="${pagingInfoQnA.lastPage }">
							<c:choose>
								<c:when test="${i==pagingInfoQnA.currentPage }">
									<span class="colorBlue font-weight-bold" >${i }</span>
								</c:when>
								<c:otherwise>
									<span><a href="#" class="decoN colorGray" onclick="pageFunc1(${i})">${i }</a></span>
								</c:otherwise>
							</c:choose>
	                	</c:forEach>
	                	<c:if test="${pagingInfoQnA.lastPage<pagingInfoQnA.totalPage }">
	                	<a href="#" class="decoN colorGray" onclick="pageFunc1(${pagingInfoQnA.lastPage+1})">▶</a>
	                	</c:if>
	                </div>
	           </div> 
	           <!-- 컨텐츠1 -->
	            
	           <!-- 서브컨텐츠2 내가 쓴 나코짜코스 -->
	            <h5>내가 작성한 여행코스</h5>
                <table class="table table-hover tableBorder">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col" style="width:10%" class="text-center">번호</th>
                            <th scope="col" style="width:55%" class="text-center">제목</th>
                            <th scope="col" style="width:10%" class="text-center">하트수</th>
                            <th scope="col" style="width:25%" class="text-center">등록일</th>
                        </tr>
                    </thead>
                    <tbody>
                      <c:if test="${!empty CourseList}">
	                    <!-- 내가 쓴 Course 반복문 시작 -->
	                    <c:forEach var="vo" items="${CourseList}">
	                        <tr>
	                            <td scope="row" class="text-center">${vo.courseNo }</td>
	                            <td>
		                            <a href="<c:url value='미정 나코자게시판이 완성되면 디테일페이지로 연결=${vo.courseNo }'/>">
			                            <!--제목이 긴 경우 일부만 보여주기 -->
			                            <c:if test="${fn:length(vo.title)>25}">
			                            	${fn:substring(vo.title,0,25) }...
			                            </c:if>
			                            <c:if test="${fn:length(vo.title)<=25}">
			                            	${vo.title }
			                            </c:if>
		                            </a>
	                            </td>
	                            <td class="text-center">${vo.heartCount }</td>
	                            <td class="text-center"><fmt:formatDate value="${vo.regDate }" pattern="yyyy-MM-dd hh:mm"/></td>
	                        </tr>
	                     </c:forEach>
                     </c:if>
                   </tbody>
                </table>
                <div>
	                <div class="margin0 width150 marginT30">
	                	<c:if test="${pagingInfoCourse.firstPage>1 }">
	                	<a href="#" class="decoN colorGray" onclick="pageFunc2(${pagingInfoCourse.firstPage-1})">◀</a>
	                	</c:if>
	                	<c:forEach var="i" begin="${pagingInfoCourse.firstPage }" end="${pagingInfoCourse.lastPage }">
							<c:choose>
								<c:when test="${i==pagingInfoCourse.currentPage }">
									<span class="colorBlue font-weight-bold" >${i }</span>
								</c:when>
								<c:otherwise>
									<span><a href="#" class="decoN colorGray" onclick="pageFunc2(${i})">${i }</a></span>
								</c:otherwise>
							</c:choose>
	                	</c:forEach>
	                	<c:if test="${pagingInfoCourse.lastPage<pagingInfoCourse.totalPage }">
	                	<a href="#" class="decoN colorGray" onclick="pageFunc2(${pagingInfoCourse.lastPage+1})">▶</a>
	                	</c:if>
	                </div>
	           </div>
	      <!-- 컨텐츠2 --> 
         </div> 
	    </div>
	</div>
</section>


<%@ include file="../../inc/bottom.jsp" %>
