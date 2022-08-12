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
public class Planner {
	private int plannerNo; // SEQ_PNO
	private String plannerWriter;
	private String plannerTitle;
	private Date fDate;
	private Date lDate;
	private int wDate;
	private String area;
	private String type;
	private int count;
	private Date createDate;
	private String originName;
	private String changeName;
	private String status;
}
