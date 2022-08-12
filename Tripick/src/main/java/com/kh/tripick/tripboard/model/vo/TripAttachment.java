package com.kh.tripick.tripboard.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
@AllArgsConstructor


public class TripAttachment {
	
	private int trfileNo; //TR_FILE_NO NUMBER PRIMARY KEY,
    private int refTBno; //REF_TBNO NUMBER NOT NULL REFERENCES TR_BOARD(TR_BOARD_NO),
    private String originName; //ORIGIN_NAME VARCHAR2(255) NOT NULL,
    private String changeName; // CHANGE_NAME VARCHAR2(255) NOT NULL,
	private String filePath; // FILE_PATH VARCHAR2(1000) NOT NULL,
	private Date uploadDate; // UPLOAD_DATE DATE DEFAULT SYSDATE,
	private int fileLevel; // FILE_LEVEL NUMBER,
	private String status; // STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N'))

}
