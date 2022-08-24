package com.kh.tripick.chatting.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class ChatRoom {
	private int chatRoomNo;
	private String status;
	private String userId;
	private int mateNo;
	private int chatLevel;
	
	private String userNickName;
}
