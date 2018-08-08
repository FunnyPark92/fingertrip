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
	
	$('#delMulti').click(function(){
		var count=$('input[type=checkbox]:checked').length;
		if(count==0){
			alert("삭제할 회원을 선택하세요.");
			return false;	
		}else{
			if(confirm("개인회원을 탈퇴시킬경우 되돌릴 수 없습니다. 그래도 진행하시겠습니까?")){
				return true;
			}else{
				return false;
			}
		}
	});
	
});
</script>
<section class="admCenter marginTop40" style="text-align: center">
        <form name="page" action="<c:url value='/admin/member/memberList.do'/>" method="post">
			<input type="hidden" name="currentPage">
	        <input type="hidden" name="searchCondition" value="${param.searchCondition }">
	        <input type="hidden" name="searchKeyword" value="${param.searchKeyword }"> 
        </form>
        
        
        <h2>개인 회원 조회</h2>
        <div class="clearFix">
        <form action="<c:url value='/admin/member/memberList.do'/>" method="post">
           	<div class="fRight">
           		<select name="searchCondition">
           			<option value="name"
           				<c:if test="${param.searchCondition=='name' }">
                					selected="selected"
                		</c:if>
           			>이름</option>
           			<option value="id"
           				<c:if test="${param.searchCondition=='id'}">
                					selected="selected"
                		</c:if>
           			>ID</option>	
           		</select>
           		<input type="text" name="searchKeyword" value="${param.searchKeyword}">
                <input type="submit" value="검색">
           </div>
           </form>
        </div>
        <form name="frmList" method="post" action="<c:url value='/admin/member/deleteMulti.do'/>" >
        <table class="grayTh">
            <tr>
                <th><input type="checkbox" name="chkAll" /></th>
                <th>회원번호</th>
                <th>회원이름</th>
                <th>아이디</th>
                <th>비밀번호</th>
                <th>전화번호</th>
                <th>이메일주소</th>
            </tr>
            <!-- 회원정보 반복 시작 -->
            <c:set var="idx" value="0"/>
            <c:forEach var="vo" items="${list}">
	            <tr>
	                <td><input type="checkbox" name="memberItems[${idx}].memberNo" value="${vo.memberNo}"/></td>
	                <td>${vo.memberNo }</td>
	                <td><a href="<c:url value='/admin/member/memberDetail.do?id=${vo.id}'/>">${vo.name }</a></td>
	                <td><a href="<c:url value='/admin/member/memberDetail.do?id=${vo.id}'/>">${vo.id }</a></td>
	                <td>${vo.password }</td>
	                <td>${vo.hp1 }-${vo.hp2 }-${vo.hp3 }</td>
	                <td>${vo.email1}@${vo.email2}</td>
	            </tr>
	        <c:set var="idx" value="${idx+1 }"/>
            </c:forEach>
            <!-- 회원정보 반복 끝 -->
        </table>
        <div class="fRight aWrap" style="margin-top:25px">
	 		<a class="darkBorder" href="<c:url value='/admin/member/deleteMemberList.do'/>">탈퇴한회원목록으로</a>
	 	</div>
        <div class="aWrap fRight" style="margin-top:25px">
        	<input type="submit" id="delMulti" class="darkBorder" value="선택한 개인회원 탈퇴시키기"/>
        </div>
        <div style="margin-left:520px">
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
         </div>
         </form>
    </section>
</body>
</html>