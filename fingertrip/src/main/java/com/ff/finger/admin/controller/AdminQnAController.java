package com.ff.finger.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ff.finger.admin.model.AdminService;
import com.ff.finger.admin.model.AdminVO;
import com.ff.finger.common.CommonConstants;
import com.ff.finger.common.FileUploadUtil;
import com.ff.finger.cs.QnA.model.QnAListVO;
import com.ff.finger.cs.QnA.model.QnAService;
import com.ff.finger.cs.QnA.model.QnAVO;
import com.ff.finger.cs.notice.model.NoticeService;
import com.ff.finger.cs.notice.model.NoticeVO;
import com.ff.finger.member.model.MemberListVO;

@Controller
@RequestMapping("/admin/cs/QnA")
public class AdminQnAController {
	private static final Logger logger=LoggerFactory.getLogger(AdminQnAController.class);
	
	@Autowired
	private QnAService qnAService;
	@Autowired
	private NoticeService noticeService;
	@Autowired 
	private FileUploadUtil fileUploadUtil; 
	@Autowired
	private AdminService adminService;
	
	//목록보기는 QnAContoller를 통해 보여줌
	
	@RequestMapping(value="/qnAReplyWrite.do", method=RequestMethod.GET)
	public String anAReplyWrite(@RequestParam(defaultValue="0") int qnaNo, HttpSession session, Model model) {
		logger.info("QnA답변쓰기 화면 보여주기 파라미터 qnaNo={}", qnaNo);
		
		QnAVO vo=qnAService.selectByNoOne(qnaNo);
		logger.info("QnA답변하기-조회결과, vo={}", vo);
		
		//관리자로 로그인 했는지 체크
		String adminId=(String)session.getAttribute("adminid");
		logger.info("세션조회 adminId={}", adminId);
		if(adminId==null) {
			model.addAttribute("msg", "관리자로 로그인 후 답글 작성이 가능합니다.");
			model.addAttribute("url", "/index.do");
			
			return "common/message";
		}
			
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
		
		return "admin/cs/qna/qnaReplyWrite";
	}
	
	@RequestMapping(value="/qnAReplyWrite.do", method=RequestMethod.POST)
	public String anAReplyWrite_post(@ModelAttribute QnAVO qnAVo, @RequestParam String hidFile, HttpServletRequest request, MultipartHttpServletRequest fRequest, HttpSession session, Model model) {
		logger.info("QnA 답변하기 처리, qnAVo={}, hidFile={}", qnAVo, hidFile);
		
		String adminId=(String)session.getAttribute("adminid");
		logger.info("세션조회 adminId={}", adminId);
		
		//관리자 번호를 가져오기 위한 메서드 호출
		int adminNo= noticeService.getAdminNo(adminId);
		qnAVo.setAdminNo(adminNo);
		logger.info("관리자 번호 조회 결과, AdminNo={}", qnAVo.getAdminNo());
		AdminVO adminVo=adminService.getAdmin(qnAVo.getAdminNo());
		logger.info("관리자 정보 조회 결과 AdminVO={}", adminVo);
		qnAVo.setName(adminVo.getName());
		logger.info("답글 관리자 이름 세팅결과 qnAVo={}",qnAVo);
		
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
		      
		      int cnt=qnAService.reply(qnAVo);
		      logger.info("QnA답글 달기 처리 후, cnt={}", cnt);
		      
		      if(cnt>0) {
		         model.addAttribute("msg", "답글 등록이 완료되었습니다.");
		      }else {
		         model.addAttribute("msg", "답글 등록이 실패하였습니다.");
		      }
		      model.addAttribute("url", "/cs/QnA/qna.do?aNo=1");
		      
		      return "common/message";
		}
	
	@ResponseBody
	@RequestMapping("/QnAFileSize.do")
	public int QnAFSize( MultipartHttpServletRequest fRequest, HttpServletRequest request) {
		logger.info("QnA 파일 사이즈 확인");
		
		List<MultipartFile> list=fRequest.getFiles("upfile");
		logger.info("QnA 파일사이즈 확인 list.size={}", list.size());
        
		return list.size();
	}
	
	@ResponseBody
	@RequestMapping("/QnAFileKind.do")
	public int QnAFileKind( MultipartHttpServletRequest fRequest, HttpServletRequest request) {
		logger.info("QnA 파일확장자 확인");
		
		List<MultipartFile> list=fRequest.getFiles("upfile");
		logger.info("QnA 종류확장자 확인 list={}", list);
		   //확장자 구분에 사용할 값,첨부 파일중 이미지 파일이 아닌 파일이 하나라도 있으면 flag=1로 Ajax return
		   String originalFileName="", extension="", lowerExtension=""; /*확장자 대소문자 구분을 위한변수*/ int flag=0;
		      MultipartFile[] mf=new MultipartFile[list.size()];
		      
		      for(int i=0; i<list.size();i++) {
		         mf[i]=list.get(i);
		         //각각의 파일 이름 얻어오기
		         String getOriginalFileName=mf[i].getOriginalFilename();
		         if(i!=0) {
		            originalFileName+=",";
		         }
		         originalFileName+=getOriginalFileName;
		         //확장자 추출하기
		         extension=originalFileName.substring(originalFileName.lastIndexOf(".")+1);
		         //확장자가 대문자일 경우를 대비해서 모두 소문자로 바꾸기 
		         lowerExtension=extension.toLowerCase();
		         if(!lowerExtension.equals("jpg")&&!lowerExtension.equals("png")&&!lowerExtension.equals("gif")) {
		            flag=1;
		         }
		      }
		return flag;
	}
	
	@RequestMapping("/adminQnADetail.do")
	public String adminQnADetail(@RequestParam(defaultValue="0") int qnaNo, HttpServletRequest request, Model model) {
		logger.info("QnA 상세보기 파라미터 qnaNo={}", qnaNo);
		
		if(qnaNo==0) {
			model.addAttribute("msg","잘못됫 url입니다.");
			model.addAttribute("url","/cs/QnA/qna.do?aNo=1");
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
	
		return "admin/cs/qna/qnaDetail";
	}
	
	@RequestMapping("/adminQnADelete.do")
	public String adminQnADelete(@ModelAttribute QnAVO qnAVo, HttpServletRequest request, Model model) {
		logger.info("QnA 삭제, 파라미터 QnAVo={}", qnAVo);
		
		String msg="", url="/cs/QnA/qna.do?aNo=1";
		if(qnAVo.getQnaNo()==0) {
			msg="잘못된 url입니다.";
		}else {
			int cnt=qnAService.qnADelete(qnAVo.getQnaNo());
			logger.info("QnA 삭제 cnt={}", cnt);
			
			if(cnt>0) {
				msg="QnA 삭제를 성공하였습니다.";
			}else {
				msg="QnA 삭제를 실패하였습니다.";
			}
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}

	@RequestMapping("/deleteMulti.do")
	public String deleteMulti(@ModelAttribute QnAListVO listVo, Model model) {
		logger.info("QnA 삭제 파라미터, QnAListVO={}", listVo);
		int cnt=qnAService.multiDelete(listVo.getQnAItems());
		
		logger.info("QnA 다중 삭제 결과 cnt={}", cnt);
		
		String msg="", url="/cs/QnA/qna.do?aNo=1";
	      if(cnt>0) {
	         msg="다중 삭제가 완료되었습니다";
	      }else {
	         msg="삭제 실패!";
	      }
	      model.addAttribute("msg",msg);
	      model.addAttribute("url",url);
	      return "common/message";
	}
}

