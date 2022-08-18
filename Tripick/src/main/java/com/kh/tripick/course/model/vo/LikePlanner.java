package com.kh.tripick.course.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter @Setter @ToString
@AllArgsConstructor
public class LikePlanner {
	private int likeNo; //LIKE_NO (SEQ_LNO)
	private String userId; //USER_ID
	private int plannerNo; //PLANNER_NO
	private int tripType; //TRIP_TYPE (default 0)
}
