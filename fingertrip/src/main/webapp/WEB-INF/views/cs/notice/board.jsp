<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../inc/top.jsp"%>

<section class="container board marginTop80 marginBottom80 minheight600">
        <div class="row">

           <!-- 서브메뉴 -->
            <div class="col-lg-3">
                <h3>고객센터</h3>
                <div class="list-group">
                    <a href="<c:url value='/cs/notice/board.do'/> " class="list-group-item active">공지사항</a>
                    <a href="<c:url value='/cs/QnA/qna.do'/> " class="list-group-item">Q&amp;A</a>
                    <a href="<c:url value='/cs/faq/faq.do'/> " class="list-group-item">FAQ</a>
                </div>
            </div>
    
           <!-- 서브컨텐츠 -->
            <div class="col-lg-9">
                <table class="table table-hover tableBorder">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col" style="width:5%"></th>
                            <th scope="col" style="width:57%">제목</th>
                            <th scope="col" style="width:18%">관리자번호</th>
                            <th scope="col" style="width:26%">등록일</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:if test="${!empty list}">
                    <!-- Board리스트 내용 반복문 시작 -->
                    <c:forEach var="vo" items="${list}">
                        <tr>
                            <th scope="row">${vo.noticeNo }</th>
                            <td><a href="<c:url value='/cs/QnA/qnaDetail.do'/>">
                            <!--제목이 긴 경우 일부만 보여주기 -->
                            <c:if test="${fn:length(vo.title)>25}">
                            	${fn:substring(vo.title,0,20) }...
                            </c:if>
                            <c:if test="${fn:length(vo.title)<=25}">
                            	${vo.title }
                            </c:if>
                            </a></td>
                            <td>${vo.adminNo }</td>
                            <td><fmt:formatDate value="${vo.regDate}" pattern="yyyy-MM-dd hh:mm"/></td>
                        </tr>
                     </c:forEach>
                     </c:if>
                    </tbody>
                </table>

            </div>
        </div>
    </section>




 <%@ include file="../../inc/bottom.jsp"%>