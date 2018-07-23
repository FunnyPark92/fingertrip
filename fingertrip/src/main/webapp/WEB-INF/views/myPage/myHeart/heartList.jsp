<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../../inc/top.jsp" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$('#btn1').click(function(){
				location.href="<c:url value='/myPage/myHeart/heartCharge.do'/>";
			});
		}); 
		
		
	</script>
<div class="container margin80">
	<div class="row">
				
		<!-- 서브메뉴 -->
        <div class="col-lg-3">
            <h3>마이페이지</h3>
            <div class="list-group">
                <a href="#" class="list-group-item">회원 정보 수정</a>
                <a href="#" class="list-group-item">회원 탈퇴</a>
                <a href="#" class="list-group-item">내가 쓴 글</a>
                <a href="#" class="list-group-item active">내가 찜한 코스</a>
                <a href="#" class="list-group-item">쿠폰</a>
                <a href="#" class="list-group-item">결제확인</a>
                <a href="#" class="list-group-item">하트</a>
            </div>
        </div>
        
        <!-- 서브메뉴 -->
        <div class="col-lg-9">
			<div class="container">
			<h2>하트 내역</h2><br>
			<table class="box2">
				<caption>하트 내역</caption>
				<colgroup>
					<col style="width:9%" />
					<col style="width:12%" />
					<col style="width:40%" />
					<col style="width:12%" />
					<col style="width:12%" />	
					<col style="width:14%" />
				</colgroup>
				<thead>
				  <tr>
				    <th scope="col">하트번호</th>
					<th scope="col">구매일</th>
					<th scope="col">사용일</th>
					<th scope="col">개수</th>
					<th scope="col">충전/사용 상태</th>
					<th scope="col">???</th>
				  </tr>
				</thead> 
				<tbody>
					<c:if test="${empty list }">
						<tr>
							<td colspan="6">해당 기간의 하트 충전/사용 내역이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty list }">
						<!-- 반복 시작 -->
						
						<!-- 반복 끝 -->
					</c:if>
				</tbody>
			</table>
			</div>
					<button type="button" class="btn btn-warning text-center" id="btn1">하트 충전하기</button> 
					
			</div>
</div>
</div>


<%@ include file="../../inc/bottom.jsp" %>
