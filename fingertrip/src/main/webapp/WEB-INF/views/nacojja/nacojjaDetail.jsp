<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBYa_utcbQs1RLoVuJguMaQzuX4yxvQyrs&libraries=place"></script>

<script type="text/javascript">
	var mapCanvas = document.getElementById("map")
	var myZoom = 18;
	var map;
	var marker;
	var myCenter;
	
	window.onload = function() {
		initialize();
	}
	
	function initialize() {
		var mapOptions = {
				center: myCenter,
				zoom: myZoom,
				//mapTypeId:google.maps.MapTypeId.HYBRID
		}
		mapCanvas = document.getElementById("map");
		myZoom= 18;
		map = new google.maps.Map(mapCanvas,mapOptions);
		marker = new google.maps.Marker({
			position:myCenter
			,map:map});
		  marker.setMap(map);
	}
	myCenter = new google.maps.LatLng(37.52651121051272, 126.88800752162933);
    
	$(document).ready(function(){
    	$('#dayTab1').addClass("active");
    	
        $('.reply').click(function(){
            $(this).closest('.threaded-comments').children('.recomments-wrap').toggle();
        });
        
       	$('.daySel').click(function(){
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
      		
      				$.each(list, function(idx, travelSpotVO){
      					$("<p class='spot'>" + travelSpotVO.travelSpot + "</p>").appendTo('.spotDiv'); //여행지명(장소정보가 없을 시 주소가 출력됨)
      					$("<p class='address'>" + travelSpotVO.spotAddress + "</p>").appendTo('.spotDiv'); //여행지 도시정보
      					
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
        <div class="col-md-6 naThumHeart marginBottom50" style="display: ;">
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
            <div>
               	<img src="<c:url value='/img/quot1.png'/>" style="width: 10px; height: 10px">
               		<h3 style="display: inherit;">
	               		&quot;${courseVo.content}&quot;
               		</h3>
               	<img src="<c:url value='/img/quot2.png'/>" style="width: 10px; height: 10px">
            </div>
            <input type="button" class="heartBtn btn btn-block btn-danger" value="하트 누르기">
        </div>
        
           <!-- 결제할 때 -->
		<%--  <div class="col-md-6 marginBottom50 naThumPay"  style="display: none;">
			<div>결제진행중</div>
			<h3 class="marginBottom20">${vo.title}</h3>
			<div class="thumPay">
				<span class="leftSpan">여행 날짜</span> <select>
					<option value="선택">날짜 선택</option>
					<option value="0911">18.09.11~18.09.15</option>
					<option value="0912">18.09.12~18.09.16</option>
					<option value="0913">18.09.13~18.09.17</option>
					<option value="0914">18.09.14~18.09.18</option>
					<option value="0915">18.09.15~18.09.19</option>
				</select>
			</div>
			<div class="thumPay">
				<span class="leftSpan">작성자</span>  ${map['ID']}
			</div>
			<div class="thumPay">
				<span class="leftSpan">여행사</span> 핑거트립
			</div>
			<div class="thumPay">
				<span class="leftSpan">여행사 번호</span> 02 - 000 - 0000
			</div>
			<div class="marginTop10 marginBottom50">${map['CONTENT'] }</div>
			<input type="button" class="btn payBtn btn-primary" value="결제하기">
		</div>  --%>

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
                 
            <div class="spotDiv marginBottom20">
            	<!-- 여행지명<br>
            		여행지 도시 정보 들어가는 자리 -->
            	<c:forEach var="tSpotVo" items="${tSpotVoList }">
            		<c:if test="${tSpotVo.day == 1 }">
		            	<p class='spot'>${tSpotVo.travelSpot }</p>
		      			<p class='address'>${tSpotVo.spotAddress }</p>
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
