<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<link rel="stylesheet" href="css/datepicker.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    
    <style>
        .datepicker{z-index:1151 !important;}
        .ui-state-default, .ui-widget-content .ui-state-default{border: none;}
        .ui-state-highlight, .ui-widget-content .ui-state-highlight{background:#c3e6ff; }
        .ui-widget-header {border: none; background: #fff; }
    </style>

 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(function() {
            $(".datepicker").datepicker({
                dateFormat: "yy-mm-dd"
            });
        });
        
        $.datepicker.setDefaults({
            prevText: '이전 달',
            nextText: '다음 달',
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], //월 이름
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], //
            dayNames: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            showMonthAfterYear: true,
            yearSuffix: '년'
        });  
    </script>




    <div class="subBg subBgTerm">
        <p>나만의 코스 짜기</p>
        <div class="subBgBlack"></div>
    </div>

    <section class="container marginBottom80 minheight400 ">
      <div class="plan1">
           <h3>나만의 코스 짜기</h3>
           <div>
               <input type="text" placeholder="예: 5박 6일 해리포터 투어">
               <textarea rows="10" placeholder="일정에 대한 간단한 설명을 해주세요."></textarea>
           </div>
           <div>
               <input type="text" class="datepicker" placeholder="시작일">
               <input type="text" class="datepicker" placeholder="종료일">
           </div>
           <div class="planImgWrap">
                <span>대표 이미지</span><br>
                <label for="fileBtn">사진첨부</label>
                <input type="file" id="fileBtn">
           </div>
           <input type="button" class="btn btn-danger" value="나코짜 만들기">
      </div>
     
       
    </section>








<%@ include file="../inc/bottom.jsp"%>