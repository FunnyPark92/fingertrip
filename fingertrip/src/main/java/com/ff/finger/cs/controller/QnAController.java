package com.ff.finger.cs.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ff.finger.common.CommonConstants;
import com.ff.finger.common.FileUploadUtil;
import com.ff.finger.common.PaginationInfo;
import com.ff.finger.common.SearchVO;
import com.ff.finger.cs.QnA.model.QnAService;
import com.ff.finger.cs.QnA.model.QnAVO;
import com.ff.finger.member.model.MemberService;
import com.ff.finger.member.model.MemberVO;
import com.ff.finger.travelAgency.model.TravelAgencyService;
import com.ff.finger.travelAgency.model.TravelAgencyVO;

@Controller
@RequestMapping("/cs")
public class QnAController {
	private static final Logger logger = LoggerFactory.getLogger(QnAController.class);
	
	@Autowired
	private QnAService qnAService;
	@Autowired
	private MemberService memberService;
	@Autowired 
	private FileUploadUtil fileUploadUtil; 
	@Autowired
	private TravelAgencyService travelAgencyService;
	
	@RequestMapping("/QnA/qna.do")
	public String qna(@ModelAttribute SearchVO searchVo, @RequestParam(defaultValue="0") int aNo,  Model model) {
		
		//일반회원 qna리스트와 admin qna리스트를 이 컨트롤러 하나로 해결
		logger.info("Controller 한개로 페이지 나누기 위한 변수 1=관리자 0=일반회원 aNo={}", aNo);

		logger.info("QnA 목록 파라미터, searchVo={}", searchVo);
		
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(CommonConstants.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(CommonConstants.RECORD_COUNT_PER_PAGE);
		
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(CommonConstants.RECORD_COUNT_PER_PAGE);

		List<QnAVO> list=qnAService.selectAll(searchVo);
		logger.info("QnA목록 조회 결과, list.size={}",list.size());
		
		int QnAtotalRecord=qnAService.QnAtotalRecord(searchVo);
		logger.info("QnA totalRecord={}", QnAtotalRecord);
		pagingInfo.setTotalRecord(QnAtotalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		//admin이 요청할 경우 admin으로, 일반회원이 요청할 경우 일반 회원으로 
		if(aNo==1) {
		return "admin/cs/qna/qnaList";
		}else{
		return "cs/QnA/qna";
		}
	}
	
	@RequestMapping("/QnA/countUpdate.do")
	public String countUpdate(@RequestParam(defaultValue="0") int qnaNo, Model model) {
		logger.info("Q&A 조회수 증가, 파라미터 qnaNo={}", qnaNo);
		
		if(qnaNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/cs/QnA/qna.do");
			
			return "common/message";
		}
		int cnt=qnAService.countUpdate(qnaNo);
		logger.info("조회수 증가 후 cnt={}", cnt);
		
		return "redirect:/cs/QnA/qnaDetail.do?qnaNo="+qnaNo;
	
	}
	
	@RequestMapping("/QnA/qnaDetail.do")
	public String qnaDetail(@RequestParam(defaultValue="0") int qnaNo, HttpServletRequest request, HttpSession session, Model model) {
		logger.info("QnA 상세보기 파라미터 qnaNo={}", qnaNo);
		
		//기업회원일 경우 답글쓰기를 보여주기 위해 기업세션 조회
		String agencyid = (String)session.getAttribute("agencyid");
		logger.info("세션조회 agencyid={}", agencyid);
		
		//자신이 쓴 글은 삭제 버튼을 만들어 주기 위해 회원 세션 조회
		String userid = (String)session.getAttribute("userid");
		logger.info("세션조회 id={}", userid);
		//로그인 회원 정보 조회
		MemberVO memberVo=memberService.logingMember(userid);
		int memberNo=memberVo.getMemberNo();
		logger.info("회원번호 조회 memberNo={}", memberNo);
		
		
		if(qnaNo==0) {
			model.addAttribute("msg","잘못됫 url입니다.");
			model.addAttribute("url","/cs/QnA/qna.do");
			return "common/message"; 
		}
		
		//특정 qnaNo에 GroupNo가져오기
		int groupNo=(int)qnAService.serchGroupNo(qnaNo);
		logger.info("QnA 그룹넘버 가져오기 groupNo={}", groupNo);
	
		//Detail에 뿌려줄 한개의 QnAVO가져오기
		QnAVO vo=qnAService.selectByNoOne(qnaNo);
		logger.info("QnA 상세보기, vo={}", vo);
		
		//윗글 아랫글을 가져오기 위한 공간
		QnAVO voUp=qnAService.selectUp(groupNo);
		logger.info("윗글가져오기 결과 QnAUP={}", voUp);
		QnAVO voDw=qnAService.selectDw(groupNo);
		logger.info("아랫글가져오기 결과 QnADW={}", voDw);
		
		//이미지 처리에 관한 내용
		ArrayList<String> listImg=new ArrayList<>();
		String fileName=vo.getFileName();
		if(fileName!=null && !fileName.isEmpty()) {
			String[] spFileName=fileName.split(", ");
			for(int i=0;i<spFileName.length;i++) {
				listImg.add(spFileName[i]);
			}
		}
		logger.info("이미지 파일 갯수 확인 listImg.size={}", listImg.size());
		
		model.addAttribute("listImg", listImg);
		model.addAttribute("vo",vo);
		model.addAttribute("voUp",voUp);
		model.addAttribute("voDw",voDw);
		model.addAttribute("agency",agencyid);
		model.addAttribute("memberNo",memberNo);
	
		return "cs/QnA/qnaDetail";
	}
		
	@RequestMapping("/QnA/qnaWrite.do")
	public String qnaWrite(Model model,HttpSession session) {
		String id = (String)session.getAttribute("userid");
		logger.info("세션조회 id={}", id);
		
		if(id==null) {
			model.addAttribute("msg", "로그인 후 QnA 작성이 가능합니다.");
			model.addAttribute("url", "/member/login/login.do");
			
			return "common/message";
		}
		logger.info("Q&A글쓰기 화면 보기");	
		return "cs/QnA/qnaWrite";
	}
	
	@RequestMapping(value="/QnA/passck.do", method=RequestMethod.POST)
	public String passck(@RequestParam(defaultValue="0") String pwd, @RequestParam int qnaNo, HttpServletRequest request, Model model) {
		logger.info("QnA 상세보기 비밀번호 확인 파라미터 pwd={}", pwd);
		logger.info("QnA 상세보기 비밀번호 확인 파라미터 qnaNo={}", qnaNo);
	
		String dbpwd=qnAService.passck(qnaNo);
		logger.info("QnA 상세보기 비밀번호 확인 파라미터 dbpwd={}",dbpwd);
		
		if(pwd.equals(dbpwd)) {
			return "redirect:/cs/QnA/countUpdate.do?qnaNo="+qnaNo;
		}else {
			model.addAttribute("msg","비밀번호가 일치하지 않습니다..");
			model.addAttribute("url","/cs/QnA/qna.do");
			return "common/message"; 
		}
	}
	
	@RequestMapping(value="/QnA/reply.do", method=RequestMethod.GET)
	public String reply(@RequestParam(defaultValue="0") int qnaNo, HttpSession session, Model model) {
		logger.info("QnA기업답변하기 화면보여주기, 파라미터 qnaNo={}", qnaNo);
		
		if(qnaNo==0) {
			model.addAttribute("msg","잘못됫 url입니다.");
			model.addAttribute("url","/cs/QnA/qna.do");
			return "common/message"; 
		}
		//기업으로 로그인 했는지 체크
		String agencyid = (String)session.getAttribute("agencyid");
		logger.info("세션조회 agencyid={}", agencyid);
		if(agencyid==null) {
			model.addAttribute("msg", "기업회원만 QnA답변 작성이 가능합니다.");
			model.addAttribute("url", "/member/login/login.do");
			
			return "common/message";
		}
		
		QnAVO vo=qnAService.selectByNoOne(qnaNo);
		logger.info("QnA기업답변하기-조회결과, vo={}", vo);
		
		//이미지 처리에 관한 내용
		ArrayList<String> listImg=new ArrayList<>();
		String fileName=vo.getFileName();
		if(fileName!=null && !fileName.isEmpty()) {
			String[] spFileName=fileName.split(", ");
			for(int i=0;i<spFileName.length;i++) {
				listImg.add(spFileName[i]);
			}
		}
		logger.info("이미지 파일 갯수 확인 listImg.size={}", listImg.size());
		
		model.addAttribute("listImg", listImg);
		model.addAttribute("vo", vo);
		
		return "cs/QnA/reply";
	}
	
	@RequestMapping(value="/QnA/reply.do", method=RequestMethod.POST)
	public String reply_post(@ModelAttribute QnAVO qnAVo, @RequestParam String hidFile, HttpServletRequest request, MultipartHttpServletRequest fRequest, HttpSession session, Model model) {
		logger.info("QnA 기업답변하기 처리, qnAVo={}, hidFile={}", qnAVo, hidFile);
		
		String agencyid = (String)session.getAttribute("agencyid");
		logger.info("기업세션조회  agencyid={}", agencyid);
		
		//여행사 이름을 가져오기 위한 메서드 호출
		String agencyName=travelAgencyService.getAgencyName(agencyid);
		logger.info("여행사 이름 조회 결과, agencyName={}", agencyName);
		
		//여행사 이름 세팅하기
		qnAVo.setName(agencyName);
		logger.info("답글 여행사 이름 세팅결과 qnAVo={}",qnAVo);
		
		//여생사 정보 불러오와서 travelAgencyNo 세팅하기 
		TravelAgencyVO travelAgencyVo=travelAgencyService.selectOneAgency(agencyName);
		int travelAgencyNo= travelAgencyVo.getTravelAgencyNo();
		qnAVo.setTravelAgencyNo(travelAgencyNo);
		logger.info("답글 여행사 번호 세팅결과 qnAVo={}",qnAVo);
		
		//파일업로드
		if(!hidFile.equals("N")) {
			List<MultipartFile> list=fRequest.getFiles("upfile");
		    logger.info("QnA 파일업로드 list.size={}", list.size());
		         
		    String originalFileName="", fileName="";
		         
		    MultipartFile[] mf=new MultipartFile[list.size()];
		   
		    for(int i=0; i<list.size();i++) {
		    	mf[i]=list.get(i);
		            
		        String getOriginalFileName=mf[i].getOriginalFilename();
		        String getFileName=fileUploadUtil.getUniqueFileName(getOriginalFileName);
		        logger.info("QnA 기업 답변 파일, getOriginalFileName={}, getFileName={}", getOriginalFileName, getFileName);
		            
		        if(i!=0) {
		        	originalFileName+=", ";
		            fileName+=", ";
		        }
		        originalFileName+=getOriginalFileName;
		        fileName+=getFileName;
		            
		        File file=new File(fileUploadUtil.getUploadPath(request, CommonConstants.PATH_FLAG_PDS), getFileName); 
		        try {
		        	mf[i].transferTo(file);
		        } catch (IllegalStateException e) {
		            e.printStackTrace();
		        } catch (IOException e) {
		            e.printStackTrace();
		          }
		        }
		         qnAVo.setOriginalFileName(originalFileName);
		         qnAVo.setFileName(fileName);
		         logger.info("QnA 기업 답변 파일 업로드, qnaVo={}", qnAVo);
		      }
		      
		      int cnt=qnAService.agencyReply(qnAVo);
		      logger.info("QnA답글 달기 처리 후, cnt={}", cnt);
		      
		      if(cnt>0) {
		         model.addAttribute("msg", "답글 등록이 완료되었습니다.");
		      }else {
		         model.addAttribute("msg", "답글 등록이 실패하였습니다.");
		      }
		      model.addAttribute("url", "/cs/QnA/qna.do");
		      
		      return "common/message";
		}
	
	@RequestMapping(value="/QnA/qnaWrite.do", method=RequestMethod.POST)
	public String anAReplyWrite_post(@ModelAttribute QnAVO qnAVo, @RequestParam String hidFile, HttpServletRequest request, MultipartHttpServletRequest fRequest, HttpSession session, Model model) {
		logger.info("QnA 쓰기 처리, qnAVo={}, hidFile={}", qnAVo, hidFile);
		
		String id = (String)session.getAttribute("userid");
		logger.info("세션조회 id={}", id);
		
		//회원 정보 가져오기 위한 메서드 호출
		MemberVO memberVo=memberService.logingMember(id); 
		logger.info("회원 정보 조회 결과 MemberVO={}", memberVo);
		
		//qna에 맴버 정보 셋팅하기
		qnAVo.setName(memberVo.getName());
		qnAVo.setMemberNo(memberVo.getMemberNo());
		logger.info("QnA 맴버정보 세팅결과 qnAVo={}",qnAVo);
		
		if(!hidFile.equals("N")) {
			List<MultipartFile> list=fRequest.getFiles("upfile");
		    logger.info("QnA 파일업로드 list.size={}", list.size());
		         
		    String originalFileName="", fileName="";
		         
		    MultipartFile[] mf=new MultipartFile[list.size()];
		   
		    for(int i=0; i<list.size();i++) {
		    	mf[i]=list.get(i);
		            
		        String getOriginalFileName=mf[i].getOriginalFilename();
		        String getFileName=fileUploadUtil.getUniqueFileName(getOriginalFileName);
		        logger.info("QnA 파일, getOriginalFileName={}, getFileName={}", getOriginalFileName, getFileName);
		            
		        if(i!=0) {
		        	originalFileName+=", ";
		            fileName+=", ";
		        }
		        originalFileName+=getOriginalFileName;
		        fileName+=getFileName;
		            
		        File file=new File(fileUploadUtil.getUploadPath(request, CommonConstants.PATH_FLAG_PDS), getFileName); 
		        try {
		        	mf[i].transferTo(file);
		        } catch (IllegalStateException e) {
		            e.printStackTrace();
		        } catch (IOException e) {
		            e.printStackTrace();
		          }
		        }
		         qnAVo.setOriginalFileName(originalFileName);
		         qnAVo.setFileName(fileName);
		         logger.info("QnA 파일 업로드, qnaVo={}", qnAVo);
		      }
		
		int cnt=qnAService.qnaWrite(qnAVo);
		logger.info("QnA쓰기 처리 후, cnt={}", cnt);
		
		   if(cnt>0) {
		         model.addAttribute("msg", "QnA 등록이 완료되었습니다.");
		      }else {
		         model.addAttribute("msg", "QnA 등록이 실패하였습니다.");
		      }
		      model.addAttribute("url", "/cs/QnA/qna.do");
		      
		      return "common/message";
	}	
}
