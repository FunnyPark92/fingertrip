<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp"%>

    <!-- 추가한 테마 css -->
    <link href="css/ionicons.min.css" rel="stylesheet">


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
    
    
    <div class="subBg subBgAd">
        <p>제휴 및 광고 문의</p>
       <div class="subBgBlack"></div>
    </div>
    
    <section class="container marginBottom80 minheight400 advertise">
      <div class="container">
        
        <div class="row">
            <!--<div class="col-lg-4 col-md-4">
            <div class="contact-about">
              <h3>Avilon</h3>
              <p>Cras fermentum odio eu feugiat. Justo eget magna fermentum iaculis eu non diam phasellus. Scelerisque felis imperdiet proin fermentum leo. Amet volutpat consequat mauris nunc congue.</p>
              <div class="social-links">
                <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
                <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
                <a href="#" class="instagram"><i class="fa fa-instagram"></i></a>
                <a href="#" class="google-plus"><i class="fa fa-google-plus"></i></a>
                <a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
              </div>
            </div>
          </div>-->

          <div class="col-lg-5 col-md-4">
            <div class="info">
              <div>
                <i class="ion-ios-location-outline"></i>
                <p>git</p>
              </div>

              <div>
                <i class="ion-ios-email-outline"></i>
                <p>info@example.com</p>
              </div>

              <div>
                <i class="ion-ios-telephone-outline"></i>
                <p>1253-8353</p>
              </div>

            </div>
          </div>

          <div class="col-lg-7 col-md-8">
            <div class="form">
              <div id="sendmessage">담당자 이메일로 전송됩니다.</div>
              <div id="errormessage"></div>
              <form action="" method="post" role="form" class="contactForm">
                <div class="form-row">
                  <div class="form-group col-lg-6">
                    <input type="text" name="name" class="form-control" id="name" placeholder="담당자명" data-rule="minlen:4" data-msg="2글자 이상 입력하세요" />
                    <div class="validation"></div>
                  </div>
                  <div class="form-group col-lg-6">
                    <input type="email" class="form-control" name="email" id="email" placeholder="보내실 이메일" data-rule="email" data-msg="이메일을 입력해주세요" />
                    <div class="validation"></div>
                  </div>
                </div>
                <div class="form-group">
                  <input type="text" class="form-control" name="subject" id="subject" placeholder="보내실 제목" data-rule="minlen:4" data-msg="4글자 이상 입력해주세요" />
                  <div class="validation"></div>
                </div>
                <div class="form-group">
                  <textarea class="form-control" name="message" rows="5" data-rule="required" data-msg="작성해주세요" placeholder="광고 및 제휴 문의 사항을 넣어주세요"></textarea>
                  <div class="validation"></div>
                </div>
                <div class="text-center"><button type="submit" title="Send Message" class="btn btn-danger">이메일 전송</button></div>
              </form>
            </div>
          </div>
        </div>
    </div>

    
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
                            <a href="advertise.html">제휴/광고 문의</a>
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

    <script src="js/contactform.js"></script>

<%@ include file="inc/bottom.jsp"%>
