<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/find.css"/>

<div class="container margin80">
	<div class="row">
		
		<!-- 서브메뉴 -->
        <div class="col-lg-3">
            <h3>마이페이지</h3>
            <div class="list-group">
                <a href="#" class="list-group-item">회원 정보 수정</a>
                <a href="#" class="list-group-item active">회원 탈퇴</a>
                <a href="#" class="list-group-item">내가 쓴 글</a>
                <a href="#" class="list-group-item">내가 찜한 코스</a>
                <a href="#" class="list-group-item">쿠폰</a>
                <a href="#" class="list-group-item">결제확인</a>
                <a href="#" class="list-group-item">하트</a>
            </div>
        </div>

            <!-- 서브컨텐츠 -->
            <div class="col-lg-9">
            	<h2>회원 탈퇴</h2>
				<br>
				<div class="memberOut">
					<img src="${pageContext.request.contextPath }/img/padlock.png">
					<div>
						<h5>비밀번호 재확인</h5>
						<p class="colorGray">회원 정보를 안전하게 보호하기 위해 회원 비밀번호를 다시 확인합니다.</p>
					</div>
				</div>
				<form class="frmMemberOut" action="<c:url value='/member/memberOutReason.do'/>" method="post">
					<div class="row">
						<div class="col-md-4 text-right dvFindId">
							<img src="${pageContext.request.contextPath }/img/checked.png">&nbsp;&nbsp;&nbsp;
							<span class="spanSize text-left">아이디</span>
						</div>
						<div class="col-md-4 dvFindId">
							<span class="spanSize">suyun</span>
						</div>
						<div class="col-md-4"></div>
					</div>
					
					<div class="row">
						<div class="col-md-4 text-right dvFindId">
							<label for="password">
								<img src="${pageContext.request.contextPath }/img/checked.png">&nbsp;&nbsp;&nbsp;
								<span class="spanSize">비밀번호</span>
							</label>
						</div>
						<div class="col-md-4">
							<input type="password" id="password" class="form-control dvFindId" placeholder="비밀번호 입력">
						</div>
						<div class="col-md-4"></div>
					</div>
					
					<div class="row">
						<div class="col-md-12 text-center">
							<input type="submit" class="btn btn-primary btn-lg sbmit" value="SUBMIT">
						</div>
					</div>
				</form>
          </div>
	</div>
</div>
<%@ include file="../inc/bottom.jsp"%>