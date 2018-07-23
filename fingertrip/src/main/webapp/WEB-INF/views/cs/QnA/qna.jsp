<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../inc/top.jsp"%>

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
                            <td><a href="<c:url value='/cs/QnA/qnaDetail.do'/>">이거 사기아니죠??</a></td>
                            <td>김수윤</td>
                            <td>18.07.18</td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>빨리 여행가고싶네요 ㅎㅎ</td>
                            <td>박백</td>
                            <td>18.07.17</td>
                        </tr>
                        <tr>
                            <th scope="row">1</th>
                            <td>혹시 결제를 하였는데 취소가능한가요?</td>
                            <td>공백</td>
                            <td>18.07.17</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="form-group text-right">
	                <a class="btn btn-primary" style="color:#fff;" href="<c:url value='/cs/QnA/qnaWrite.do'/>">글쓰기</a>
	    </div>
    </section>




 <%@ include file="../../inc/bottom.jsp"%>