package com.kh.tripick.main.model.service;

import java.util.ArrayList;

import com.kh.tripick.tripboard.model.vo.TripBoard;

public interface MainService {
	
	ArrayList<TripBoard> selectRandomList();
	
	ArrayList<TripBoard> countPlannerList();
}
