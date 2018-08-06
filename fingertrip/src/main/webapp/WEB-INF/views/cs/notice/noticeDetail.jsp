<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/find.css"/>

<script type="text/javascript">
	$(document).ready(function(){
		$('#del').click(function(){
			var confrm=confirm("삭제하시겠습니까?");
			if(confrm){
				$('form[name=frmDel]').submit();
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
					<a href="<c:url value='/cs/notice/noticeList.do'/> " class="list-group-item active">공지사항</a>
					<a href="<c:url value='/cs/QnA/qna.do'/> " class="list-group-item">Q&amp;A</a>
					<a href="<c:url value='/cs/faq/faq.do'/> " class="list-group-item">FAQ</a>
				</div>
			</div>
		
			<!-- 서브컨텐츠 -->
			<div class="col-lg-9">
				<table class="table tableBorder">
					<tr>
						<th class="width30">제목</th>
						<td class="width70">
							<c:if test="${param.noticeNo==list[1].noticeNo }">
								${list[1].title}
							</c:if>
							<c:if test="${param.noticeNo==list[0].noticeNo }">
								${list[0].title}
							</c:if>
						</td>
					</tr>
					<tr>
				    	<th class="width30">등록일</th>
					    <td class="width70">
					    <c:if test="${param.noticeNo==list[1].noticeNo }">
							<fmt:formatDate value="${list[1].regDate }" pattern="yyyy-MM-dd"/> 
						</c:if>
						<c:if test="${param.noticeNo==list[0].noticeNo }">
							<fmt:formatDate value="${list[0].regDate }" pattern="yyyy-MM-dd"/> 
						</c:if>
					    </td>
					</tr>
					<tr>
						<th class="width30">조회수</th>
						<td class="width70">
							<c:if test="${param.noticeNo==list[1].noticeNo }">
								${list[1].readCount }
							</c:if>
							<c:if test="${param.noticeNo==list[0].noticeNo }">
								${list[0].readCount }
							</c:if>
						</td>
					</tr>
					<c:if test="${!empty list3 }">
						<tr>
							<th class="width30">첨부파일</th>
						 	<td class="width70">
						 		<c:set value="0" var="i"/>
								<c:forEach begin="1" end="${fn:length(list3) }">
									<img src="${pageContext.request.contextPath }/img/save.png">
									<a href="<c:url value='/cs/notice/download.do?fileName=${list3[i]}'/>"> 
										<c:if test="${fn:length(list3[i])>35}">
											${fn:substring(list3[i],0,35) }...
										</c:if>
										<c:if test="${fn:length(list3[i])<=35}">
											${list3[i]}
										</c:if>
									</a>
									<br>
									<c:set value="${i+1 }" var="i"/>
								</c:forEach>
							 </td>
						</tr>
					</c:if>
					<tr>
				    	<td colspan="2">
				        	<div class="minheight300">
					         	<c:if test="${param.noticeNo==list[1].noticeNo }">
									${list[1].content }
								</c:if>
								<c:if test="${param.noticeNo==list[0].noticeNo }">
									${list[0].content }
								</c:if>
								<c:if test="${!empty list2 }">
									<c:set value="0" var="i"/>
									<c:forEach items="${list2 }" var="imgFileN">
										<img alt="" src="${pageContext.request.contextPath }/upload_pds/${imgFileN}" class="maxW100">
										<c:set value="${i+1 }" var="i"/>
									</c:forEach>
								</c:if>
				        	</div>
					    </td>
					</tr>
				</table>
				<div class="fRight">
				    <a href="<c:url value='/cs/notice/noticeList.do'/>" class="btn btn-outline-info">목록</a>
				    <c:if test="${param.noticeNo==list[1].noticeNo }">
					    <a href="<c:url value='/cs/notice/noticeEdit.do?noticeNo=${list[1].noticeNo }'/>" class="btn btn-outline-warning btnColor">수정</a>
				    </c:if>
				    <c:if test="${param.noticeNo==list[0].noticeNo }">
			    		<a href="<c:url value='/cs/notice/noticeEdit.do?noticeNo=${list[0].noticeNo }'/>" class="btn btn-outline-warning btnColor">수정</a>
				    </c:if>
				   	<a id="del" class="btn btn-outline-danger" onclick="go()">삭제</a>
				   
					<form name="frmDel" method="post" action="<c:url value='/cs/notice/noticeDelete.do'/>">
						<c:if test="${param.noticeNo==list[1].noticeNo }">
					   		<input type="hidden" name="noticeNo" value="${list[1].noticeNo }">
					   		<input type="hidden" name="fileName" value="${list[1].fileName}">
						</c:if>
						<c:if test="${param.noticeNo==list[0].noticeNo }">
					   		<input type="hidden" name="noticeNo" value="${list[0].noticeNo }">
					   		<input type="hidden" name="fileName" value="${list[0].fileName }">
						</c:if>
				    </form>
				</div>
		         
		   		<c:set value="${fn:length(list) }" var="listLeng"/> 
		        <c:if test="${listLeng>1 }">
		        	<div class="clear marginTop100">
		          		<table class="table tableBorder">
		         			<c:if test="${param.noticeNo==list[1].noticeNo}">
				           		<tr>
				          			<th class="width20"><img class="prev" alt="이전글" src="${pageContext.request.contextPath }/img/up.png">이전글</th>
					           			<td class="width60"><a href="<c:url value='/cs/notice/noticeDetail.do?noticeNo=${list[0].noticeNo }'/>">${list[0].title }</a></td>
					           			<td class="width20"><fmt:formatDate value="${list[0].regDate }" pattern="yyyy-MM-dd"/></td>
				           		</tr>
		         			</c:if>
		         			
		         			<c:if test="${(empty list[2]&&param.noticeNo!=list[1].noticeNo)||!empty list[2]}">
				           		<tr>
				           			<th class="width20"><img class="prev" alt="다음글" src="${pageContext.request.contextPath }/img/down.png">다음글</th>
				           			<c:if test="${!empty list[2] }">
					           			<td class="width60"><a href="<c:url value='/cs/notice/noticeDetail.do?noticeNo=${list[2].noticeNo }'/>">${list[2].title }</a></td>
					           			<td class="width20"><fmt:formatDate value="${list[2].regDate }" pattern="yyyy-MM-dd"/></td>
				           			</c:if>
				          			<c:if test="${empty list[2] }">
					           			<td class="width60"><a href="<c:url value='/cs/notice/noticeDetail.do?noticeNo=${list[1].noticeNo }'/>">${list[1].title }</a></td>
					           			<td class="width20"><fmt:formatDate value="${list[1].regDate }" pattern="yyyy-MM-dd"/></td>
					           		</c:if>
				           		</tr>
			          		</c:if>
		          		</table>
		        	</div>
				</c:if>
			</div>
		</div>
	</section>

<%@ include file="../../inc/bottom.jsp"%>