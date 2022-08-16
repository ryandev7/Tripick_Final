package com.kh.tripick.community.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tripick.common.model.vo.PageInfo;
import com.kh.tripick.common.template.Pagination;
import com.kh.tripick.community.model.service.MateBoardService;
import com.kh.tripick.community.model.vo.Mate;

@Controller
public class MateBoardController {
	
	@Autowired
	private MateBoardService mateBoardService;
	
	@RequestMapping("list.mb")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue="1")
									int currentPage, ModelAndView mv) {
		PageInfo pi = Pagination.getPageInfo(mateBoardService.selectListCount(), currentPage, 10, 5);
		
		mv.addObject("pi", pi)
		  .addObject("list", mateBoardService.selectList(pi))
		  .setViewName("mateboard/mateboardList");
		
		return mv;
	}
	
	@RequestMapping("enrollForm.mb")
	public String enrollForm(HttpSession session) {
		session.setAttribute("lclist", mateBoardService.selectLocalcatList());
		return "mateboard/mateboardEnroll";
	}
	@RequestMapping("detail.mb")
	public ModelAndView selectBoard(ModelAndView mv, int mno) {
		int result = mateBoardService.increaseCount(mno);
		if(result > 0) {
			
			Mate m = mateBoardService.selectBoard(mno);
			System.out.println(m);
			mv.addObject("m", m)
			.setViewName("mateboard/mateboardDetail");
			
		} else {
			mv.addObject("errorMsg", "상세조회실패~").setViewName("common/errorPage");
			
		} return mv;
	}

}
