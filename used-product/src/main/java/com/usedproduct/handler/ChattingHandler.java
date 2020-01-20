package com.usedproduct.handler;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.usedproduct.vo.MemberVO;

import lombok.extern.log4j.Log4j;

@Log4j
public class ChattingHandler extends TextWebSocketHandler {
	private Map<String, WebSocketSession> users = new HashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log(getId(session) + " 연결");
		users.put(getId(session), session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log(getId(session) + " 메세지 수신 : " + message.getPayload());

		for (WebSocketSession wss : users.values()) {
			wss.sendMessage(message);
			log(getId(session) + " 메세지 발송 : " + message.getPayload());
		}
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log(getId(session) + " 예외 발생 : " + exception.getMessage());
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log(getId(session) + " 연결 종료");
		users.remove(getId(session));
	}
	
	private void log(String msg) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		log.warn("[ " + format.format(new Date()) + " ] " + msg);
	}

	private String getId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		MemberVO loginUser = (MemberVO) httpSession.get("loginuser");
		
		return loginUser.getMemberId();
	}
}