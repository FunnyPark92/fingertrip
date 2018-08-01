<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>
<section class="admCenter marginTop40">
        <ul class="clearFix marginBottom40 lineGnb">
            <li><a href="<c:url value='/admin/agency/agencyList.do'/>">관리자회원조회</a></li>
            <li><a href="<c:url value='/admin/agency/agencyWrite.do'/>">관리자회원가입</a></li>
        </ul>
        <h2>관리자 회원 가입</h2>


	 <form name="frm1" method="post" action="<c:url value='/admin/agency/agencyWrite.do'/>" class="agencyWrite">
		<fieldset>
			<legend>기업회원 가입</legend>
			<div class="div1st">
				<label for="name">상호명</label> <input type="text" name="name"
					id="name" class="valid" style="ime-mode: active">
			</div>
			<div>
				<label for="userid">ID</label> <input type="text" name="userid" id="userid">&nbsp;
				<span class="message"></span>
			</div>
			<div>
				<label for="pwd">비밀번호</label> <input type="Password" name="pwd" id="pwd" class="valid">
			</div>
			<div class="div3">
				<label for="hp1">전화번호</label>&nbsp;
				<select name="hp1" id="hp1" title="휴대폰 앞자리">
					<option value="010">010</option>
					<option value="02">02</option>
					<option value="051">051</option>
					<option value="053">053</option>
					<option value="032">032</option>
					<option value="062">062</option>
					<option value="042">042</option>
					<option value="052">052</option>
					<option value="044">044</option>
					<option value="031">031</option>
					<option value="033">033</option>
					<option value="043">043</option>
					<option value="041">041</option>
					<option value="063">063</option>
					<option value="061">061</option>
					<option value="054">054</option>
					<option value="055">055</option>
					<option value="065">065</option>
				</select> - <input type="text" name="hp2" id="hp2" maxlength="4"
					title="휴대폰 가운데자리">- <input type="text"
					name="hp3" id="hp3" maxlength="4" title="휴대폰 뒷자리">
			</div>
			<div class="div3">
				<label for="licenseNo">사업자 등록번호</label> 
				<input type="text" name="licenseNo1" id="licenseNo1" maxlength="3" title="사업자등록번호 첫번째" class="width_80"> - 
				<input type="text" name="licenseNo2" id="licenseNo2" maxlength="2" title="사업자등록번호 두번째" class="width_80"> -
				<input type="text" name="licenseNo3" id="licenseNo3" maxlength="5" title="사업자등록번호 마지막" class="width_80">
			</div>
			<div class="divLast">
				<input type="submit" id="wr_submit" value="회원가입">
			</div>
		</fieldset>
	</form>
</section>


</body>
</html>