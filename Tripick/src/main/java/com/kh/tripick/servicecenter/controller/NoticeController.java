package com.kh.tripick.servicecenter.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tripick.common.model.vo.PageInfo;
import com.kh.tripick.common.template.Pagination;
import com.kh.tripick.servicecenter.model.service.NoticeService;
import com.kh.tripick.servicecenter.model.vo.Notice;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	// 고객센터 클릭시 list.no
	// 페이징바 클릭시 => list.no?cPage=요청한페이지의번호
	@RequestMapping("list.no")
	public String selectNotice(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		//System.out.println("cpage : " + currentPage);
		
		PageInfo pi = Pagination.getPageInfo(noticeService.selectListCount(), currentPage, 10, 10);
		
		ArrayList<Notice> list = noticeService.selectList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "notice/noticeListView";
	}
	
	@RequestMapping("enrollForm.no")
	public String enrollForm() {
		return "notice/noticeEnrollForm";
	}
	
	@RequestMapping("insert.no")
	public String insertNotice(Notice n, HttpSession session ,Model model) {
		
		System.out.println(n);
		
		// 제목, 작성자, 내용
		int result = noticeService.insertNotice(n);
		
		if(result > 0) {
			// 성공
			session.setAttribute("alertMsg", "공지사항 등록 성공");
			return "redirect:list.no";
		}else {
			// 실패
			model.addAttribute("errorMsg", "공지사항 등록 실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("detail.no")
	public ModelAndView selectNotice(ModelAndView mv, int nno) {
		
		int listCount = noticeService.selectListCount();
		//System.out.println(listCount);
		
		// 해당 공지사항 조회수 증가
		int result = noticeService.increaseCount(nno);
		
		if(result > 0) {
			Notice n = noticeService.selectNotice(nno);
			mv.addObject("listCount", listCount).setViewName("notice/noticeDetailView");
			mv.addObject("n", n).setViewName("notice/noticeDetailView");
		}else {
			mv.addObject("errorMsg", "실패").setViewName("common/errorPage");
		} 
		
		return mv;	
	}
	
	@RequestMapping("delete.no")
	public String deleteNotice(int nno, HttpSession session, Model model) {
		
		int result = noticeService.deleteNotice(nno);
		
		if(result > 0) { 
			//성공
			session.setAttribute("alertMsg", "게시글 삭제 성공");
			return "redirect:list.no";
		}else {
			//실패
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("updateForm.no")
	public String updateForm(int nno, Model model) {
		
		model.addAttribute("n", noticeService.selectNotice(nno));
		return "notice/noticeUpdateForm";
	}
	
	@RequestMapping("update.no")
	public String updateNotice(Notice n, Model model, HttpSession session) {
		
		int result = noticeService.updateNotice(n);
		
		if(result > 0) {
			//성공
			session.setAttribute("alertMsg", "게시글 수정 성공");
			return "redirect:detail.no?nno=" + n.getNoticeNo(); 
		}else {
			//실패
			model.addAttribute("errorMsg", "게시글 수정 실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("search.no")
	public ModelAndView searchNotice(@RequestParam(value="cpage", defaultValue="1") int currentPage, String keyword, ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(noticeService.searchListCount(keyword), currentPage, 10, 10);
		
		ArrayList<Notice> list = noticeService.searchNoticeList(keyword, pi);
		
		System.out.println(list);
		
		mv.addObject("list", list).addObject("pi", pi).addObject("keyword", keyword).setViewName("notice/noticeListView");
		
		return mv;
		
	}
	

}
