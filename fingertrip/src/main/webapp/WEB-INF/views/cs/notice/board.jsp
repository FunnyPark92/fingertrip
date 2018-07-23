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
                            <th scope="col" style="width:65%">제목</th>
                            <th scope="col" style="width:18%">작성자</th>
                            <th scope="col">등록일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">3</th>
                            <td><a href="<c:url value='/cs/notice/boardDetail.do'/>">회원가입을 환영합니다.</a></td>
                            <td>최고관리자</td>
                            <td>18.07.18</td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>최초 이벤트</td>
                            <td>관리자</td>
                            <td>18.07.17</td>
                        </tr>
                        <tr>
                            <th scope="row">1</th>
                            <td>회원가입을 환영합니다.</td>
                            <td>최고관리자</td>
                            <td>18.07.17</td>
                        </tr>
                    </tbody>
                </table>

            </div>
        </div>
    </section>




 <%@ include file="../../inc/bottom.jsp"%>