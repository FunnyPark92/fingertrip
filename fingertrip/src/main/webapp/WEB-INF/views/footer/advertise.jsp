<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

    


    
    <div class="subBg subBgAd">
        <p>제휴 및 광고 문의</p>
       <div class="subBgBlack"></div>
    </div>
    
    <section class="container marginBottom80 minheight400 advertise">
      <div class="container">
        
        <div class="row">

          <div class="col-lg-5 col-md-4">
            <div class="info">
              <div>
                <i class="ion-ios-location-outline"></i>
                <p>trip finger</p>
              </div>

              <div>
                <i class="ion-ios-email-outline"></i>
                <p>fingertrip2018@gmail.com</p>
              </div>

              <div>
                <i class="ion-ios-telephone-outline"></i>
                <p>1253-8253</p>
              </div>

            </div>
          </div>

          <div class="col-lg-7 col-md-8">
            <div class="form">
              <div id="sendmessage">담당자 이메일로 전송됩니다.</div>
              <div id="errormessage"></div>
              <form action="<c:url value='/footer/advertise/send.do'/>" method="post" role="form" class="contactForm">
                <div class="form-row">
                  <div class="form-group col-lg-6">
                    <input type="text" name="name" class="form-control" id="name" placeholder="담당자명" data-rule="minlen:4" data-msg="한글 2자 (영문 4자)이상 입력하세요" />
                    <div class="validation"></div>
                  </div>
                  <div class="form-group col-lg-6">
                    <input type="email" class="form-control" name="email" id="email" placeholder="보내실 이메일" data-rule="email" data-msg="이메일을 입력해주세요" />
                    <div class="validation"></div>
                  </div>
                </div>
                <div class="form-group">
                  <input type="text" class="form-control" name="title" id="subject" placeholder="보내실 제목" data-rule="minlen:4" data-msg="4글자 이상 입력해주세요" />
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
