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
			var confrm=confirm("삭제하시겠습니까?");
			if(confrm){
				$('form[name=frmDel]').submit();
			}
		});
	});
</script>
	<section class="admCenter marginTop40">
		<ul class="clearFix marginBottom40 lineGnb">
	     	<li class="on"><a href="<c:url value='/admin/cs/notice/noticeList.do'/>">공지사항조회</a></li>
	       	<li><a href="<c:url value='/admin/cs/notice/noticeWrite.do'/>">공지사항등록</a></li>
  		</ul>
		<table class="grayBor">
			<tr>
	 			<th>제목</th>
	 			<td>
					<c:if test="${param.noticeNo==list[1].noticeNo }">
						${list[1].title}
					</c:if>
					<c:if test="${param.noticeNo==list[0].noticeNo }">
						${list[0].title}
					</c:if>
				</td>
	 		</tr>
	 		<tr>
	 			<th>작성자</th>
	 			<td>
	 				${name }
	 			</td>
	 		</tr>
	 		<tr>
	 			<th>등록일</th>
	 			<td>
					 <c:if test="${param.noticeNo==list[1].noticeNo }">
							<fmt:formatDate value="${list[1].regDate }" pattern="yyyy-MM-dd"/> 
						</c:if>
						<c:if test="${param.noticeNo==list[0].noticeNo }">
							<fmt:formatDate value="${list[0].regDate }" pattern="yyyy-MM-dd"/> 
						</c:if> 
				</td>
	 		</tr>
	 		<tr>
	 			<th>조회수</th>
	 			<td>
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
					<th>첨부파일</th>
				 	<td>
				 		<c:set value="0" var="i"/>
						<c:forEach begin="1" end="${fn:length(list3) }">
							<img src="${pageContext.request.contextPath }/img/save.png">
							<a href="<c:url value='/cs/notice/download.do?fileName=${list3[i]}'/>"> 
								<%-- <c:if test="${fn:length(list3[i])>35}">
									${fn:substring(list3[i],0,35) }...
								</c:if>
								<c:if test="${fn:length(list3[i])<=35}"> --%>
									${list3[i]}
								<%-- </c:if> --%>
							</a>
							<br>
							<c:set value="${i+1 }" var="i"/>
						</c:forEach>
					 </td>
				</tr>
			</c:if>
			<tr>
				<th>내용</th>
		    	<td id="ctt">
		        	<div class="minheight300 pad15">
			         	<c:if test="${param.noticeNo==list[1].noticeNo }">
							${list[1].content }
						</c:if>
						<c:if test="${param.noticeNo==list[0].noticeNo }">
							${list[0].content }
						</c:if>
						<c:if test="${!empty list2 }">
							<c:set value="0" var="i"/>
							<c:forEach items="${list2 }" var="imgFileN">
								<img alt="" src="${pageContext.request.contextPath }/upload_pds/${imgFileN}" class="maxH500">
								<c:set value="${i+1 }" var="i"/>
							</c:forEach>
						</c:if>
        			</div>
			    </td>
			</tr>
		</table>
				<div class="fRight aWrap">
				    <a href="<c:url value='/admin/cs/notice/noticeList.do'/>" class="darkBorder">목록</a>
				    <c:if test="${param.noticeNo==list[1].noticeNo }">
					    <a href="<c:url value='/admin/cs/notice/noticeEdit.do?noticeNo=${list[1].noticeNo }'/>" class="lightGray">수정</a>
				    </c:if>
				    <c:if test="${param.noticeNo==list[0].noticeNo }">
			    		<a href="<c:url value='/admin/cs/notice/noticeEdit.do?noticeNo=${list[0].noticeNo }'/>" class="lightGray">수정</a>
				    </c:if>
				   	<a id="del" class="darkGray" onclick="go()">삭제</a>
				   
					<form name="frmDel" method="post" action="<c:url value='/admin/cs/notice/noticeDelete.do'/>">
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
		        	<div class="clear marginTop100 marginBottom90">
		          		<table class="table tableBorder grayBor">
		         			<c:if test="${param.noticeNo==list[1].noticeNo}">
				           		<tr>
				          			<th class="width20"><img class="marR10" alt="윗글" src="${pageContext.request.contextPath }/img/up-arrow.png">윗글</th>
					           			<td class="width60"><a href="<c:url value='/admin/cs/notice/noticeDetail.do?noticeNo=${list[0].noticeNo }'/>">${list[0].title }</a></td>
					           			<td class="width20"><fmt:formatDate value="${list[0].regDate }" pattern="yyyy-MM-dd"/></td>
				           		</tr>
		         			</c:if>
		         			
		         			<c:if test="${(empty list[2]&&param.noticeNo!=list[1].noticeNo)||!empty list[2]}">
				           		<tr>
				           			<th class="width20"><img class="marR10" alt="아랫글" src="${pageContext.request.contextPath }/img/down-arrow.png">아랫글</th>
				           			<c:if test="${!empty list[2] }">
					           			<td class="width60"><a href="<c:url value='/admin/cs/notice/noticeDetail.do?noticeNo=${list[2].noticeNo }'/>">${list[2].title }</a></td>
					           			<td class="width20"><fmt:formatDate value="${list[2].regDate }" pattern="yyyy-MM-dd"/></td>
				           			</c:if>
				          			<c:if test="${empty list[2] }">
					           			<td class="width60"><a href="<c:url value='/admin/cs/notice/noticeDetail.do?noticeNo=${list[1].noticeNo }'/>">${list[1].title }</a></td>
					           			<td class="width20"><fmt:formatDate value="${list[1].regDate }" pattern="yyyy-MM-dd"/></td>
					           		</c:if>
				           		</tr>
			          		</c:if>
		          		</table>
		        	</div>
				</c:if>
	</section>

