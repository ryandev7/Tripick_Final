package com.kh.tripick.tripboard.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.tripick.common.model.vo.PageInfo;
import com.kh.tripick.tripboard.model.vo.TripBoard;

@Service
public interface TripBoardService {

	int trBoardListCount();

	ArrayList<TripBoard> trBoardList(PageInfo pi);
	
	int filterTripBoardtCount(String localName);

	ArrayList<TripBoard> filterTripBoard(PageInfo pi, String localName);

}
