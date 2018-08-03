package com.ff.finger.cs.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.servlet.ModelAndView;

import com.ff.finger.common.CommonConstants;
import com.ff.finger.common.FileUploadUtil;
import com.ff.finger.common.PaginationInfo;
import com.ff.finger.common.SearchVO;
import com.ff.finger.cs.notice.model.NoticeService;
import com.ff.finger.cs.notice.model.NoticeVO;

@Controller
@RequestMapping("/cs/notice")
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired private NoticeService noticeService;
	@Autowired private FileUploadUtil fileUploadUtil;
	
	@RequestMapping("/noticeList.do")
	public String noticeList(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("공지사항 목록 파라미터, searchVo={}", searchVo);
		
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(CommonConstants.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(CommonConstants.RECORD_COUNT_PER_PAGE);
		
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(CommonConstants.RECORD_COUNT_PER_PAGE);
		
		List<NoticeVO> list=noticeService.selectAllNotice(searchVo);
		logger.info("공지사항 목록 조회 결과, list.size={}",list.size());
	
		int totalRecord=noticeService.totalRecord(searchVo);
		logger.info("공지사항 totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
	
		return "cs/notice/noticeList";
	}
	
	@RequestMapping(value="/noticeWrite.do", method=RequestMethod.GET)
	public String noticeWrite() {
		logger.info("공지사항 글쓰기 화면");
		
		return "cs/notice/noticeWrite";
	}
	
	@RequestMapping(value="/noticeWrite.do", method=RequestMethod.POST)
	public String noticeWrite_post(@ModelAttribute NoticeVO noticeVo, HttpServletRequest request, 
			MultipartHttpServletRequest fRequest, HttpSession session, Model model ) {
		logger.info("공지사항 글쓰기 처리, noticeVo={}", noticeVo);
		
		/*String adminId=(String) session.getAttribute("adminId");
		logger.info("세션 조회 adminId={}", adminId);*/
		
		int adminNo=noticeService.getAdminNo("admin3");
		noticeVo.setAdminNo(adminNo);
		logger.info("관리자 번호 조회 결과, noticeVo={}", noticeVo);
		
		List<MultipartFile> list=fRequest.getFiles("upfile");
		logger.info("공지사항 파일업로드 list.size={}", list.size());
		
		String originalFileName="", fileName="";
		
		MultipartFile[] mf=new MultipartFile[list.size()];

		for(int i=0; i<list.size();i++) {
			mf[i]=list.get(i);
			
			String getOriginalFileName=mf[i].getOriginalFilename();
			String getFileName=fileUploadUtil.getUniqueFileName(getOriginalFileName);
			logger.info("공지사항 파일, getOriginalFileName={}, getFileName={}", getOriginalFileName, getFileName);
			
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
		
		noticeVo.setOriginalFileName(originalFileName);
		noticeVo.setFileName(fileName);
		logger.info("공지사항 파일 업로드, noticeVo={}", noticeVo);
		
		int cnt=noticeService.noticeInsert(noticeVo);
		logger.info("글쓰기 처리 후, cnt={}", cnt);
		
		if(cnt>0) {
			model.addAttribute("msg", "공지사항 등록이 완료되었습니다.");
		}else {
			model.addAttribute("msg", "공지사항 등록이 실패하였습니다.");
		}
		model.addAttribute("url", "/cs/notice/noticeList.do");
		
		return "common/message";
	}
	
	@RequestMapping("/countUpdate.do")
	public String countUpdate(@RequestParam int noticeNo, Model model) {
		logger.info("공지사항 조회수 증가, 파라미터 noticeNo={}", noticeNo);
		
		if(noticeNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/cs/notice/noticeList.do");
			
			return "common/message";
		}
		
		int cnt=noticeService.countUpdateNotice(noticeNo);
		logger.info("조회수 증가 후 cnt={}", cnt);
		
		return "redirect:/cs/notice/noticeDetail.do?noticeNo="+noticeNo;
	}
	
	@RequestMapping("/noticeDetail.do")
	public String noticeDetail(@RequestParam(defaultValue="0") int noticeNo, HttpServletRequest request, Model model) {
		logger.info("공지사항 상세보기 화면, 파라미터 noticeNo={}", noticeNo);
		
		if(noticeNo==0) {
			model.addAttribute("msg", "잘못된 url 입니다.");
			model.addAttribute("url", "/cs/notice/noticeList.do");
			
			return "common/message";
		}
		
		List<NoticeVO> list=noticeService.noticeDetail(noticeNo);
		logger.info("공지사항 상세보기 조회 결과, list.size={}", list.size());
		
		String fileName="", listFileN="", imgFileN="";
		ArrayList<String> list2=new ArrayList<>();
		ArrayList<String> list3=new ArrayList<>();
		
		fileName=list.get(0).getFileName();
		if(list.size()>1&&list.get(1).getNoticeNo()==noticeNo) {
			fileName=list.get(1).getFileName();
		}
		logger.info("공지사항 fileName={}", fileName);
		
		if(fileName!=null && !fileName.isEmpty()) {
			String[] fileN=fileName.split(", ");
			for(int i=0;i<fileN.length;i++) {
				String subFileN=fileN[i].substring(fileN[i].lastIndexOf(".")+1).toLowerCase();
				logger.info("공지사항 subFileN={}", subFileN);
				if(subFileN.equals("jpg")||subFileN.equals("png")||subFileN.equals("gif")){
	/*				uploadPath=fileUploadUtil.getUploadPath(request, CommonConstants.PATH_FLAG_PDS)+"\\"+fileN[i];
	*/				imgFileN=fileN[i];
					list2.add(imgFileN);
					logger.info("imgFileN={}", imgFileN);
				}else {
					listFileN=fileN[i];
					list3.add(listFileN);
					logger.info("listFileN={}", listFileN);
				}
			}
			
			logger.info("이미지, 파일 구분 후 list2.size={}, list3.size={}", list2.size(), list3.size());
			model.addAttribute("list2", list2);
			model.addAttribute("list3", list3);
		}
		model.addAttribute("list", list);

		return "cs/notice/noticeDetail";
	}
	
	@RequestMapping("/download.do")
	public ModelAndView download(@RequestParam String fileName, HttpServletRequest request) {
		logger.info("파일 다운로드, 파라미터, fileName={}", fileName);
		
		File file=new File(fileUploadUtil.getUploadPath(request,CommonConstants.PATH_FLAG_PDS),fileName);
		Map<String, Object> map = new HashMap<>();
		map.put("file", file);
		
		ModelAndView mav=new ModelAndView("downloadView", map);
		
		return mav;
	}
}
