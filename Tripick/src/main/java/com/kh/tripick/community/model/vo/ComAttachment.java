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
public class ComAttachment {
	
	private int fileNo; //FILE_NO	NUMBER
	private String originName; //ORIGIN_NAME	VARCHAR2(255 BYTE)
	private String changeName; //CHANGE_NAME	VARCHAR2(255 BYTE)
	private String filePath; //FILE_PATH	VARCHAR2(1000 BYTE)
	private Date uploadDate; //UPLOAD_DATE	DATE
	private int fileLevel; //FILE_LEVEL	NUMBER
	private String status;//STATUS	VARCHAR2(1 BYTE)
	private int mateNo; //MATE_NO	NUMBER
	private int localBoardNo; //LOCAL_BOARD_NO	NUMBER

}
