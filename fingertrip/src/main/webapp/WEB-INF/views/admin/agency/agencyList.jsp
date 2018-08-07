<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>
<script type="text/javascript">
function pageFunc(currentPage){
	page.currentPage.value=currentPage;
	page.submit();
}

$(document).ready(function(){
	$('input[name=chkAll]').click(function(){
		$('input[type=checkbox]').prop("checked",this.checked);
	});
	
	$('#delete').click(function(){
		var checked = $('input[type=checkbox]:checked').length;
		if(checked==0){
			alert("삭제 할 기업을 선택해 주세요");
			return false;
		}else{
			if(confirm("정말 삭제하시겠습니까?")){
				return true;
			}else{
				return false;
			}
			
		}
		
	});
	
});

</script>

<section class="admCenter marginTop40" style="text-align: center">
        <ul class="clearFix marginBottom40 lineGnb">
            <li class="on"><a href="<c:url value='/admin/agency/agencyList.do'/>">기업회원조회</a></li>
            <li><a href="<c:url value='/admin/agency/agencyWrite.do'/>">기업회원가입</a></li>
        </ul>
        <!-- 페이징 처리를 위한 div -->
        <form name="page" action="#" method="post">
			<input type="hidden" name="currentPage">
	        <input type="hidden" name="searchCondition" value="${param.searchCondition }">
	        <input type="hidden" name="searchKeyword" value="${param.searchKeyword }"> 
        </form>
        <h2>기업 회원 조회</h2>
      
        <div class="clearFix">
        	<form action="<c:url value='/admin/agency/agencyList.do'/>" method="post">
           <div class="fRight">
           		<select name="searchCondition">
           			<option value="name"
           				<c:if test="${param.searchCondition=='name' }">
                					selected="selected"
                		</c:if>
           			>상호명</option>
           			<option value="license_No"
           				<c:if test="${param.searchCondition=='licenseNo'}">
                					selected="selected"
                		</c:if>
           			>사업자 번호</option>
           			
           		</select>
               <input type="text" name="searchKeyword" value="${param.searchKeyword}">
                <input type="submit" value="검색">
           </div>
           </form>
        </div>
        
        <form name="frmList" method="post" action="<c:url value='/admin/agency/deleteAgency.do'/>" >
        <table class="grayTh">
            <tr>
                <th scope="col" style="width:5%; text-align: center"><input type="checkbox" name="chkAll"/></th>
                <th scope="col" style="width:7%; text-align: center">번호</th>
                <th scope="col" style="width:20%; text-align: center">상호명</th>
                <th scope="col" style="width:15%; text-align: center">아이디</th>
                <th scope="col" style="width:15%; text-align: center">전화번호</th>
                <th scope="col" style="width:15%; text-align: center">사업자등록번호</th>
            </tr>
            <!-- 기업 반복 시작 -->
            <c:set var="idx" value="0"/>
            <c:forEach var="vo" items="${list}">
	            <tr style="text-align: center">
	                <td><input type="checkbox" name="agencyItems[${idx}].travelAgencyNo" value="${vo.travelAgencyNo }"></td>
	                <td>${vo.travelAgencyNo }</td>
	                <td><a href="<c:url value='/admin/agency/agencyDetail.do?name=${vo.name}'/>">${vo.name }</a></td>
	                <td>${vo.id }</td>
	                <td>${vo.hp }</td>
	                <td>${vo.licenseNo}</td>
	            </tr>
	            <c:set var="idx" value="${idx+1 }"/>
            </c:forEach>
            <!-- 기업 반복 끝 -->
            
        </table>
        <!-- paging 시작 -->
        <c:if test="${pagingInfo.firstPage>1 }">
        <a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">◀</a>
        </c:if>
        <c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">
        		
				<c:choose>
					<c:when test="${i==pagingInfo.currentPage }">
						<span>${i }</span>
					</c:when>
					<c:otherwise>
						<span><a href="#" onclick="pageFunc(${i})">${i }</a></span>
					</c:otherwise>
				</c:choose>
				
         </c:forEach>
         <c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
            <a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">▶</a>
         </c:if>
        <div class="aWrap fRight">
        	<input type="submit" class="darkBorder" id="delete" value="삭제"/>
        </div>
        </form>
    </section>


</body>
</html>