<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/find.css"/>
<section class="container board marginTop80 marginBottom80 minheight600">
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
    
     		<!-- 서브컨텐츠 -->
            <div class="col-lg-9">
                <table class="table tableBorder">
                    <tr>
                        <th>제목</th>
                        <td>${vo.title}</td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td>${vo.name}</td>
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
                            	<p class="font-italic font-weight-bold"><img class="qna" src="${pageContext.request.contextPath }/img/question.png">Question</p>
                               	<br>
                               	<p>${vo.content}</p>
                            </div>
                        </td>
                    </tr>
                </table>
                <div class="fRight">
                    <a href="<c:url value='/cs/QnA/qna.do'/>" class="btn btn btn-warning">목록</a>
                </div>
                
                <div class="clear marginTop100">
                	<table class="table tableBorder">
                		<tr>
                			<th><img class="prev" alt="이전글" src="${pageContext.request.contextPath }/img/up.png">이전글</th>
                			<td><a href="">오늘의 공지사항 제목</a></td>
                			<td>최고관리자</td>
                			<td>2018. 07. 23</td>
                		</tr>
                		<tr>
                			<th><img class="prev" alt="다음글" src="${pageContext.request.contextPath }/img/down.png">다음글</th>
                			<td><a href="">어제의 공지사항 제목</a></td>
                			<td>관리자</td>
                			<td>2018. 07. 22</td>
                		</tr>
                	</table>
                </div>
            </div>
    
        </div>
    </section>

<%@ include file="../../inc/bottom.jsp"%>