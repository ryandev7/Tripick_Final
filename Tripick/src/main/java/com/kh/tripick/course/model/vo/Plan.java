package com.kh.tripick.course.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter @Setter @ToString
@AllArgsConstructor
public class Plan {	
	private int planNo; // SEQ_PLNO
	private int refPno;
	private int planOrder;
	private String placeName;
	private String placeAddress;
	private String xCoordinate;
	private String yCoordinate;
	private String tripDate;
	private String memo;

}
