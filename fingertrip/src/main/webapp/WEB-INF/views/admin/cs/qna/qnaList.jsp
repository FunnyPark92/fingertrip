<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/adminTop.jsp"%>
<script type="text/javascript">
	function pageFunc(currentPage){
		frmHid.currentPage.value=currentPage;
		frmHid.submit();
	}
$(document).ready(function(){
	$('input[name=chkAll]').click(function(){
		$('input[type=checkbox]').prop("checked",this.checked);
	});
	
	$('#delMulti').click(function(){
		var count=$('input[type=checkbox]:checked').length;
		if(count==0){
			alert("삭제할 QnA를 선택하세요.");
			return false;	
		}else{
			if(confirm("QnA를 삭제할 경우 되돌릴 수 없습니다. 그래도 진행하시겠습니까?")){
				return true;
			}else{
				return false;
			}
		}
	});
	$(".hid").hide();
	$(".click").click(function(){
		$(".hid").hide();
		var del=$('.delf').val();
		if(del!="N"){
			$(this).next().show();	
		}
	});
});
</script>

<section class="admCenter marginTop40" style="text-align: center">
	<h2>QnA리스트</h2>
	<div class="clearFix">
		<div class="fRight">
			<form action="<c:url value='/cs/QnA/qna.do'/>" method="post">
		    	<select name="searchCondition">
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
	     		<input type="text" name="searchKeyword" value="${param.searchKeyword }">
	     		<input type="submit" value="검색" >
	     		<input type="hidden" name="aNo" value="1">
			</form>
		</div>
	</div>
   	<div>
   		<form name="frmHid" action="<c:url value='/cs/QnA/qna.do'/>" method="post">
    		<input type="hidden" name="currentPage">
    		<input type="hidden" name="searchCondition" value="${param.searchCondition }">
    		<input type="hidden" name="searchKeyword" value="${param.searchKeyword }">
    		<input type="hidden" name="aNo" value="1">
   		</form>
   	</div>
    <form name="frmDel" action="<c:url value='/admin/cs/QnA/deleteMulti.do'/>" method="post">        	
    <table class="grayTh">
        <tr>
            <th scope="col" style="width:5%; text-align: center" ><input type="checkbox" name="chkAll"></th>
            <th scope="col" style="width:10%; text-align: center">번호</th>
            <th scope="col" style="width:50%; text-align: center">제목</th>
            <th scope="col" style="width:10%; text-align: center">작성자</th>
            <th scope="col" style="width:10%; text-align: center">조회수</th>
            <th scope="col" style="width:15%; text-align: center">등록일</th>
        </tr>
       	<c:if test="${!empty list}">
			  <!-- QnA 반복문 시작 -->          	 
			  <c:set var="idx" value="0"/>
          	  <c:forEach var="vo" items="${list}">
          	  <!-- 삭제된 글은 상세보기와 답글달기 버튼이 나타나지 않게 하기 위한 값 -->
          	  <input type="hidden" class="delFlag" class="delf" value="${vo.delFlag}">
              <tr style="text-align:center" class="click">
              	<td><input type="checkbox" name="qnAItems[${idx}].qnaNo" value="${vo.qnaNo}"/></td>
                  <td scope="row" class="text-center">${vo.qnaNo}</td>
                  <td style="text-align:left">
                   <a  href="#">
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
                  <td class="text-center">${vo.name }</td>
                  <td class="text-center">${vo.readCount }</td>
                  <td class="text-center"><fmt:formatDate value="${vo.regDate}" pattern="yyyy-MM-dd yy:mm"/></td>
              </tr>
              <tr class="hid">
              	<td colspan="6">
					<div class="aWrap fleft">                 
                		<a class="darkBorder"  href="<c:url value='/admin/cs/QnA/adminQnADetail.do?qnaNo=${vo.qnaNo}'/>">상세보기</a>
                    	<a class="darkBorder"  href="<c:url value='/admin/cs/QnA/qnAReplyWrite.do?qnaNo=${vo.qnaNo}'/>">답변하기</a>
                    </div>
              	</td>
              </tr>
            <c:set var="idx" value="${idx+1 }"/>
           	</c:forEach>
       </c:if>
    </table> 
	<div>
	 		<c:if test="${pagingInfo.firstPage>1 }">
				<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">◀</a>
			</c:if>
			<c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">
				<c:choose>
					<c:when test="${i==pagingInfo.currentPage }">
						<span >${i }</span>
					</c:when>
					<c:otherwise>
						<span><a href="#" onclick="pageFunc(${i})">${i }</a></span>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
				<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">▶</a>
			</c:if>
	</div>	
	<div class="aWrap fRight">
 		<input type="submit" id="delMulti" class="darkBorder" value="삭제"/>
	</div>
	</form>
</section>
</body>
</html>