<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/adminTop.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/find.css"/>
<style>
	#ctt a{
		text-decoration: underline;
		color:blue;
	}
	
	
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('#del').click(function(){
			if(confirm("삭제하시겠습니까?")){
				$('form[name=frmDel]').submit();
			}
		});
	});
</script>
	<section class="admCenter marginTop40">
		<table class="grayBor">
			<tr>
	 			<th>제목</th>
	 			<td>
					${vo.title}
				</td>
	 		</tr>
	 		<tr>
	 			<th>작성자</th>
	 			<td>
	 				${vo.name}
	 			</td>
	 		</tr>
	 		<tr>
	 			<th>등록일</th>
	 			<td>
					${vo.regDate}
				</td>
	 		</tr>
	 		<tr>
	 			<th>조회수</th>
	 			<td>
					${vo.readCount}
				</td>
	 		</tr>
			<tr>
				<th>내용</th>
		    	<td id="ctt">
		        	<div class="minheight300 pad15">
			         	${vo.content }
						<c:if test="${!empty listImg }">
							<c:set value="0" var="i"/>
							<c:forEach var="img" items="${listImg}">
								<img alt="" src="${pageContext.request.contextPath }/upload_pds/${img}" class="maxH500">
								<c:set value="${i+1 }" var="i"/>
							</c:forEach>
						</c:if>
        			</div>
			    </td>
			</tr>
		</table>
				<div class="fRight aWrap">
				    <a href="<c:url value='/cs/QnA/qna.do?aNo=1'/>" class="darkBorder">목록</a>
				   	<a id="del" class="darkGray" onclick="go()">삭제</a>
				   
					<form name="frmDel" method="post" action="<c:url value='/admin/cs/QnA/adminQnADelete.do'/>">
						<c:if test="${param.qnaNo==list[1].qnaNo }">
					   		<input type="hidden" name="qnaNo" value="${list[1].qnaNo }">
					   		<input type="hidden" name="fileName" value="${list[1].fileName}">
						</c:if>
						<c:if test="${param.qnaNo==list[0].qnaNo }">
					   		<input type="hidden" name="noticeNo" value="${list[0].qnaNo }">
					   		<input type="hidden" name="fileName" value="${list[0].fileName }">
						</c:if>
				    </form>
				</div>
				
				<c:set value="${fn:length(list) }" var="listLeng"/> 
		        <c:if test="${listLeng>=1 }">
		        	<div class="clear marginTop100 marginBottom90">
		          		<table class="table tableBorder grayBor">
		         			<c:if test="${listLeng==2}">
				           		<tr>
				          			<th class="width20"><img class="marR10" alt="윗글" src="${pageContext.request.contextPath }/img/up-arrow.png">윗글</th>
					           		<td class="width60"><a href="<c:url value='/admin/cs/QnA//adminQnADetail.do?qnaNo=${list[0].qnaNo }'/>">${list[0].title }</a></td>
					           		<td class="width20"><fmt:formatDate value="${list[0].regDate }" pattern="yyyy-MM-dd"/></td>
				           		</tr>
				           		<tr>
		         					<th class="width20"><img class="marR10" alt="아랫글" src="${pageContext.request.contextPath }/img/down-arrow.png">아랫글</th>
		         					<td class="width60"><a href="<c:url value='/admin/cs/QnA//adminQnADetail.do?qnaNo=${list[1].qnaNo }'/>">${list[1].title }</a></td>
					           		<td class="width20"><fmt:formatDate value="${list[1].regDate }" pattern="yyyy-MM-dd"/></td>
		         				</tr>	
		         			</c:if>
		         	
		         			<c:if test="${listLeng==1&&(list[0].qnaNo>param.qnaNo)}">
		         				<tr>
				          			<th class="width20"><img class="marR10" alt="윗글" src="${pageContext.request.contextPath }/img/up-arrow.png">윗글</th>
					           		<td class="width60"><a href="<c:url value='/admin/cs/QnA//adminQnADetail.do?qnaNo=${list[0].qnaNo }'/>">${list[0].title }</a></td>
					           		<td class="width20"><fmt:formatDate value="${list[0].regDate }" pattern="yyyy-MM-dd"/></td>
				           		</tr>
		         			</c:if>
		         			<c:if test="${listLeng==1&&(list[0].qnaNo<param.qnaNo)}">
				           		<tr>
		         					<th class="width20"><img class="marR10" alt="아랫글" src="${pageContext.request.contextPath }/img/down-arrow.png">아랫글</th>
		         					<td class="width60"><a href="<c:url value='/admin/cs/QnA//adminQnADetail.do?qnaNo=${list[0].qnaNo }'/>">${list[0].title }</a></td>
					           		<td class="width20"><fmt:formatDate value="${list[0].regDate }" pattern="yyyy-MM-dd"/></td>
		         				</tr>	
			          		</c:if>
		          		</table>
		        	</div>
				</c:if>
	</section>

