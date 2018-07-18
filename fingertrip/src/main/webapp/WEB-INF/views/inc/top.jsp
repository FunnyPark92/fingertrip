<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!DOCTYPE html >
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Finger Trip</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath }/css/landing-page.min.css" rel="stylesheet">

    <!-- bxslider -->
    <link href="${pageContext.request.contextPath }/css/jquery.bxslider.css" rel="stylesheet">

    <!-- 셀프 css -->
    <link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet">

    <!-- 추가한 테마 css -->
    <link href="${pageContext.request.contextPath }/css/import.css" rel="stylesheet">

</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light gnb">
        <div class="container">
            <a class="navbar-brand" href="<c:url value='/index.do'/> ">Finger Trip</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav">
                    <!--<li class="nav-item active">
                        <a class="nav-link" href="#">홈으로 <span class="sr-only">(current)</span></a>
                    </li>-->
                    <li class="nav-item">
                        <a class="nav-link" href="#">검색</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" title="나만의 코스 짜기">나코짜</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">여행가기</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">이용방법</a>
                    </li>
                    <li class="nav-item dropdown hidden-xs">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            고객센터
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="#">공지사항</a>
                            <a class="dropdown-item" href="#">Q&amp;A</a>
                            <a class="dropdown-item" href="#">FAQ</a>
                        </div>
                    </li>
                    <li class="nav-item disBlock992">
                        <a class="nav-link topLoginDiv" href="#">로그인</a>
                        <!--<a class="nav-link topLogoutDiv" href="#">로그아웃</a>-->
                    </li>
                    <li class="nav-item disBlock992">
                        <a class="nav-link topLoginDiv" href="#">회원가입</a>
                        <!--  <a class="nav-link topLogoutDiv" href="#">마이페이지</a>-->
                    </li>
                </ul>


            </div>

            <!-- 로그인 안 했을때 나오는 .topLoginDiv -->
            <!--<div class="topMenu disNone992 topLoginDiv">
                <a class="btn btn-info mar5" style="color:#fff;">회원가입</a>
                <a class="btn btn-primary" style="color:#fff;" href="login.html">로그인</a>
            </div>-->

            <!-- 로그인 했을때 나오는 .topLogoutDiv -->
             <li class="nav-item dropdown list-unstyled disNone992 topLogoutDiv">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                             마이페이지
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="#">회원 정보 수정</a>
                        <a class="dropdown-item" href="#">회원 탈퇴</a>
                        <a class="dropdown-item" href="#">내가 쓴 글</a>
                        <a class="dropdown-item" href="#">내가 찜한 코스</a>
                        <a class="dropdown-item" href="#">쿠폰</a>
                        <a class="dropdown-item" href="#">결제확인</a>
                        <a class="dropdown-item" href="#">하트</a>
                    </div>
                </li>
                <button type="button" class="btn btn-primary disNone992">로그아웃</button>

        </div>
    </nav>
