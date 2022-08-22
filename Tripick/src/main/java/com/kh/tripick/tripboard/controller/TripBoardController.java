package com.kh.tripick.tripboard.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.tripick.common.model.vo.LocalCategory;
import com.kh.tripick.common.model.vo.PageInfo;
import com.kh.tripick.common.template.Pagination;
import com.kh.tripick.course.model.service.CourseService;
import com.kh.tripick.course.model.vo.Planner;
import com.kh.tripick.tripboard.model.service.TripBoardService;
import com.kh.tripick.tripboard.model.vo.TripBoard;

@Controller
public class TripBoardController {
	
	@Autowired
	private TripBoardService tbService;
	
	@Autowired
	private CourseService courseService;
	
	@RequestMapping("list.tb")
	public String selectTripList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		PageInfo pi = Pagination.getPageInfo(tbService.trBoardListCount(), currentPage, 12, 12);
		
		ArrayList<TripBoard> list = tbService.trBoardList(pi);
		ArrayList<LocalCategory> localList = courseService.selectLocalList(); // 지역 카테고리 list
		System.out.println(list);
		
		model.addAttribute("list", list);
		model.addAttribute("localList", localList);
		model.addAttribute("pi", pi);
		
		return "tripboard/tripBoardList";
	}
	
	@RequestMapping("filter.tb")
	public String filterTripBoard(@RequestParam(value="cpage", defaultValue="1") int currentPage, String localName, Model model) {
		PageInfo pi = Pagination.getPageInfo(tbService.filterTripBoardtCount(localName), currentPage, 12, 12);
		ArrayList<TripBoard> list = tbService.filterTripBoard(pi, localName);
		ArrayList<LocalCategory> localList = courseService.selectLocalList(); // 지역 카테고리 list
		model.addAttribute("list", list);
		model.addAttribute("localList", localList);
		model.addAttribute("localName", localName);
		model.addAttribute("pi", pi);
		
		return "tripboard/tripBoardList";
	}

}
