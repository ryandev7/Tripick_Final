package com.kh.tripick.servicecenter.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.tripick.common.model.vo.PageInfo;
import com.kh.tripick.common.template.Pagination;
import com.kh.tripick.servicecenter.model.service.QnaService;
import com.kh.tripick.servicecenter.model.vo.Qna;

@Controller
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	@RequestMapping("list.qna")
	public String selectQnaList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		PageInfo pi = Pagination.getPageInfo(qnaService.selectQnaListCount(), currentPage, 10, 10);
		
		ArrayList<Qna> list = qnaService.selectQnaList(pi);

		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "qna/qnaListView";
	}
	
	@RequestMapping("detail.qna")
	public String selectQna(Model model, int qno) {
		
		Qna q = qnaService.selectQna(qno);
		
		model.addAttribute("q", q);
		
		return "qna/qnaDetailView";
	}
	
	@RequestMapping("enrollForm.qna")
	public String qnaEnrollForm() {
		return "qna/qnaEnrollForm";
	}
	
	//qna 작성
	@RequestMapping("insert.qna")
	public String insertQna(Qna q, HttpSession session, Model model) {
		int result = qnaService.insertQna(q);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "Q&A 작성 성공");
			return "redirect:list.qna";
		}else {
			model.addAttribute("errorMsg", "Q&A 작성 실패");
			return "common/errorPage";
		}
	}
	
	//qna 삭제
	@RequestMapping("delete.qna")
	public String deleteQna(int qno, HttpSession session, Model model) {
		
		int result = qnaService.deleteQna(qno);
		
		if(result > 0) { 
			session.setAttribute("alertMsg", "Q&A 삭제 성공");
			return "redirect:list.qna";
		}else {
			model.addAttribute("errorMsg", "Q&A 삭제 실패");
			return "common/errorPage";
		}
	}
	
	
	@RequestMapping("updateForm.qna")
	public String updateForm(int qno, Model model) {
		model.addAttribute("q", qnaService.selectQna(qno));
		return "qna/qnaUpdateForm";
	}
	
	//qna 수정하기
	@RequestMapping("update.qna")
	public String updateForm(Qna q, Model model, HttpSession session) {
		System.out.println("hello");
		
		int result = qnaService.updateQna(q);
		
		System.out.println(result);
		
		if(result > 0) {
			//성공
			session.setAttribute("alertMsg", "Q&A 수정 성공");
			return "redirect:detail.qna?qno=" + q.getQnaNo(); 
		}else {
			//실패
			model.addAttribute("errorMsg", "Q&A 수정 실패");
			return "common/errorPage";
		}
	}

	//답변작성
	@ResponseBody
	@RequestMapping("answer.in")
	public String insertQnaAnswer(Qna q) {
		return qnaService.insertQnaAnswer(q) > 0 ? "success" : "fail";
			
	}
	
	//답변삭제
	@RequestMapping("delete.an")
	public String deleteAnswer(int qno, HttpSession session, Model model) {

		int result = qnaService.deleteAnswer(qno);
		Qna q = qnaService.selectQna(qno);
		
		if(result > 0) { 
			session.setAttribute("alertMsg", "답변이 삭제되었습니다.");
			return "redirect:detail.qna?qno=" + q.getQnaNo();
		}else {
			model.addAttribute("errorMsg", "답변 삭제를 실패했습니다.");
			return "common/errorPage";
		}
	}
	
	//답변수정 answer.up
	@ResponseBody
	@RequestMapping("answer.up")
	public String updateQnaAnswer(Qna q) {
		return qnaService.insertQnaAnswer(q) > 0 ? "success" : "fail";
	}
	
	// 내 QNA만 보기
	@ResponseBody
	@RequestMapping(value="qna.my" , produces="application/json; charset=UTF-8")
	public String selectMyQnaList(String qnaWriter) {
		return new Gson().toJson(qnaService.selectMyQnaList(qnaWriter));
	}
	
	/*
	@RequestMapping("qna.my")
	public ModelAndView searchNotice(@RequestParam(value="cpage", defaultValue="1") int currentPage, String userId, ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(qnaService.selectMyQnaListCount(userId), currentPage, 10, 10);
		
		ArrayList<Qna> list = qnaService.selectMyQnaList(userId, pi);
		
		System.out.println(list);
		
		mv.addObject("list", list)
		  .addObject("pi", pi)
		  .setViewName("qna/qnaListView");
		
		return mv;
	}
*/
	/*
	@ResponseBody
	@RequestMapping(value="qna.my" , produces="application/json; charset=UTF-8")
	public String selectMyQnaList(@RequestParam(value="cpage", defaultValue="1") int currentPage, String userId) {
		
		PageInfo pi = Pagination.getPageInfo(qnaService.selectMyQnaListCount(userId), currentPage, 10, 10);
		System.out.println(qnaService.selectMyQnaList(userId, pi));
		return new Gson().toJson(qnaService.selectMyQnaList(userId, pi));
		
	}
	*/
}
