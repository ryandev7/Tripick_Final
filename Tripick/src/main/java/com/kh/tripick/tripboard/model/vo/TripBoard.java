package com.kh.tripick.tripboard.model.vo;

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

public class TripBoard {
	
	private int trboardNo; 			//TR_BOARD_NO	NUMBER PRIMARY KEY,
	private String trboardTitle; 	// TR_BOARD_TITLE VARCHAR2(200) NOT NULL,
	private String trboardContent; 	// TR_BOARD_CONTENT VARCHAR2(4000) NOT NULL,
	private String trboardWriter; 	// TR_BOARD_WRITER VARCHAR2(50) NOT NULL REFERENCES MEMBER(USER_ID),
	private String createDate; 		// CREATE_DATE DATE DEFAULT SYSDATE,
	private String status;			// STATUS VARCHAR2(1)	DEFAULT 'Y' CHECK (STATUS IN('Y', 'N')),
	private String localName;		//LOCAL_NAME NOT NULL REFERENCES LOCAL(LOCAL_NAME)

}
