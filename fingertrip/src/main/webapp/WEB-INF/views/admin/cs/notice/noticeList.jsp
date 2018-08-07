<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/adminTop.jsp"%>
<script type="text/javascript">
	function pageFunc(currentPage){
		frmHid.currentPage.value=currentPage;
		frmHid.submit();
	}
	$(document).ready(function(){
		$('a[name=del]').click(function(){
			var count=0;
			$('input[name=chk]').each(function(){
				if($(this).is(':checked')){
					count++;
				}
			});
			if(count==0){
				alert('삭제할 공지사항을 선택해주세요');
				return false;
			}else{
				$('form[name=frmDel]').submit();
			}
		});
	});
	
	function allChecked(bool){
		$('input[name=chk]').prop('checked',bool);
	}
</script>

<section class="admCenter marginTop40" style="text-align: center">
	<ul class="clearFix marginBottom40 lineGnb">
     	<li class="on"><a href="<c:url value='/admin/cs/notice/noticeList.do'/>">공지사항조회</a></li>
       	<li><a href="<c:url value='/admin/cs/notice/noticeWrite.do'/>">공지사항등록</a></li>
  	</ul>
	<h2>공지사항</h2>
	<div class="clearFix">
		<div class="fRight">
			<form action="<c:url value='/admin/cs/notice/noticeList.do'/>" method="post">
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
			</form>
		</div>
	</div>
   	<div>
   		<form name="frmHid" action="<c:url value='/admin/cs/notice/noticeList.do'/>" method="post">
    		<input type="hidden" name="currentPage">
    		<input type="hidden" name="searchCondition" value="${param.searchCondition }">
    		<input type="hidden" name="searchKeyword" value="${param.searchKeyword }">
   		</form>
   	</div>
            	
    <table class="grayTh">
        <tr>
            <th scope="col" style="width:5%; text-align: center" ><input type="checkbox" name="chkAll" onclick="allChecked(this.checked)"></th>
            <th scope="col" style="width:10%; text-align: center">번호</th>
            <th scope="col" style="width:50%; text-align: center">제목</th>
            <th scope="col" style="width:10%; text-align: center">작성자</th>
            <th scope="col" style="width:10%; text-align: center">조회수</th>
            <th scope="col" style="width:15%; text-align: center">등록일</th>
        </tr>
        <c:if test="${!empty list}">
        	<form name="frmDel" action="<c:url value='/admin/cs/notice/deleteMulti.do'/>" method="post">
         	<!-- 공지사항 반복문 시작 -->
          	<c:forEach var="map" items="${list}">
              <tr style="text-align: center">
              	<td><input type="checkbox" name="chk" value="${map['NOTICE_NO']}"></td>
                  <td scope="row" class="text-center">${map['NOTICE_NO']}</td>
                  <td>
                   <a href="<c:url value='/admin/cs/notice/noticeDetail.do?noticeNo=${map["NOTICE_NO"]}'/>">
                    <!--제목이 긴 경우 일부만 보여주기 -->
                    <c:if test="${fn:length(map['TITLE'])>30}">
                    	${fn:substring(map['TITLE'],0,30) }...
                    </c:if>
                    <c:if test="${fn:length(map['TITLE'])<=30}">
                    	${map['TITLE'] }
                    </c:if>
                   </a>
                  </td>
                  <td class="text-center">${map['NAME'] }</td>
                  <td class="text-center">${map['READ_COUNT'] }</td>
                  <td class="text-center"><fmt:formatDate value="${map['REG_DATE'] }" pattern="yyyy-MM-dd"/></td>
              </tr>
           	</c:forEach>
          </form>
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
 		<a href="#" class="darkBorder" name="del">삭제</a>
	</div>
                
</section>


</body>
</html>