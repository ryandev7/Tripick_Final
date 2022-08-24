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
public class MateMember {

	private int memberMateNo; //M_MATE_NO	NUMBER
	private int refMateNo; //REF_MATE_NO	NUMBER
	private String mateMember; //MATE_MEMBER	VARCHAR2(50 BYTE) -> 닉네임담을거
	private String status; //STATUS	VARCHAR2(1 BYTE)A
	
	private String mateTitle;
	private String bstatus;
	
	private String mateMember2; // 아이디 담을거
}
