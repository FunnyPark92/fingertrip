<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>
<section class="admCenter marginTop40">
        <ul class="clearFix marginBottom40 lineGnb">
            <li class="on"><a href="<c:url value='/admin/agency/agencyList.do'/>">기업회원조회</a></li>
            <li><a href="<c:url value='/admin/agency/agencyWrite.do'/>">기업회원가입</a></li>
        </ul>
        <h2>기업 회원 조회</h2>
        <div class="clearFix">
           <div class="fRight">
               <input type="search">
                <input type="button" value="검색">
           </div>
        </div>
        
        <table class="grayTh">
            <tr>
                <th><input type="checkbox" /></th>
                <th>번호</th>
                <th>상호명</th>
                <th>아이디</th>
                <th>비밀번호</th>
                <th>전화번호</th>
                <th>사업자등록번호</th>
            </tr>
            <c:forEach var="vo" items="${list}">
	            <tr>
	                <td><input type="checkbox" /></td>
	                <td>${vo.travelAgencyNo }</td>
	                <td><a href="<c:url value='/admin/agency/agencyDetail.do'/>">${vo.name }</a></td>
	                <td>${vo.id }</td>
	                <td>${vo.password }</td>
	                <td>${vo.hp }</td>
	                <td>${vo.licenseNo}</td>
	            </tr>
            </c:forEach>
        </table>
        <div class="aWrap fRight">
        	<input type="submit" class="darkBorder" value="삭제"/>
        </div>
        
    </section>


</body>
</html>