package com.ff.finger.common;

public interface CommonConstants {
	//아이디 중복확인에서 사용
	public static final int EXIST_ID = 1;  //해당 아이디가 이미 존재
	public static final int AVAILABLE_ID = 2; //사용가능
	
	//로그인 처리에서 사용
	public static final int LOGIN_OK = 1;  //로그인 성공
	public static final int PWD_MISMATCH = 2;  //비밀번호가 일치하지 않는다	
	public static final int ID_NONE = 3;  //해당 아이디가 없다
	
	//공지사항 페이지 처리
	public static final int BLOCK_SIZE=10;
	public static final int RECORD_COUNT_PER_PAGE=10;
}
