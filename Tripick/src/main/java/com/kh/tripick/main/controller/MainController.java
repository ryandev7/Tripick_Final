package com.kh.tripick.main.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.tripick.common.model.vo.LocalCategory;
import com.kh.tripick.common.model.vo.PageInfo;
import com.kh.tripick.common.template.Pagination;
import com.kh.tripick.course.model.service.CourseService;
import com.kh.tripick.course.model.vo.Planner;
import com.kh.tripick.main.model.service.MainService;
import com.kh.tripick.tripboard.model.vo.TripBoard;


@Controller
public class MainController {
	
	@Autowired
	private MainService mainService;
	
	@Autowired
    private CourseService courseService;
	
	@ResponseBody
	@RequestMapping(value="random.tb", produces="application/json; charset=UTF-8")
	public String selectRandomList() {

		return new Gson().toJson(mainService.selectRandomList());
	}

	@ResponseBody
	@RequestMapping(value="count.pn", produces="application/json; charset=UTF-8")
	public String countPlannerList() {

		return new Gson().toJson(mainService.countPlannerList());
	}
	
	// 코스 검색
	
	@RequestMapping("search.co")
    public ModelAndView searchCourse(@RequestParam(value="cpage", defaultValue="1") int currentPage, String keyword, ModelAndView mv) {
        PageInfo pi = Pagination.getPageInfo(mainService.searchCourseCount(keyword), currentPage, 5, 6);

        ArrayList<Planner> list = mainService.searchCourseList(keyword, pi);

        ArrayList<LocalCategory> localList = courseService.selectLocalList(); // 지역 카테고리 list

        mv.addObject("pi", pi).addObject("list", list).addObject("keyword", keyword).addObject("localList", localList).setViewName("course/courseMain");
        return mv;

    }
	
	
	
	
}
