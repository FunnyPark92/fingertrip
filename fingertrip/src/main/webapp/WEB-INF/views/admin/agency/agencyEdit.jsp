<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>
<section class="admCenter marginTop40">
        <ul class="clearFix marginBottom40 lineGnb">
            <li><a href="<c:url value='/admin/agency/agencyList.do'/>">기업회원조회</a></li>
            <li class="on"><a href="<c:url value='/admin/agency/agencyWrite.do'/>">기업회원가입</a></li>
        </ul>


	 <form name="frm1" method="post" action="<c:url value='/admin/agency/agencyEdit.do'/>" class="agencyWrite">
		<fieldset>
			<legend>기업회원 수정</legend>
			<div class="div1st">
				<label for="name">상호명</label> <input type="text" name="name"
					id="name" class="valid">
			</div>
			<div>
				<label for="userid">ID</label> <input type="text" name="userid" id="userid">&nbsp;
				<span class="message"></span>
			</div>
			<div>
				<label for="pwd">비밀번호</label> <input type="Password" name="pwd" id="pwd" class="valid">
			</div>
			<div class="div3">
				<label for="hp1">전화번호</label>
				<input type="text" name="hp1" id="hp1" maxlength="4"title="휴대폰 시작자리">
				 - <input type="text" name="hp2" id="hp2" maxlength="4"title="휴대폰 가운데자리">
				 - <input type="text" name="hp3" id="hp3" maxlength="4" title="휴대폰 뒷자리">
			</div>
			<div class="div3">
				<label for="licenseNo">사업자 등록번호</label> 
				<input type="text" name="licenseNo1" id="licenseNo1" maxlength="3" title="사업자등록번호 첫번째" class="width_80"> - 
				<input type="text" name="licenseNo2" id="licenseNo2" maxlength="2" title="사업자등록번호 두번째" class="width_80"> -
				<input type="text" name="licenseNo3" id="licenseNo3" maxlength="5" title="사업자등록번호 마지막" class="width_80">
			</div>
			<div class="divLast aWrap fRight">
				<a href="<c:url value='/admin/agency/agencyList.do'/>" class="darkBorder">목록</a>
				<input type="submit" id="wr_submit" value="수정">
			</div>
		</fieldset>
	</form>
</section>


</body>
</html>