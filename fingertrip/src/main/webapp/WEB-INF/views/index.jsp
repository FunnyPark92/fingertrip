<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Finger Trip</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template -->
    <link href="css/landing-page.min.css" rel="stylesheet">

    <!-- bxslider -->
    <link href="css/jquery.bxslider.css" rel="stylesheet">

    <!-- 셀프 css -->
    <link href="css/style.css" rel="stylesheet">

    <!-- 추가한 테마 css -->
    <link href="css/import.css" rel="stylesheet">

</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light gnb">
        <div class="container">
            <a class="navbar-brand" href="#">Finger Trip</a>
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

    <!-- Masthead -->
    <header class="masthead text-white text-center">
        <!--<div class="overlay"></div>-->
        <div class="container">
            <div class="row">
                <div class="col-xl-9 mx-auto">
                    <h2 class="mb-5">손가락으로 즐기는 나만의 코스</h2>
                    <h1 class="mb-5">Finger Trip</h1>
                </div>
                <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
                    <form>
                        <div class="form-row">
                            <div class="col-12 col-md-9 mb-2 mb-md-0">
                                <input type="email" class="form-control form-control-lg" placeholder="가고싶은 어디든">
                            </div>
                            <div class="col-12 col-md-3">
                                <button type="submit" class="btn btn-block btn-lg btn-danger">검색</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </header>



    <!-- Testimonials -->
    <section class="testimonials text-center bg-light">
        <div class="container">
            <h2 class="mb-5">TRIP MYSELF</h2>
            <div class="row">
                <div class="col-lg-4">
                    <div class="testimonial-item mx-auto mb-5 mb-lg-0">
                        <img class="img-fluid rounded-circle mb-3" src="img/testimonials-1.jpg" alt="">
                        <h5>나만의 코스 짜기</h5>
                        <p class="font-weight-light mb-0">내 취향에 맞게 코스를 짜고 같은 취향인 사람들의 공감을 받습니다</p>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="testimonial-item mx-auto mb-5 mb-lg-0">
                        <img class="img-fluid rounded-circle mb-3" src="img/testimonials-2.jpg" alt="">

                        <h5>코스 좋아요</h5>
                        <p class="font-weight-light mb-0">마음에 드는 코스에 좋아요를 누르면 현실화에 한발 가까워 집니다</p>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="testimonial-item mx-auto mb-5 mb-lg-0">
                        <img class="img-fluid rounded-circle mb-3" src="img/testimonials-3.jpg" alt="">
                        <h5>떠나자 취향대로</h5>
                        <p class="font-weight-light mb-0">맞춤 코스로 여행을 갑니다</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="portfolio" class="testimonials">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="section-title">
                        <h2>추천 여행지</h2>
                        <p>
                            핑거트립이 추천하는 여행지 BEST 6!!!
                        </p>
                    </div>
                </div>
            </div>
            <div class="row my-md-3">
                <!-- start portfolio item -->
                <div class="col-md-4">
                    <div class="ot-portfolio-item">
                        <figure class="effect-bubba">
                            <img src="img/portfolio-1.jpg" alt="img02" class="img-responsive" />
                            <figcaption>
                                <h2>런던</h2>
                                <p>해리포터, 축구 등 취향의 도시</p>
                                <a href="#">View more</a>
                            </figcaption>
                        </figure>
                    </div>
                </div>
                <!-- end portfolio item -->
                <!-- start portfolio item -->
                <div class="col-md-4">
                    <div class="ot-portfolio-item">
                        <figure class="effect-bubba">
                            <img src="img/portfolio-2.jpg" alt="img02" class="img-responsive" />
                            <figcaption>
                                <h2>교토</h2>
                                <p>고즈넉한 전통이 느껴지는</p>
                                <a href="#">View more</a>
                            </figcaption>
                        </figure>
                    </div>
                </div>
                <!-- end portfolio item -->
                <!-- start portfolio item -->
                <div class="col-md-4">
                    <div class="ot-portfolio-item">
                        <figure class="effect-bubba">
                            <img src="img/portfolio-3.jpg" alt="img02" class="img-responsive" />
                            <figcaption>
                                <h2>그리스</h2>
                                <p>파란 하늘과 파란 지붕의</p>
                                <a href="#">View more</a>
                            </figcaption>
                        </figure>
                    </div>
                </div>
                <!-- end portfolio item -->
            </div>
            <div class="row my-md-3">
                <!-- start portfolio item -->
                <div class="col-md-4">
                    <div class="ot-portfolio-item">
                        <figure class="effect-bubba">
                            <img src="img/portfolio-4.jpg" alt="img02" class="img-responsive" />
                            <figcaption>
                                <h2>하와이</h2>
                                <p>대표적인 힐링 휴양지</p>
                                <a href="#">View more</a>
                            </figcaption>
                        </figure>
                    </div>
                </div>
                <!-- end portfolio item -->
                <!-- start portfolio item -->
                <div class="col-md-4">
                    <div class="ot-portfolio-item">
                        <figure class="effect-bubba">
                            <img src="img/portfolio-5.jpg" alt="img02" class="img-responsive" />
                            <figcaption>
                                <h2>스위스</h2>
                                <p>청정한 자연을 느낄 수 있는</p>
                                <a href="#">View more</a>
                            </figcaption>
                        </figure>
                    </div>
                </div>
                <!-- end portfolio item -->
                <!-- start portfolio item -->
                <div class="col-md-4">
                    <div class="ot-portfolio-item">
                        <figure class="effect-bubba">
                            <img src="img/portfolio-6.jpg" alt="img02" class="img-responsive" />
                            <figcaption>
                                <h2>로마</h2>
                                <p>역사와 문화의 도시</p>
                                <a href="#">View more</a>
                            </figcaption>
                        </figure>
                    </div>
                </div>
                <!-- end portfolio item -->
            </div>
        </div>
        <!-- end container -->
    </section>



    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 h-100 text-center text-lg-left my-auto">
                    <ul class="list-inline mb-2">
                        <li class="list-inline-item">
                            <a href="#">회사소개</a>
                        </li>
                        <li class="list-inline-item">&sdot;</li>
                        <li class="list-inline-item">
                            <a href="#">이용약관</a>
                        </li>
                        <li class="list-inline-item">&sdot;</li>
                        <li class="list-inline-item">
                            <a href="#">제휴/광고 문의</a>
                        </li>
                    </ul>
                    <p class="text-muted small mb-4 mb-lg-0">&copy; Your Website 2018. All Rights Reserved.</p>
                </div>
                <div class="col-lg-6 h-100 text-center text-lg-right my-auto">
                    <ul class="list-inline mb-0">
                        <li class="list-inline-item mr-3 disNone992">
                            <a href="#">참고하면 좋은 사이트</a>
                        </li>
                        <li class="list-inline-item mr-3">
                            <a href="#"><i class="fa fa-facebook fa-2x fa-fw">페북</i></a>
                        </li>
                        <li class="list-inline-item mr-3">
                            <a href="#"><i class="fa fa-twitter fa-2x fa-fw">트위터</i></a>
                        </li>
                        <li class="list-inline-item">
                            <a href="#"><i class="fa fa-instagram fa-2x fa-fw">인스타</i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>

    <!--  bxslider js   -->
    <script src="js/jquery.bxslider.js"></script>
    <script>
        $(document).ready(function() {
            $('.slider').bxSlider();
        });
    </script>


</body>
</html>