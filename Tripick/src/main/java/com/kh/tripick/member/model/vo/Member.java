package com.kh.tripick.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Member {

	
	private String userId;			 // USER_ID VARCHAR2(50) PRIMARY KEY,
	private String userNickName; 	// USER_NICKNAME VARCHAR2(50) NOT NULL UNIQUE,
	private String userPwd; 		// USER_PWD VARCHAR2(50) NOT NULL,
	private String userName; 		// USER_NAME VARCHAR2(50)	NOT NULL,
	private String email; 			// EMAIL VARCHAR2(50) NOT NULL,
	private Date enrollDate; 		// ENROLL_DATE DATE DEFAULT SYSDATE,
	private int memberLoginCheck; 	// MEMBER_LOGIN_CHECK NUMBER NOT NULL,
	private String status; 			// STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N'))
}
