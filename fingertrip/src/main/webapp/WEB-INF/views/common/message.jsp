<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>message.jsp</title>
</head>
<body>
	<script type="text/javascript">
		<c:if test="${!empty msg}">
			alert("${msg}"); //자바스크립트
		</c:if>
		
		location.href="<c:url value='${url}'/>"; //자바스크립트로 보냄 (get방식)
	</script>
</body>
</html>






