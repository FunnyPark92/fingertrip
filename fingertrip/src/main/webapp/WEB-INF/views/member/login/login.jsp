<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../../inc/top.jsp"%>
    
    <div class="minHeight580">
        <div class="container login">
            <div class="row">
                <div class="col-sm-1"></div>
                <div class="col-sm-5">
                    <div class="form-box">
                        <div class="form-top">
                            <div class="form-top-left">
                                <h3>개인회원</h3>
                            </div>
                            <div class="form-top-right">
                                <i class="fa fa-key"></i>
                            </div>
                        </div>
                        <div class="form-bottom">
                            <form role="form" action="" method="post" class="login-form">
                                <div class="form-group">
                                    <label class="sr-only" for="id">UserId</label>
                                    <input type="text" name="id" placeholder="UserId..." class="form-username form-control" id="id"
                                    	value="${cookie.ck_userid.value }"
                                    >
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="password">Password</label>
                                    <input type="password" name="password" placeholder="Password..." class="form-password form-control" id="password">
                                </div>
                                <button type="submit" class="btn">login!</button>
	                            <div>
	                               <input type="checkbox" name="saveId1" id="saveId1"
	                               		<c:if test="${!empty cookie.ck_userid }">
	                               			checked=checked
	                               		</c:if>
	                               >
	                               <label for="saveId1">아이디 저장</label>
	                                <p class="fRight">
	                                    <a href="<c:url value='/member/login/findId.do'/>">아이디 찾기</a>ㅣ
	                                    <a href="<c:url value='/member/login/findPw.do'/>">비밀번호 찾기</a>
	                                </p>
	                            </div>
                            </form>
                        </div>
                    </div>
                </div>

                <!--<div class="col-sm-1 middle-border"></div>
                        <div class="col-sm-1"></div>-->

                <div class="col-sm-5">
                    <div class="form-box">
                        <div class="form-top">
                            <div class="form-top-left">
                                <h3>기업회원</h3>
                            </div>
                            <div class="form-top-right">
                                <i class="fa fa-key"></i>
                            </div>
                        </div>
                        <div class="form-bottom">
                            <form role="form" action="" method="post" class="login-form">
                                <div class="form-group">
                                    <label class="sr-only" for="form-username">Agencyid</label>
                                    <input type="text" name="form-username" placeholder="AgencyId..." class="form-username form-control" id="form-username">
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="form-password">Password</label>
                                    <input type="password" name="form-password" placeholder="Password..." class="form-password form-control" id="form-password">
                                </div>
                                <button type="submit" class="btn">login!</button>
                            </form>
                            <div>
                                <input type="checkbox" id="saveId2">
                                <label for="saveId2">아이디 저장</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-1"></div>
            </div>
        </div>
    </div>

<%@ include file="../../inc/bottom.jsp"%>



