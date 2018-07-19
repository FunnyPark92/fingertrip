<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

  
      <article class="container">
        <div class="page-header">
          <h1>회원가입</h1>
        </div>
        <div class="col-md-6 col-md-offset-3">
          <form role="form">
            <div class="form-group">
              <label for="username">이름</label>
              <input type="text" class="form-control" id="username" placeholder="이름을 입력해 주세요">
            </div>
            <div class="form-group">
              <label for="userid">회원ID</label>
              <input type="email" class="form-control" id="userid" placeholder="회원ID">
            </div>
            <div class="form-group">
             <label for="userhp">이메일 입력</label>
              <div class="input-group" style="width:525px">
                <input type="tel" class="form-control"  id="hp2">&nbsp;@&nbsp;
                <label for="hp1"></label>
                <select name="hp1" id="hp1" title="이메일앞자리" class="form-control">
           			<option value="naver.com">naver.com</option>
            		<option value="hanmail.net">hanmail.net</option>
            		<option value="gmail.com">gmail.com</option>
            		<option value="nate.com">nate.com</option>
            		<option value="etc">etc</option>
         		 </select>
              </div>
            </div>
            <div class="form-group">
              <label for="InputPassword1">비밀번호</label>
              <input type="password" class="form-control" id="InputPassword1" placeholder="비밀번호">
            </div>
            <div class="form-group">
              <label for="InputPassword2">비밀번호 확인</label>
              <input type="password" class="form-control" id="InputPassword2" placeholder="비밀번호 확인">
            </div>
            <div class="form-group">
              <label for="userhp">휴대폰 번호 입력</label>
              <div class="input-group" style="width:525px">
                <label for="hp1"></label>
                <select name="hp1" id="hp1" title="휴대폰 앞자리" class="form-control">
           			<option value="010">010</option>
            		<option value="011">011</option>
            		<option value="016">016</option>
            		<option value="017">017</option>
            		<option value="018">018</option>
            		<option value="019">019</option>
         		 </select>
         		&nbsp;-&nbsp;
                <input type="tel" class="form-control"  id="hp2">
                &nbsp;-&nbsp;
                <input type="tel" class="form-control"  id="hp3">
              </div>
            </div>
            <div class="form-group">
                <label>약관 동의</label>
              <div data-toggle="buttons">
              <label class="btn btn-primary active">
                  <span class="fa fa-check"></span>
                  <input id="agree" type="checkbox" autocomplete="off" checked>
              </label>
              <a href="#">이용약관</a>에 동의합니다.
              </div>
            </div>
            <div class="form-group text-center">
              <button type="submit" class="btn btn-info">회원가입<i class="fa fa-check spaceLeft"></i></button>
              <button type="submit" class="btn btn-warning">가입취소<i class="fa fa-times spaceLeft"></i></button>
            </div>
          </form>
        </div>

       </article>
<%@ include file="../inc/bottom.jsp"%>
  
