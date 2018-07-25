<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<script type="text/javascript">
	window.onload = function() {
		initialize()
	}
</script>

<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBYa_utcbQs1RLoVuJguMaQzuX4yxvQyrs&libraries=places"></script>
<script>
	var geocoder;
	var map;

	function initialize() {
		geocoder = new google.maps.Geocoder();
		var latlng = new google.maps.LatLng(37.525939, 126.888935);
		var mapOptions = {
			zoom : 13,
			center : latlng
		}
		map = new google.maps.Map(document.getElementById('map'), mapOptions);
	}

	function codeAddress() {
		var address = document.getElementById('address').value;
		geocoder.geocode({
			'address' : address
		}, function(results, status) {
			if (status == 'OK') {
				map.setCenter(results[0].geometry.location);
				var marker = new google.maps.Marker({
					map : map,
					position : results[0].geometry.location
				});
				var address_lat = results[0].geometry.location.lat(); //위도 
				var address_lng = results[0].geometry.location.lng(); //경도
				console.log(address_lat, address_lng, results);
			} else {
				alert('Geocode was not successful for the following reason: '
						+ status);
			}
		});
	}
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
                            Day1
                            <small>09.11</small>
                        </a>
                        <a href="#tab2" class="list-group-item" role="tab" data-toggle="tab">
                            Day2
                            <small>09.12</small>
                        </a>
                        <a href="#tab3" class="list-group-item" role="tab" data-toggle="tab">
                            Day3
                            <small>09.13</small>
                        </a>
                        <a href="#tab4" class="list-group-item" role="tab" data-toggle="tab">
                            Day4
                            <small>09.14</small>
                        </a>
                    </div>
                </ul>
            </div>
            <div class="col-md-10">
                <div class="tab-content panels-faq">
                    <div class="tab-pane active" id="tab1">
                        <script>
                            $(function() {
                                $('.country').hide();

                                $('.continent').change(function() {
                                    if ($(this).val() == 'asia') {
                                        $('.country').hide();
                                        $('.asiaCountry').show();
                                    } else if ($(this).val() == 'europe') {
                                        $('.country').hide();
                                        $('.europeCountry').show();
                                    } else if ($(this).val() == 'oceania') {
                                        $('.country').hide();
                                        $('.oceaniaCountry').show();
                                    } else if ($(this).val() == 'america') {
                                        $('.country').hide();
                                        $('.americaCountry').show();
                                    } else {
                                        $('.country').hide();
                                        $('.africaCountry').show();
                                    }
                                });
                            });
                        </script>


                        <form action="" name="nacojja" class="course">
                            <input type="hidden" value="1">
                            <div class="courseDiv">
                                <label for="continent" class="courseLabel">대륙</label>
                                <select name="continent" class="continent" id="continent">
                                  <option value="asia">아시아</option>
                                  <option value="europe">유럽</option>
                                  <option value="oceania">오세아니아</option>
                                  <option value="america">아메리카</option>
                                  <option value="africa">아프리카</option>
                                </select>
                                <select name="asiaCountry" class="country asiaCountry">
                                    <option value="KR">한국</option>
                                    <option value="CN">중국</option>
                                    <option value="JP">일본</option>
                                    <option value="NP">네팔</option>
                                    <option value="TW">대만</option>
                                    <option value="LA">라오스</option>
                                    <option value="MO">마카오</option>
                                    <option value="MY">말레이시아</option>
                                    <option value="MV">몰디브</option>
                                    <option value="MN">몽골</option>
                                    <option value="MM">미얀마</option>
                                    <option value="VN">베트남</option>
                                    <option value="LK">스리랑카</option>
                                    <option value="SG">싱가포르</option>
                                    <option value="AE">아랍에미리트</option>
                                    <option value="IN">인도</option>
                                    <option value="ID">인도네시아</option>
                                    <option value="QA">카타르</option>
                                    <option value="KH">캄보디아</option>
                                    <option value="TH">태국</option>
                                    <option value="PH">필리핀</option>
                                    <option value="HK">홍콩</option>
                                </select>
                                <select name="europeCountry" style="display: ;" class="country europeCountry">
                                    <option value="GR">그리스</option>
                                    <option value="NL">네덜란드</option>
                                    <option value="NO">노르웨이</option>
                                    <option value="DK">덴마크</option>
                                    <option value="DE">독일</option>
                                    <option value="RU">러시아</option>
                                    <option value="RO">루마니아</option>
                                    <option value="LU">룩셈부르크</option>
                                    <option value="MC">모나코</option>
                                    <option value="BE">벨기에</option>
                                    <option value="BA">보스니아</option>
                                    <option value="BG">불가리아</option>
                                    <option value="SE">스웨덴</option>
                                    <option value="CH">스위스</option>
                                    <option value="ES">스페인</option>
                                    <option value="SI">슬로베니아</option>
                                    <option value="IS">아이슬랜드</option>
                                    <option value="IE">아일랜드</option>
                                    <option value="GB">영국</option>
                                    <option value="AT">오스트리아</option>
                                    <option value="IT">이탈리아</option>
                                    <option value="CZ">체코</option>
                                    <option value="HR">크로아티아</option>
                                    <option value="TR">터키</option>
                                    <option value="PT">포르투갈</option>
                                    <option value="PL">폴란드</option>
                                    <option value="FR">프랑스</option>
                                    <option value="FI">핀란드</option>
                                    <option value="HU">헝가리</option>
                                </select>
                                <select name="oceaniaCountry" style="display: ;" class="country oceaniaCountry">
                                    <option value="GU">괌</option>
                                    <option value="NZ">뉴질랜드</option>
                                    <option value="NC">뉴칼레도니아</option>
                                    <option value="MP">사이판</option>
                                    <option value="AU">호주</option>
                                    <option value="FJ">피지</option>
                                </select>
                                <select name="americaCountry" style="display: ;" class="country americaCountry">
                                    <option value="US">미국</option>
                                    <option value="CA">캐나다</option>
                                    <option value="MX">멕시코</option>
                                    <option value="BS">바하마</option>
                                    <option value="BO">볼리비아</option>
                                    <option value="BR">브라질</option>
                                    <option value="AR">아르헨티나</option>
                                    <option value="EC">에콰도르</option>
                                    <option value="JM">자메이카</option>
                                    <option value="CL">칠레</option>
                                    <option value="CO">콜롬비아</option>
                                    <option value="CU">쿠바</option>
                                    <option value="PE">페루</option>
                                </select>
                                <select name="africaCountry" style="display:;" class="country africaCountry">
                                    <option value="GH">가나</option>
                                    <option value="ZA">남아프리카공화국</option>
                                    <option value="MU">모리셔스</option>
                                    <option value="BW">보츠와나</option>
                                    <option value="EG">이집트</option>
                                    <option value="ZM">잠비아</option>
                                    <option value="ZW">짐바브웨</option>
                                    <option value="KE">케냐</option>
                                    <option value="TZ">탄자니아</option>
                                </select>
                            </div>
                            <div class="courseDiv">
                                <label for="city" class="courseLabel">도시</label>
                                <input type="text" id="city" class="courseInput">
                            </div>

                            <div class="courseDiv">
                                <label for="city" class="courseLabel">여행지</label>
                                <input type="text" id="city" class="courseInput">
                            </div>
                            
                           
                            <div id="map"></div>
                            <div class="mapSearch">
                                <input id="address" type="textbox" placeholder="지도에 표시될 여행지를 검색해주세요">
                                <input type="button" value="장소검색" onclick="codeAddress()" class="btn btn-warning">
                            </div>
                            

                            <textarea name="" id="" rows="10" class="textCK" placeholder="여행지에 대한 설명을 작성해주세요"></textarea>

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