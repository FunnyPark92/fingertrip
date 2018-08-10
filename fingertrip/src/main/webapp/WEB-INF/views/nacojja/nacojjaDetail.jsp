<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBYa_utcbQs1RLoVuJguMaQzuX4yxvQyrs&libraries=place"></script>

<script type="text/javascript">
		var mapCanvas = document.getElementById("map")
		var myZoom =18;
		var map;
		var marker;
		var myCenter;
	function initialize(){
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
    	$('#dayActive').addClass("active");
    	
        $('.reply').click(function(){
            $(this).closest('.threaded-comments').children('.recomments-wrap').toggle();
        });
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
      			data:{courseNo:"${param.courseNo}",day:day},
      			success:function(list){
        		initialize();
      				$('#spotContent').text("");
      				$('.spot').remove(); //클릴 할 때마다 초기화
      				$('.spotExp').remove(); // 클릭 할 때마다 초기화
      				$.each(list,function(idx,travelSpotVO){
      					$('#spotContent').append(travelSpotVO.travelContent+"<br>"); // spot별 설명 
      					$("<p class='spot'>"+travelSpotVO.city+"</p>").appendTo('.spotDiv'); //일짜별 도시 ex)1일차에 3개면 3개
      					$("<p class='spotExp'>"+travelSpotVO.travelSpot+"</p>").appendTo('.spotDiv');
      				}); //each문
      			},
      			error:function(xhr,starus,error){
      				alert("error : "+ error);
      			}
      		});
      	});//click
        	
       	$('.dayActive').each(function(idx,item){
	        $(this).click(function(){
				$(this).addClass("active");
				$(this).siblings().removeClass("active");
       		
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
                        <button type="button" class="list-group-item dayActive daySel" value="${i }" id="dayActive">
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
                 
            <div class="spotDiv marginBottom20"></div>
                 
			<div>
				<p class="explain">
					여행지 설명
				</p>
				<p id="spotContent"></p>
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
