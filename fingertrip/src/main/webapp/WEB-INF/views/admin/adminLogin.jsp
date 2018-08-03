<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>핑거트립 관리자 페이지</title>
</head>

<style>
@import url(http://weloveiconfonts.com/api/?family=fontawesome);
@import url(http://fonts.googleapis.com/css?family=Open+Sans:400,700);

[class*="fontawesome-"]:before {
	font-family: 'FontAwesome', sans-serif;
}

input {
	border: 0;
	color: inherit;
	font: inherit;
	margin: 0;
	outline: 0;
	padding: 0;
	-webkit-transition: background-color .3s;
	transition: background-color .3s;
}

.site__container {
	-webkit-box-flex: 1;
	-webkit-flex: 1;
	-ms-flex: 1;
	flex: 1;
	padding: 10rem 0;
}

.form input[type="password"], .form input[type="text"], .form input[type="submit"]
	{
	width: 100%;
}

.form--login {
	color: #555656;
}

.form--login label, .form--login input[type="text"], .form--login input[type="password"],
	.form--login input[type="submit"] {
	border-radius: 0.25rem;
	padding: 1rem;
}

.form--login label {
	background-color: #363b41;
	border-bottom-right-radius: 0;
	border-top-right-radius: 0;
	padding-left: 1.25rem;
	padding-right: 1.25rem;
}

.form--login input[type="text"], .form--login input[type="password"] {
	background-color: #a8abad;
	border-bottom-left-radius: 0;
	border-top-left-radius: 0;
}

.form--login input[type="text"]:focus, .form--login input[type="text"]:hover,
	.form--login input[type="password"]:focus, .form--login input[type="password"]:hover
	{
	background-color: #dadbdc;
}

.form--login input[type="submit"] {
	background-color: #363b41;
	color: #eee;
	font-weight: bold;
	text-transform: uppercase;
}

.form--login input[type="submit"]:focus, .form--login input[type="submit"]:hover
	{
	background-color: #080808;
}

.form__field {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	margin-bottom: 1rem;
}

.form__input {
	-webkit-box-flex: 1;
	-webkit-flex: 1;
	-ms-flex: 1;
	flex: 1;
}

.align {
	-webkit-box-align: center;
	-webkit-align-items: center;
	-ms-flex-align: center;
	align-items: center;
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-orient: horizontal;
	-webkit-box-direction: normal;
	-webkit-flex-direction: row;
	-ms-flex-direction: row;
	flex-direction: row;
}

.hidden {
	border: 0;
	clip: rect(0, 0, 0, 0);
	height: 1px;
	margin: -1px;
	overflow: hidden;
	padding: 0;
	position: absolute;
	width: 1px;
}

.grid__container {
	width: 510px;
	margin: 0 auto;
     border: 1px solid #d4d4d4;
    padding: 70px 65px 100px;
}
.pTitle{
	text-align: center;
	font-size: 1.3em;
	font-weight: bold;
	margin-bottom: 30px;
}
</style>
</head>

<body class="align">

	<div class="site__container">

		<div class="grid__container">
			<p class="pTitle">관리자 로그인</p>
			<form action="<c:url value='/admin/adminLogin.do'/>" method="post" class="form form--login">

				<div class="form__field">
					<label class="fontawesome-user" for="login__username"><span
						class="hidden">Username</span></label> <input id="login__username" name="id"
						type="text" class="form__input" placeholder="Username" required>
				</div>

				<div class="form__field">
					<label class="fontawesome-lock" for="login__password"><span
						class="hidden">Password</span></label> <input id="login__password" name="password"
						type="password" class="form__input" placeholder="Password"
						required>
				</div>

				<div class="form__field">
					<input type="submit" value="Log In">
				</div>
				

			</form>

		</div>

	</div>


</body>
</html>