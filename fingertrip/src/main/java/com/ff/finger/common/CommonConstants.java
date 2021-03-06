package com.ff.finger.common;

public interface CommonConstants {
	//아이디 중복확인에서 사용
	public static final int EXIST_ID = 1;  //해당 아이디가 이미 존재
	public static final int AVAILABLE_ID = 2; //사용가능
	
	//로그인 처리에서 사용
	public static final int LOGIN_OK = 1;  //로그인 성공
	public static final int PWD_MISMATCH = 2;  //비밀번호가 일치하지 않는다.	
	public static final int ID_NONE = 3;  //해당 아이디가 없다.
	public static final int EMAIL_AUTHENTICATION=4; // 이메일 인증을 하지 않았다.
	public static final int LOGIN_OK_LONG_TERM_NOT_LOGIN = 5; //장기 미접속자(6개월 이상)
	//기업 입찰에서 사용
	public static final int TRAVEL_BIDDING = 2; //이미 입찰을 하였다.
	//공지사항 페이지 처리
	//공지사항, 하트내역 페이징 처리
	public static final int BLOCK_SIZE=5; //테스트를 위해 5로 변경..
	public static final int RECORD_COUNT_PER_PAGE=10;
	
	//나코짜 페이지 처리
	public static final int NA_BLOCK_SIZE=5;
	public static final int NA_RECORD_COUNT_PER_PAGE=12;

	//내가 찜한 코스 페이지 처리
	public static final int MY_NA_RECORD_COUNT_PER_PAGE=9;
	
	//관리자 - 기업 조회
	public static final int AGENCY_PER_PAGE=5;
	
	//파일 업로드에 사용
	public static final int PATH_FLAG_PDS = 1; //일반자료실
	public static final int PATH_FLAG_IMAGE = 2; //코스등록 시-이미지 업로드	
}
