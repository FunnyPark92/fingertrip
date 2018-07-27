<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp"%>


<script type="text/javascript">
$(document).ready(function(){
   $("#london").click(function(){
	  $("#cityset").prop("placeholder","런던")
   });
   $("#kyoto").click(function(){
      $("#cityset").prop("placeholder","교토")
   });
   $("#greece").click(function(){
	  $("#cityset").prop("placeholder","그리스")
   });
   $("#hawaii").click(function(){
	  $("#cityset").prop("placeholder","하와이")
   });
   $("#suisse").click(function(){
	  $("#cityset").prop("placeholder", "스위스")
   });
   $("#roma").click(function(){
      $("#cityset").prop("placeholder","로마")
   });
});
</script>

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
                                <input type="text" id="cityset" class="form-control form-control-lg" placeholder="가고싶은 어디든">
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
            <div class="row my-md-3" >
                <!-- start portfolio item -->
                <div class="col-md-4" id="london">
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
                <div class="col-md-4" id="kyoto">
                    <div class="ot-portfolio-item">
                        <figure class="effect-bubba">
                            <img src="img/portfolio-2.jpg" alt="img02" class="img-responsive"/>
                            <figcaption >
                                <h2>교토</h2>
                                <p>고즈넉한 전통이 느껴지는</p>
                                <a href="#">View more</a>
                            </figcaption>
                        </figure>
                    </div>
                </div>
                <!-- end portfolio item -->
                <!-- start portfolio item -->
                <div class="col-md-4" id="greece">
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
                <div class="col-md-4" id="hawaii">
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
                <div class="col-md-4" id="suisse">
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
                <div class="col-md-4" id="roma">
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

<%@ include file="inc/bottom.jsp"%>