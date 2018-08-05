<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    
<style>
    .datepicker{z-index:1151 !important;}
    .ui-state-default, .ui-widget-content .ui-state-default{border: none;}
    .ui-state-highlight, .ui-widget-content .ui-state-highlight{background:#c3e6ff; }
    .ui-widget-header {border: none; background: #fff; }
</style>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
    var filename;
    
    $(document).ready(function() {
    	$("input[name=title]").focus();
    	
    	$("form[name=frmNacojja1]").submit(function(){
			var bool = true;
			
			$(".valid").each(function(){
				if ($.trim($(this).val()).length < 1) {
					alert($(this).prev().text() + "를 입력하세요.");
					$(this).focus();
					
					bool = false;
					return false;
				}
			});
			
			//이미지 파일인지 아닌지 체크
			if (filename != null && filename != "") {
				var fNameExt = filename.substring(filename.lastIndexOf(".") + 1);
				var lowfNameExt = fNameExt.toLowerCase();
				if (lowfNameExt != "jpeg" && lowfNameExt && "jpg" 
						&& lowfNameExt != "png" && lowfNameExt != "gif") {
					alert("이미지 파일이 아닙니다. 다시 선택해 주세요!");
					bool = false;
				}
			}
			
			if ($("input[name=startDay]").val() != null && $("input[name=startDay]").val() != "" 
					&& $("input[name=endDay]").val() != null && $("input[name=endDay]").val() != "") {
				
				var todayMillis = new Date().getTime();
				var startDayMillis = new Date($("input[name=startDay]").val()).getTime();
				var endDayMillis = new Date($("input[name=endDay]").val()).getTime();
				var travelDay = (endDayMillis - startDayMillis) / (1000*60*60*24) + 1; //여행기간 구하기
				
				if (todayMillis - startDayMillis > 24*60*60*1000) { //출발일을 당일 날짜까지 설정 가능하도록
					alert("출발일이 오늘 날짜보다 더 이전일 수는 없습니다!!!");
					bool = false;
				} else if (travelDay < 1) {
					alert("출발일보다 도착일이 더 빠를순 없습니다!!!");
					bool = false;
				} else if (travelDay > 10) {
					alert("여행기간은 10일을 초과할 수 없습니다!!!");
					bool = false;
				} else {
					$("#travelDay").val(travelDay);
				}
			}
			
			return bool;
		});
    	
        $(".datepicker").datepicker({
            dateFormat: "yy-mm-dd"
        });
        
        var fileTarget = $('.planImgWrap .upload-hidden'); 
        fileTarget.on('change', function(){ // 값이 변경되면
        	if(window.FileReader){ // modern browser
        		filename = $(this)[0].files[0].name; 
        	} else { // old IE
        		filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
        	} 
        
        	$(this).siblings('.upload-name').val(filename); // 추출한 파일명 삽입
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

<section class="container marginBottom80 minheight400">
	<form name="frmNacojja1" method="post" action="<c:url value='/nacojja/nacojja1.do'/>"
 		enctype="multipart/form-data">
	    <div class="plan1">
	    	<h3>나만의 코스 짜기</h3>
	    	<div>
	    		<label for="title" hidden="">제목</label>
		        <input type="text" name="title" placeholder="제목을 작성해주세요. (예: 5박 6일 해리포터 투어)" class="valid">
		        <textarea rows="10" name="content" placeholder="일정에 대한 간단한 설명을 해주세요."></textarea>
	    	</div>
	    	<div>
	    		<label for="startDay" hidden="">출발일</label>
	        	<input type="text" name="startDay" placeholder="출발일" class="datepicker valid">
	    		<label for="endDay" hidden="">도착일</label>
	        	<input type="text" name="endDay" placeholder="도착일" class="datepicker valid">
	    	</div>
		    <div class="planImgWrap">
		        <span style="display: block;">대표 이미지</span>
		        <input type="file" name="imageUpload" id="imageUpload" class="upload-hidden valid">
		        <label for="imageUpload">사진첨부</label>
		        <input class="upload-name" value="지원 확장자(JPEG/JPG, PNG, GIF)" disabled="disabled">
		    </div>
		    <input type="hidden" id="travelDay" name="travelDay">
	    	<input type="submit" class="btn btn-danger" id="btnNacojja1" value="나코짜 만들기">
		</div>
 	</form>
</section>

<%@ include file="../inc/bottom.jsp"%>