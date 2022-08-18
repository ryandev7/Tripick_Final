package com.kh.tripick.main.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.tripick.main.model.service.MainService;
import com.kh.tripick.tripboard.model.vo.TripBoard;


@Controller
public class MainController {
	
	@Autowired
	private MainService mainService;
	
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
}
