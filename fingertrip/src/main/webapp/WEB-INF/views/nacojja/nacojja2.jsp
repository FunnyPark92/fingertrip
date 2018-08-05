<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<style>
	#floating-panel {
        position: absolute;
        top: 800px;
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
	var polys = []; //위도,경도 정보를 배열에 담음
	var polyIndex = 0;
	
	var latLng;
	var latLngs = []; //이전 여행지를 중복해서 추가하려고 할때 체크하기 위한 용도
	
	var checkUnload = true;
	var checkCountryCode = true;
	
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
		$.ajax({
			url: "<c:url value='/nacojja/addClearPlace.do?clearFlag=true'/>",
			type:"POST",
		});
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
    	//콤보 박스에서 국가 선택하고 구글 맵에서 다른 국가의 여행지 선택 시 alert 띄우고 예외처리
 		if ($("#country").val() != null && $("#country").val() != "") {
			geocoder.geocode({'location': event.latLng}, function(results, status) {
			    if (status == 'OK') {
			    	if (results[0]) {
				        for (var i=0; i<results[0].address_components.length; i++) {
							if (results[0].address_components[i].types[0] == "country") {
								//alert("1:" + $("#country").val().substring(0, $("#country").val().indexOf(" ")));
								//alert("2:" + results[0].address_components[i].short_name);
								
						    	if ($("#country").val().substring(0, $("#country").val().indexOf(" "))
						    			!= results[0].address_components[i].short_name) {
						    		alert("선택하신 국가와 일치하지 않는 여행지입니다!!!");
						    		checkCountryCode = false;
						    	} else {
						    		checkCountryCode = true;
						    	}
							}
						}
			    	} else {
			            window.alert('No results found');
			        }
			    } else {
			        alert('Geocode was not successful for the following reason: ' + status);
			    }
		  	});
 		} else {
 			checkCountryCode = true;
 		}
 		
    	setTimeout(function(){ //checkCountryCode값이 세팅될때까지 딜레이를 주어야 국가 체크 로직이 정상동작 함(거지같네 진짜 ㅠㅠ)
    		//alert("국가 일치 여부: " + checkCountryCode);
     		if (!checkCountryCode) {
     			return;
     		}
     		
     		//전역변수 latLng에 위도,경도값 미리 넣어두기(나중에 여기저기서 사용)
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
     	
     	        event.stop(); //POI 클릭시 인포창이 뜨는 이벤트 발생을 일단 막아놓음..
     	        getPlaceInformation(event.placeId);
            } else {
            	$("#place-icon").hide();
            	//$("#rating-icon").hide();
            	$("#divRating").find("img").remove();
            	//$("#place-icon").prop("src", "");
            	//$("#rating-icon").prop("src", "");
            	$("#place-rating").val("");
            	
            	getAddressInformation(event.latLng);
            }
    	}, 400); //수십차례 테스트 해 본 결과 딜레이는 400밀리초가 마지노선임. 조금 더 빠르게 처리 불가.. (수정 금지)
 		
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
			        
			        //해당 위치에 주소를 받아와서 스트링 배열로 만든다음 도시 정보만 빼오는 방식(but, 국가별 주소 체계가 달라 예외처리 할게 많음)
			        /* var address = new Array();
			        address = results[0].formatted_address.split(",");
			        
			        var city;
			        if (address[0].split(" ")[0] == "일본") { //일본 주소 체계중 국가부터 나올때
			        	city = address[1];
			        } else { //국가가 뒤에 나오는 나머지 나라들
				        city = address[address.length-2];
			        }
			        
			        if (city == null || city == "") { //대한민국만  해당
			        	address = results[0].formatted_address.split(" ");
			        	city = address[1];
			        } */
			        
			        $("#city").val("");
			        for (var i=0; i<results[0].address_components.length; i++) {
			        	//도시 정보 세팅(타입이 locality인 애를 찾아내서 도시 정보 가져오기)
			        	if (results[0].address_components[i].types[0] == "locality") {
					        $("#city").val(results[0].address_components[i].long_name);
			        	}
			        
			        	//국가코드 세팅
						if (results[0].address_components[i].types[0] == "country") {
					        $("#countryCode").val(results[0].address_components[i].short_name);
						}
					}
			        
			        if ($("#city").val() == null || $("#city").val() == "") {
			        	$("#city").val("도시 정보 없음");
			        }
			        
			        //console.log(results);
					//console.log(results[0]);
					console.log(results[0].address_components);
					//console.log(results[0].address_components[i].types[0]);
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
        		$("#divRating").find("img").remove();

        		$("#place-icon").show();
	        	//$("#rating-icon").show();
        		$("#place-icon").prop("src", place.icon);
	        	$("#place-name").val(place.name);
	        	//$("#rating-icon").prop("src", "<c:url value='/img/star.png'/>");
	        	$("#place-rating").val(place.rating);
	        	
	        	for (var i=1; i<=place.rating; i++) {
	        		$("#divRating label").after("<img id='rating-icon' src='<c:url value="/img/star.png"/>' height='17' width='17'>");
	        	}
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
    	//To-Do: 유효성 체크
    	
    	
    	//이전에 선택한 여행지를 중복으로 추가못하게 막기
    	if (latLngs[latLngs.length-1] == latLng) {
    		alert("방금 등록하신 여행지입니다. 다른 여행지를 선택해 주세용! +_+");
    		return;
    	}
    	latLngs.push(latLng);
    	
     	// 맵 클릭시 새로운 경로 라인 정보 추가
		addLatLng(latLng);
    
    	// 위도,경도 정보 DB에 넣기 위해 세팅
    	$("#latLng").val(latLng);

     	marker = new google.maps.Marker({
        	position: latLng,
        	map: mapFinal,
        	//title: '#' + path.getLength(),
        	animation: google.maps.Animation.BOUNCE
      	});
      	markersFinal.push(marker);
      	
      	mapFinal.setCenter(latLng);
      	mapFinal.setZoom(17);
      	
		// ajax로 여행지 정보 List에 담아버리긔
		$.ajax({
			url: "<c:url value='/nacojja/addClearPlace.do'/>",
			type:"post",
			data: $("form[name=frmNacojja2]").serializeArray(),
		});
		
		//여행지 설명 클리어
		$("textarea[name=travelContent]").val("");
	}

    function addLatLng(location) {
	  	path = poly.getPath(); //path 정보 담을 배열 객체 가져옴
	  	path.push(location);
   	  	
	  	polys.push(location); //위도, 경도를 배열에 담기..
   		polyIndex++;
    }
    
    function undoPlace() {
    	for (var i=markersFinal.length-1; i<markersFinal.length; i++) {
        	markersFinal[i].setMap(null);
      	}
    	markersFinal.pop();
    	
    	polys.pop();
	 	polyIndex--;
	  	//poly.getPath().setAt(polyIndex, polys[polys.length - 1]);
	  	poly.getPath().removeAt(polyIndex);
	}
    
    function deletePolys() {
    	//polys = [];
      	polyIndex = 0;
      	alert(poly.getPath().length);
    	for (var i=0; i<poly.getPath().length; i++) {
    		polys.pop();
    		poly.getPath().removeAt(i);
      	}
      	//poly.setMap(null);
    }
    
    function deleteMarkers() {
    	setMapOnAll(null);
      	markers = [];
    }
    
    function deleteMarkersFinal() {
    	for (var i=0; i<markersFinal.length; i++) {
        	markersFinal[i].setMap(null);
      	}
      	markersFinal = [];
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
	
	function findPlace(zoomValue) {
		var address = document.getElementById("address").value;
		geocoder.geocode({"address": address}, function(results, status) {
			if (status == "OK") {
				map.setCenter(results[0].geometry.location);
				map.setZoom(zoomValue);
				
				var lat = results[0].geometry.location.lat(); //위도 
				var lng = results[0].geometry.location.lng(); //경도
				
				console.log(lat, lng);
			} else {
				alert("Geocode was not successful for the following reason: " + status);
			}
		});
	}
	
	$(document).ready(function() {
		$('#dayTab1').addClass("active");

		$('.country').hide();
        $("#place-icon").hide();
        
        $('.continent').change(function() {
            if ($(this).val() == "") {
            	$('.country').hide();
            	$('#country').val("");
            } else { //대륙별 국가 리스트 받아와서 뿌리기
            	//컨트롤러를 거쳐서 새롭게 다시 뿌려주는 이전 방식
            	//checkUnload = false;
            	//$("form[name=frmNacojja2]").prop("action", "<c:url value='/country.do'/>");
				//$("form[name=frmNacojja2]").submit();
				
				//비동기 방식으로 가져와서 뿌리기
				$.ajax({
					url: "<c:url value='/country.do'/>",
					type:"POST",
					data: {continent: $('.continent').val()},
					success: function(list) {
						if (list.length > 0) {
							$('.country').show();
							$(".country").empty();
							
							$.each(list, function(idx, countryVo){ //국가 리스트 가져온거 반복으로 뿌려주기
								$("<option value='" + countryVo.countryCode + " " + countryVo.country + "'></option>")
									.html(countryVo.country)
									.appendTo(".country");
							});
							
							if ($('.continent').val() == 'asia') {
								alert("아시아로 이동");
								map.setCenter(new google.maps.LatLng(34.047863, 100.61965529999998));
					        } else if ($('.continent').val() == 'middleEast') {
								alert("중동으로 이동");
					        	map.setCenter(new google.maps.LatLng(29.2985278, 42.55096030000004));
					        } else if ($('.continent').val() == 'europe') {
								alert("유럽으로 이동");
					        	map.setCenter(new google.maps.LatLng(54.5259614, 15.255118700000025));
					        }  else if ($('.continent').val() == 'northAmerica') {
					        	alert("북미로 이동");
					        	map.setCenter(new google.maps.LatLng(48.67212160577449, -101.79580880540192));
					        } else if ($('.continent').val() == 'latinAmerica') {
					        	alert("중남미로 이동");
					        	map.setCenter(new google.maps.LatLng(7.214281738343903, -81.51370573497422));
					        } else if ($('.continent').val() == 'africa') {
					        	alert("애프리카로 이동");
					        	map.setCenter(new google.maps.LatLng(4.533162102579155, 15.085477354232808));
					        } else if ($('.continent').val() == 'oceania') {
					        	alert("대양주로 이동");
					        	map.setCenter(new google.maps.LatLng(-22.7359095, 140.01876530000004));
					        }
							map.setZoom(4);
							
						}
					},
					error: function(xhr, status, error) {
						alert("error:" + error + ", status=" + status);
					},
				});
            }
        });
        
        $('#country').change(function() {
        	$("#address").val($("#country").val().substring($("#country").val().indexOf(" ")));
        	findPlace(7);
        	$("#address").val("");
        });
        
        $('.dayTab').click(function(){
        	if (confirm("다음 일정으로 넘어가면 이전 일정은 수정할 수 없습니다. 넘어가시겠습니까?")) {
        		$("#day").val($(this).val());
            	
            	$("#continent").val("");
            	$('.country').hide();
                $("#city").val("");
                $("#place-icon").hide();
        		$("#place-name").val("");
                $("#divRating").find("img").remove();
                $("#place-rating").val("");
            	
            	deleteMarkers();
            	
            	//아래 두개 함수를 undoPlace() 함수 하나로 처리하도록 바꿈..
            	/* deleteMarkersFinal();
            	deletePolys(); */
            	
            	var pathLength = polyIndex; // poly.getPath().length == polys.length == polyIndex
        		for (var i=0; i<pathLength; i++) {
        			undoPlace();
          		}
            	
        		$('.dayTab').removeClass("active");
        		$(this).addClass("active");
        		
        		$(this).prev().attr("disabled", "disabled");
        		//$("#dayTab' + '"$(this).val()" + '"' )
        		//$("#dayTab + + ")
        	} else {
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
                <div class="faq-list list-group nav">
                    <c:forEach var="i" begin="1" end="${travelDay}">
                    	<button id="dayTab${i}" class="list-group-item dayTab" value="${i}">
                    		Day${i}<small>${travelSpotVo.startDay.getMonth()+1}.${travelSpotVo.startDay.getDate()+i-1}</small>
                   		</button>
                    </c:forEach>
                </div>
            </ul>
        </div>
        
        <div class="col-md-10">
            <div class="tab-content panels-faq">
            	<%-- <c:forEach var="i" begin="1" end="${travelDay}">
            		<div class="tab-pane" id="tab${i}"> --%>
            		<div class="tab-pane active" id="tab1">
                    <form name="frmNacojja2" method="post" class="course" action="<c:url value='/nacojja/nacojja2.do'/>"   >
                        <div class="courseDiv">
                            <label for="continent" class="courseLabel">대륙</label>
                            <select name="continent" class="continent" id="continent">
                              <option value="">== 대륙 선택 ==</option>
                              <option value="asia"
                              	<c:if test="${param.continent == 'asia'}">
                              		selected
                              	</c:if>
                              >아시아</option>
                              <option value="middleEast"
                              	<c:if test="${param.continent == 'middleEast'}">
                              		selected
                              	</c:if>
                              >중동</option>
                              <option value="europe"
                              	<c:if test="${param.continent == 'europe'}">
                              		selected
                              	</c:if>
                              >유럽</option>
                              <option value="northAmerica"
                              	<c:if test="${param.continent == 'northAmerica'}">
                              		selected
                              	</c:if>
                              >북미</option>
                              <option value="latinAmerica"
                              	<c:if test="${param.continent == 'latinAmerica'}">
                              		selected
                              	</c:if>
                              >중남미</option>
                              <option value="africa"
                              	<c:if test="${param.continent == 'africa'}">
                              		selected
                              	</c:if>
                              >아프리카</option>
                              <option value="oceania"
                              	<c:if test="${param.continent == 'oceania'}">
                              		selected
                              	</c:if>
                              >대양주</option>
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
                            <input type="text" id="city" name="city" readonly="readonly" style="border: none; width: 70%">
                        </div>

                        <div class="courseDiv">
                            <label for="place-name" class="courseLabel">여행지</label>
                            <img id="place-icon" height="17" width="17">
                            <input type="text" id="place-name" name="travelSpot" readonly="readonly" style="border: none; width: 70%">
                        </div>
                        
                        <div id="divRating" class="courseDiv">
                            <label for="place-rating" class="courseLabel">평점</label>
                            <input type="text" id="place-rating" readonly="readonly" style="border: none;">
                        </div>
                        
                        <div id="floating-panel">
					      <input onclick="clearMarkers();" type=button value="마커 숨기기">
					      <input onclick="showMarkers();" type=button value="모든 마커 표시">
					      <input onclick="deleteMarkers();" type=button value="모든 마커 제거">
					      <input onclick="undoPlace();" type=button value="여행지 취소">
						</div>
                        
                        <%-- <div id="map${i}" class="map"></div> --%>
                        <div id="map" class="map"></div>
                        
                        <div class="mapSearch">
                            <input id="address" type="textbox" placeholder="지도에 표시될 여행지를 검색해주세요" 
                            	onkeypress="if (event.keyCode==13) {return false;}"> <!-- 엔터키로 submit 되어버리는 현상 막음 -->
                            <input type="button" value="장소검색" onclick="findPlace(18)" class="btn btn-warning">
                        </div>
                        
                        <textarea name="travelContent" rows="5" class="textCK" placeholder="여행지에 대한 설명을 작성해주세요"></textarea>
                        <input type="button" value="여행지로 추가" onclick="addPlace()" class="btn btn-warning">
                        
                        <%-- <div id="mapFinal${i}" class="mapFinal"></div> --%>
                        <div id="mapFinal" class="mapFinal"></div>
                        
                        <input type="submit" id="btnFinalAdd" value="나코짜 최종 등록" class="btn btn-warning">
                        
                        <input type="hidden" name="title" value="${travelSpotVo.title }">
		        		<input type="hidden" name="content" value="${travelSpotVo.content }">
			        	<input type="hidden" name="startDay" value="${travelSpotVo.startDay }">
	    		    	<input type="hidden" name="endDay" value="${travelSpotVo.endDay }">
					    <input type="hidden" name="thumbImg" value="${travelSpotVo.thumbImg }">
					    
					    <%-- <input type="hidden" name="day" value="${i}"> --%>
					    <input type="hidden" id="day" name="day" value="1">
					    
					    <input type="hidden" id="countryCode" name="countryCode">
					    <input type="hidden" id="latLng" name="latLng">
                    </form>
                	</div>
            	<%-- </c:forEach> --%>
            </div>
        </div>
    </div>
</section>

<%@ include file="../inc/bottom.jsp"%>