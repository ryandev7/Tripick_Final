package com.kh.tripick.chatting.model.vo;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class ChatMessage {
	private int cmNo;
	private String message;
	private Timestamp createDt;
	private int chatRoomNo;
	private String userId;
	private String sender;
	private String reciever;
	
}
