package com.kh.tripick.tripboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.tripick.tripboard.model.service.TripBoardService;

@Controller
public class TripBoardController {
	
	@Autowired
	private TripBoardService tbService;
	
	@RequestMapping("list.tb")
	public String selectTripList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		return "tripboard/tripBoardList";
	}

}
