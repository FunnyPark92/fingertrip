<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>
<section class="admCenter marginTop40">
        <ul class="clearFix marginBottom40 lineGnb">
            <li class="on"><a href="<c:url value='/admin/agency/agencyList.do'/>">기업회원조회</a></li>
            <li><a href="<c:url value='/admin/agency/agencyWrite.do'/>">기업회원가입</a></li>
        </ul>
        <h2>회원 조회</h2>
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
            <tr>
                <td><input type="checkbox" /></td>
                <td>1</td>
                <td>하나투어</td>
                <td>hana</td>
                <td>qwe123</td>
                <td>02-1111-1111</td>
                <td>201-94-71716</td>
            </tr>
        </table>
    </section>


</body>
</html>