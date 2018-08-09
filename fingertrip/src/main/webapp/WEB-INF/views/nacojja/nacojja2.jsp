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
		    strokeOpacity: 0.6,
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
     	
     	        //event.stop(); //POI 클릭시 인포창이 뜨는 이벤트 발생을 일단 막아놓음..
     	        getPlaceInformation(event.placeId);
            } else {
            	$("#place-icon").hide();
            	$("#divRating").find("img").remove();
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
        		$("#divPhotos").find("img").remove();
        		
        		$("#place-icon").show();
        		$("#place-icon").prop("src", place.icon);
	        	$("#place-name").val(place.name);
	        	$("#place-rating").val(place.rating);
	        	
	        	for (var i=1; i<=place.rating; i++) {
	        		$("#divRating label").after("<img id='rating-icon' src='<c:url value="/img/star.png"/>' height='17' width='17'>");
	        	}
	        	
	        	if (place.photos != null && place.photos != "") {
	        		//alert("사진 객체 배열의 길이: " + place.photos.length);
		        	if (place.photos.length > 0) {
		        		console.log(place.photos[0].getUrl({'maxWidth': 200, 'maxHeight': 200}));
		        		$("#img").val(place.photos[0].getUrl({'maxWidth': 300, 'maxHeight': 206}));
		        		
			        	//for (var i=0; i<place.photos.length; i++) { //해당 장소의 모든 이미지가 보여지도록
			        	for (var i=0; i<1; i++) { //1개의 대표 이미지만 보여지도록
			        		var url = place.photos[i].getUrl({'maxWidth': 300, 'maxHeight': 206});
				        	$("#divPhotos label").after("<img id='photos' src='" + url + "'>&nbsp;&nbsp;");
			        	}
		        	}
	        	}
        	} else { //placeId는 존재하는데 place 정보가 존재하지 않을 경우 예외처리.. (주로 대한민국이 여기에 해당)
        		//alert('placesService was not successful for the following reason: ' + status);
        		
        		$("#place-icon").hide();
                $("#divRating").find("img").remove();
                $("#place-rating").val("");
        		
        		getAddressInformation(latLng);
        	}
        });
    }
    
    function getAddressInformation(location) {
    	geocoder.geocode({'location': location}, function(results, status) {
		    if (status == 'OK') {
		    	if (results[0]) {
		    		var infowindow = new google.maps.InfoWindow({
			      		content: '주소: ' + results[0].formatted_address
			    	});
			        infowindow.open(map, marker);
		    		
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
    	
    	
    	//맵을 클릭하여 위도,경도 정보가 존재할때만 여행지 추가 로직 진행
    	if (latLng != null && latLng != "") {
	    	//이전에 선택한 여행지를 중복으로 추가못하게 막기
	    	if (latLngs[latLngs.length-1] == latLng) {
	    		alert("방금 등록하신 여행지입니다. 다른 여행지를 선택해 주세용! +_+");
	    		return;
	    	}
	    	latLngs.push(latLng);
    	
	     	// 맵 클릭시 새로운 경로 라인 정보 추가
	     	//alert("여행지 추가 누를시 파라미터 : " + latLng);
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
			
			//빠진 일정 없는지 체크하여 submit을 막는 로직
			setTimeout(function(){
		    	$.ajax({
					url: "<c:url value='/nacojja/checkDataValid.do'/>",
					type:"POST",
					success: function(map) {
			        	//alert("빠진 일정 체크 결과: " + map["bool"] + ", 몇일차? " + map["day"]);
						if (map["bool"] == false) {
							$("#checkDataValidDay").val(map["day"]);
						} else {
							$("#checkDataValid").val("Y");
						}
					},
					error: function(xhr, status, error) {
						alert("error:" + error + ", status=" + status);
					}
				});
       		}, 10);
			
    	} else {
    		alert("가고싶은 여행지를 먼저 선택하세요~ !" + "(\'(\")\')!");
    	}
	}

    function addLatLng(location) {
    	//alert("addLatLng함수");
    	
	  	path = poly.getPath(); //path 정보 담을 배열 객체 가져옴
	  	path.push(location);
   	  	
	  	polys.push(location); //위도, 경도를 배열에 담기..
   		polyIndex++;
	  	
   		//alert("path:" + path);
   		//alert("polys:" + polys);
   		//alert("polyIndex:" + polyIndex);
    }
    
    function undoPlace(flag) {
    	//여행지 추가 후 바로 취소 누른뒤 다시 같은곳을 추가하려고 할때 가능하도록 latLng배열에서 이전에 기록된 위도경도 제거
    	latLngs.pop();
    	
    	for (var i=markersFinal.length-1; i<markersFinal.length; i++) {
        	markersFinal[i].setMap(null);
      	}
    	markersFinal.pop();
    	
    	polys.pop();
	 	polyIndex--;
	  	//poly.getPath().setAt(polyIndex, polys[polys.length - 1]);
	  	poly.getPath().removeAt(polyIndex);
	  	
	  	if (flag) { //여행지 취소 버튼을 누를때만 실행
		  	$.ajax({
				url: "<c:url value='/nacojja/delPrevPlace.do?day=" + $("#day").val() + "'/>",
				type:"POST",
			});
	  	
		  	//빠진 일정 없는지 체크하여 submit을 막는 로직
			setTimeout(function(){
		    	$.ajax({
					url: "<c:url value='/nacojja/checkDataValid.do'/>",
					type:"POST",
					success: function(map) {
			        	//alert("빠진 일정 체크 결과: " + map["bool"] + ", 몇일차? " + map["day"]);
						if (map["bool"] == false) {
							$("#checkDataValidDay").val(map["day"]);
							$("#checkDataValid").val("N");
						}
					},
					error: function(xhr, status, error) {
						alert("error:" + error + ", status=" + status);
					}
				});
       		}, 10);
	  	}
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
    
    function setMapOnAll(map) {
      	for (var i=0; i<markers.length; i++) {
        	markers[i].setMap(map);
      	}
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
	
	function findPlace(zoomValue) {
		var address = document.getElementById("address").value;
		geocoder.geocode({"address": address}, function(results, status) {
			if (status == "OK") {
				map.setCenter(results[0].geometry.location);
				map.setZoom(zoomValue);
				
				var lat = results[0].geometry.location.lat(); 
				var lng = results[0].geometry.location.lng();
				
				console.log(lat, lng);
			} else {
				alert("Geocode was not successful for the following reason: " + status);
			}
		});
	}
	
	$(document).ready(function() {
		$('#dayTab1').addClass("active");
		
		//이전에 지난간 일정도 수정할 수 있게 구현중.. 잠시 주석처리
		/* $('.dayTab').eq(1)
			.siblings().attr("disabled", "disabled")
			.end()
			.nextAll().attr("style", "text-align: left; background-color: #e9e9e9"); */

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
							$(".country").show();
							$(".country").empty();
							
							$("<option value=''>=== 국가 선택 ===</option>").appendTo(".country");
							$.each(list, function(idx, countryVo){ //국가 리스트 가져온거 반복으로 뿌려주기
								$("<option value='" + countryVo.countryCode + " " + countryVo.country + "'></option>")
									.html(countryVo.country)
									.appendTo(".country");
							});
							
							if ($('.continent').val() == 'asia') {
								map.setCenter(new google.maps.LatLng(34.047863, 100.61965529999998));
					        } else if ($('.continent').val() == 'middleEast') {
					        	map.setCenter(new google.maps.LatLng(29.2985278, 42.55096030000004));
					        } else if ($('.continent').val() == 'europe') {
					        	map.setCenter(new google.maps.LatLng(54.5259614, 15.255118700000025));
					        }  else if ($('.continent').val() == 'northAmerica') {
					        	map.setCenter(new google.maps.LatLng(48.67212160577449, -101.79580880540192));
					        } else if ($('.continent').val() == 'latinAmerica') {
					        	map.setCenter(new google.maps.LatLng(7.214281738343903, -81.51370573497422));
					        } else if ($('.continent').val() == 'africa') {
					        	map.setCenter(new google.maps.LatLng(4.533162102579155, 15.085477354232808));
					        } else if ($('.continent').val() == 'oceania') {
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
        
        $('#country').change(function(){
        	if ($('#country').val() != null && $('#country').val() != "") {
	        	$("#address").val($("#country").val().substring($("#country").val().indexOf(" ")));
	        	findPlace(7);
	        	$("#address").val("");
        	}
        });
        
        $('.dayTab').click(function(){
        	//이전에 지난간 일정도 수정할 수 있게 구현중.. 잠시 주석처리
        	//if (confirm("다음 일정으로 넘어가면 이전 일정은 수정할 수 없습니다. 넘어가시겠습니까?")) {
        		
        		//일차가 넘어간 후 아무것도 안한상태에서 바로 여행지 추가를 누르면 이벤트 진행되지 않도록 latLng값 초기화
            	latLng = "";
        		
        		$("#day").val($(this).val());
            	
            	$("#continent").val("");
            	$('.country').hide();
                $("#city").val("");
                $("#place-icon").hide();
        		$("#place-name").val("");
                $("#divRating").find("img").remove();
                $("#place-rating").val("");
                $("#divPhotos").find("img").remove();
            	
            	deleteMarkers();
            	
            	//아래 두개 함수를 undoPlace() 함수 하나로 처리하도록 바꿈..
            	/* deleteMarkersFinal();
            	deletePolys(); */
            	
            	var pathLength = polyIndex; // poly.getPath().length == polys.length == polyIndex
        		for (var i=0; i<pathLength; i++) {
        			undoPlace();
          		}
            	
            	//일정을 다시 되돌아가면 그 정보를 맵에 뿌려주고 수정할 수 있도록 구현..
        		$.ajax({
					url: "<c:url value='/nacojja/getTravelList.do'/>",
					type:"POST",
					success: function(list) {
						if (list.length > 0) {
							$.each(list, function(idx, travelSpotVO){
								if (travelSpotVO.day == $("#day").val()) {
									//alert("[" + idx + "]위도,경도: " + travelSpotVO.latLng);
									//alert("[" + idx + "]위도: " + travelSpotVO.latLng.substring(1, travelSpotVO.latLng.indexOf(",")));
									//alert("[" + idx + "]경도: " + travelSpotVO.latLng.substring(travelSpotVO.latLng.indexOf(",")+2, travelSpotVO.latLng.length-1));
									var someDayLatLng = new google.maps.LatLng(
											travelSpotVO.latLng.substring(1, travelSpotVO.latLng.indexOf(",")),
											travelSpotVO.latLng.substring(travelSpotVO.latLng.indexOf(",")+2, travelSpotVO.latLng.length-1)
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
							      	mapFinal.setZoom(17);
								}
							});
						}
					},
					error: function(xhr, status, error) {
						alert("error:" + error + ", status=" + status);
					}
				});
            	
            	
        		//이전에 지난간 일정도 수정할 수 있게 구현중.. 잠시 주석처리
            	/* $('.dayTab').removeClass("active");
        		$(this).prev().removeClass("active").attr({"disabled" : "disabled", 
        													"style" : "text-align: left; background-color: #e9e9e9"
        													});
        		$(this).addClass("active").attr({"disabled" : "disabled"});
        		
        		$(this).next().attr("style", "text-align: left; background-color: #fff; color: #777");
        		$(this).next().removeAttr("disabled", "disabled"); */
        	//}
        	
        });
        
        //나코짜 최종 등록 버튼 누를 시 예외처리 할것들 그리고 데이터 유효성 검사 
        $("#btnFinalAdd").click(function(){
        	checkUnload = false;
        	
        	if ($("#checkDataValid").val() == "N") {
        		alert($("#checkDataValidDay").val() + "일차 일정이 빠져있습니다!");
        		return false;
        	}
        	
        	//var bool = true;
        	//비동기 방식으로 유효성 체크시 bool 값이 세팅 되기도 전에 submit 되어버린다.. setTimeout을 써도 마찬가지..
        	/* $.ajax({
				url: "<c:url value='/nacojja/checkDataValid.do'/>",
				type:"POST",
				success: function(result) {
		        	alert("1불값: " + result);
					if (result == false) {
						bool = false;
					}
				},
				error: function(xhr, status, error) {
					alert("error:" + error + ", status=" + status);
				}
			});
        	
       		setTimeout(function(){
	        	alert("2불값: " + bool);
	        	return bool;
       		}, 6); */
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
                    <%-- <c:forEach var="i" begin="1" end="${travelDay}"> --%>
                    <c:set var="i" value="1"></c:set>
                    <c:forEach var="travelDate" items="${tdList}">
                    	<button id="dayTab${i}" class="list-group-item dayTab" value="${i}" style="text-align: left;" role="tab" data-toggle="tab">
                    		Day${i}
                    		<small><fmt:formatDate value="${travelDate}" pattern="yyyy/MM/dd"/> </small>
                   		</button>
                   		<c:set var="i" value="${i+1}"></c:set>
                    </c:forEach>
                </div>
            </ul>
        </div>
        
        <div class="col-md-10">
            <div class="tab-content panels-faq">
           		<div class="tab-pane active" id="tab1">
                    <form name="frmNacojja2" method="post" class="course" action="<c:url value='/nacojja/nacojja2.do'/>">
                    <%-- <form name="frmNacojja2" method="post" class="course" action="<c:url value='/nacojja/nacojja2.do'/>" onsubmit="return checkDataValid()"> --%>
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
                        
                        <div id="divPhotos" class="courseDiv">
                        	<label for="photos" class="courseLabel">포토</label>
                        	<input type="hidden" id="img" name="img">
                        </div>
                       
                       <!--  <div id="floating-panel">
						    <input onclick="clearMarkers();" type=button value="마커 숨기기">
						    <input onclick="showMarkers();" type=button value="모든 마커 표시">
						    <input onclick="deleteMarkers();" type=button value="모든 마커 제거">
					    </div> -->
                       
                        <div id="map" class="map"></div>
                       
                        <div class="mapSearch">
                            <input id="address" type="textbox" placeholder="지도에 표시될 여행지를 검색해주세요" 
                        		onkeypress="if (event.keyCode==13) {return false;}"> <!-- 엔터키로 submit 되어버리는 현상 막음 -->
                            <input type="button" value="장소검색" onclick="findPlace(18)" class="btn btn-warning">
                        </div>
                       
                        <textarea name="travelContent" rows="5" class="textCK" placeholder="여행지에 대한 설명을 작성해주세요"></textarea>
                        <input type="button" value="여행지로 추가" onclick="addPlace()" class="btn btn-warning">
                        <input type=button onclick="undoPlace(true);" value="여행지 취소" class="btn btn-warning">
                       
                        <div id="mapFinal" class="mapFinal"></div>
                       
                        <input type="submit" id="btnFinalAdd" value="나코짜 최종 등록" class="btn btn-warning">
                       
                        <input type="hidden" name="title" value="${travelSpotVo.title }">
		        		<input type="hidden" name="content" value="${travelSpotVo.content }">
			        	<input type="hidden" name="startDay" value="${travelSpotVo.startDay }">
	    		    	<input type="hidden" name="endDay" value="${travelSpotVo.endDay }">
					    <input type="hidden" name="thumbImg" value="${travelSpotVo.thumbImg }">
					    
					    <input type="hidden" id="day" name="day" value="1">
					    
					    <input type="hidden" id="countryCode" name="countryCode">
					    <input type="hidden" id="latLng" name="latLng">
					    
					    <input type="hidden" id="checkDataValid" name="checkDataValid" value="N">
					    <input type="hidden" id="checkDataValidDay" name="checkDataValidDay" value="1">
                    </form>
               	</div>
            </div>
        </div>
    </div>
</section>

<%@ include file="../inc/bottom.jsp"%>

