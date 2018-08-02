<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<style>
	#floating-panel {
        position: absolute;
        top: 930px;
        left: 25%;
        z-index: 5;
        background-color: #fff;
        padding: 2px;
        border: 1px solid #999;
        text-align: center;
        line-height: 30px;
	}
</style>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBYa_utcbQs1RLoVuJguMaQzuX4yxvQyrs&libraries=places"></script>
<script type="text/javascript">
	var geocoder;
	var placesService;
	
	var map;
	var mapFinal;
	var myCenter = new google.maps.LatLng(37.5255936544199, 126.88887745922625);
	var myZoom = 17;
	
	var marker;
	var markers = []; //마커 정보를 배열에 담음
	var markersFinal = []; //최종 마커 정보를 배열에 담음
	
	var path;
	var poly;
	var polys = []; //경로 정보를 배열에 담음
	var polyIndex = 0;
	
	var latLng;
	
	var checkUnload = true;
	
	//페이지가 새로 열릴때
	window.onload = function() {
		initialize();
	}
	
	//해당 페이지를 벗어나려는 시도를 할때
	window.onbeforeunload = function(event) {
		//location.href="<c:url value='/nacojja/addPlace.do?clearFlag=true'/>";
		if (checkUnload) {
			return "작성중이던 정보가 날라가는데 나가실꺼유~?";
		}
	}
	
	//해당 페이지를 완전히 벗어날때
	window.onunload = function() { 
		//if (checkUnload) {
			$.ajax({
				url: "<c:url value='/nacojja/addClearPlace.do?clearFlag=true'/>",
				type:"POST",
			});
		//}
	}

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
		    strokeOpacity: 0.5,
		    strokeWeight: 5
		});
		poly.setMap(mapFinal);
		animate(poly);
		
		geocoder = new google.maps.Geocoder();
        placesService = new google.maps.places.PlacesService(map);

		map.addListener('click', handleClick); // 클릭 이벤트에 대한 리스너 추가
        
	} //initialize()
	
	function animate(line) {
          var count = 0;
          window.setInterval(function() {
            count = (count + 1) % 200;

            var icons = line.get('icons');
            icons[0].offset = (count / 2) + '%';
            line.set('icons', icons);
        }, 10);
    }
	
 	// 실제 클릭이 발생 했을 시 모든 처리를 여기서 해결(클릭핸들러 개념)
    function handleClick(event) {
    	latLng = event.latLng;
    	
    	//이전 모든 마커 삭제
    	deleteMarkers();
    	
    	// 해당 클릭 경로에 새로운 마커 추가
      	addMarker(event.latLng);
      	
      	// 해당 위치 정보받아서 도시 정보를 뷰에 뿌려주기
      	displayCityInfo(event.latLng);
		
    	console.log('You clicked on: ' + event.latLng);
         
        if (event.placeId) {
 	        console.log('You clicked on place:' + event.placeId);
 	
 	        event.stop();
 	        getPlaceInformation(event.placeId);
        } else {
        	$("#place-icon").hide();
        	$("#rating-icon").hide();
        	//$("#place-icon").prop("src", "");
        	//$("#rating-icon").prop("src", "");
        	$("#place-rating").val("");
        	
        	getAddressInformation(event.latLng);
        }
    }
    
    function addLatLng(location) {
	  	path = poly.getPath();
	  	path.push(location);
   	  	
	  	polys.push(location); //위도, 경도를 배열에 담기..
   		polyIndex++;
    }
    
    function addMarker(location) {
    	marker = new google.maps.Marker({
        	position: location,
        	map: map,
        	//title: '#' + path.getLength(),
        	animation: google.maps.Animation.BOUNCE
      	});
      	markers.push(marker);
    }
    
    function displayCityInfo(location) {
    	geocoder.geocode({'location': location}, function(results, status) {
		    if (status == 'OK') {
		    	if (results[0]) {
			        //map.setCenter(results[0].geometry.location);
			        var infowindow = new google.maps.InfoWindow({
			      		content: '주소: ' + results[0].formatted_address
			    	});
			        infowindow.open(map, marker);
			        
			        var address = new Array();
			        address = results[0].formatted_address.split(",");
			        
			        var city;
			        alert(address[0].split(" ")[0]);
			        if (address[0].split(" ")[0] == "일본") { //일본 주소 체계중 국가부터 나올때
			        	city = address[1];
			        } else { //국가가 뒤에 나오는 나머지 나라들
				        city = address[address.length-2];
			        }
			        //var city = results[0].formatted_address.substring(address.lastIndexOf(","));
			        
			        if (city == null || city == "") { //대한민국만  해당
			        	address = results[0].formatted_address.split(" ");
			        	city = address[1];
			        }
			        
			        $("#city").val(city);
			        
			        //console.log(results);
					//console.log(results[0]);
					//console.log(results[0].formatted_address);
		    	} else {
		            window.alert('No results found');
		        }
		    } else {
		        alert('Geocode was not successful for the following reason: ' + status);
		    }
	  	});
	}
    
    function getPlaceInformation(placeId) {
    	placesService.getDetails({placeId: placeId}, function(place, status) {
        	if (status === 'OK') {
        		//$("#divRating").find("img").remove();

        		$("#place-icon").show();
	        	$("#rating-icon").show();
        		$("#place-icon").prop("src", place.icon);
	        	$("#rating-icon").prop("src", "<c:url value='/img/star.png'/>");
	        	$("#place-name").val(place.name);
	        	$("#place-rating").val(place.rating);
	        	
	        	/* for (var i=2; i<place.rating; i++) {
	        		//$("#rating-icon").append("<img src='<c:url value="/img/star.png"/>' height='17' width='17'>");
	        		//$("#rating-icon").append("#place-rating");
	        		//$("#place-rating").after("#rating-icon");
	        		$("#rating-icon").after("<img src='<c:url value="/img/star.png"/>' height='17' width='17'>");
	        	} */
	        	//this.infowindowContent.children['place-id'].textContent = place.place_id;
	        	//this.infowindowContent.children['place-address'].textContent = place.formatted_address;
        	}
        });
    }
    
    function getAddressInformation(location) {
    	geocoder.geocode({'location': location}, function(results, status) {
		    if (status == 'OK') {
		    	if (results[0]) {
		    		$("#place-name").val(results[0].formatted_address);
		    	} else {
		            window.alert('No results found');
		        }
		    } else {
		        alert('Geocode was not successful for the following reason: ' + status);
		    }
	  	});
	}
    
    function addPlace() {
     	// 맵 클릭시 새로운 경로 라인 정보 추가
		addLatLng(latLng);

     	marker = new google.maps.Marker({
        	position: latLng,
        	map: mapFinal,
        	//title: '#' + path.getLength(),
        	animation: google.maps.Animation.BOUNCE
      	});
      	markersFinal.push(marker);
      	
      	mapFinal.setCenter(latLng);
      	mapFinal.setZoom(17);
      	
      	//$("form[name=frmNacojja2]").prop("action", "<c:url value='/nacojja/addPlace.do'/>");
		//$("form[name=frmNacojja2]").submit();
		
		// ajax로 여행지 정보 List에 담아버리긔
		$.ajax({
			url: "<c:url value='/nacojja/addClearPlace.do'/>",
			type:"POST",
			data: $("form[name=frmNacojja2]").serializeArray(),
		});
		
		//여행지 설명 클리어
		$("textarea[name=travelContent]").val("");
	}

    function undoPlace() {
    	undoMarker();
    	
    	polys.pop();
	 	polyIndex--;
	  	poly.getPath().setAt(polyIndex, polys[polys.length - 1]);
	  	poly.getPath().removeAt(polyIndex);
	}
    
    function undoMarker() {
    	for (var i=markersFinal.length-1; i<markersFinal.length; i++) {
        	markersFinal[i].setMap(null);
      	}
    	markersFinal.pop();
	}
    
    function deleteMarkers() {
    	setMapOnAll(null);
      	markers = [];
    }
    
    function clearMarkers() {
      	setMapOnAll(null);
    }

    function showMarkers() {
      	setMapOnAll(map);
    }
    
    function setMapOnAll(map) {
      	for (var i=0; i<markers.length; i++) {
        	markers[i].setMap(map);
      	}
    }
    
	
	function codeAddress() {
		var address = document.getElementById("address").value;
		geocoder.geocode({"address": address}, function(results, status) {
			if (status == "OK") {
				map.setCenter(results[0].geometry.location);
				map.setZoom(17);
				
				var lat = results[0].geometry.location.lat(); //위도 
				var lng = results[0].geometry.location.lng(); //경도
				
				console.log(lat, lng);
			} else {
				alert("Geocode was not successful for the following reason: " + status);
			}
		});
	}
	
	$(document).ready(function() {
        $('#country').hide();
        $("#place-icon").hide();
    	$("#rating-icon").hide();
        
        $('#continent').change(function() {
            if ($(this).val() == "") {
            	$('#country').hide();
            } else { //대륙별 국가 리스트 받아와서 뿌리기
            	//컨트롤러를 거쳐서 새롭게 다시 뿌려주는 이전 방식
            	//checkUnload = false;
            	//$("form[name=frmNacojja2]").prop("action", "<c:url value='/country.do'/>");
				//$("form[name=frmNacojja2]").submit();
				
				//비동기 방식으로 가져와서 뿌리기
				$.ajax({
					url: "<c:url value='/country.do'/>",
					type:"POST",
					data: {continent: $('#continent').val()},
					success: function(list) {
						if (list.length > 0) {
							$('#country').show();
							$("#country").empty();
							
							$.each(list, function(idx, countryVo){ //국가 리스트 가져온거 반복으로 뿌려주기
								$("<option value='" + countryVo.countryCode + "'></option>")
									.html(countryVo.country)
									.appendTo("#country");
							});
							
							if ($('#continent').val() == 'asia') {
								alert("아시아로 이동");
								map.setCenter(new google.maps.LatLng(34.047863, 100.61965529999998));
								map.setZoom(3);
					        } else if ($('#continent').val() == 'europe') {
								alert("유럽으로 이동");
					        	map.setCenter(new google.maps.LatLng(54.5259614, 15.255118700000025));
								map.setZoom(3);
					        } else if ($('#continent').val() == 'oceania') {
					        	alert("오세아니아로 이동");
					        	map.setCenter(new google.maps.LatLng(-22.7359095, 140.01876530000004));
								map.setZoom(3);
					        } else if ($('#continent').val() == 'america') {
					        	alert("미쿡으로 이동");
					        	map.setCenter(new google.maps.LatLng(18.75836397846548, -100.49775588418578));
								map.setZoom(2);
					        } else if ($('#continent').val() == 'africa') {
					        	alert("애프리카로 이동");
					        	map.setCenter(new google.maps.LatLng(4.533162102579155, 15.085477354232808));
								map.setZoom(3);
					        }
							
						}
					},
					error: function(xhr, status, error) {
						alert("error:" + error + ", status=" + status);
					},
				});
            }
        });
        
        $("#btnFinalAdd").click(function(){
        	checkUnload = false;
        	
        	
        });
        
	});
</script>


<div class="subBg subBgTerm">
	<p>나만의 코스 짜기</p>
	<div class="subBgBlack"></div>
</div>

<section class="container marginBottom80 minheight400 plan2">
    <div class="row">
        <div class="col-md-2">
            <ul class="list-group help-group">
                <div class="faq-list list-group nav nav-tabs">
                    <a href="#tab1" class="list-group-item active" role="tab" data-toggle="tab">
                    	Day1<small>09.11</small>
                    </a>
                    <a href="#tab2" class="list-group-item" role="tab" data-toggle="tab">
                        Day2<small>09.12</small>
                    </a>
                    <a href="#tab3" class="list-group-item" role="tab" data-toggle="tab">
                        Day3<small>09.13</small>
                    </a>
                    <a href="#tab4" class="list-group-item" role="tab" data-toggle="tab">
                        Day4<small>09.14</small>
                    </a>
                </div>
            </ul>
        </div>
        <div class="col-md-10">
            <div class="tab-content panels-faq">
                <div class="tab-pane active" id="tab1">
                    <form name="frmNacojja2" method="post" class="course" action="<c:url value='/nacojja/nacojja2.do'/>"   >
                        <div class="courseDiv">
                            <label for="continent" class="courseLabel">대륙</label>
                            <select name="continent" class="continent" id="continent">
                              <option value="">== 대륙ㅋ ==</option>
                              <option value="asia"
                              	<c:if test="${param.continent == 'asia'}">
                              		selected
                              	</c:if>
                              >아시아</option>
                              <option value="europe"
                              	<c:if test="${param.continent == 'europe'}">
                              		selected
                              	</c:if>
                              >유럽</option>
                              <option value="oceania"
                              	<c:if test="${param.continent == 'oceania'}">
                              		selected
                              	</c:if>
                              >오세아니아</option>
                              <option value="america"
                              	<c:if test="${param.continent == 'america'}">
                              		selected
                              	</c:if>
                              >아메리카</option>
                              <option value="africa"
                              	<c:if test="${param.continent == 'africa'}">
                              		selected
                              	</c:if>
                              >아프리카</option>
                            </select>
                            <select name="country" class="country" id="country">
                            	<!-- 국가 리스트 반복 시작 -->
                            	<%-- <c:forEach var="countryVo" items="${list}">
                                	<option value="${countryVo.countryCode}">${countryVo.country}</option>
                            	</c:forEach> --%>
                            	<!-- 국가 리스트 반복 끝 -->
                            </select>
                        </div>
                        
                        <div class="courseDiv">
                            <label for="city" class="courseLabel">도시</label>
                            <input type="text" id="city" name="city" readonly="readonly" style="border: none;">
                        </div>

                        <div class="courseDiv">
                            <label for="place-name" class="courseLabel">여행지</label>
                            <img id="place-icon" height="17" width="17">
                            <input type="text" id="place-name" name="travelSpot" readonly="readonly" style="border: none;">
                        </div>
                        
                        <div id="divRating" class="courseDiv">
                            <label for="place-rating" class="courseLabel">평점</label>
                            <img id="rating-icon" height="17" width="17">
                            <input type="text" id="place-rating" readonly="readonly" style="border: none;">
                        </div>
                        
                        <div id="floating-panel">
					      <input onclick="clearMarkers();" type=button value="마커 숨기기">
					      <input onclick="showMarkers();" type=button value="모든 마커 표시">
					      <input onclick="deleteMarkers();" type=button value="모든 마커 제거">
					      <input onclick="undoPlace();" type=button value="여행지 취소">
						</div>
                        
                        <div id="map"></div>
                        
                        <div class="mapSearch">
                            <input id="address" type="textbox" placeholder="지도에 표시될 여행지를 검색해주세요">
                            <input type="button" value="장소검색" onclick="codeAddress()" class="btn btn-warning">
                            <input type="button" value="여행지로 추가" onclick="addPlace()" class="btn btn-warning">
                        </div>
                        
                        <textarea name="travelContent" rows="10" class="textCK" placeholder="여행지에 대한 설명을 작성해주세요"></textarea>
                        
                        <div id="mapFinal"></div>
                        
                        <input type="submit" id="btnFinalAdd" value="나코짜 최종 등록" class="btn btn-warning">
                        
                        <input type="hidden" name="title" value="${travelSpotVo.title }">
		        		<input type="hidden" name="content" value="${travelSpotVo.content }">
			        	<input type="hidden" name="startDay" value="${travelSpotVo.startDay }">
	    		    	<input type="hidden" name="endDay" value="${travelSpotVo.endDay }">
					    <input type="hidden" name="thumbImg" value="${travelSpotVo.thumbImg }">
					    
					    <input type="hidden" name="day" value="1">
                    </form>
                </div>
                <div class="tab-pane" id="tab2">
                    2일차
                </div>
                <div class="tab-pane" id="tab3">
                    3일차
                </div>
                <div class="tab-pane" id="tab4">
                    4일차
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="../inc/bottom.jsp"%>