<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>

<link href="${pageContext.request.contextPath}/css/jquery-ui.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script>
$(document).ready(function(){

$("#tabs").tabs();
$(".accordion").accordion({"heightStyle":"content"});

});
</script>


<section class="container board marginTop80 marginBottom80 minheight600">
        <div class="row">

           <!-- 서브메뉴 -->
            <div class="col-lg-3">
                <h3>고객센터</h3>
                <div class="list-group">
                    <a href="<c:url value='/cs/notice/board.do'/> " class="list-group-item ">공지사항</a>
                    <a href="<c:url value='/cs/QnA/qna.do'/> " class="list-group-item">Q&amp;A</a>
                    <a href="<c:url value='/cs/faq/faq.do'/> " class="list-group-item active">FAQ</a>
                </div>
            </div>
    
           <!-- 서브컨텐츠 -->
            <div class="col-lg-9">
            	<div id="tabs">
					<ul>
						<li><a href="#tabs-1">결제/환불</a></li>
						<li><a href="#tabs-2">쿠폰</a></li>
						<li><a href="#tabs-3">상품</a></li>
						<li><a href="#tabs-4">기타</a></li>
					</ul>
					<div id="tabs-1">
						<div class="accordion">
							<c:forEach var="aa" begin="1" end="5">
								<h3><span>제목</span></h3>
								<div>
									<p>내용</p>
								</div>
							</c:forEach>
						</div>
					</div>
					<div id="tabs-2">
						<div class="accordion">
							<c:forEach var="aa" begin="1" end="5">
								<h3>제목2</h3>
								<div>
									<p>내용2</p>
								</div>
							</c:forEach>
						</div>
					</div>
					<div id="tabs-3">
						<div class="accordion">
							<c:forEach var="aa" begin="1" end="5">
								<h3>제목3</h3>
								<div>
									<p>내용3</p>
								</div>
							</c:forEach>
						</div>
					</div>
					<div id="tabs-4">
						<div class="accordion">
							<c:forEach var="aa" begin="1" end="5">
								<h3>제목4</h3>
								<div>
									<p>내용4</p>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			
				            
       

            </div>
        </div>
    </section>





<%@ include file="../../inc/bottom.jsp"%>