package com.kh.tripick.tripboard.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.tripick.common.model.vo.PageInfo;
import com.kh.tripick.tripboard.model.vo.TripAttachment;
import com.kh.tripick.tripboard.model.vo.TripBoard;

@Service
public interface TripBoardService {

	int trBoardListCount();

	ArrayList<TripBoard> trBoardList(PageInfo pi);
	
	int filterTripBoardtCount(String localName);

	ArrayList<TripBoard> filterTripBoard(PageInfo pi, String localName);
	
	// 상세보기
	TripBoard selectTripBoard(int trboardNo); // 게시글 가져오기
	ArrayList<TripAttachment> selectTripAttachment(int trboardNo); // 첨부파일 가져오기

}
