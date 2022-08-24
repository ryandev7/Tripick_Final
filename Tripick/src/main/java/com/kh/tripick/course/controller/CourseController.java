package com.kh.tripick.course.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.tripick.admin.model.vo.Report;
import com.kh.tripick.common.model.vo.LocalCategory;
import com.kh.tripick.common.model.vo.PageInfo;
import com.kh.tripick.common.model.vo.Reply;
import com.kh.tripick.common.template.Pagination;
import com.kh.tripick.course.model.service.CourseService;
import com.kh.tripick.course.model.vo.LikePlanner;
import com.kh.tripick.course.model.vo.Plan;
import com.kh.tripick.course.model.vo.Planner;

@Controller
public class CourseController {
	
	@Autowired
	private CourseService courseService;
	
	/**
	 * 여행코스 메인화면 보여줌
	 */
	@RequestMapping("main.co")
	public ModelAndView selectCourseList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		PageInfo pi = Pagination.getPageInfo(courseService.selectCourseListCount(), currentPage, 5, 6);
		ArrayList<Planner> list = courseService.selectCourseList(pi); // 플래너 list
		ArrayList<LocalCategory> localList = courseService.selectLocalList(); // 지역 카테고리 list
		mv.addObject("pi", pi).addObject("list", list).addObject("localList", localList).setViewName("course/courseMain");
		return mv;
	}
	
	/**
	 * 나만의 여행코스 만들기 -상세계획페이지 보여주기
	 */
	@RequestMapping("enrollform.co")
	public ModelAndView courseEnrollForm(Planner p, MultipartFile upfile, HttpSession session, ModelAndView mv) {
		
		//System.out.println(upfile);
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = saveFile(upfile, session);
			p.setOriginName(upfile.getOriginalFilename());
			p.setChangeName("resources/course-upfiles/" + changeName);
		}
		
		// 여행 시작날짜 ~ 끝날짜 사이의 날짜 List
		ArrayList<Date> days = dateList(p.getFDate(), p.getLDate());
		p.setWDate(days.size());
		
		// System.out.println(p);
		mv.addObject("days", days);
		mv.addObject("planner", p);
		mv.setViewName("course/courseEnrollForm");
		
		return mv;
	}
	
	/**
	 * 나만의 여행코스 만들기 - 첨부파일 저장
	 */
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
		String originName = upfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmmss").format(new Date());
		int ranNum = (int)(Math.random()*90000)+10000;
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = currentTime + ranNum + ext;
		
		String savePath = session.getServletContext().getRealPath("/resources/course-upfiles/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		} 
		// System.out.println(savePath);
		return changeName;
	}
	
	
	/**
	 * 나만의 여행코스 만들기 -상세계획에 필요한 여행 날짜 list
	 */
	public ArrayList<Date> dateList(Date fDate, Date lDate) {
		
		// Calendar 타입으로 변경
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
		c1.setTime(fDate);
		c2.setTime(lDate);
		
		ArrayList<Date> days = new ArrayList();
		
		while(c1.compareTo(c2) != 1) { // Date.compareTo() 값이 동일하면 0, 이전날짜면 0보다 작은 값, 이후 날짜인 경우 0보다 큰 값
			days.add(c1.getTime()); // <Date> 리스트에 값을 넣어줌
			c1.add(Calendar.DATE, 1); // 날짜 1 더하기
		}		
		return days;
	}
	
	
	/**
	 * 나만의 여행코스 만들기 - 등록
	 */
	@ResponseBody
	@RequestMapping(value="insert.co", produces="text/html; charset=UTF-8")
	public String insertCourse(Planner planner, @RequestParam(value="tripDate[]") List<String> tripDate
										, @RequestParam(value="placeName[]") List<String> placeName
										, @RequestParam(value="placeAddress[]") List<String> placeAddress
										, @RequestParam(value="xCoordinate[]") List<String> xCoordinate
										, @RequestParam(value="yCoordinate[]") List<String> yCoordinate
										, @RequestParam(value="planOrder[]") List<Integer> planOrder
										, @RequestParam(value="memo[]") List<String> memo
										) {
		
		// Planner insert 후 plannerNo 시퀀스 값 받아옴
		int plannerNo = courseService.insertPlanner(planner);
		
		ArrayList<Plan> planList = new ArrayList();			
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(plannerNo > 0) {			
			for(int i = 0; i < placeName.size(); i++) {
				Plan p = new Plan();
				p.setRefPno(plannerNo);
				p.setPlanOrder(planOrder.get(i));
				p.setPlaceName(placeName.get(i));
				p.setPlaceAddress(placeAddress.get(i));
				p.setXCoordinate(xCoordinate.get(i));
				p.setYCoordinate(yCoordinate.get(i));
				p.setTripDate(tripDate.get(i));
				p.setMemo(memo.get(i));
				planList.add(p);
			}
			map.put("planList", planList);			
			return courseService.insertPlanList(map) > 0 ? "나만의 코스가 등록되었습니다.":"실패(plan)";			
		} else {
			return "실패(planner)";
		}
	}
	
	/**
	 * 코스 상세페이지
	 */
	@RequestMapping("detail.co")
	public ModelAndView selectCourseDetail(int pno, ModelAndView mv) {
		int result = courseService.increaseCount(pno); // 조회수 증가
		if(result > 0) {
			Planner planner = courseService.selectPlanner(pno);
			ArrayList<Plan> planList = courseService.selectPlanList(pno);
			ArrayList<Date> days = dateList(planner.getFDate(), planner.getLDate());
			ArrayList<LocalCategory> localList = courseService.selectLocalList();
			
			mv.addObject("planner", planner).addObject("planList", planList).addObject("days", days).addObject("localList", localList).setViewName("course/courseDetail");			
		} else {
			mv.addObject("errorMsg", "게시글 상세조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	/**
	 * 코스 관심등록
	 */
	@RequestMapping("like.co")
	public String insertLikePlanner(LikePlanner likePlanner, HttpSession session) {		
		String alertMsg = courseService.insertLikePlanner(likePlanner)>0?"관심코스로 등록되었습니다.":"관심등록 실패";		
		session.setAttribute("alertMsg", alertMsg);		
		return "redirect:detail.co?pno="+likePlanner.getPlannerNo();
	}
	
	/**
	 * 관심코스 불러오기
	 */
	@ResponseBody
	@RequestMapping(value="getLike.co", produces="application/json; charset=UTF-8")
	public String ajaxSelectLikePlanner(String userId, HttpSession session) {
		return new Gson().toJson(courseService.selectLikePlanner(userId));
	}
	
	/**
	 * 코스 관심등록 해제
	 */
	@RequestMapping("unlike.co")
	public String ajaxDeletetLikePlanner(LikePlanner likePlanner, HttpSession session) {		
		String alertMsg = courseService.deleteLikePlanner(likePlanner)>0?"관심등록이 해제됐습니다.":"Error";		
		session.setAttribute("alertMsg", alertMsg);		
		return "redirect:detail.co?pno="+likePlanner.getPlannerNo();
	}
	
	/**
	 * 댓글 목록
	 */
	@ResponseBody
	@RequestMapping(value="rlist.co", produces="application/json; charset=UTF-8")
	public String ajaxSelectReplyList(int plannerNo) {
		return new Gson().toJson(courseService.selectReplyList(plannerNo));
	}
	
	/**
	 * 댓글 작성
	 */
	@ResponseBody
	@RequestMapping("rinsert.co")
	public String ajaxInsertReply(Reply r) {
		// System.out.println(r);
		return courseService.insertReply(r) > 0 ? "success" : "fail";
	}
	
	/**
	 * 코스 삭제
	 */
	@RequestMapping("delete.co")
	public String deletePlanner(int plannerNo, HttpSession session) {
		String alertMsg = courseService.deletePlanner(plannerNo) > 0 ? "삭제되었습니다" : "error:삭제 실패";
		session.setAttribute("alertMsg", alertMsg);
		return "redirect:main.co";
	}
	
	/**
	 * 댓글 삭제
	 */
	@RequestMapping("rdelete.co")
	public String deleteReply(Reply r, HttpSession session) {
//		System.out.println(r);
		String alertMsg = courseService.deleteReply(r) > 0 ? "삭제되었습니다" : "error:삭제 실패";
		session.setAttribute("alertMsg", alertMsg);
		return "redirect:detail.co?pno="+r.getRefBoardNo();
		
	}
	
	/**
	 * 코스 메인 - 지역필터
	 */
	@RequestMapping("filter.co")
	public ModelAndView filterCourse(@RequestParam(value="cpage", defaultValue="1") int currentPage, String localName, ModelAndView mv) {		
		PageInfo pi = Pagination.getPageInfo(courseService.selectFilterListCount(localName), currentPage, 5, 6);
		ArrayList<Planner> list = courseService.selectFilterList(pi, localName);
		ArrayList<LocalCategory> localList = courseService.selectLocalList();
		mv.addObject("pi", pi).addObject("list", list).addObject("localName", localName).addObject("localList", localList).setViewName("course/courseMain");
		return mv;
	}
	
	/**
	 * 코스 댓글 신고
	 */
	@RequestMapping("report.co")
	public String reportCourseReply(Report report, int plannerNo, HttpSession session) {
		// 1. 신고여부 확인,  2. 신고
		String alertMsg = courseService.reportCheck(report) > 0 ? "이미 신고한 댓글입니다." : 
						 (courseService.reportCourseReply(report) > 0 ? "신고가 접수되었습니다" : "error:신고실패");
		session.setAttribute("alertMsg", alertMsg);
		return "redirect:detail.co?pno=" + plannerNo;
	}
	
	/**
	 * 코스 수정 폼
	 */
	@RequestMapping("updateForm.co")
	public ModelAndView courseUpdateFrom(Planner planner, MultipartFile reupfile, ModelAndView mv, HttpSession session) {
		
		if(!reupfile.getOriginalFilename().equals("")) { // 새 첨부파일이 있는 경우
			String changeName = saveFile(reupfile, session);
			planner.setOriginName(reupfile.getOriginalFilename());
			planner.setChangeName("resources/course-upfiles/" + changeName);	
		}	
	
		ArrayList<Date> days = dateList(planner.getFDate(), planner.getLDate());
		planner.setWDate(days.size());

		ArrayList<Plan> planList = courseService.selectPlanList(planner.getPlannerNo());
		
		mv.addObject("planner", planner);
		mv.addObject("days", days);
		mv.addObject("planList", planList);
		mv.setViewName("course/courseUpdateForm");
		
		return mv;
	}
	
	/**
	 * 코스 수정
	 */
	@ResponseBody
	@RequestMapping(value="update.co", produces="text/html; charset=UTF-8")
	public String updateCourse(Planner planner, @RequestParam(value="tripDate[]") List<String> tripDate
											  , @RequestParam(value="placeName[]") List<String> placeName
											  , @RequestParam(value="placeAddress[]") List<String> placeAddress
											  , @RequestParam(value="xCoordinate[]") List<String> xCoordinate
											  , @RequestParam(value="yCoordinate[]") List<String> yCoordinate
											  , @RequestParam(value="planOrder[]") List<Integer> planOrder
											  , @RequestParam(value="memo[]") List<String> memo											  
											  ) {
	
		ArrayList<Plan> planList = new ArrayList();
		Map<String, Object> map = new HashMap<String, Object>();
		
		for(int i = 0; i < placeName.size(); i++) {
			Plan p = new Plan();
			p.setRefPno(planner.getPlannerNo());
			p.setPlanOrder(planOrder.get(i));
			p.setPlaceName(placeName.get(i));
			p.setPlaceAddress(placeAddress.get(i));
			p.setXCoordinate(xCoordinate.get(i));
			p.setYCoordinate(yCoordinate.get(i));
			p.setTripDate(tripDate.get(i));
			p.setMemo(memo.get(i));
			planList.add(p);		
		}
		map.put("planList", planList);
				
		// 1. planner 먼저 수정(update)
		int result1 = courseService.updatePlanner(planner);
		
		// 2. 기존의 plans 모두 삭제 (delete)
		int result2 = courseService.deletePlanList(planner.getPlannerNo());
				
		// 3. 새로 받아온 plans 등록 (insert)
		int result3 = courseService.insertPlanList(map);
		
		String alertMsg = result1*result2*result3 > 0 ? "나만의 코스가 수정되었습니다" : "error:코스 수정 실패";
				
		return alertMsg;
	}	
}
