package com.kh.tripick.chatting.controller;

import java.util.Arrays;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.tripick.chatting.model.vo.ChatMessage;
import com.kh.tripick.mypage.model.service.MyPageService;
import com.kh.tripick.mypage.model.service.MyPageServiceImpl;

@Controller
public class ChattingController extends TextWebSocketHandler{
	private Set<WebSocketSession> users = new CopyOnWriteArraySet<WebSocketSession>();
	
	@Autowired
	private MyPageService mypageService;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		users.add(session);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		String str = message.getPayload();
		
		String userId = str.substring(str.lastIndexOf(",")+1, str.length());
		str = str.substring(0, str.lastIndexOf(","));
		
		int chatRoomNo = Integer.parseInt(str.substring(str.lastIndexOf(",")+1, str.length()));
		str = str.substring(0, str.lastIndexOf(","));
		
		String text = str.substring(0, str.length());
		
		ChatMessage cm = new ChatMessage();
		cm.setUserId(userId);
		cm.setChatRoomNo(chatRoomNo);
		cm.setMessage(text);
		
		int result = mypageService.insertMsg(cm);
		
		//TextMessage newMessage = new TextMessage(message.getPayload());
		TextMessage newMessage = new TextMessage(text);
		for(WebSocketSession ws : users) {
			if(!session.equals(ws)) {
				ws.sendMessage(newMessage);
			}
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		users.remove(session);
	}
}
