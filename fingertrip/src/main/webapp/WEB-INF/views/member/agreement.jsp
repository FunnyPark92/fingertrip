<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<div class="container">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<h2>회원 약관</h2>
			<br>
			<iframe src="<c:url value='/inc2/provision.html'/>" width="100%"
				height="300px"></iframe>
			<br> <br>
			<div>
				<!-- style="width: 700px" -->
				<form name="frmAgree" method="post"
					action="<c:url value='/member/register.do'/>">
					<fieldset>
						<legend style="visibility: hidden;">회원 약관</legend>
						<div style="text-align: right">
							<input type="checkbox" name="chkAgree" id="chkAgree"> <label
								for="chkAgree">약관에 동의합니다.</label>
						</div>
						<div style="text-align: center">
							<input type="submit" class="btn btn-primary" id="submit"
								value="확인"> <input type="reset" class="btn btn-warning"
								value="취소">
						</div>
					</fieldset>
				</form>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>

<%@ include file="../inc/bottom.jsp"%>