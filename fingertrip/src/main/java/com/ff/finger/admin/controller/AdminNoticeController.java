package com.ff.finger.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ff.finger.admin.model.AdminService;
import com.ff.finger.admin.model.AdminVO;
import com.ff.finger.common.CommonConstants;
import com.ff.finger.common.FileUploadUtil;
import com.ff.finger.common.PaginationInfo;
import com.ff.finger.common.SearchVO;
import com.ff.finger.cs.notice.model.NoticeService;
import com.ff.finger.cs.notice.model.NoticeVO;

@Controller
@RequestMapping("/admin/cs/notice")
public class AdminNoticeController {
	private static final Logger logger=LoggerFactory.getLogger(AdminNoticeController.class);
	
	@Autowired private NoticeService noticeService;
	@Autowired private FileUploadUtil fileUploadUtil; 
	@Autowired private AdminService adminService;
	
	@RequestMapping("/noticeList.do")
	public String noticeList(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("관리자 공지사항 목록, searchVo={}", searchVo);
		
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(CommonConstants.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(CommonConstants.RECORD_COUNT_PER_PAGE);
		
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(CommonConstants.RECORD_COUNT_PER_PAGE);
		
		List<Map<String, Object>> list=noticeService.selectAllNotice(searchVo);
		logger.info("공지사항 목록 조회 결과, list.size={}",list.size());
	
		int totalRecord=noticeService.totalRecord(searchVo);
		logger.info("공지사항 totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
	
		return "admin/cs/notice/noticeList";
	}
	
	@RequestMapping(value="/noticeWrite.do", method=RequestMethod.GET)
	public String noticeWrite() {
		logger.info("공지사항 글쓰기 화면");
		
		return "admin/cs/notice/noticeWrite";
	}
	
	@RequestMapping(value="/noticeWrite.do", method=RequestMethod.POST)
	public String noticeWrite_post(@ModelAttribute NoticeVO noticeVo, @RequestParam String hidFile, 
			HttpServletRequest request, MultipartHttpServletRequest fRequest, HttpSession session, Model model ) {
		logger.info("공지사항 글쓰기 처리, noticeVo={}, hidFile={}", noticeVo, hidFile);
		
		String adminId=(String) session.getAttribute("adminid");
		logger.info("세션 조회 adminId={}", adminId);

		int adminNo=noticeService.getAdminNo(adminId);
		noticeVo.setAdminNo(adminNo);
		logger.info("관리자 번호 조회 결과, noticeVo={}", noticeVo);
		
		if(!hidFile.equals("N")) {
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
	
	@ResponseBody
	@RequestMapping("/noticeFSize.do")
	public int noticeFSize( MultipartHttpServletRequest fRequest) {
		logger.info("파일 사이즈 확인");
		
		List<MultipartFile> list=fRequest.getFiles("upfile");
		logger.info("공지사항 파일업로드 list.size={}", list.size());
		
		return list.size();
	}
	
	@RequestMapping("/noticeDetail.do")
	public String noticeDetail(@RequestParam(defaultValue="0") int noticeNo, HttpServletRequest request, Model model) {
		logger.info("공지사항 상세보기 화면, 파라미터 noticeNo={}", noticeNo);
		
		if(noticeNo==0) {
			model.addAttribute("msg", "잘못된 url 입니다.");
			model.addAttribute("url", "/admin/cs/notice/noticeList.do");
			
			return "common/message";
		}
		
		List<NoticeVO> list=noticeService.noticeDetail(noticeNo);
		logger.info("공지사항 상세보기 조회 결과, list.size={}", list.size());
		
		String fileName="", listFileN="", imgFileN="";
		ArrayList<String> list2=new ArrayList<>();
		ArrayList<String> list3=new ArrayList<>();
		
		AdminVO vo=new AdminVO();
		if(list.size()>1&&list.get(1).getNoticeNo()==noticeNo) {
			fileName=list.get(1).getFileName();
			vo=adminService.getAdmin(list.get(1).getAdminNo());
		}else {
			fileName=list.get(0).getFileName();
			vo=adminService.getAdmin(list.get(0).getAdminNo());
		}
		
		String name=vo.getName();
		
		logger.info("공지사항 fileName={}, name={}", fileName, name);
		
		if(fileName!=null && !fileName.isEmpty()) {
			String[] fileN=fileName.split(", ");
			for(int i=0;i<fileN.length;i++) {
				String subFileN=fileN[i].substring(fileN[i].lastIndexOf(".")+1).toLowerCase();
				logger.info("공지사항 subFileN={}", subFileN);
				if(subFileN.equals("jpg")||subFileN.equals("jpeg")||subFileN.equals("png")||subFileN.equals("gif")){
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
		model.addAttribute("name", name);

		return "admin/cs/notice/noticeDetail";
	}
	
	@RequestMapping(value="/noticeEdit.do", method=RequestMethod.GET)
	public String noticeEdit(@RequestParam int noticeNo, Model model) {
		logger.info("공지사항 수정 화면, 파라미터 noticeNo={}", noticeNo);

		if(noticeNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/cs/notice/noticeList.do");
			
			return "common/message";
		}
		
		NoticeVO vo=noticeService.noticeSelectByNo(noticeNo);
		
		model.addAttribute("vo", vo);
		return "admin/cs/notice/noticeEdit";
	
	}
	
	@RequestMapping(value="/noticeEdit.do", method=RequestMethod.POST)
	public String noticeEdit_post(@ModelAttribute NoticeVO noticeVo, @RequestParam String hidFile, 
			@RequestParam String oldFileName, HttpServletRequest request, 
			MultipartHttpServletRequest fRequest, HttpSession session, Model model ) {
		logger.info("공지사항 수정 처리, 파라미터 noticeVo={}", noticeVo);
		logger.info("공지사항 수정 처리, 파라미터  hidFile={}, oldFileName={}", hidFile, oldFileName);
		
		if(!hidFile.equals("N")) {
			List<MultipartFile> list=fRequest.getFiles("upfile");
			logger.info("공지사항 수정 파일 업로드 list.size={}", list.size());
			
			String originalFileName="", fileName="";
			
			MultipartFile[] mf=new MultipartFile[list.size()];
	
			for(int i=0; i<list.size();i++) {
				mf[i]=list.get(i);
				
				String getOriginalFileName=mf[i].getOriginalFilename();
				String getFileName=fileUploadUtil.getUniqueFileName(getOriginalFileName);
				logger.info("공지사항 수정 파일, getOriginalFileName={}, getFileName={}", getOriginalFileName, getFileName);
				
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
			
			String[] fileN=oldFileName.split(", ");
			logger.info("oldFileName, fileN.length={}", oldFileName, fileN.length);
			
			for(int i=0;i<fileN.length;i++) {
				logger.info("공지사항 fileN={}", fileN[i]);
				File oldFile=new File(fileUploadUtil.getUploadPath(request,CommonConstants.PATH_FLAG_PDS), fileN[i]);
				if(oldFile.exists()) {
					boolean bool=oldFile.delete();
					logger.info("기존파일 삭제 여부: {}", bool);
				}
			}
			
			noticeVo.setOriginalFileName(originalFileName);
			noticeVo.setFileName(fileName);
			logger.info("공지사항 수정 파일 업로드, noticeVo={}", noticeVo);
			
		}
		
		int cnt=noticeService.noticeUpdate(noticeVo);
		logger.info("공지사항 수정 처리 후, cnt={}", cnt);
		
		if(cnt>0) {
			model.addAttribute("msg", "공지사항 수정이 완료되었습니다.");
		}else {
			model.addAttribute("msg", "공지사항 수정이 실패하였습니다.");
		}
		model.addAttribute("url", "/admin/cs/notice/noticeList.do");
		
		return "common/message";
	}
	
	@RequestMapping("/noticeDelete.do")
	public String noticeDelete(@ModelAttribute NoticeVO noticeVo, HttpServletRequest request, Model model) {
		logger.info("공지사항 삭제, 파라미터 noticeVo={}", noticeVo);
		
		String msg="", url="/admin/cs/notice/noticeList.do";
		if(noticeVo.getNoticeNo()==0) {
			msg="잘못된 url입니다.";
		}else {
			int cnt=noticeService.noticeDelete(noticeVo.getNoticeNo());
			logger.info("공지사항 삭제 cnt={}", cnt);
			
			if(cnt>0) {
				String[] fileN=noticeVo.getFileName().split(", ");
				logger.info("noticeVo.getFileName(), fileN.length={}", noticeVo.getFileName(), fileN.length);
				
				for(int i=0;i<fileN.length;i++) {
					logger.info("공지사항 fileN={}", fileN[i]);
					File oldFile=new File(fileUploadUtil.getUploadPath(request,CommonConstants.PATH_FLAG_PDS), fileN[i]);
					if(oldFile.exists()) {
						boolean bool=oldFile.delete();
						logger.info("기존파일 삭제 여부: {}", bool);
					}
				}
				msg="공지사항 삭제를 성공하였습니다.";
			}else {
				msg="공지사항 삭제를 실패하였습니다.";
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/deleteMulti.do")
	public String deleteMulti(@RequestParam String chk[], HttpServletRequest request,Model model) {
		for(int i=0;i<chk.length;i++) {
			logger.info("공지사항 다중 삭제, 파라미터 chk={}", chk[i]);

			String fileName=noticeService.selectFileName(chk[i]);
			
			if(fileName!=null && !fileName.isEmpty()) {
				String[] fileN=fileName.split(", ");
				logger.info("fileName, fileN.length={}", fileName, fileN.length);
				
				for(int j=0;j<fileN.length;j++) {
					logger.info("공지사항 fileN={}", fileN[j]);
					File oldFile=new File(fileUploadUtil.getUploadPath(request,CommonConstants.PATH_FLAG_PDS), fileN[j]);
					if(oldFile.exists()) {
						boolean bool=oldFile.delete();
						logger.info("기존파일 삭제 여부: {}", bool);
					}
				}
			}
		}
		
		Map<String, String[]> map=new HashMap<>();
		map.put("nos", chk);
		
		int cnt=noticeService.deleteMulti(map);
		logger.info("다중 삭제, cnt={}", cnt);
		
		String msg="", url="/admin/cs/notice/noticeList.do";
		if(cnt>0) {
			msg="공지사항 삭제를 성공하였습니다.";
		}else {
			msg="공지사항 삭제를 실패하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
