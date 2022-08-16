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
public class Mate {
	private int mateNo;//MATE_NO	NUMBER
	private String mateWriter;//MATE_WRITER	VARCHAR2(50 BYTE)
	private String localCode;//LOCAL_CODE	NUMBER
	private String mateTitle;//MATE_TITLE	VARCHAR2(200 BYTE)
	private String mateContent;//MATE_CONTENT	VARCHAR2(4000 BYTE)
	private int memberCount;//MEMBER_COUNT	NUMBER
	private int memberCurCount;//MEMBER_CURCOUNT	NUMBER
	private String recruitStatus;//RECRUIT_STATUS	VARCHAR2(1 BYTE)
	private String status;//STATUS	VARCHAR2(1 BYTE)
	private Date firstDate;//F_DATE	DATE
	private Date lastDate;//L_DATE	DATE
	private int count;//COUNT	NUMBER
	private Date createDate;
	
	private String localName;

}
