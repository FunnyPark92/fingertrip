<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<style>
.qna{
		width:30px;
		margin: 10px;
	}
.heart2{
	margin-top: 4px;
	font-size: 25px;
}
</style>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBYa_utcbQs1RLoVuJguMaQzuX4yxvQyrs&libraries=place"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    
<style>
    .datepicker{
    	z-index:1151 !important; 
    	border:none;
    	border-bottom:1px solid #70bdff;
    	margin-bottom: 3px;
    }
    .ui-state-default, .ui-widget-content .ui-state-default{border: none;}
    .ui-state-highlight, .ui-widget-content .ui-state-highlight{background:#c3e6ff; }
    .ui-widget-header {border: none; background: #fff; }
</style>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
	
		
		
	var pattern = new RegExp(/^[0-9]+$/g); //입찰가격 정규식 
	var myZoom;
	var map;
	var marker;
	var markers = []; 
	var myCenter;
	var path;
	var poly;
	
	window.onload = function() {
		initialize();
		initMarker(); //초기 로드시 1일차 map
		
		var startDay = new Date($('#endBid').val());
		startDay.setDate(startDay.getDate()+3);
		$('#endBidding').text(startDay.toLocaleDateString());
	}
	
	function initialize() {
		var mapOptions = {
				center: myCenter,
				zoom: myZoom,
				//mapTypeId:google.maps.MapTypeId.HYBRID
		}
		map = new google.maps.Map(document.getElementById("map"),mapOptions);
		
		var lineSymbol = {
		     path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW,
		     scale: 5, //두께
		     strokeColor: '#ffff00'
		};
		    	
   	    poly = new google.maps.Polyline({
			icons: [{
	            icon: lineSymbol,
	            offset: '100%'
	        }],
		    strokeColor: "#0000ff",
		    strokeOpacity: 0.6,
		    strokeWeight: 5
		});
    	
		poly.setMap(map);
		animate(poly);
	}
  
	function animate(line) {
        var count = 0;
        window.setInterval(function() {
          count = (count + 1) % 200;

          var icons = line.get('icons');
          icons[0].offset = (count / 2) + '%';
          line.set('icons', icons);
      }, 10);
   }
	
	function initMarker(){
		$('.mapLat').each(function(idx,travelSpotVO){
			var someDayLatLng = new google.maps.LatLng(
					$(this).val().substring(1, $(this).val().indexOf(",")),
					$(this).val().substring($(this).val().indexOf(",")+2, $(this).val().length-1)
				);
			addLatLng(someDayLatLng);
			 marker = new google.maps.Marker({
		    	position:someDayLatLng ,
		    	map: map,
		    	animation: google.maps.Animation.BOUNCE
		  	});
			markers.push(marker);
			map.setCenter(someDayLatLng);
			map.setZoom(14);  //어느정도가 적당?
		});
	}
	
	function addLatLng(location) {
	  path = poly.getPath(); 
	  path.push(location);
    }
    
    function setMapOnAll(map) {
      	for (var i=0; i<markers.length; i++) {
        	markers[i].setMap(map);
      	}
    }
    function pressHeart(){ // 하트 누르기 
    	if(confirm("하트 1개가 차감됩니다. 여행에 한걸음 다가서겠습니까?")){
    		location.href="<c:url value='/nacojja/pressHeart.do?courseNo=${courseVo.courseNo}'/>";
    	}else{
    		alert("아쉽군");
    	}
    }
    
	$(document).ready(function(){
		$(".datepicker").datepicker({
            dateFormat: "yy-mm-dd"
        });
		
    	$('#dayTab1').addClass("active");
    	
        $('.reply').click(function(){
            $(this).closest('.threaded-comments').children('.recomments-wrap').toggle();
        });
        
       	$('.daySel').click(function(){
       	 	for (var i=-10; i<=markers.length; i++) { //왜 마이너스 여야지?
        		poly.getPath().removeAt(i);
          	}

       		
      		var day = $(this).val();
      		$('#day').text("Day "+day);
      		var year = $(this).find('small').text().substring(0,4);
      		var month = $(this).find('small').text().substring(5,7);
      		var date = $(this).find('small').text().substring(8,10);
      		$('#date').text(year + "년 " + month + "월 " + date + "일");
      		
      		$.ajax({
      			url:"<c:url value='/nacojja/selectTravel.do'/>",
      			type:"POST",
      			data:{
      					courseNo:"${param.courseNo}",
      					day:day
      				},
      			success:function(list){
	      			//불필요 코드 - 추후 의논 후 삭제 여부 결정
	        		//initialize();
      				//$('#spotContent').text("");
      				var diaplayOnce = true;
      				
      				$('#spotContent').find("div").remove();
      				$('.spot').remove(); //?클릴 할 때마다  ? 초기화
      				$('.address').remove(); //?클릭 할 때마다 ? 초기화
      				$(".spotImg").find("img").remove(); //데이탭이 바뀔때마다 여행지별 이미지 초기화
      				$("#spotExp").find("p").remove();
      				setMapOnAll(null);
      				
      				$.each(list, function(idx, travelSpotVO){
      					var someDayLatLng = new google.maps.LatLng(
								travelSpotVO.latLng.substring(1, travelSpotVO.latLng.indexOf(",")),
								travelSpotVO.latLng.substring(travelSpotVO.latLng.indexOf(",")+2, travelSpotVO.latLng.length-1)
							);
      					addLatLng(someDayLatLng);
      					marker = new google.maps.Marker({
				        	position: someDayLatLng,
				        	map: map,
				        	animation: google.maps.Animation.BOUNCE
				      	});
      					markers.push(marker);
      					map.setCenter(someDayLatLng);
      					map.setZoom(14); //어느 정도가 적당?
      					
      					$("<p class='spot'>" + travelSpotVO.travelSpot + "</p>").appendTo('.spotDiv'); //여행지명(장소정보가 없을 시 주소가 출력됨)
      					$("<p class='address spotExp'>" + travelSpotVO.spotAddress + "</p>").appendTo('.spotDiv'); //여행지 도시정보
      					
      					if (travelSpotVO.travelContent != null && travelSpotVO.travelContent != "") {
      						//alert(travelSpotVO.travelSpot + "-" + travelSpotVO.travelContent);
      						if (diaplayOnce) {
								$("<p class='explain'>여행지 설명</p>").appendTo("#spotExp");
								diaplayOnce = false;
      						}
      						$("<div><b>" + travelSpotVO.travelSpot + "</b>" + " - " 
      								+ travelSpotVO.travelContent + "<br></div>").appendTo('#spotContent'); //여행지별 설명
      					}
      					
      					if (travelSpotVO.img != null && travelSpotVO.img != "") {
	      					$(".spotImg").append("<img src='" + travelSpotVO.img + "'>"); //여행지별 이미지
      					}
      				}); //each문
      			},
      			error:function(xhr,starus,error){
      				alert("error : "+ error);
      			}
      		});
      	});//click
        	
      	//불필요 코드 - 추후 의논 후 삭제 여부 결정
       	/* $('.dayActive').each(function(idx,item){
	        $(this).click(function(){
				$(this).addClass("active");
				$(this).siblings().removeClass("active");
       		
       		});
       	}); */ 
       	
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
       	
      	$('.datepicker').change(function() {
       	/* 	var endbid = new Date(bidStartDay.getTime());
       		alert(endbid);
       		endbid.setDate(endbid.getDate()+14);
       		alert(endbid); */
       		
       		/* var endbid = new Date($('#endBid').val()).getTime(); */
       		var endbid = new Date($('#endBidding').text()).getTime();
      		var startDay1 = new Date($('input[name=tripStartDay1]').val()).getTime();
      		var startDay2 = new Date($('input[name=tripStartDay2]').val()).getTime();
      		var startDay3 = new Date($('input[name=tripStartDay3]').val()).getTime();
      		var startDay4 = new Date($('input[name=tripStartDay4]').val()).getTime();
      		
			if(startDay1 - endbid < 24*60*60*1000 * 14){
				alert("출발일은 입찰종료후 2주후부터 가능합니다.");
				$(this).val("");
				$(this).focus();
			}else if(startDay2 - endbid < 24*60*60*1000 * 14){
				alert("출발일은 입찰종료후 2주후부터 가능합니다.");
				$(this).val("");
				$(this).focus();
			}else if(startDay3 - endbid < 24*60*60*1000 * 14){
				alert("출발일은 입찰종료후 2주후부터 가능합니다.");
				$(this).val("");
				$(this).focus();
			}else if(startDay4 - endbid < 24*60*60*1000 * 14){
				alert("출발일은 입찰종료후 2주후부터 가능합니다.");
				$(this).val("");
				$(this).focus();
			}
       	});
       	
       	$('#bidding').click(function(){//입찰 유효성 검사 
       		var bool = true;
       	
       		$('.valid').each(function(idx,item){
	       		if($(this).val().length <1){
	       			alert($(this).prev().text()+" 입력해주세요");
	       			$(this).focus();
	       			bool=false;
	       			return false;
	       		}
       			
       		});
       		if(bool){
	       		 if(pattern.test($('#biddingPrice').val())){
	       			bool = true;
	       		}else{
	       			bool = false;
	       			alert("입찰가격은 숫자로만 입력해주세요");
	       		}
       		}
       		
       		alert(bool);
       		return bool;
       	});
    	
    });
</script>

<div class="subBg subBgTerm">
	<p>나만의 코스 짜기</p>
	<div class="subBgBlack"></div>
</div>

<section class="container marginBottom80 minheight400 plan2">
    <div class="row">
    	<div class="col-md-6 naThumImg marginBottom50">
            <img src="<c:url value='/upload_images/${courseVo.thumbImg}'/>" alt="썸네일">
        </div>
        
	        <!-- 하트받을때 -->
        <c:if test="${courseVo.progressNo==1}">
	        <div class="col-md-6 naThumHeart marginBottom50">
	            <div>
	               	하트받는중 
	            </div>
	            <h2>
	               	${courseVo.title}
	            </h2>
	            <h5>
	                ${courseVo.startDay} ~ ${courseVo.endDay}
	            </h5>
	            <div>
	                <small>작성자 : </small>${memberVo.name}
	            </div>
	            <div>
	                <small>등록일 : </small>${courseVo.regDate}
	            </div>
	            <div class="expDiv">
	               	<img src="<c:url value='/img/quot1.png'/>" style="width: 10px; height: 10px">
	               	${courseVo.content}
	               	<img src="<c:url value='/img/quot2.png'/>" style="width: 10px; height: 10px">
	            </div>
	            <input type="button" class="heartBtn btn btn-block btn-danger" onclick="pressHeart()" value="하트 누르기">
	            <div>
	            	<span class="listTitle float-left"><img src="${pageContext.request.contextPath }/img/heart.png" class="qna"></span>
	            	
	            	<p class="float-left heart2">${courseVo.heartCount }</p>
	            </div>
	        </div>
        </c:if>
        
        <c:if test="${courseVo.progressNo==2}">
		<!-- 입찰 -->
		<div class="col-md-6 naThumHeart marginBottom50" style="display: ;">
			<form name="biding" method="post" action="<c:url value='/nacojja/nacojjaBidding.do'/>">
				<div>입찰진행중</div>
				<h3 class="marginBottom20">${courseVo.title}</h3>
	            <div>
	            	<span class="leftSpan">작성자</span>
	                ${memberVo.name}
	            </div>
			 	<div>
					<span class="leftSpan">작성자 일정</span>
					<span>${courseVo.startDay} ~ ${courseVo.endDay}</span>
				</div>
			 	<div>
					<span class="leftSpan">여행 일수</span>
					<span>${travelDay}</span>
				</div>
			 	<div>
					<span class="leftSpan">입찰 종료일</span>
					<span id="endBidding"></span>
					<input type="hidden" id="endBid" value="<fmt:formatDate value='${courseVo.bidStartDay}' pattern="yyyy-MM-dd"/>">
					
				</div>
	            <div>
	               	<img src="<c:url value='/img/quot1.png'/>" style="width: 10px; height: 10px">
		             ${courseVo.content}
	               	<img src="<c:url value='/img/quot2.png'/>" style="width: 10px; height: 10px">
	            </div>
			 	<div>
					<span class="leftSpan">출발일</span>
		    		<label for="startDay1" hidden="">출발일1</label>
		        	<input type="text" name="tripStartDay1" placeholder="출발일1" class="datepicker valid expDay" readonly="readonly">,
		    		<label for="startDay2" hidden="">출발일2</label>
		        	<input type="text" name="tripStartDay2" placeholder="출발일2" class="datepicker valid expDay" readonly="readonly">
				</div>
				<div>
					<span class="leftSpan"></span>
		    		<label for="startDay3" hidden="">출발일3</label>
		        	<input type="text" name="tripStartDay3" placeholder="출발일3" class="datepicker valid expDay" readonly="readonly">,
		    		<label for="startDay4" hidden="">출발일4</label>
		        	<input type="text" name="tripStartDay4" placeholder="출발일4" class="datepicker valid expDay" readonly="readonly">
				</div>
	            <div class="marginTop10">
					<span class="leftSpan">입찰금액</span>
	            	<input type="number" class="valid" id="biddingPrice" placeholder="회원들에게 결제받을 금액을 적어주세요" style="width:70%;" name="bidPrice"/>
	            </div>
				<div class="marginTop10 marginBottom50">${map['CONTENT'] }</div>
				<input type="hidden" value="${courseVo.courseNo}" name="courseNo">
				<input type="submit" class="btn payBtn btn-primary" id="bidding" value="입찰하기">
			</form>
		</div> 
		 </c:if>

		<c:if test="${courseVo.progressNo==3}">
		
			<!-- 결제할 때 -->
			<!--  <div class="col-md-6 marginBottom50 naThumPay"  style="display: none;"> -->
			<div class="col-md-6 naThumHeart marginBottom50" style="display:;">
				<div>결제진행중</div>
				<h3 class="marginBottom20">${courseVo.title}</h3>
				<div class="thumPay">
					<span class="leftSpan">여행 날짜</span> <select>
						<option value="선택">날짜 선택</option>
						<option value="${courseVo.startDay}">${courseVo.startDay}</option>
						<option value="${bidVo.tripStartDay1}">${bidVo.tripStartDay1}</option>
						<option value="${bidVo.tripStartDay2}">${bidVo.tripStartDay2}</option>
						<option value="${bidVo.tripStartDay3}">${bidVo.tripStartDay3}</option>
						<option value="${bidVo.tripStartDay4}">${bidVo.tripStartDay4}</option>

					</select>
				</div>
				
				<div class="thumPay">
					<span class="leftSpan">작성자</span>${memberVo.name}
				</div>
				<div class="thumPay">
					<span class="leftSpan">여행사</span> ${agencyVo.name}
				</div>
				<div class="thumPay">
					<span class="leftSpan">여행가격</span>${bidVo.bidPrice}
				</div>
				<div class="thumPay">
					<span class="leftSpan">여행사 번호</span> ${agencyVo.licenseNo}
				</div>
				<div class="marginTop10 marginBottom50">${map['CONTENT'] }</div>
				<div>
					<input type="button" class="btn payBtn btn-primary" value="결제하기">
				</div>
			</div>
		</c:if>


		
		
		
		<c:if test="${courseVo.progressNo==4 || courseVo.progressNo==5}">
		<!-- 실패 -->
        <div class="col-md-6 naThumHeart marginBottom50" style="display: ;">
            <div>
               	종료
            </div>
            <h2>
               	${courseVo.title}
               	
            </h2>
            <h5>
                ${courseVo.startDay} ~ ${courseVo.endDay}
            </h5>
            <div>
                <small>작성자 : </small>${memberVo.name}
            </div>
            <div>
                <small>등록일 : </small>${courseVo.regDate}
            </div>
            <div>
               	<img src="<c:url value='/img/quot1.png'/>" style="width: 10px; height: 10px">
	            ${courseVo.content}
               	<img src="<c:url value='/img/quot2.png'/>" style="width: 10px; height: 10px">
            </div>
            <input type="button" class="btn btn-block" disabled="disabled" onclick="pressHeart()" value="종료되었습니다">
        </div>
		</c:if>
		
		
		<div class="col-md-2">
            <ul class="list-group help-group">
            	<div class="faq-list list-group nav">
                    <c:set var="i" value="1"/>
                    <c:forEach var="travelDate" items="${tdList}">
                        <button id="dayTab${i}" class="list-group-item dayActive daySel" value="${i}" 
                        		style="text-align: left;" role="tab" data-toggle="tab">
                            Day${i}
                            <small id="travelDate"><fmt:formatDate value="${travelDate}" pattern="yyyy/MM/dd"/></small>
                        </button>
                        <c:set var="i" value="${i+1}"/>
                     </c:forEach>   
                 </div>
             </ul>
         </div>
            
         <div class="col-md-10 ncjD">
             <div class="ncjP">
                 <span id="day">Day 1</span>
                 <span id="date"><fmt:formatDate value="${tdList[0] }" pattern="yyyy년 MM월 dd일"/>  </span>
             </div>
            
          	  <div id="map" class="marginBottom50"></div>
            <c:forEach var="tSpotVo" items="${tSpotVoList }">
            	<c:if test="${tSpotVo.day == 1 }">
            		<input type="hidden" value="${tSpotVo.latLng}" class="mapLat">
            	</c:if>
            </c:forEach>
                 
            <div class="spotDiv marginBottom20">
            	<!-- 여행지명<br>
            		여행지 도시 정보 들어가는 자리 -->
            	<c:forEach var="tSpotVo" items="${tSpotVoList }">
            		<c:if test="${tSpotVo.day == 1 }">
		            	<p class='spot'>${tSpotVo.travelSpot }</p>
		      			<p class='address spotExp'>${tSpotVo.spotAddress }</p>
            		</c:if>
				</c:forEach>
            </div>
                 
			<div>
				<div id="spotExp">
					<c:set var="i" value="0"></c:set>
					<c:forEach var="tSpotVo" items="${tSpotVoList }">
						<c:if test="${tSpotVo.day == 1 && !empty tSpotVo.travelContent }">
							<c:if test="${i < 1 }">
				       			<p class="explain">
									여행지 설명
								</p>
								<c:set var="i" value="${i+1}"></c:set>
	           				</c:if>
						</c:if>
					</c:forEach>
				</div>
				
				<div id="spotContent">
					<!-- 여행지별 설명 -->
					<c:forEach var="tSpotVo" items="${tSpotVoList }">
         				<c:if test="${tSpotVo.day == 1 && !empty tSpotVo.travelContent }">
							<div>
								<b>${tSpotVo.travelSpot }</b> - ${tSpotVo.travelContent }<br>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
            
            <div class="spotImg">
				<!-- 여행지별 사진 들어가는 자리 -->
				<c:forEach var="tSpotVo" items="${tSpotVoList }">
            		<c:if test="${tSpotVo.day == 1 }">
						<img src='${tSpotVo.img }'>
					</c:if>
				</c:forEach>
            </div>
                
            <div class="comments-list">
				<p class="replyTitle">댓글</p>
				<ul>
					<li class="threaded-comments">
	                    <div class="comments-content-wrap marginBottom20">
	                        <span class="marginBottom10">
	                            <b>작성자</b> ㅣ
	                            <span class="post-time">2018.08.06 12:20</span>
	                        </span>
	                        <p>
	                        	정말 잘 짜셨네요 꼭 실행됐으면 좋겠습니다
	                        </p>
	                        <small class="reply">답글 <span>1개</span></small>
	                    </div>
                           
                        <div class="recomments-wrap">
                            <div class="recomments-content-wrap">
                                <span class="marginBottom10">
                                    <b>작성자</b> ㅣ
                                    <span class="post-time">2018.08.06 12:20</span>
                                </span>
                                <p>
									정말 잘 짜셨네요 꼭 실행됐으면 좋겠습니다
                                </p>
                        	</div>

                            <form action="" class="rereply">
                                <textarea name="" id="" rows="10" placeholder="댓글을 작성해주세요"></textarea>
                                    <div class="clearFix">
                                        <button class="fRight">등록</button>
                                    </div>
                            </form>
                        </div>
                    </li>
                       
                    <li class="threaded-comments">
                        <div class="comments-content-wrap marginBottom20">
                            <span class="marginBottom10">
                                <b>작성자</b> ㅣ
                                <span class="post-time">2018.08.06 12:20</span>
                            </span>
                            <p>
								진행은 언제 시작하나요?
                            </p>
                            <small class="reply">답글</small>
                        </div>
                           
                        <div class="recomments-wrap">
                            <form action="" class="rereply">
                                <textarea name="" id="" rows="10" placeholder="댓글을 작성해주세요"></textarea>
                                    <div class="clearFix">
                                        <button class="fRight">등록</button>
                                    </div>
                            </form>
                        </div>
                    </li>
                </ul>
                
                <form action="" class="replyText marginTop10">
                    <textarea name="" id="" rows="10" placeholder="댓글을 작성해주세요"></textarea>
                    <div class="clearFix">
                    	<button class="fRight btn-outline-secondary">등록</button>
                	</div>
            	</form>
        	</div>
    	</div>
	</div>
</section>

<%@ include file="../inc/bottom.jsp"%>
