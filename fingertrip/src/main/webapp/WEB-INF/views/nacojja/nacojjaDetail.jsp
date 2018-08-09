<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBYa_utcbQs1RLoVuJguMaQzuX4yxvQyrs&libraries=place"></script>

<script type="text/javascript">
/* var map;
var mapFinal;
var myCenter = new google.maps.LatLng(37.5255936544199, 126.88887745922625);
var myZoom = 17;
var path;
var poly;
var polys = []; //위도,경도 정보를 배열에 담음
var polyIndex = 0;
var latLng;
var latLngs = []; //이전 여행지를 중복해서 추가하려고 할때 체크하기 위한 용도
var marker;
var markers = []; //마커 정보를 배열에 담음
var markersFinal = []; //최종 마커 정보를 배열에 담음
var mapOptions2 = {
		center: myCenter, 
		zoom: myZoom,
		//mapTypeId:google.maps.MapTypeId.HYBRID
	};

mapFinal = new google.maps.Map(document.getElementById("mapFinal"), mapOptions2);
function initialize() {
	var mapOptions1 = {
		center: myCenter, 
		zoom: myZoom,
		mapTypeId:google.maps.MapTypeId.HYBRID
	};
	var mapOptions2 = {
		center: myCenter, 
		zoom: myZoom,
		//mapTypeId:google.maps.MapTypeId.HYBRID
	};
	map = new google.maps.Map(document.getElementById("map"), mapOptions1);
	mapFinal = new google.maps.Map(document.getElementById("mapFinal"), mapOptions2);
	
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
	poly.setMap(mapFinal);
	animate(poly);
	

} //initialize() */

/* function addLatLng(location) {
	//alert("addLatLng함수");
	
  	path = poly.getPath(); //path 정보 담을 배열 객체 가져옴
  	path.push(location);
	  	
  	polys.push(location); //위도, 경도를 배열에 담기..
		polyIndex++;
  	
		//alert("path:" + path);
		//alert("polys:" + polys);
		//alert("polyIndex:" + polyIndex);
}
function animate(line) {
    var count = 0;
    window.setInterval(function() {
      count = (count + 1) % 200;

      var icons = line.get('icons');
      icons[0].offset = (count / 2) + '%';
      line.set('icons', icons);
  }, 10);
} */

    $(function(){
    	
        $('.reply').click(function(){
            $(this).closest('.threaded-comments').children('.recomments-wrap').toggle();
        });
        	/* $('.dayActive').each(function(idx,item){
		        $(this).click(function(){
					$(this).addClass("active");
					$(this).siblings().removeClass("active");
					location.href="<c:url value='/index.do'/>";
					
        		});
        	}); */
        	
         	$('.daySel').click(function(){
        		var day = $(this).val();
        		$('#day').text("Day "+day);
        		var year = $(this).find('small').text().substring(0,4);
        		var month = $(this).find('small').text().substring(5,7);
        		var dd = $(this).find('small').text().substring(8,10);
        		var date = year +"년"+ month+"월" + dd+"일";
        		
        		$('#date').text(date);
        		$.ajax({
        			url:"<c:url value='/nacojja/selectTravel.do'/>",
        			type:"POST",
        			data:{courseNo:${param.courseNo},day:day},
        			success:function(list){
        				$.each(list,function(idx,vo){
        					$('.spotContent').text(vo.travelContent);
        					
        					/* var someDayLatLng = new google.maps.LatLng(
									travelSpotVO.latLng.substring(1, vo.latLng.indexOf(",")),
									travelSpotVO.latLng.substring(vo.latLng.indexOf(",")+2, vo.latLng.length-1)
							);
							
							addLatLng(someDayLatLng);
							
							marker = new google.maps.Marker({
					        	position: someDayLatLng,
					        	map: mapFinal,
					        	//title: '#' + path.getLength(),
					        	animation: google.maps.Animation.BOUNCE
					      	});
					      	markersFinal.push(marker);
					      	
					      	mapFinal.setCenter(someDayLatLng);
					      	mapFinal.setZoom(17); */
			
        				});
        			},
        			error:function(xhr,starus,error){
        				alert("error : "+ error);
        			}
        		});
        		
        		
        		
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
           <img src="${pageContext.request.contextPath}/img/spot1.jpg" alt="썸네일" id="travelImg">
           </div>
           <!-- 하트받읗때 -->
           <div class="col-md-6 naThumHeart marginBottom50" style="display: ;">
              <div>
                  	하트받는중
              </div>
              <h3>
                  	${vo.title}
              </h3>
              <h5>
                  ${vo.startDay} ~ ${vo.endDay}
              </h5>
              <div>
                  <small>작성자 :</small> ${map['ID']}
              </div>
              <div>
                  <small>등록일</small> ${map['REGDATE']}
              </div>
              <div>
                  	${vo.content}
              </div>
               <input type="button" class="heartBtn btn btn-block btn-danger" value="하트 누르기">
           </div>
           
           <!-- 결제할 때 -->
		 <div class="col-md-6 marginBottom50 naThumPay"  style="display: none;">
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
		</div> 

		<div class="col-md-2">
            <ul class="list-group help-group">
                    <div class="faq-list list-group nav">
                    <c:set var="i" value="1"/>
                    <c:forEach var="travelDate" items="${tdList}">
                        <button type="button" class="list-group-item dayActive daySel" value="${i }">
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
                    <span id="day"></span>
                    <span id="date"></span>
                </div>
                 <div id="map" class="marginBottom50"></div>
                 
                   <div class="spotDiv marginBottom20">
                       <p class="spot">
                           루브르 박물관
                       </p>
                       <p class="spotExp">
                        
                         프랑스 Paris Rue de Rivoli 75001
                       </p>
                       
                       <p class="spot">
                           노트르담 대성당
                       </p>
                       <p class="spotExp">
                         프랑스 Paris 6 Parvis Notre-Dame - Pl. Jean-Paul II 75004
                       </p>
                       
                       <p class="spot">
                           에펠탑
                       </p>
                       <p class="spotExp">
                         프랑스 Paris Champ de Mars 5 Avenue Anatole France 75007
                       </p>
                   </div>
                 
               <div>
                  <p class="explain">여행지 설명</p>
                 <p class="spotContent"> </p>
                </div>
                <div class="spotImg">
                    <img src="${pageContext.request.contextPath }/img/spot1.jpg" alt="루브르박물관">
                    <img src="${pageContext.request.contextPath }/img/spot2.jpg" alt="노트르담대성당">
                    <img src="${pageContext.request.contextPath }/img/spot3.jpg" alt="에펠탑">
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