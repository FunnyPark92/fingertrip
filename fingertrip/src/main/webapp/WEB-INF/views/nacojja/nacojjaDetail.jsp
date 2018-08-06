<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBYa_utcbQs1RLoVuJguMaQzuX4yxvQyrs&libraries=places"></script>

<div class="subBg subBgTerm">
	<p>나만의 코스 짜기</p>
	<div class="subBgBlack"></div>
</div>

<section class="container marginBottom80 minheight400 plan2">
    <div class="row">
        <div class="col-md-2">
            <ul class="list-group help-group">
                    <div class="faq-list list-group nav">
                        <a class="list-group-item active">
                            Day1
                            <small>09.11</small>
                        </a>
                        <a class="list-group-item">
                            Day2
                            <small>09.12</small>
                        </a>
                        <a class="list-group-item">
                            Day3
                            <small>09.13</small>
                        </a>
                        <a class="list-group-item">
                            Day4
                            <small>09.14</small>
                        </a>
                    </div>
                </ul>
            </div>
            <div class="col-md-10 ncjD">
                <div class="ncjP">
                    <span>Day1</span>
                    <span>09월 11일 화요일</span>
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
                   루브르 박물관 - 모나리자가 전시되어져있는 박물관으로 큰 규모를 자랑합니다.<br>
                   노트르담 대성당 - 프랑스 파리의 시테 섬의 동쪽 반쪽에 있는 프랑스후기고딕 양식의 성당이다.<br>
                   에펠탑 - 프랑스의 대표 건축물인 이 탑은 격자 구조로 이루어져 파리에서 가장 높은 건축물이다.
                </div>
                <div class="spotImg">
                    <img src="img/spot1.jpg" alt="루브르박물관">
                    <img src="img/spot2.jpg" alt="노트르담대성당">
                    <img src="img/spot3.jpg" alt="에펠탑">
                </div>

            </div>
        </div>
</section>

<%@ include file="../inc/bottom.jsp"%>