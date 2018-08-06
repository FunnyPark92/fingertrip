package com.ff.finger.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ff.finger.common.CommonConstants;
import com.ff.finger.common.PaginationInfo;
import com.ff.finger.common.SearchVO;
import com.ff.finger.member.model.MemberService;
import com.ff.finger.member.model.MemberVO;

@Controller
@RequestMapping("/admin")
public class AdminMemberController {
	private static final Logger logger = LoggerFactory.getLogger(AdminMemberController.class); 
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/member/memberList.do")
	public String memberList(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("admin 개인회원 목록 파라미터 SearchVO={}", searchVo);
		
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(CommonConstants.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(CommonConstants.RECORD_COUNT_PER_PAGE);
		
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(CommonConstants.RECORD_COUNT_PER_PAGE);
		
		List<MemberVO> list=memberService.selectAll(searchVo);
		logger.info("개인 회원 목록 조회 결과, list.size={}",list.size());
		
		int memberTotalRecord=memberService.memberTotalRecord();
		logger.info("member totalRecord={}", memberTotalRecord);
		pagingInfo.setTotalRecord(memberTotalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "admin/member/memberList";
	}
	
	@RequestMapping("/member/memberDetail.do")
	public String memberDetail(@RequestParam(defaultValue="0") String id, HttpServletRequest request, Model model) {
		logger.info("member 상세보기 파라미터 member={}", id);
		
		if(id.equals("0")) {
			model.addAttribute("msg","잘못됫 url입니다.");
			model.addAttribute("url","/cs/QnA/qna.do");
			return "common/message"; 
		}
		
		MemberVO vo=memberService.logingMember(id);	
		logger.info("member 상세보기 결과 memberVO={}", vo);
		
		//탈퇴 사유를 보여주기 위한 메서드
		int memberNo=vo.getMemberNo();
		List<Map<String, Object>> list=memberService.outLeason(memberNo);
		
		logger.info("탈퇴사유 검색결과 list.size={}",list.size());
		
		model.addAttribute("list",list);
		model.addAttribute("vo", vo);
		
		return "admin/member/memberDetail";
	}
	
	@RequestMapping("/member/deleteMemberList.do")
	public String deleteMemberList(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("admin 탈퇴한 개인회원 목록 파라미터 SearchVO={}", searchVo);
		
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(CommonConstants.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(CommonConstants.RECORD_COUNT_PER_PAGE);
		
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(CommonConstants.RECORD_COUNT_PER_PAGE);
		
		List<MemberVO> list=memberService.deleteSelectAll(searchVo);
		logger.info("탈회한 개인 회원 목록 조회 결과, list.size={}",list.size());
		
		int deletemMemberTotalRecord=memberService.deleteMemberTotalRecord();
		logger.info("member totalRecord={}",  deletemMemberTotalRecord);
		pagingInfo.setTotalRecord(deletemMemberTotalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "admin/member/deleteMemberList";
	}
	
	@RequestMapping("/member/memberdelete.do")
	public String memberDelete(@RequestParam(defaultValue="0") int memberNo, Model model) {
		logger.info("탈퇴시킬 맴버 정보조회 memberNo={}", memberNo);
		
		if(memberNo==0) {
			model.addAttribute("msg","잘못됫 url입니다.");
			model.addAttribute("url","/admin/member/memberList.do");
			return "common/message"; 
		}
		
		int cnt=memberService.adminDeleteMember(memberNo);
		logger.info("회원탈퇴 처리 cnt={}", cnt);
		
		return "redirect:/admin/member/memberList.do";
	}
	/*미완료
	@RequestMapping("member/deleteMulti.do")
	public String deleteMulti(@RequestParam String[] chk, Model model) {
		logger.info("여러 글 삭제");
		
		if(chk!=null) {
			int i=0;
			for(String no: chk) {
				logger.info("{} : 파라미터=>{}",i++,no);
			}
		}//if
	}
	*/
}
