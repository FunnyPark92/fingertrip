<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBYa_utcbQs1RLoVuJguMaQzuX4yxvQyrs&libraries=places"></script>

<script>
    $(function(){
        $('.reply').click(function(){
            $(this).closest('.threaded-comments').children('.recomments-wrap').toggle();
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
               <img src="img/spot1.jpg" alt="썸네일">
           </div>
           
           <!-- 하트받읗때 -->
           <div class="col-md-6 naThumHeart marginBottom50">
              <div>
                  	하트받는중
              </div>
              <h3>
                  	낭만이 있는 4일간의 유럽 여행
              </h3>
              <h5>
                  2018.09.11 ~ 2018.09.16
              </h5>
              <div>
                  	파리의 명소를 딥하게 여행해보는 일정
              </div>
              <div>
                  <small>등록일</small> 2018.08.07
              </div>
               <input type="button" class="heartBtn btn btn-block btn-danger" value="하트 누르기">
           </div>
           
           <!-- 결제할 때 -->
		<div class="col-md-6 marginBottom50">
			<div>결제진행중</div>
			<h3 class="marginBottom20">낭만이 있는 4일간의 유럽 여행</h3>
			<div class="thumPay">
				<span class="leftSpan">여행 날짜</span> <select>
					<option value="선택">날짜 선택</option>
					<option value="0911">18.09.11~18.09.15</option>
					<option value="0912">18.09.12~18.09.16</option>
					<option value="0913">18.09.13~18.09.17</option>
					<option value="0914">18.09.14~18.09.18</option>
				</select>
			</div>
			<div class="thumPay">
				<span class="leftSpan">여행사</span> 핑거트립
			</div>
			<div class="thumPay">
				<span class="leftSpan">여행사 번호</span> 02 - 000 - 0000
			</div>
			<div class="marginTop10">파리의 명소를 딥하게 여행해보는 일정</div>
			<input type="button" class="btn payBtn btn-primary" value="결제하기">
		</div>

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