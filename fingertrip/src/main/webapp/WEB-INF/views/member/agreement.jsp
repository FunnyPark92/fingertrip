<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원 약관</h2>
	<br>
	<iframe src="<c:url value='/inc2/provision.html'/>" width="700px"
		height="300px"></iframe>
	<br>
	<br>
	<div style="width: 700px">
		<form name="frmAgree" method="post"
			action="<c:url value='/member/register.do'/>">
			<fieldset>
				<legend style="visibility: hidden;">회원 약관</legend>
				<div style="text-align: right">
					<input type="checkbox" name="chkAgree" id="chkAgree"> <label
						for="chkAgree">약관에 동의합니다.</label>
				</div>
				<div style="text-align: center">
					<input type="submit" id="submit" value="확인"> <input
						type="reset" value="취소">
				</div>
			</fieldset>
		</form>
	</div>

	<%@ include file="../inc/bottom.jsp"%>
</body>
</html>