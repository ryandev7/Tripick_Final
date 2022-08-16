package com.kh.tripick.community.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class LocalBoard {
	
	private int localBoardNo; //LOCAL_BOARD_NO	NUMBER
	private int localCode;//LOCAL_CODE	NUMBER
	private String lbWriter;//LB_WRITER	VARCHAR2(50 BYTE)
	private String lbTitle; //LOCAL_BOARD_TITLE	VARCHAR2(500 BYTE)
	private String lbContent;//LOCAL_BOARD_CONTENT	VARCHAR2(4000 BYTE)
	private Date createDate;//CREATE_DATE	DATE
	private String status;//STATUS	VARCHAR2(1 BYTE)
	private String count;//COUNT	NUMBER
	
	private String localName;

}
