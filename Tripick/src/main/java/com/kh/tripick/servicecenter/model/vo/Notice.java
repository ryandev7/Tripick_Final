package com.kh.tripick.servicecenter.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Notice {
	private int noticeNo;
	private String noticeWriter;
	private String noticeTitle;
	private String noticeContent;
	private String noticeDate; //createDate
	private String status;
	private int count;
}
