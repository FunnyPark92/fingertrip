package com.ff.finger.nacojja.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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

import com.ff.finger.bid.model.BidService;
import com.ff.finger.bid.model.BidVO;
import com.ff.finger.common.CommonConstants;
import com.ff.finger.common.FileUploadUtil;
import com.ff.finger.common.PaginationInfo;
import com.ff.finger.common.SearchVO;
import com.ff.finger.course.model.CourseService;
import com.ff.finger.course.model.CourseVO;
import com.ff.finger.heart.model.HeartService;
import com.ff.finger.heart.model.HeartVO;
import com.ff.finger.heartlist.model.HeartListService;
import com.ff.finger.heartlist.model.HeartListVO;
import com.ff.finger.member.model.MemberService;
import com.ff.finger.member.model.MemberVO;
import com.ff.finger.travelAgency.model.TravelAgencyService;
import com.ff.finger.travelAgency.model.TravelAgencyVO;
import com.ff.finger.travelspot.model.TravelSpotVO;

@Controller
@RequestMapping("/nacojja")
public class NacojjaController {
	private static final Logger logger = LoggerFactory.getLogger(NacojjaController.class);
	//private List<TravelSpotVO> travelSpotList = new ArrayList<>();
	private List<Map<String, TravelSpotVO>> travelSpotListById = new ArrayList<>();
	private int totalTravelDay;
	
	@Autowired 
	private CourseService courseService;
	
	@Autowired
	private FileUploadUtil fileUploadUtil;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private HeartService heartService;
	
	@Autowired
	private HeartListService heartListService;
	
	@Autowired
	private TravelAgencyService travelAgencyService;
	
	@Autowired
	private BidService bidService;
	
	@RequestMapping("/nacojjaList.do")
	public String nacojjaList(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("나코짜 목록 보여주기, 파라미터 searchVo={}", searchVo);
		
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(CommonConstants.NA_BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		if(searchVo.getRecordCountPerPage()==0) {
			pagingInfo.setRecordCountPerPage(CommonConstants.NA_RECORD_COUNT_PER_PAGE);
			searchVo.setRecordCountPerPage(CommonConstants.NA_RECORD_COUNT_PER_PAGE);
		}else {
			pagingInfo.setRecordCountPerPage(searchVo.getRecordCountPerPage());
		}
		
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<Map<String,Object>> list=courseService.nacojjaList(searchVo);
		logger.info("나코짜 목록 조회 결과, list.size={}, searchVo={}", list.size(), searchVo);
		
		int totalRecord=courseService.getTotalRecord(searchVo);
		logger.info("나코짜 목록 totalRecord={}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "nacojja/nacojjaList";
	}
	
	@RequestMapping(value = "/nacojja1.do", method = RequestMethod.GET)
	public String nacojja1Write_get(Model model) {
		logger.info("나코짜1 작성화면 보여주기");
		
		//출발 가능일 계산
		Calendar cal = Calendar.getInstance();
		Date today = new Date();
		cal.setTime(today);
		cal.add(Calendar.DATE, 30); //출발 가능일 - 30일 뒤부터
		
		model.addAttribute("availableStartDay", cal.getTime());
		
		return "nacojja/nacojja1";
	}
	
	@RequestMapping(value = "/nacojja1.do", method = RequestMethod.POST)
	public String nacojja1Write_post(@ModelAttribute CourseVO travelSpotVo, @RequestParam int travelDay, 
			HttpServletRequest request, Model model) {
		logger.info("나코짜1 처리하기, 파라미터 travelSpotVo={}", travelSpotVo);
		logger.info("나코짜1 처리하기, 여행기간 travelDay={}", travelDay);
		
		//파일 업로드 처리
		String fileName = "";
		try {
			List<Map<String, Object>> fileList = fileUploadUtil.fileUpload(request, CommonConstants.PATH_FLAG_IMAGE);

			for (Map<String, Object> map : fileList) {
				fileName = (String) map.get("fileName");
			}
			travelSpotVo.setThumbImg(fileName);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		logger.info("나코짜1 파일 업로드 처리 후, travelSpotVo={}", travelSpotVo);
		
		//일차별 데이터 유효성 검사를 위해 미리 변수 세팅
		totalTravelDay = travelDay;
		
		//출발일부터 날짜 계산
		Calendar cal = Calendar.getInstance();
		cal.setTime(travelSpotVo.getStartDay());
		
		List<Date> travelDateList = new ArrayList<>();
		travelDateList.add(cal.getTime());
		for (int i=1; i<travelDay; i++) {
			cal.add(Calendar.DATE, 1);
			travelDateList.add(cal.getTime());
		}
		
		model.addAttribute("tdList", travelDateList);
		model.addAttribute("travelDay", travelDay);
		model.addAttribute("travelSpotVo", travelSpotVo);
		
		return "nacojja/nacojja2";
	}
	
	/*@RequestMapping(value = "/nacojja2.do", method = RequestMethod.GET)
	public String nacojja2Write_get() {
		logger.info("나코짜2 작성화면 보여주기");
		
		return "nacojja/nacojja2";
	}*/
	
	@RequestMapping(value = "/nacojja2.do", method = RequestMethod.POST)
	public String nacojja2Write_post(@ModelAttribute TravelSpotVO travelSpotVo, HttpSession session) {
		logger.info("나코짜2 DB 처리하기, 파라미터 travelSpotVo={}", travelSpotVo);
		
		String userid = (String) session.getAttribute("userid");
		MemberVO memberVo = memberService.logingMember(userid);
		travelSpotVo.setMemberNo(memberVo.getMemberNo());
		logger.info("나코짜2 DB 처리하기, 세팅 후 파라미터 travelSpotVo={}", travelSpotVo);
		
		
		int cnt = courseService.nacojjaWrite(travelSpotVo, travelSpotListById, userid);
		//int cnt = courseService.nacojjaWrite(travelSpotVo, travelSpotList);
		logger.info("나코짜2 DB 처리하기 결과, cnt={}", cnt);
		
		cnt = memberService.minusHeart(memberVo.getMemberNo());
		logger.info("나코짜2 DB 처리 후 작성한 회원의 하트 차감 결과, cnt={}", cnt);
		
		int courseNo = travelSpotVo.getCourseNo();
		logger.info("지금 등록한 코스의 코스번호: {}", courseNo);

		HeartVO heartVO = new HeartVO();
		heartVO.setCourseNo(courseNo);
		heartVO.setMemberNo(memberVo.getMemberNo());
		cnt = heartService.insertHeart(heartVO);
		logger.info("하트 테이블에 insert한 결과, cnt={}", cnt);
		
		HeartListVO heartListVo = new HeartListVO();
		heartListVo.setStatus("코스등록");
		heartListVo.setHeartNo(heartVO.getHeartNo()); //하트 넘버 제대로 들어가는지 확인해 볼것
		heartListVo.setMemberNo(memberVo.getMemberNo());
		cnt = heartListService.insertHeartListUse(heartListVo);
		logger.info("하트 내역 테이블에 insert한 결과, cnt={}", cnt);
		
		return "redirect:/nacojja/nacojjaDetail.do?courseNo=" + courseNo + "";
	}
	
	@RequestMapping("/addClearPlace.do")
	@ResponseBody
	public void addClearPlace(@ModelAttribute TravelSpotVO travelSpotVo,
			@RequestParam(required=false) boolean clearFlag,
			HttpSession session) {
		logger.info("나코짜2 여행지 담거나 지우거나, 파라미터 travelSpotVo={}", travelSpotVo);
		logger.info("나코짜2 여행지 리스트 쓸어버릴까? clearFlag={}", clearFlag);
		
		String userid = (String) session.getAttribute("userid");
		
		if (clearFlag == true) {
			System.out.println("전체 삭제할 사이즈: " + travelSpotListById.size());
			//똥멍청이네.. 이걸 몰라서 엄청 삽질했네..리스트는 중간에 데이터가 삭제되면 인덱스가 옮겨가기때문에 뒤에서부터 삭제해줘야
			for (int i=travelSpotListById.size()-1; i>=0; ) {  
				System.out.println("인덱스:" + i);
				if (travelSpotListById.get(i).containsKey(userid)) {
					System.out.println(userid + "가 들어간 여행지 삭제 - " + i);
					travelSpotListById.remove(i);
					//travelSpotListById.get(i).remove(userid); //이렇게 삭제하면 리스트안에 맵만 사라지고 공간은 차지하여 추후 등록시 에러가 난다.
				}
				//(이것도 중요!)다른 사람이 동시간대에 여행지 취소할 경우를 대비하여 변수를 다시 세팅
				//테스트 부탁해요 팀원님들 ㅠㅠ 동시에 여행지 취소하거나 한사람이 여행지 취소하고 있는데 한사람은 페이지 나가버릴떄 정상 동작 하는지?
				i = travelSpotListById.size() - 1; 
			}
			//travelSpotList.clear();
			logger.info("나코짜2 여행지 삭제 결과, list={}", travelSpotListById);
			logger.info("나코짜2 여행지 삭제 결과, list.size={}", travelSpotListById.size());
		} else {
			Map<String, TravelSpotVO> travelSpotVoMap = new HashMap<>();
			
			travelSpotVoMap.put(userid, travelSpotVo);
			travelSpotListById.add(travelSpotVoMap);
			logger.info("나코짜2 여행지 담은 결과, travelSpotListById.size={}", travelSpotListById.size());
			logger.info("나코짜2 여행지 담은 결과, travelSpotListById={}", travelSpotListById);
			
			//travelSpotList.add(travelSpotVo);			
			//logger.info("나코짜2 여행지 담은 결과, list.size={}", travelSpotList.size());
		}
	}
	
	@RequestMapping("/delPrevPlace.do")
	@ResponseBody
	public void delPrevPlace(@RequestParam(required=false) int day, HttpSession session) {
		logger.info("나코짜2 여행지 취소시 리스트에서 삭제, 파라미터 day={}", day);
		
		String userid = (String) session.getAttribute("userid");
		
		int delIndex = 0;
		/*for (int i=0; i<travelSpotList.size(); i++) {
			if (travelSpotList.get(i).getDay() == day) {
				delIndex = i;
			}
		}*/
		
		for (int i=0; i<travelSpotListById.size(); i++) {
			if (travelSpotListById.get(i).get(userid).getDay() == day) {
				delIndex = i;
			}
		}
		logger.info("삭제할 인덱스, delIndex={}", delIndex);
		
		//travelSpotList.remove(delIndex);
		travelSpotListById.remove(delIndex);
		logger.info("일차별 이전 여행지 1개 삭제 결과, list.size={}", travelSpotListById.size());
	}
	
	@RequestMapping("/getTravelList.do")
	@ResponseBody
	public List<TravelSpotVO> getTravelList(@RequestParam int day, HttpSession session) {   
		//logger.info("나코짜2 여행지 리스트 가져오기, 전체 List.size={}", travelSpotList.size());
		logger.info("나코짜2 여행지 리스트 가져오기, 몇일차? {}일차", day);
		logger.info("나코짜2 여행지 리스트 가져오기, 전체 travelSpotListById.size={}", travelSpotListById.size());
		
		List<TravelSpotVO> someDaytravelSpotList = new ArrayList<>();
		
		String userid = (String) session.getAttribute("userid");
		
		for (int i=0; i<travelSpotListById.size(); i++) {
			if (travelSpotListById.get(i).get(userid).getDay() == day) {
				System.out.println("[goni]특정일 여행지 가져오기" + travelSpotListById.get(i).get(userid));
				someDaytravelSpotList.add(travelSpotListById.get(i).get(userid));
			}
		}
		
		return someDaytravelSpotList;
		//return travelSpotList;
	}
	
	@RequestMapping("/checkDataValid.do")
	@ResponseBody
	public Map<String, Object> checkDataValid(HttpSession session) {   
		logger.info("나코짜2 일차별 데이터 유효성 체크, totalTravelDay={}", totalTravelDay);
		
		String userid = (String) session.getAttribute("userid");
		
		Map<String, Object> map = new HashMap<>();
		map.put("bool", true);
		int cnt = 0;
		for (int i=1; i<=totalTravelDay; i++) {
			/*for (int j=0; j<travelSpotList.size(); j++) {
				//System.out.println("i,j=" + i + "," + j);
				if (travelSpotList.get(j).getDay() == i) {
					cnt++;
				}
			}*/
			
			for (int j=0; j<travelSpotListById.size(); j++) {
				//System.out.println("i,j=" + i + "," + j);
				if (travelSpotListById.get(j).get(userid).getDay() == i) {
					cnt++;
				}
			}
			
			//System.out.println("cnt=" + cnt);
			if (cnt < 1) {
				map.put("bool", false);
				map.put("day", i);
				break;
			}
			cnt = 0;
		}
		//System.out.println("map = " + map);
		
		return map;
	}
	
	@RequestMapping("/nacojjaDetail.do")
	public String nacojjaDetail(@RequestParam int courseNo, Model model) {   
		logger.info("나코짜 상세보기");
		
		int travelDay = courseService.selectMaxDay(courseNo);
		CourseVO courseVo = courseService.selectOneCourse(courseNo);
		//Map<String, Object> map = courseService.selectOneCTJoin(courseNo);
		MemberVO memberVo = memberService.selectMember(courseVo.getMemberNo());
		List<TravelSpotVO> travelSpotVoList = courseService.selectTravelSpot(courseNo);
		BidVO bidVo = bidService.selectWin(courseNo);
		
		Calendar cal = Calendar.getInstance();
		
		List<Date> travelDateList = new ArrayList<>();
		travelDateList.add(cal.getTime());
		for (int i=1; i<travelDay; i++) {
			cal.add(Calendar.DATE, 1);
			travelDateList.add(cal.getTime());
		}
		
		model.addAttribute("travelDay",travelDay);
		model.addAttribute("tdList", travelDateList); //일수 
		model.addAttribute("courseVo", courseVo); //코스
		model.addAttribute("memberVo", memberVo); //멤버
		model.addAttribute("tSpotVoList", travelSpotVoList); //여행지 정보 리스트
		//model.addAttribute("tSpotVoList", travelSpotVoList); //1일차 여행지 정보 리스트
		model.addAttribute("bidVo",bidVo);
		return "nacojja/nacojjaDetail";
	}
	
	@RequestMapping("/selectTravel.do")
	@ResponseBody
	public List<TravelSpotVO> selectTravel(@ModelAttribute TravelSpotVO travelSpotVo){
		//logger.info("여행지 정보 가져오기, TravelSpotVO={}", travelSpotVo);
		
		List<TravelSpotVO> travelSpotVoList = courseService.selectListTravelSpot(travelSpotVo);
		//logger.info("여행지 정보 가져온 결과, travelSpotVoList.size={}", travelSpotVoList.size());
		
		return travelSpotVoList;
	}
	@RequestMapping("/pressHeart.do")
	public String pressHeart(@ModelAttribute HeartVO heartVo,HttpSession session, Model model) {
		String id =  (String) session.getAttribute("userid"); //하트 누르는 사람의 아이디! 등록한 사람 이 아님
		logger.info("하트 누르기 파라미터 userid={} courseNo={}",id,heartVo.getCourseNo());
		
		MemberVO memberVo = memberService.logingMember(id);
		heartVo.setMemberNo(memberVo.getMemberNo());
		int result = heartService.countHeartMember(heartVo);
		
		String msg="", url="/nacojja/nacojjaDetail.do?courseNo="+heartVo.getCourseNo();
		
		if(result>0) { //이미 해당코스에 하트를 사용했을 경우 
			msg="이미 하트를 부여했습니다. 하트주기는 코스당 1회로 제한됩니다.!";
			logger.info("과거 해당코스에 하트 부여 여부 result={}",result);
		}else {
			
			int cnt  = memberService.pressHeart(id);
			logger.info("하트 누르기 멤버 업데이트 결과 cnt={}",cnt);
			
			heartVo.setMemberNo(memberVo.getMemberNo());
			if(cnt>0) {
				msg="소중한 하트 감사합니다.";
				url="/nacojja/nacojjaDetail.do?courseNo="+heartVo.getCourseNo();
				int countHeart = heartService.countHeart200(heartVo.getCourseNo());
				logger.info("하트 200개  countHeart={}",countHeart);
				if(countHeart > 0) {
					int progress2 = courseService.ProgressNo2(heartVo.getCourseNo());
					logger.info("진행상태 업뎃2 결과 progress={}",progress2);
					int cCnt =heartService.updateCourseHeart(heartVo.getCourseNo());
					logger.info("코스테이블에 하트 업데이트 결과 cCnt={}",cCnt);
					
					int hCnt =heartService.insertHeart(heartVo);
					logger.info("하트테이블 insert결과 hCnt={}",hCnt);
					
					HeartListVO heartListVo = new HeartListVO();
					heartListVo.setMemberNo(memberVo.getMemberNo());
					heartListVo.setStatus("하트주기");
					heartListVo.setHeartNo(heartVo.getHeartNo());
					
					int lCnt =heartListService.insertHeartListUse(heartListVo);
					logger.info("하트내역 insert결과 lCnt={}",lCnt);
				}else {
					int cCnt =heartService.updateCourseHeart(heartVo.getCourseNo());
					logger.info("코스테이블에 하트 업데이트 결과 cCnt={}",cCnt);
					
					int hCnt =heartService.insertHeart(heartVo);
					logger.info("하트테이블 insert결과 hCnt={}",hCnt);
					
					HeartListVO heartListVo = new HeartListVO();
					heartListVo.setMemberNo(memberVo.getMemberNo());
					heartListVo.setStatus("하트");
					heartListVo.setHeartNo(heartVo.getHeartNo());
					
					int lCnt =heartListService.insertHeartListUse(heartListVo);
					logger.info("하트내역 insert결과 lCnt={}",lCnt);
				}
			}else {
				
				msg="하트가 부족합니다! 충전하러 가시겠어요?";
				url="/nacojja/nacojjaDetail.do?courseNo="+heartVo.getCourseNo();
			}
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping("/nacojjaBidding.do")
	public String courseBidding(@ModelAttribute BidVO bidVo,HttpSession session,Model model) {
		String agencyid = (String)session.getAttribute("agencyid");
		logger.info("입찰하기 파람 bidvo={},agencyid={}",bidVo,agencyid);
		
		String agencyName =travelAgencyService.getAgencyName(agencyid);
		TravelAgencyVO travelVo = travelAgencyService.selectOneAgency(agencyName);
		bidVo.setTravelAgencyNo(travelVo.getTravelAgencyNo());
		int cnt =bidService.insertBId(bidVo);
		logger.info("입찰 결과 cnt={}",cnt);
		String msg="", url="/nacojja/nacojjaList.do";
		if(cnt==CommonConstants.EXIST_ID) {
			msg="한 코스에 한번만 입찰 가능합니다.";
		}else {
			msg="입찰 성공!";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
}

























