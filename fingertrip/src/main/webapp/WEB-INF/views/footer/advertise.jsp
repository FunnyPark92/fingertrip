<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

    <!-- 추가한 테마 css -->
    <link href="${pageContext.request.contextPath}/css/ionicons.min.css" rel="stylesheet">


    
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




    <script src="${pageContext.request.contextPath}/js/contactform.js"></script>

<%@ include file="../inc/bottom.jsp"%>