package com.kh.tripick.admin.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter @Setter @ToString

public class Report {
	private int rptNo; //RPT_NO NUMBER PRIMARY KEY,
	private int writeNo; //WRITE_NO NUMBER NOT NULL,
	private String divCode; //DIVCODE VARCHAR2(100) NOT NULL CHECK(DIVCODE IN('L', 'M', 'R')),
	private String userId; //USER_ID VARCHAR2(100) NOT NULL,
	private String rptDate; //RPT_DATE DATE DEFAULT SYSDATE,
	private String rptContent; //RPT_CONTENT VARCHAR2(1000) NOT NULL
	private int rptCnt;
	private int boardNo;
	private String writerNo;
	private String title;
	private String content;
	private String createDate;
	private String status;
	private String lbWriter;
	private String code;
	private int replyNo;
	private String reWriter;
	private String replyLevel;
	
}
