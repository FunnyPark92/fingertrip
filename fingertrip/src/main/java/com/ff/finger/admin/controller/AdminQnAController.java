package com.ff.finger.admin.controller;

import java.io.File;
import java.io.IOException;
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
import com.ff.finger.cs.QnA.model.QnAService;
import com.ff.finger.cs.QnA.model.QnAVO;
import com.ff.finger.cs.notice.model.NoticeService;

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
	
	//목록보기는 QnAContoller를 통해 보여줌
	
	@RequestMapping(value="/qnAReplyWrite.do", method=RequestMethod.GET)
	public String anAReplyWrite(@RequestParam(defaultValue="0") int qnaNo, Model model) {
		logger.info("QnA답변쓰기 화면 보여주기 파라미터 qnaNo={}", qnaNo);
		
		QnAVO vo=qnAService.selectByNoOne(qnaNo);
		logger.info("QnA답변하기-조회결과, vo={}", vo);
		
		model.addAttribute("vo", vo);
		
		return "admin/cs/qna/qnaReplyWrite";
	}
	
	@RequestMapping(value="/qnAReplyWrite.do", method=RequestMethod.POST)
	public String anAReplyWrite_post(@ModelAttribute QnAVO qnAVo, @RequestParam String hidFile, HttpServletRequest request, MultipartHttpServletRequest fRequest, HttpSession session, Model model) {
		logger.info("QnA 답변하기 처리, qnAVo={}, hidFile={}", qnAVo, hidFile);
		
		String adminId=(String)session.getAttribute("adminid");
		logger.info("세션조회 adminId={}", adminId);
		
		int adminNo= noticeService.getAdminNo(adminId);
		qnAVo.setAdminNo(adminNo);
		logger.info("관리자 번호 조회 결과, qnAVo={}", qnAVo);
		
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
		      
		      int cnt=noticeService.noticeInsert(noticeVo);
		      logger.info("글쓰기 처리 후, cnt={}", cnt);
		      
		      if(cnt>0) {
		         model.addAttribute("msg", "공지사항 등록이 완료되었습니다.");
		      }else {
		         model.addAttribute("msg", "공지사항 등록이 실패하였습니다.");
		      }
		      model.addAttribute("url", "/admin/cs/notice/noticeList.do");
		      
		      return "common/message";

			
	
		
	}
	
}

